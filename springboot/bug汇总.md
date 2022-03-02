# **Security**

* Spring Security 提供了BCryptPasswordEncoder类,实现Spring的PasswordEncoder接口使用BCrypt强哈希方法来加密密码。方法采用SHA-256 +随机盐+密钥对密码进行加密

在里面还依赖了几个自定义的类，都是必须配置的。分别是
HrService，
MyFilterInvocationSecurityMetadataSource，
MyAccessDecisionManager，

MyAccessDeniedHandler，
MyAuthenticationFailureHandler，
MyAuthenticationSuccessHandler，
MyLogoutSuccessHandler

### 配置——WebSecurityConfigurerAdapter

```java
/**
 * @Author: Galen
 * @Date: 2019/3/27-14:43
 * @Description: spring-security权限管理的核心配置
 **/
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true) //全局
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private HrService hrService;  //实现了UserDetailsService接口
    @Autowired
    private MyFilterInvocationSecurityMetadataSource filterMetadataSource; //权限过滤器（当前url所需要的访问权限）
    @Autowired
    private MyAccessDecisionManager myAccessDecisionManager;//权限决策器
    @Autowired
    private MyAccessDeniedHandler deniedHandler;//自定义错误(403)返回数据

    /**
     * @Author: Galen
     * @Description: 配置userDetails的数据源，密码加密格式
     * @Date: 2019/3/28-9:24
     * @Param: [auth]
     * @return: void
     **/
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(hrService)
                .passwordEncoder(new BCryptPasswordEncoder());
    }

    /**
     * @Author: Galen
     * @Description: 配置放行的资源
     * @Date: 2019/3/28-9:23
     * @Param: [web]
     * @return: void
     **/
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/index.html", "/static/**", "/login_p", "/favicon.ico")
                // 给 swagger 放行；不需要权限能访问的资源
                .antMatchers("/swagger-ui.html", "/swagger-resources/**", "/images/**", "/webjars/**", "/v2/api-docs", "/configuration/ui", "/configuration/security");
    }

    /**
     * @Author: Galen
     * @Description: HttpSecurity包含了原数据（主要是url）
     * 通过withObjectPostProcessor将MyFilterInvocationSecurityMetadataSource和MyAccessDecisionManager注入进来
     * 此url先被MyFilterInvocationSecurityMetadataSource处理，然后 丢给 MyAccessDecisionManager处理
     * 如果不匹配，返回 MyAccessDeniedHandler
     * @Date: 2019/3/27-17:41
     * @Param: [http]
     * @return: void
     **/
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
                    @Override
                    public <O extends FilterSecurityInterceptor> O postProcess(O o) {
                        o.setSecurityMetadataSource(filterMetadataSource);
                        o.setAccessDecisionManager(myAccessDecisionManager);
                        return o;
                    }
                })
                .and()
                .formLogin().loginPage("/login_p").loginProcessingUrl("/login")
                .usernameParameter("username").passwordParameter("password")
                .failureHandler(new MyAuthenticationFailureHandler())
                .successHandler(new MyAuthenticationSuccessHandler())
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessHandler(new MyLogoutSuccessHandler())
                .permitAll()
                .and().csrf().disable()
                .exceptionHandling().accessDeniedHandler(deniedHandler);
    }
}
```

### 认证UserDetailsService

```java
@Service
@Transactional
public class HrService implements UserDetailsService {

    @Autowired
    private HrMapper hrMapper;

    /**
     * @Author: Galen
     * @Description: 实现了UserDetailsService接口中的loadUserByUsername方法
     * 执行登录,构建Authentication对象必须的信息,
     * 如果用户不存在，则抛出UsernameNotFoundException异常
     * @Date: 2019/3/27-16:04
     * @Param: [s]
     * @return: org.springframework.security.core.userdetails.UserDetails
     **/
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        /**
         * @Author: Galen
         * @Description: 查询数据库，获取登录的用户信息
         **/
        Hr hr = hrMapper.loadUserByUsername(s);
        if (hr == null) {
            throw new UsernameNotFoundException("用户名不对");
        }
        return hr;
    }
}

```

### 自定义权限过滤——FilterInvocationSecurityMetadataSource

```java
/**
 * @Author: Galen
 * @Date: 2019/3/27-16:54
 * @Description: FilterInvocationSecurityMetadataSource（权限资源过滤器接口）继承了 SecurityMetadataSource（权限资源接口）
 * Spring Security是通过SecurityMetadataSource来加载访问时所需要的具体权限；Metadata是元数据的意思。
 * 自定义权限资源过滤器，实现动态的权限验证
 * 它的主要责任就是当访问一个url时，返回这个url所需要的访问权限
 **/
@Component
public class MyFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    @Autowired
    private MenuService menuService;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    private static final Logger log = LoggerFactory.getLogger(MyFilterInvocationSecurityMetadataSource.class);

    /**
     * @Author: Galen
     * @Description: 返回本次访问需要的权限，可以有多个权限
     * @Date: 2019/3/27-17:11
     * @Param: [o]
     * @return: java.util.Collection<org.springframework.security.access.ConfigAttribute>
     **/
    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) {
        String requestUrl = ((FilterInvocation) o).getRequestUrl();
        //去数据库查询资源
        List<Menu> allMenu = menuService.getAllMenu();
        for (Menu menu : allMenu) {
            if (antPathMatcher.match(menu.getUrl(), requestUrl)
                    && menu.getRoles().size() > 0) {
                List<Role> roles = menu.getRoles();
                int size = roles.size();
                String[] values = new String[size];
                for (int i = 0; i < size; i++) {
                    values[i] = roles.get(i).getName();
                }
                log.info("当前访问路径是{},这个url所需要的访问权限是{}", requestUrl, values);
                return SecurityConfig.createList(values);
            }
        }
        /**
         * @Author: Galen
         * @Description: 如果本方法返回null的话，意味着当前这个请求不需要任何角色就能访问
         * 此处做逻辑控制，如果没有匹配上的，返回一个默认具体权限，防止漏缺资源配置
         **/
        log.info("当前访问路径是{},这个url所需要的访问权限是{}", requestUrl, "ROLE_LOGIN");
        return SecurityConfig.createList("ROLE_LOGIN");
    }

    /**
     * @Author: Galen
     * @Description: 此处方法如果做了实现，返回了定义的权限资源列表，
     * Spring Security会在启动时校验每个ConfigAttribute是否配置正确，
     * 如果不需要校验，这里实现方法，方法体直接返回null即可。
     * @Date: 2019/3/27-17:12
     * @Param: []
     * @return: java.util.Collection<org.springframework.security.access.ConfigAttribute>
     **/
    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    /**
     * @Author: Galen
     * @Description: 方法返回类对象是否支持校验，
     * web项目一般使用FilterInvocation来判断，或者直接返回true
     * @Date: 2019/3/27-17:14
     * @Param: [aClass]
     * @return: boolean
     **/
    @Override
    public boolean supports(Class<?> aClass) {
        return FilterInvocation.class.isAssignableFrom(aClass);
    }
}
```

### 自定义权限决策——AccessDecisionManager

```java
/**
 * @Author: Galen
 * @Date: 2019/3/27-16:59
 * @Description: Decision决定的意思。
 * 有了权限资源(MyFilterInvocationSecurityMetadataSource)，知道了当前访问的url需要的具体权限，接下来就是决策当前的访问是否能通过权限验证了
 * MyAccessDecisionManager 自定义权限决策管理器
 **/
@Component
public class MyAccessDecisionManager implements AccessDecisionManager {
    /**
     * @Author: Galen
     * @Description: 取当前用户的权限与这次请求的这个url需要的权限作对比，决定是否放行
     * auth 包含了当前的用户信息，包括拥有的权限,即之前UserDetailsService登录时候存储的用户对象
     * object 就是FilterInvocation对象，可以得到request等web资源。
     * configAttributes 是本次访问需要的权限。即上一步的 MyFilterInvocationSecurityMetadataSource 中查询核对得到的权限列表
     * @Date: 2019/3/27-17:18
     * @Param: [auth, object, cas]
     * @return: void
     **/
    @Override
    public void decide(Authentication auth, Object object, Collection<ConfigAttribute> cas) {
        Iterator<ConfigAttribute> iterator = cas.iterator();
        while (iterator.hasNext()) {
            if (auth == null) {
                throw new AccessDeniedException("当前访问没有权限");
            }
            ConfigAttribute ca = iterator.next();
            //当前请求需要的权限
            String needRole = ca.getAttribute();
            if ("ROLE_LOGIN".equals(needRole)) {
                if (auth instanceof AnonymousAuthenticationToken) {
                    throw new BadCredentialsException("未登录");
                } else
                    return;
            }
            //当前用户所具有的权限
            Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                if (authority.getAuthority().equals(needRole)) {
                    return;
                }
            }
        }
        throw new AccessDeniedException("权限不足!");
    }

    @Override
    public boolean supports(ConfigAttribute configAttribute) {
        return true;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
```

### 自定义响应——AccessDeniedHandler

```java
/**
     * @Author: Galen
     * @Date: 2019/3/27-17:36
     * @Description: Denied是拒签的意思
     * 此处我们可以自定义403响应的内容,让他返回我们的错误逻辑提示
     **/
    public class MyAccessDeniedHandler implements AccessDeniedHandler {
        @Override
        public void handle(HttpServletRequest httpServletRequest, HttpServletResponse resp,
                           AccessDeniedException e) throws IOException {
            resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
            resp.setContentType("application/json;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            RespBean error = RespBean.error("权限不足，请联系管理员!");
            out.write(new ObjectMapper().writeValueAsString(error));
            out.flush();
            out.close();
        }
    }
```

### 认证失败——AuthenticationFailureHandler

### 认证成功——AuthenticationSuccessHandler

### 登出——LogoutSuccessHandler

```java
/**
 * @Author: Galen
 * @Date: 2019/3/28-9:17
 * @Description: 认证失败的处理
 **/
public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        RespBean respBean;
        if (exception instanceof BadCredentialsException ||
                exception instanceof UsernameNotFoundException) {
            respBean = RespBean.error("账户名或者密码输入错误!");
        } else if (exception instanceof LockedException) {
            respBean = RespBean.error("账户被锁定，请联系管理员!");
        } else if (exception instanceof CredentialsExpiredException) {
            respBean = RespBean.error("密码过期，请联系管理员!");
        } else if (exception instanceof AccountExpiredException) {
            respBean = RespBean.error("账户过期，请联系管理员!");
        } else if (exception instanceof DisabledException) {
            respBean = RespBean.error("账户被禁用，请联系管理员!");
        } else {
            respBean = RespBean.error("登录失败!");
        }
        response.setStatus(401);
        new GalenWebMvcWrite().writeToWeb(response, respBean);
    }
}
/**
 * @Author: Galen
 * @Date: 2019/3/28-9:17
 * @Description: 认证成功的处理
 **/
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    
        @Override
        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
            response.setContentType("application/json;charset=utf-8");
            RespBean respBean = RespBean.ok("登录成功!", HrUtils.getCurrentHr());
            new GalenWebMvcWrite().writeToWeb(response, respBean);
            System.out.println("登录成功!");
        }
    }
/**
 * @Author: Galen
 * @Date: 2019/3/28-9:21
 * @Description: 注销登录处理
 **/
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        RespBean respBean = RespBean.ok("注销成功!");
        new GalenWebMvcWrite().writeToWeb(response, respBean);
        System.out.println("注销成功!");
    }
}
```





------





# Oauth2.0

```xml
 <!--security-->
 <dependency>
     <groupId>org.springframework.boot</groupId>
     <artifactId>spring-boot-starter-security</artifactId>
 </dependency>
 <dependency>
     <groupId>org.springframework.security.oauth</groupId>
     <artifactId>spring-security-oauth2</artifactId>
 </dependency>
```

### 配置——WebSecurityConfigurerAdapter 

```java
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyUserDatailService userDatailService;

    /**
     * 指定加密方式
     */
    @Bean
    public PasswordEncoder passwordEncoder(){
        // 使用BCrypt加密密码
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers(HttpMethod.POST, "/add-user").permitAll() // 允许post请求/add-user，而无需认证
                .anyRequest().authenticated() // 所有请求都需要验证
                .and()
                .formLogin() // 使用默认的登录页面
                .and()
                .csrf().disable();// post请求要关闭csrf验证,不然访问报错；实际开发中开启，需要前端配合传递其他参数
    }
}
```



### 认证——UserDetailsService

```java
@Component
public class MyUserDetailsService implements UserDetailsService {

    @Reference(version = "2.0.0")
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        String passwd = "";
        System.out.println("收到的账号"+username);
        if (CheckFormat.isEmail(username)){
             passwd = userService.selectPasswdByEmail(username);
        }else if (CheckFormat.isPhone(username)){
             passwd = userService.selectPasswdByPhone(username);
        }else {
            throw new RuntimeException("登录账号不存在");
        }
        System.out.println("查到的密码"+passwd);
        return new User(username, passwd, AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_USER"));
    }
}
这里重写了security认证UserDetailsService 的接口方法，添加了自定义数据库密码的查询和校验。
```

### 认证失败——SimpleUrlAuthenticationFailureHandler

```java
/**
 * 自定义登录失败处理器
 * Created by Fant.J.
 */
@Component
public class MyAuthenticationFailHandler extends SimpleUrlAuthenticationFailureHandler {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        logger.info("登录失败");
            //设置状态码
            response.setStatus(500);
            response.setContentType("application/json;charset=UTF-8");
            //将 登录失败 信息打包成json格式返回
            response.getWriter().write(JSON.toJSONString(ServerResponse.createByErrorMessage(exception.getMessage())));
    }
}
```

### 认证成功——SavedRequestAwareAuthenticationSuccessHandler

```java
/**
 * Created by Fant.J.
 */
@Component
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ClientDetailsService clientDetailsService;

    @Autowired
    private AuthorizationServerTokenServices authorizationServerTokenServices;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        logger.info("登录成功");


        String header = request.getHeader("Authorization");
        if (header == null && !header.startsWith("Basic")) {
            throw new UnapprovedClientAuthenticationException("请求投中无client信息");
        }
        String[] tokens = this.extractAndDecodeHeader(header, request);

        assert tokens.length == 2;

        //获取clientId 和 clientSecret
        String clientId = tokens[0];
        String clientSecret = tokens[1];

        //获取 ClientDetails
        ClientDetails clientDetails = clientDetailsService.loadClientByClientId(clientId);

        if (clientDetails == null){
            throw new UnapprovedClientAuthenticationException("clientId 不存在"+clientId);
            //判断  方言  是否一致
        }else if (!StringUtils.equals(clientDetails.getClientSecret(),clientSecret)){
            throw new UnapprovedClientAuthenticationException("clientSecret 不匹配"+clientId);
        }
        //密码授权 模式, 组建 authentication
        TokenRequest tokenRequest = new TokenRequest(MapUtils.EMPTY_MAP,clientId,clientDetails.getScope(),"password");

        OAuth2Request oAuth2Request = tokenRequest.createOAuth2Request(clientDetails);
        OAuth2Authentication oAuth2Authentication = new OAuth2Authentication(oAuth2Request,authentication);

        OAuth2AccessToken token = authorizationServerTokenServices.createAccessToken(oAuth2Authentication);

        //判断是json 格式返回 还是 view 格式返回
        //将 authention 信息打包成json格式返回
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(JSON.toJSONString(ServerResponse.createBySuccess(token)));
    }


    /**
     * 解码请求头
     */
    private String[] extractAndDecodeHeader(String header, HttpServletRequest request) throws IOException {
        byte[] base64Token = header.substring(6).getBytes("UTF-8");

        byte[] decoded;
        try {
            decoded = Base64.decode(base64Token);
        } catch (IllegalArgumentException var7) {
            throw new BadCredentialsException("Failed to decode basic authentication token");
        }

        String token = new String(decoded, "UTF-8");
        int delim = token.indexOf(":");
        if (delim == -1) {
            throw new BadCredentialsException("Invalid basic authentication token");
        } else {
            return new String[]{token.substring(0, delim), token.substring(delim + 1)};
        }
    }
}
```

### 资源服务器——ResourceServerConfigurerAdapter

### 认证服务器——AuthorizationServerConfigurerAdapter

```java
/**
 * 资源服务器
 * Created by Fant.J.
 */
@Configuration
@EnableResourceServer
public class MyResourceServerConfig extends ResourceServerConfigurerAdapter {

    @Autowired
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;
    @Autowired
    private MyAuthenticationFailHandler myAuthenticationFailHandler;
    @Override
    public void configure(HttpSecurity http) throws Exception {
        //表单登录 方式
        http.formLogin()
                .loginPage("/authentication/require")
                //登录需要经过的url请求
                .loginProcessingUrl("/authentication/form")
                .successHandler(myAuthenticationSuccessHandler)
                .failureHandler(myAuthenticationFailHandler);

        http
                .authorizeRequests()
                .antMatchers("/user/*")
                .authenticated()
                .antMatchers("/oauth/token").permitAll()
                .anyRequest()
                .permitAll()
                .and()
                //关闭跨站请求防护
                .csrf().disable();
    }
}
只需要认证/user/*开头的url。@EnableResourceServer这个注解就决定了这是个资源服务器。它决定了哪些资源需要什么样的权限。


/**
 * 认证服务器
 * Created by Fant.J.
 */
@Configuration
@EnableAuthorizationServer
public class MyAuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {


    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        super.configure(security);
    }

    /**
     * 客户端配置（给谁发令牌）
     * @param clients
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.inMemory().withClient("internet_plus")
                .secret("internet_plus")
                //有效时间 2小时
                .accessTokenValiditySeconds(72000)
                //密码授权模式和刷新令牌
                .authorizedGrantTypes({"refresh_token","password"})
                .scopes( "all");
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        endpoints
                .authenticationManager(authenticationManager)
                .userDetailsService(userDetailsService);
        }
    }
}

@EnableAuthorizationServer就代表了它是个认证服务端。
```



````json
使用
给/oauth/token 发送post请求获取token
请求头：Authorization:Basic +clientid:secret 的base64加密字符串 (认证服务器中设置的client信息)
请求参数：username password (用户登陆账号密码)
{
    "data": {
        "refreshToken": {
            "expiration": 1528892642111,
            "value": "xxxxxx-xxxxxx-xxxxx-xxxxxxxx"
        },
        "scope": [
            "all"
        ],
        "tokenType": "bearer",
        "value": "xxxxxx-xxxxxx-xxxxx-xxxxxxxx"
    },
    "status": 200,
    "success": true
}

给/oauth/token 发送post请求刷新token
grant_type:refresh_token
refresh_token:获取token时返回的refreshToken的value
````


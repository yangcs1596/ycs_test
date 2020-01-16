#### 1、基本语法 

格式要求 
k:(空格)v：表示一对键值对（空格必须有）；

以空格的缩进来控制层级关系；只要是左对齐的一列数据，都是同一个层级的

```yaml
server:
    port: 8081
    path: /hello
```

**属性和值也是大小写敏感；**

```yaml
${server.port}  #引用的方式
```



#### 2、值的写法

字面量：普通的值（数字，字符串，布尔）
 k: v：字面直接来写；

 字符串默认不用加上单引号或者双引号；

 “”：双引号；不会转义字符串里面的特殊字符；特殊字符会作为本身想表示的意思

 name: “zhangsan \n lisi”：输出；zhangsan 换行 lisi

 ”：单引号；会转义特殊字符，特殊字符最终只是一个普通的字符串数据

 name: ‘zhangsan \n lisi’：输出；zhangsan \n lisi

对象、Map（属性和值）（键值对）：
 k: v：在下一行来写对象的属性和值的关系；注意缩进

 对象还是k: v的方式

```yaml
friends:
        lastName: zhangsan
        age: 20
```


行内写法：

```yaml
friends: {lastName: zhangsan,age: 18}
```

数组（List、Set）：
用- 值表示数组中的一个元素

```yaml
pets:
 - cat
 - dog
 - pig
```

行内写法

```yaml
pets: [cat,dog,pig]
```

1、@controller 控制器（注入服务） 
2、@service 服务（注入dao） 
3、@repository （实现dao访问） 
4、@component （把普通pojo实例化到spring容器中，相当于配置文件中的

(<bean id="" class=""/>）

@ConfigurationProperties：告诉SpringBoot将本类中的所有属性和配置文件中相关的配置进行绑定； 

prefix = “person”：配置文件中哪个下面的所有属性进行一一映射

------

###  javax.servlet

* https://www.cnblogs.com/haimishasha/p/5609261.html

* javax.servlet.Filter

  文档 ：https://www.cnblogs.com/zlbx/p/4888312.html

### RestFul风格

* 在Restful之前的操作：
  http://127.0.0.1/user/query/1 GET  根据用户id查询用户数据
  http://127.0.0.1/user/save POST 新增用户
  http://127.0.0.1/user/update POST 修改用户信息
  http://127.0.0.1/user/delete GET/POST 删除用户信息

  RESTful用法：
  http://127.0.0.1/user/1 GET  根据用户id查询用户数据
  http://127.0.0.1/user  POST 新增用户
  http://127.0.0.1/user  PUT 修改用户信息
  http://127.0.0.1/user  DELETE 删除用户信息

  之前的操作是没有问题的,大神认为是有问题的,有什么问题呢?你每次请求的接口或者地址,都在做描述,例如查询的时候用了query,新增的时候用了save,其实完全没有这个必要,我使用了get请求,就是查询.使用post请求,就是新增的请求,我的意图很明显,完全没有必要做描述,这就是为什么有了restful. 

  例如spirngMVC的实现restful服务

```java
@RequestMapping(value = "{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<User> queryUserById(@PathVariable("id") Long id) {
    }
 
    /**
     * 新增用户
     * 
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> saveUser(User user) {
    }
 
    /**
     * 更新用户资源
     * 
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<Void> updateUser(User user) {
    } 
```



### IDEA里SVN配置

- https://blog.csdn.net/hello__word__/article/details/81773815

### Dubbo 

* 文档： http://dubbo.apache.org/zh-cn/docs/user/quick-start.html
* 

| 节点        | 角色说明                               |
| ----------- | -------------------------------------- |
| `Provider`  | 暴露服务的服务提供方                   |
| `Consumer`  | 调用远程服务的服务消费方               |
| `Registry`  | 服务注册与发现的注册中心               |
| `Monitor`   | 统计服务的调用次数和调用时间的监控中心 |
| `Container` | 服务运行容器                           |

* 调用关系说明

1. 服务容器负责启动，加载，运行服务提供者。
2. 服务提供者在启动时，向注册中心注册自己提供的服务。
3. 服务消费者在启动时，向注册中心订阅自己所需的服务。
4. 注册中心返回服务提供者地址列表给消费者，如果有变更，注册中心将基于长连接推送变更数据给消费者。
5. 服务消费者，从提供者地址列表中，基于软负载均衡算法，选一台提供者进行调用，如果调用失败，再选另一台调用。
6. 服务消费者和提供者，在内存中累计调用次数和调用时间，定时每分钟发送一次统计数据到监控中心。 

### BeetlSQL

* 文档 ： http://ibeetl.com/guide/#beetlsql

```java
@Bean
public SqlManagerFactoryBean sqlManagerFactoryBean(DataSource dataSource) throws Exception {
    SqlManagerFactoryBean sqlManagerFactoryBean = new SqlManagerFactoryBean();
    BeetlSqlDataSource connectionSource = new BeetlSqlDataSource();
    connectionSource.setMasterSource(dataSource);
    sqlManagerFactoryBean.setCs(connectionSource);
    sqlManagerFactoryBean.setNc(new UnderlinedNameConversion());
    sqlManagerFactoryBean.setDbStyle(new MySqlStyle());
    sqlManagerFactoryBean.getObject().addIdAutonGen(ID_AUTO_GEN, new IDAutoGen() {
        @Override
        public Object nextID(String params) {
            return BaseUUID.random();
        }
    });
    if (show) {
        sqlManagerFactoryBean.getObject().setInters(new Interceptor[]{new DebugInterceptor()});
    }
    return sqlManagerFactoryBean;
}
```



### Redis

```yaml
spring:
  redis:
	#database: name
    database: 0
	#server: host
    host: 192.168.88.94
    port: 6379
    password: 123456a
    #连接超时时间（毫秒）
    timeout: 60000
    jedis:
      pool:
        max-active: 8
        max-wait: 1
        max-idle: 8
        min-idle: 0
```

* **可视化工具的控制台语法**

```cmd
》get key 查询返回对应的值，否则返回null
》set key value 增加键值对
》exists key 判断对应的key是否存在 存在返回1，否则返回0
》type key 查看key的类型
》del key 删除对应的key
```



### 谷歌浏览器常用插件

* **postman**  网页调试与发送网页HTTP请求  接口测试
* **Json Viewer** 格式化请求接口，返回Json数据格式

### 注解解析

```
@controller 控制器（注入服务）
@ResponseBody 返回的为json数据
@RequestMapping  仅作用在处理器方法上
@service 服务（注入dao）
@repository（实现dao访问）
@component （把普通pojo实例化到spring容器中，相当于配置文件中的<bean id="" class=""/> 

@RestController 相当于@Controller+@ResponseBody两个注解的结合，返回json数据不需要在方法前面加@ResponseBody注解了，但使用@RestController这个注解，就不能返回jsp,html页面，视图解析器无法解析jsp,html页面

获取配置信息常用注解
@Value("${}") ("#{}")区别微#{}对应的是对象实体 
@Value不能直接用在含statice关键字静态标识的上面,否则会变成Null？ 用在set()方法

@ConfigurationProperties（“acme”），
@PropertySource

一、用 @Configuration用于定义配置类，可替换xml配置文件，被注解的类内部包含有一个或多个被@Bean注解的方法，这些方法将会被AnnotationConfigApplicationContext或AnnotationConfigWebApplicationContext类进行扫描，并用于构建bean定义，初始化Spring容器。
1.1、@Configuration配置spring并启动spring容器
1.2、@Configuration启动容器+@Bean注册Bean
1.3、@Configuration启动容器+@Component注册Bean
1.4、使用 AnnotationConfigApplicationContext 注册 AppContext 类的两种方法
1.5、配置Web应用程序(web.xml中配置AnnotationConfigApplicationContext)
```

```java
@Configuration
public  class WebConfig implements WebMvcConfigurer{

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("test").setViewName("emp/test");
        
    }
    
}
#等价于
@Controller
public class EmpContrller {
    
    @RequestMapping("test")
    public String test() {
        
        return "emp/test";
    }
}
```

```java
@Reference(version = "${online-service.version-2-0}", url = "${online-service.url}")注解

之前我常用的是@Autowired，我的理解就是从本地的spring容器内引入一个对象。
了解到@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按 byName自动注入。

@Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 通过 @Autowired的使用来消除 set ，get方法。

@Reference是dubbo的注解，@Resource是spring的

@Reference也是注入，他一般注入的是分布式的远程服务的对象，需要dubbo配置使用

总的来说他们的区别：@Reference注入的是分布式中的远程服务对象，@Resource和@Autowired注入的是本地spring容器中的对象。 

如果可以传入NULL值，则标记为@Nullable，如果不可以，则标注为@Nonnull。
例子：
public FileSystemXmlApplicationContext(boolean refresh, @Nullable ApplicationContext parent) throws BeansExcep  //有null则会有警告
```



@ControllerAdvice

```java
@ControllerAdvice，是Spring3.2提供的新注解，从名字上可以看出大体意思是控制器增强
```

- `@ControllerAdvice`是一个`@Component`，用于定义`@ExceptionHandler`，`@InitBinder`和`@ModelAttribute`方法，适用于所有使用`@RequestMapping`方法。
- Spring4之前，`@ControllerAdvice`在同一调度的Servlet中协助所有控制器。Spring4已经改变：`@ControllerAdvice`支持配置控制器的子集，而默认的行为仍然可以利用。
- 在Spring4中， `@ControllerAdvice`通过`annotations()`, `basePackageClasses()`, `basePackages()`方法定制用于选择控制器子集。

* 向前端返回数据时，自动忽略返回内容为null的属性

  ```java
  //该注解可以将实体类中的null的属性自动忽略，该注解可以对实现进行注解,注解后该类中出现null的属性时,传递回页面的json中自动忽略
  @JsonInclude(JsonInclude.Include.NON_NULL)
  ```

  ```yaml
  jackson:
    default-property-inclusion: NON_NULL
  ```

  

#### 获取参数

@RequestParam用于将请求参数区数据映射到功能处理方法的参数上。

```java
1、直接把表单的参数写在Controller相应的方法的形参中，适用于get方式提交，不适用于post方式提交
 @RequestParam(value = "page", defaultValue = "1")
2、通过HttpServletRequest接收，post方式和get方式都可以。
	request.getParameter("username");
3、通过一个bean来接收,post方式和get方式都可以。
4、get请求通过@PathVariable获取路径中的参数
@RequestMapping(value="/dubbo/say/{name}")
public String sayHello(@PathVariable("name") String name){
    //调用服务提供者的服务
    String result=remoteUserService.sayHello(name);
    return result;
}
5、使用@ModelAttribute注解获取POST请求的FORM表单数据
@RequestMapping(value="/addUser5",method=RequestMethod.POST)
public String addUser5(@ModelAttribute("user") UserModel user) {
    System.out.println("username is:"+user.getUsername());
    System.out.println("password is:"+user.getPassword());
    return "demo/index";
}
6、当请求参数username不存在时会有异常发生,可以通过设置属性required=false解决,例如: @RequestParam(value="username", required=false)
public String queryUserName(@RequestParam String userName)
7、@RequestBody
    @RequestBody，它只会全部绑定在第一个参数中，切记
以前，一直以为在SpringMVC环境中，@RequestBody接收的是一个Json对象，一直在调试代码都没有成功，后来发现，其实 @RequestBody接收的是一个Json对象的字符串，而不是一个Json对象。然而在ajax请求往往传的都是Json对象，后来发现用 JSON.stringify(data)的方式就能将对象变成字符串。同时ajax请求的时候也要指定dataType: "json",contentType:"application/json" 这样就可以轻易的将一个对象或者List传到Java端，使用@RequestBody即可绑定对象或者List.  
@RequestMapping(value = "saveUser", method = {RequestMethod.POST }})   
public void saveUser(@RequestBody List<User> users) { 
    userService.batchSave(users); 
} 
```

```java
1、application/x-www-form-urlencoded （浏览器的默认方式）
请求参数在Form Data中，只能上传键值对，并且键值对都是间隔分开的。
参数形式:  name1=value1&name2=value2
3、application/json  注意ajax的content-type
1）注解@RequestBody 
@RequestBody，它只会全部绑定在第一个参数中，切记
2）流HttpServletRequest.getInputStream()或者HttpServletRequest.getReader()
```



若：**@RequestMapping(value="/dubbo/say/**")**

#### 获取 /**  的所有内容

```java
/**
     * 获取文件路径
     * 杨春生
     * @param request
     * @return
     */
private String extractPathFromPattern(final HttpServletRequest request) {
    String path = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
    String bestMatchPattern = (String) request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE);
    return new AntPathMatcher().extractPathWithinPattern(bestMatchPattern, path);
}
```

#### AOP 切面@Around注解

Spring AOP常用于拦截器、事务、日志、权限验证等方面。

```java
@Around("execution(* com.company.controller.*.*(..))")
public Object around(ProceedingJoinPoint Point) throws Throwable {
     //获取方法参数类型数组
    String methodName = point.getSignature().getName();
        Object[] args = point.getArgs();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String params = formatArgs(args);
        Map<String, String> osAndBrowserInfo = OsAndBrowserInfoUtil.getOsAndBrowserInfo(request);
        AllianceUserDTO loginUser = getSysUserDTOCheckAuth(request);
        String requestURI = request.getRequestURI();
        String ip = IpAddressUtil.getIp(request);
        if (params.length() > SysLogConstants.MAX_WORD_NUM) {
            params = SysLogConstants.BEYOND_MAX_WORD_NUM;
        }
        save(ip, request.getSession().getId(), params, osAndBrowserInfo.get("os"), osAndBrowserInfo.get("browser"), methodName, null, requestURI, loginUser);
    //如果这里不返回result，则目标对象实际返回值会被置为null
        return point.proceed();
}

private String formatArgs(Object[] args) {
    StringBuffer argsStr = new StringBuffer();
    for (Object arg : args) {
        if (arg != null) {
            if (HttpServletRequest.class.isAssignableFrom(arg.getClass()) || HttpServletResponse.class.isAssignableFrom(arg.getClass())) {
                continue;
            } else {
                argsStr.append(JSON.toJSONString(arg)).append(",");
            }
        } else {
            argsStr.append("null,");
        }
    }
    if (argsStr.length() > 0) {
        argsStr.setLength(argsStr.length() - 1);
    }
    return argsStr.toString();
}
```



如果不想每次都写private  final Logger logger = LoggerFactory.getLogger(XXX.class); 可以用注解**@Slf4j**

如果注解@Slf4j注入后找不到变量log，那就给IDE安装lombok插件，



接下来我们看一下@RequestParam注解主要有哪些参数：

* value：参数名字，即入参的请求参数名字，如username表示请求的参数区中的名字为username的参数的值将传入；
* required：是否必须，默认是true，表示请求中一定要有相应的参数，否则将报404错误码；
* defaultValue：默认值，表示如果请求中没有同名参数时的默认值，默认值可以是SpEL表达式，如“#{systemProperties['java.vm.version']}”。



@Transactional 事务回滚

```java
@Transactional(rollbackFor=Exception.class)
如果类加了这个注解，那么这个类里面的方法抛出异常，就会回滚，数据库里面的数据也会回滚。

在@Transactional注解中如果不配置rollbackFor属性,那么事物只会在遇到RuntimeException的时候才会回滚,加上rollbackFor=Exception.class,可以让事物在遇到非运行时异常时也回滚
```

#### 自定义一个注解

##### 元注解

```java
元注解的作用就是注解其他注解，一般我们使用自定义注解时，就需要用元注解来标注我们自己的注解，一共有以下四个元注解
1.创建一个 Annotation 类型的类

2.@Target：说明了Annotation被修饰的范围，可被用于 packages、types（类、接口、枚举、Annotation类型）、类型成员（方法、构造方法、成员变量、枚举值）、方法参数和本地变量（如循环变量、catch参数）。在Annotation类型的声明中使用了target可更加明晰其修饰的目标

例：@Target(ElementType.TYPE)
 ElementType.CONSTRUCTOR:   用于描述构造器
 ElementType.FIELD:         用于描述域（类的成员变量）
 ElementType.LOCAL_VARIABLE:用于描述局部变量（方法内部变量）
 ElementType.METHOD:        用于描述方法
 ElementType.PACKAGE:       用于描述包
 ElementType.PARAMETER:     用于描述参数
 ElementType.TYPE:          用于描述类、接口(包括注解类型) 或enum声明

3.@Retention：定义了该Annotation被保留的时间长短，有些只在源码中保留，有时需要编译成的class中保留，有些需要程序运行时候保留。即描述注解的生命周期

例：@Retention(RetentionPolicy.RUNTIME)
1.RetentionPoicy.SOURCE:在源文件中有效（即源文件保留）
2.RetentionPoicy.CLASS:在class文件中有效（即class保留）
3.RetentionPoicy.RUNTIME:在运行时有效（即运行时保留）

4.@Inherited：它也是一个标记注解，它的作用是，被它标注的类型是可被继承的，比如一个class被@Inherited标记，那么一个子类继承该class后，则这个annotation将被用于该class的子类。

```

##### jdk的自带注解

```java

@Override：告诉编译器我重写了接口方法
@Deprecated：告诉编译器这个方法过时了，不建议使用，Ide会在方法上划横线
@SuppressWarnings("deprecation"):关闭方法中出现的警告
下面列出@SuppressWarnings注解参数的几个常见用法

例:@SuppressWarnings(value={ "rawtypes", "unchecked" })
1.deprecation：去除不暂成使用类的警告
2.serial：当在可序列化的类上缺少 serialVersionUID 定义时的警告
3.finally：任何 finally 子句不能正常完成时的警告
4.rawtypes：去除传参数时也要带泛型
5.unchecked：执行了未检查的转换时的警告，例如当使用集合时没有用泛型来指定集合保存的类型
6.unused：去除对未使用代码的警告
7:all:去除所有类型的警告
```

##### 自定义注解格式：

```java
public @interface 注解名 {定义体}
```

使用@interface定义一个注解，自动继承了java.lang.annotation.Annotation接口，其中的每一个方法实际上是声明了一个配置参数。方法的名称就是参数的名称，返回值类型就是参数的类型（返回值类型只能是基本类型、Class、String、enum）。可以通过default来声明参数的默认值。

注解参数的可支持数据类型：

```
1.所有基本数据类型（int,float,boolean,byte,double,char,long,short)
2.String类型
3.Class类型
4.enum类型
5.Annotation类型
6.以上所有类型的数组
```

* 定义注解成员的注意点: 第一,只能用public或默认(default)这两个访问权修饰.例如,String value();这里把方法设为defaul默认类型；　

* 第二,参数成员只能用基本类型byte,short,char,int,long,float,double,boolean八种基本数据类型和 String,Enum,Class,annotations等数据类型，以及这一些类型的数组。

* 第三,如果只有一个参数成员,最好把参数名称设为"value",后加小括号。

注解的默认值
注解元素必须有确定的值，要么指定时给默认值，要么使用时给值。不过有时候我们需要确定表达一个元素不存在值，所以使用空字符串或者负数表示某个元素不存在，在定义注解时，这已经成为一个约定用法。

```java
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface User {
   public int id() default -1;
   public String name() default "";
   public String address() default "";
}
```



### Node使用

安装项目所需的依赖

```cmd
$ cd my-project
$ cnpm install
$ cnpm run dev
 DONE  Compiled successfully in 4388ms
```

------

### FreeMarker

例子：http://freemarker.foofun.cn/dgui_quickstart_basics.html

```java
@GetMapping(value = {"/index.do"})
public String index(HttpServletRequest request,String orderId, String orderStatus) throws Exception {
    if (OrderStatusEnum.REVIEWING.getValue().equals(orderStatus)) {
        OrgDTO orgDTO = SessionKeyConstant.getSKeyOrg(request.getSession());
        OrgDurationDTO orgDuration = orgDurationService.getByOrgId(orgDTO.getId());
        request.setAttribute("orgDuration", orgDuration);
    }
    request.setAttribute("orderId", orderId);
    request.setAttribute("orderStatus", orderStatus);
    return "/online/bid/fifth";   //存在一个online/bid/fifth.ftl的模板
}
```

配置的方法

```yml
spring:
  freemarker:
    suffix: .ftl
    enabled: true
    cache: false
    settings:
     template_update_delay: 0
  resources:
    chain:
      strategy:
        content:
          enabled: true
```

```yaml

spring:
  freemarker:
    request-context-attribute: req  #req访问request
    suffix: .html  #后缀名
    content-type: text/html
    enabled: true
    cache: false #缓存配置
    template-loader-path: classpath:/templates/ #模板加载路径 按需配置
    charset: UTF-8 #编码格式
    settings:
    number_format: '0.##'   #数字格式化，无小数点
```

```xml
<!-- 整合Freemarker -->
    <!-- 放在InternalResourceViewResolver的前面，优先找freemarker -->  
    <bean id="freemarkerConfig" class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">  
        <property name="templateLoaderPath" value="/WEB-INF/views/templates"/>  
    </bean>  
    <bean id="viewResolver" class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">  
        <property name="prefix" value=""/>  
        <property name="suffix" value=".ftl"/>  
        <property name="contentType" value="text/html; charset=UTF-8"/>
    </bean>
```

#### springboot配置资源映射

Spring Boot 默认配置的`/**`映射到`/static`（或`/public`，`/resources`，`/META-INF/resources`），`/webjars/**`会映射到`classpath:/META-INF/resources/webjars/`。

**注意：**上面的`/static`等目录都是在`classpath:`下面。

如果你想增加如`/mystatic/**`映射到`classpath:/mystatic/`，你可以让你的配置类继承`WebMvcConfigurerAdapter`，然后重写如下方法：

```java
/**
* 静态资源使用md5作为版本号
*/
@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/mystatic/**")
            .addResourceLocations("classpath:/mystatic/")
        //此处若在resource有配置可忽略
            .resourceChain(false)
            .addResolver(new VersionResourceResolver()
            .addContentVersionStrategy("/**"));
}
```

这种方式会在默认的基础上增加`/mystatic/**`映射到`classpath:/mystatic/`，不会影响默认的方式，可以同时使用。

这样配置后，所有`/**`请求的静态资源都会被处理为上面例子的样子。

到这儿还没完，我们在写资源url的时候还要特殊处理。

首先增加如下配置：

```java
@ControllerAdvice
public class ControllerConfig {
    @Autowired
    ResourceUrlProvider resourceUrlProvider;
    @ModelAttribute("urls")
    public ResourceUrlProvider urls() {
        return this.resourceUrlProvider;
    }

}
```

然后在页面写的时候用下面的写法：

```html
<link rel="stylesheet" type="text/css" href="${urls.getForLookupPath('/css/index.css')}">
```



#### FreeMarker常用指令

```
分支控制语句
语法格式如下
<#if condition>
	....
<#elseif condition2>
	...
<#elseif condition3>      
	...
<#else>
	...
</#if> 
<#if orgList?? && (orgList?size > 0) >
list不为空

1. 用if判断对象是否为空
<#if obj??>不为空处理</#if>
<#if obj?default("xxx")>
	obj如果为空则给obj复制xxx。
<#if aaa?if_exists>  
<#if (aaa)!>不为空则执行
<#list lists!! as list> list的判断不为空
2、给对象赋默认值，避免空值
使用 ${(obj)!'xxx'} 来避免对象为空的错误。如果obj为空，则obj=xxx

3、list、break指令
    list指令时一个典型的迭代输出指令，用于迭代输出数据模型中的集合。list指令的语法格式如下：
     <#list sequence as item>
       ...
     </#list>
      除此之外，迭代集合对象时，还包括两个特殊的循环变量：
      a、item_index：当前变量的索引值。
      b、item_has_next:是否存在下一个对象
      也可以使用<#break>指令跳出迭代
      <#list ["星期一","星期二","星期三","星期四","星期五"] as x>
          ${x_index +1}.${x} <#if x_has_next>,</#if>
          <#if x = "星期四"><#break></#if>
      </#list>
      
4、include 指令
    include指令的作用类似于JSP的包含指令，用于包含指定页，include指令的语法格式如下
    <#include filename [options]
    在上面的语法格式中，两个参数的解释如下
    a、filename：该参数指定被包含的模板文件
    b、options：该参数可以省略，指定包含时的选项，包含encoding和parse两个选项，encoding指定包含页面时所使用的解码集，而parse指定被
    包含是否作为FTL文件来解析。如果省略了parse选项值，则该选项值默认是true
    
5、assign指令
	它用于为该模板页面创建或替换一个顶层变量
	
6、setting指令
        该指令用于设置FreeMarker的运行环境，该指令的语法格式如下：
        <#setting name = value>
        name 的取值范围包括如下几个
         locale ：该选项指定该模板所用的国家/语言选项
         number_format:该选项指定格式化输出数字的格式
         boolean_format:该选项指定两个布尔值的语法格式，默认值是"true、false"
         date_format,time_format,datetime_format：该选项指定格式化输出日期的格式
         time_zone:  设置格式化输出日期时所使用的时区


```

字符串的操作

```
1、substring（start,end）从一个字符串中截取子串 start:截取子串开始的索引，start必须大于等于0，小于等于end end: 截取子串的长度，end必须大于等于0，小于等于字符串长度，如果省略该参数，默认为字符串长度。
2、cap_first 将字符串中的第一个单词的首字母变为大写。
3、uncap_first将字符串中的第一个单词的首字母变为小写。
4、capitalize将字符串中的所有单词的首字母变为大写
5、 date,time，datetime将字符串转换为日期 例如： <#assign date1=”2009-10-12”?date(“yyyy-MM-dd”)>

6、ends_with 判断某个字符串是否由某个子串结尾，返回布尔值。
	${“string”?ends_with(“ing”)?string} 返回结果为true 注意：布尔值必须转换为字符串才能输出
	
7、index_of（substring,start）
8、length返回字符串的长度 ${“string”?length}à结果为6
9、lower_case将字符串转为小写 
10、upper_case将字符串转为大写 ${“string”?upper_case}à结果为STRING
11、contains 判断字符中是否包含某个子串。返回布尔值 ${“string”?contains(“ing”)?string} à结果为true 注意：布尔值必须转换为字符串才能输出
12、number将字符串转换为数字 ${“111.11”?number}à结果为111.11
13、replace用于将字符串中的一部分从左到右替换为另外的字符串。 ${“strabg”?replace(“ab”,”in”)} à结果为string
14、split使用指定的分隔符将一个字符串拆分为一组字符串
<#list “This|is|split”?split(“|”) as s> ${s} </#list> 结果为: This is split

15、trim 删除字符串首尾空格 ${“ String ”?trim} à结果为String
```

```
使用 >= 和 > 的时候有一点小问题。FreeMarker解释 > 的时候可以把它当作FTL标签的结束符。为了避免这种问题，可以使用 lt 代替 <， lte 代替 <=， gt 代替 > 还有 gte 代替 >=， 例如 <#if x gt y>。另外一个技巧是将表达式放到 圆括号 中， 尽管这么写并不优雅，例如 <#if (x > y)>。
```



------

### 浏览器客户端使用activeMQ

1、引入js文件，jquery.js类库支持

```html
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/amq_jquery_adapter.js"></script>
<script type="text/javascript" src="js/amq.js"></script>  
```

2、 初始化请求参数

```html
var amq = org.activemq.Amq;
  amq.init({ 
    uri: '/amq', 
    logging: true,
    timeout: 20,
    clientId:"123"
    //clientId:(new Date()).getTime().toString()
  });  
```

* Uri表示浏览器请求服务器端时的地址
* Logging表示浏览器在与服务器端交互时是否打印js日志
* Timeout表示轮询保持的时间
* Clientid表示浏览器的身份，如果用同一个字符串，则只有一个窗口会生效；如果用时间做参数，那么每一个浏览器窗口就相当于不同的消费者。

3、获取消息之后回调函数处理

```html
var myHandler ={
    rcvMessage: function(message){
    	console.log(message.data);
    	console.log(message.nodeValue);
    	console.log(message.wholeText);
    	//var bidData = eval('('+ message.textContent+ ')');
    }
  };  
```

* 这个函数是接收到消息之后的回调函数，至于回调函数的参数是一个js对象，取值的方法根据字符串和xml格式还不一样。最好的方式就是先研究一下amq.js的源代码，下面我直接给出不同的格式不同的取值方法。

4、客户端监听和发送消息

```js
amq.addListener(clientId,'topic://topic_js2',myHandler.rcvMessage); //消费者监听js
//amq.sendMessage(myDestination,myMessage); 这是java后端发送生产者消息
```

* 浏览器向服务器端发送注册监听器和发送消息的请求。
* clientId  表示消费者的一个ID,接受到消息回调时会用到作为标识 (new Date()).getTime().toString()
* topic://topic_js2  表示目的地，也可以为queue
* myHandler.rcvMessage   表示回调函数

```java
/**
     * 发送消息至mq
     *
     * @param topic   主题
     * @param message 消息内容
     */
    public static void sendMessage(String topic, String message) {
        ConnectionFactory connectionFactory;   
        Connection connection = null;	 
        Session session;
        Destination destination;
        MessageProducer producer;
        // 1、创建连接工厂 构造ConnectionFactory实例对象，此处采用ActiveMq的实现jar
        connectionFactory = new ActiveMQConnectionFactory(
                ActiveMQConnection.DEFAULT_USER,
                ActiveMQConnection.DEFAULT_PASSWORD, activemqBrokerUrl);
        //activemqBrokerUrl  连接的地址

        try { // 2、构造从工厂得到连接对象
            connection = connectionFactory.createConnection();
            // 3、启动
            connection.start();
            // 4、获取操作连接(参数1：是否启动事务,参数2：消息确认模式)
            session = connection.createSession(Boolean.TRUE,
                    Session.AUTO_ACKNOWLEDGE);
            destination = session.createTopic(topic);
            // 5、得到消息生成者【发送者】
            producer = session.createProducer(destination);
            // 6、设置不持久化，实际根据项目决定
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            //7、创建消息 
            //TextMessage textMessage = session.createTextMessage(message);
            ObjectMessage objectMessage = session.createObjectMessage();
            objectMessage.setObject(message);
            producer.send(destination, objectMessage);
            session.commit();
        } catch (Exception e) {
            SYS_LOGGER.error("发送消息通知报错"+ ExceptionUtils.getFullStackTrace(e));
        } finally {
            try {
                if (null != connection) {
                    connection.close();
                }
            } catch (Throwable ignore) {
                SYS_LOGGER.error("关闭消息通知连接报错" + ExceptionUtils.getFullStackTrace(ignore));
            }
        }
    }
```

后端服务器配置activemq的消息（注意拦截器是否把 /amq 拦截的问题）

```xml
需要的activemq的jar包
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-client</artifactId>
			<version>5.15.2</version>
		</dependency>

		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-kahadb-store</artifactId>
			<version>5.15.2</version>
		</dependency>
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-spring</artifactId>
			<version>5.15.2</version>
		</dependency>
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-web</artifactId>
			<version>5.15.2</version>
			<exclusions>
				<exclusion>
					<artifactId>activemq-all</artifactId>
					<groupId>org.apache.activemq</groupId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>javax.jms</groupId>
			<artifactId>jms</artifactId>
			<version>1.1</version>
		</dependency>
```

```java
/**
     * 注入activemq的ajax控制器
     */
    @Bean
    public ServletRegistrationBean ajaxServletRegistration() {
        ServletRegistrationBean registration = new ServletRegistrationBean(new AjaxServlet());
        registration.setEnabled(true);
        registration.addUrlMappings("/amq/*");
        return registration;
    }

    //向servletContext中初始化activemq的消息访问url
    @Bean
    public ServletContextInitializer initializer() {
        return new ServletContextInitializer() {
            @Override
            public void onStartup(ServletContext servletContext) throws ServletException {
                servletContext.setInitParameter("org.apache.activemq.brokerURL", activemqBrokerUrl);
            }
        };
    }

```

```yaml
#解决乱码的问题
spring
 http:
    encoding:
      charset: UTF-8
      enabled: true
      force: true
activemq:
  broker-url: tcp://127.0.0.1:61616
```

```java
@Component
public class ActiveMQUtil {
    private static final SysLogger SYS_LOGGER = SysLoggerFactory.getLogger(ActiveMQUtil.class);
    public static String activemqBrokerUrl;
    @Value("${activemq.broker-url}")
    public void setActivemqBrokerUrl(String brokerUrl) {
        ActiveMQUtil.activemqBrokerUrl = brokerUrl;
    }

    /**
     * 发送消息至mq
     *
     * @param topic   主题
     * @param message 消息内容
     */
    public static void sendMessage(String topic, String message) {
        ConnectionFactory connectionFactory;
        Connection connection = null;
        Session session;
        Destination destination;
        MessageProducer producer;
        // 构造ConnectionFactory实例对象，此处采用ActiveMq的实现jar
        connectionFactory = new ActiveMQConnectionFactory(
                ActiveMQConnection.DEFAULT_USER,
                ActiveMQConnection.DEFAULT_PASSWORD, activemqBrokerUrl);

        try { // 构造从工厂得到连接对象
            connection = connectionFactory.createConnection();
            // 启动
            connection.start();
            // 获取操作连接
            session = connection.createSession(Boolean.TRUE,
                    Session.AUTO_ACKNOWLEDGE);
            destination = session.createTopic(topic);
            // 得到消息生成者【发送者】
            producer = session.createProducer(destination);
            // 设置不持久化，实际根据项目决定
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            ObjectMessage objectMessage = session.createObjectMessage();
            objectMessage.setObject(message);
            producer.send(destination, objectMessage);
            session.commit();
        } catch (Exception e) {
            SYS_LOGGER.error("发送消息通知报错"+ ExceptionUtils.getFullStackTrace(e));
        } finally {
            try {
                if (null != connection) {
                    connection.close();
                }
            } catch (Throwable ignore) {
                SYS_LOGGER.error("关闭消息通知连接报错" + ExceptionUtils.getFullStackTrace(ignore));
            }
        }
    }
}

```



### RabbitMQ 的使用

#### 集成

```
#导入依赖
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-amqp</artifactId>
	<version>2.0.2.RELEASE</version>
</dependency> 

#对于rabbitMQ的支持
spring.rabbitmq.host=127.0.0.1
spring.rabbitmq.port=5672
spring.rabbitmq.username=guest
spring.rabbitmq.password=guest
```



 https://www.jianshu.com/p/188453d4b79c 浏览器端的使用

对于 @RabbitListener 这个注解要注意

https://blog.csdn.net/qq_41969879/article/details/81015262   队列Queue模式

https://blog.csdn.net/zhaodj5660/article/details/79895562     主题Topic模式

* 1.在启动类上添加@EnableRabbit注解

* 2.在Spring容器中托管一个RabbitListenerContainerFactory，默认实现类SimpleRabbitListenerContainerFactory

* 3.编写一个消息处理器类托管到Spring容器中，并使用**@RabbitListener**注解标注该类为RabbitMQ的消息处理类

* 4.使用**@RabbitHandler**注解标注在方法上，表示当有收到消息的时候，就交给带有@RabbitHandler的方法处理，具体找哪个方法需要根据MessageConverter转换后的对象类型决定

* host文件所在目录 ：C:\Windows\System32\drivers\etc 

```
# 开启RabbitMQ节点
rabbitmqctl start_app
# 开启RabbitMQ管理模块的插件，并配置到RabbitMQ节点上
rabbitmq-plugins enable rabbitmq_management rabbitmq_web_stomp rabbitmq_stomp rabbitmq_web_stomp_examples
# 关闭RabbitMQ节点
rabbitmqctl stop
```

```
#启动服务  E:\RabbitMQ\rabbitmq_server-3.7.17\sbin>目录下
rabbitmq-server.bat
rabbitmq-server -detached 后台启动
#查看状态
rabbitmq-server status

```

#### nginx笔记

~~~
cd /etc/nginx/
vim nginx.conf
cd /usr/sbin/
./nginx -s reload
~~~

```nginx
#配置说明
########### 每个指令必须有分号结束。#################
#user administrator administrators;  #配置用户或者组，默认为nobody nobody。
#worker_processes 2;  #允许生成的进程数，默认为1
#pid /nginx/pid/nginx.pid;   #指定nginx进程运行文件存放地址
error_log log/error.log debug;  #制定日志路径，级别。这个设置可以放入全局块，http块，server块，级别以此为：debug|info|notice|warn|error|crit|alert|emerg
events {
    accept_mutex on;   #设置网路连接序列化，防止惊群现象发生，默认为on
    multi_accept on;  #设置一个进程是否同时接受多个网络连接，默认为off
    #use epoll;      #事件驱动模型，select|poll|kqueue|epoll|resig|/dev/poll|eventport
    worker_connections  1024;    #最大连接数，默认为512
}
http {
    include       mime.types;   #文件扩展名与文件类型映射表
    default_type  application/octet-stream; #默认文件类型，默认为text/plain
    #access_log off; #取消服务日志    
    log_format myFormat '$remote_addr–$remote_user [$time_local] $request $status $body_bytes_sent $http_referer $http_user_agent $http_x_forwarded_for'; #自定义格式
    access_log log/access.log myFormat;  #combined为日志格式的默认值
    sendfile on;   #允许sendfile方式传输文件，默认为off，可以在http块，server块，location块。
    sendfile_max_chunk 100k;  #每个进程每次调用传输数量不能大于设定的值，默认为0，即不设上限。
    keepalive_timeout 65;  #连接超时时间，默认为75s，可以在http，server，location块。

    upstream mysvr {   
      server 127.0.0.1:7878;
      server 192.168.10.121:3333 backup;  #热备
    }
    error_page 404 https://www.baidu.com; #错误页
    server {
        keepalive_requests 120; #单连接请求上限次数。
        listen       4545;   #监听端口
        server_name  127.0.0.1;   #监听地址       
        location  ~*^.+$ {       #请求的url过滤，正则匹配，~为区分大小写，~*为不区分大小写。
           #root path;  #根目录
           #index vv.txt;  #设置默认页
           proxy_pass  http://mysvr;  #请求转向mysvr 定义的服务器列表
           deny 127.0.0.1;  #拒绝的ip
           allow 172.18.5.54; #允许的ip           
        } 
    }
}
```



```
gzy@5185188
ps -ef |grep rabbit  linux查看  /home/env

退出编辑模式 
　　按ESC键，然后 ：注意这里是要加冒号
　　　　退出vi
    :q!  不保存文件，强制退出vi命令
    :w   保存文件，不退出vi命令
    :wq  保存文件，退出vi命令

#添加stomp相关的插件
rabbitmq-plugins enable rabbitmq_web_stomp rabbitmq_stomp rabbitmq_web_stomp_examples
;
#重启服务
rabbitmqctl stop_app
rabbitmqctl start_app
#查看集群状态，有使用集群的话集群中的所有服务器都要添加插件
rabbitmqctl cluster_status
```

开放防火墙端口号

```
firewall-cmd --zone=public --add-port=15672/tcp --permanent #网页端口
firewall-cmd --zone=public --add-port=5672/tcp --permanent  #AMQP端口,java使用
firewall-cmd --reload # 重新加载
//关闭某个端口
"sudo iptables -A INPUT -p tcp --dport $PORT -j DROP"
"sudo iptables -A OUTPUT -p tcp --dport $PORT -j DROP" 
//linux或者
/sbin/iptables -I INPUT -p tcp --dport 5672 -j ACCEPT  
/sbin/iptables -I INPUT -p tcp --dport 15672 -j ACCEPT
备注一下
/sbin/iptables -I INPUT -p tcp --dport 8011 -j ACCEPT #开启8011端口 
/etc/rc.d/init.d/iptables save #保存配置 
/etc/rc.d/init.d/iptables restart #重启服务 

查看端口号
1、lsof -i:端口号
2、netstat -tunlp|grep 端口号
可以通过"netstat -anp" 来查看哪些端口被打开

//添加入站规则
启动指令:service iptables start   
重启指令:service iptables restart   
关闭指令:service iptables stop 

iptables -A OUTPUT -s 192.168.88.94 -p tcp -m tcp --sport 15674 -j ACCEPT 
```

#### 配置信息

~~~
#linux修改默认端口号  安装路径/etc/rabbitmq.config文件

[
	{rabbit, [
		{tcp_listeners, [{"192.168.88.94", 5673}]}，
		{rabbitmq_web_stomp,[{"192.168.88.94", 15675}]}
  		]
   	}
].

//----------------
[
	{rabbit, [
			{tcp_listeners, [{"192.168.88.94", 5673}]}			
  		]
   	},
   	{rabbitmq_web_stomp,[
   		{tcp_listen_options, [{"192.168.88.94", 15675}] }
   		]
   	}
].
//------------------
[
  {rabbitmq_web_stomp，
      [{tcp_config，[{port，12345 }]}]}}
]
~~~



```
#启动服务报错时
rabbitmq-service remove
rabbitmq-service install
net start rabbitmq

```



```yaml
#springboot的配置
spring:
  rabbitmq:
    host: 127.0.0.1
    username: guest
    password: guest
    port: 5672
```



```js
var ws = new WebSocket('ws://127.0.0.1:15674/ws');
// 获得Stomp client对象
var client = Stomp.over(ws);
// SockJS does not support heart-beat: disable heart-beats
//heart-beating也就是频率，incoming是接收频率，outgoing是发送频率
client.heartbeat.outgoing = 0; //发送频率
client.heartbeat.incoming = 0; //接收频率
//关闭控制台调试数据：client.debug = null
client.debug =function(str) {
    // append the debug log to a #debug div somewhere in the page using JQuery:
    $("#debug").append(str + "<br/>");
};;

// 定义连接成功回调函数
var on_connect = function(x) {
    //data.body是接收到的数据
    client.subscribe("/queue/user2", function(data) {
        var msg = data.body;
        console.log("收到数据：");
        console.log(data);
        $("#message").append(msg + "<br/>");
        data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
    },{ack:'client'});
};

// 定义错误时回调函数
var on_error =  function() {
    console.log('error');
};

// 连接RabbitMQ
client.connect('guest', 'guest', on_connect, on_error, '/');
```

```js
//订阅模式 这里的url为  交换机 / exchangeName / routekey 
client.subscribe("/exchange/topicExchange/topic.sendLeaveMsgQueue", function(data) {
     var msg = data.body;
     console.log("收到数据：");
     $("#message").append(msg + "<br/>");
     data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
 },{ack:'client'});
//队列的点对点模式  
 client.subscribe("/queue/sendLeaveMsgQueue", function(data) {
     data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
 },{ack:'client'});
```

后台的部分代码示例（是否用了初始化）

```java
    /**
     * a.留言的Topic模式
     */
    @Bean(name="sendLeaveMsgQueue")
    public Queue sendLeaveMsgQueue() {
        return new Queue(sendLeaveMsgQueue,true);
    }
    /**
     * b.创建交换机TopicExchange
     */
    @Bean
    public TopicExchange exchange(){
        return new TopicExchange(topicExchange);
    }
    /**
     * c.根据绑定规则将队列绑定到相应的交换机上（bindingKey）--Exchange Queues
     */
    @Bean
    public Binding bindingExchangeMessage(@Qualifier("sendLeaveMsgQueue") Queue queueMessage, TopicExchange exchange) {
        return BindingBuilder.bind(queueMessage).to(exchange).with(MsgRoute);
    }
```

//监听和发送

```java
// 自动创建，queue 和 exchange 绑定监听
   @RabbitListener(bindings = @QueueBinding(
            exchange = @Exchange("myOrder"),
            key = "computer",
            value = @Queue("computerOrder")
    )) 

// 参数：交换机，路由key, 消息
amqpTemplate.convertAndSend("myOrder","computer", msg);
```

这里是动态的创建消息模式 交换机exchange和 queue的绑定之类

```java
ConnectionFactory factory = new ConnectionFactory();  
         factory.setHost("localhost");
         factory.setPort(5672);
         factory.setUsername("guest");
         factory.setPassword("guest"); 
         Connection connection = factory.newConnection();  
         Channel channel = connection.createChannel();    
        String message = "Hello World!";          
         // 声明队列
         channel.queueDeclare(QUEUE_NAME, true, false, false, null);        
        // 绑定队列到交换机
        channel.queueBind(QUEUE_NAME, "TOPICExchange", "RouteKey");
		// 指定exchange和routing key，并发送消息到exchange
         channel.basicPublish("TOPICExchange", "RouteKey", null, message.getBytes());  
//不用交换机的方式
//Queue.DeclareOk queueDeclare (String queue , boolean durable , boolean exclusive , boolean autoDelete , Map arguments) throws IOException
// 指定一个队列
channel.queueDeclare(queue, false, false, false, null);
// 往队列中发出一条消息，由于是一个byte[]，所以意味着你可以发送任何数据
channel.basicPublish("", queue, null, message.toString().getBytes());

```

交换机属性

```tsx
name: 交换机名称
type: 交换机类型 direct，topic，fanout，headers
durability: 是否需要持久化，true 为持久化
auto delete: 当最后一个绑定到 exchange 上的队列被删除后，exchange 没有绑定的队列了，自动删除该 exchange
internal: 当前 exchange 是否用于 rabbitMQ 内部使用，默认为 false
arguments: 扩展参数，用于扩展 AMQP 协议自制定化使用
```

#### 查看日志的一些linux命令

```
# 查看文件，实时显示最后一页
tail  -f  filename        
# 实时查看日志文件 后一百行
tail - 100f  

# sz命令发送文件到本地：
sz filename
# rz命令本地上传文件到服务器：
rz  弹出回话框，选择文件上传
 

ps -ef | grep 'name'
查看当前所处的路径：    pdw
netstat -lnp|grep 端口号
 
-rw——- (600) 只有所有者才有读和写的权限
-rw-r–r– (644) 只有所有者才有读和写的权限，组群和其他人只有读的权限
-rwx—— (700) 只有所有者才有读，写，执行的权限
-rwxr-xr-x (755) 只有所有者才有读，写，执行的权限，组群和其他人只有读和执行的权限
-rwx–x–x (711) 只有所有者才有读，写，执行的权限，组群和其他人只有执行的权限
-rw-rw-rw- (666) 每个人都有读写的权限
-rwxrwxrwx (777) 每个人都有读写和执行的权限

rm -f 'fileName'  
rm -rf '文件夹'
  -d或–directory 　直接把欲删除的目录的硬连接数据删成0，删除该目录。 
　-f或–force 　强制删除文件或目录。 
　-i或–interactive 　删除既有文件或目录之前先询问用户。 
　-r或-R或–recursive 　递归处理，将指定目录下的所有文件及子目录一并处理。 
　-v或–verbose 　显示指令执行过程。 删除文件 不给出提示
```

```
#更改权限
chgrp  用户名  文件名  -R
切换所在组
chown 用户名  文件名  
```

```
#重命名
例子：将目录A重命名为B
mv A B
```



##### basicPublish方法

```java
 void basicPublish(String exchange, String routingKey, BasicProperties props, byte[] body) throws IOException;

void basicPublish(String exchange, String routingKey, boolean mandatory, BasicProperties props, byte[] body) throws IOException;

void basicPublish(String exchange, String routingKey, boolean mandatory, boolean immediate, BasicProperties props, byte[] body) throws IOException;

```

- exchange 交换器名称
- routingKey 路由键
- props 有14个成员

```tsx
 public static class BasicProperties extends com.rabbitmq.client.impl.AMQBasicProperties {
        private String contentType;   //消息类型如(text/plain)
        private String contentEncoding; //编码
        private Map<String,Object> headers; //header
        private Integer deliveryMode; //消息的投递模式
        private Integer priority; //优先级
        private String correlationId;
        private String replyTo;
        private String expiration; //过期时间
        private String messageId;
        private Date timestamp;
        private String type;
        private String userId;
        private String appId;
        private String clusterId;
```

------

### OpenOffice服务的启动命令

KKFileView预览项目 https://kkfileview.keking.cn/zh-cn/docs/production.html

* 在解压路径bin文件，运行startup脚本(Windows下以管理员身份运行`startup.bat`，Linux以root用户运行`startup.sh`）

* 浏览器访问本机8012端口（[http://127.0.0.1:8012](http://127.0.0.1:8012/) ）即可看到项目演示用首页

  

```
2、用以下命令启动OpenOffice服务 
cd D:\Program Files (x86)\OpenOffice 4\program
soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard 
```

```linux
#linux启动服务  好像和windows一样
1 /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard  临时启动
2 nohup /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &  后台启动
```



* CMD端口的问题

#### 查看端口是否被占用

```
netstat -ano | findstr 8080
```

​	   杀死占用端口的进程

```
taskkill -pid 进程pid -f  //根据pid杀死的进程
```



------

### RestTemplate详解HTTP请求

Springboot — 用更优雅的方式发HTTP请求(RestTemplate详解)

* https://www.cnblogs.com/javazhiyin/p/9851775.html

```java
/**
 * 不带参的get请求
 */
@Test
public void restTemplateGetTest(){
    RestTemplate restTemplate = new RestTemplate();
    Notice notice = restTemplate.getForObject("http://xxx.top/notice/list/1/5"
                                              , Notice.class);
    System.out.println(notice);
}
/**
 * 带参的get请求
 */
Notice notice = restTemplate.getForObject("http://fantj.top/notice/list/{1}/{2}"
                , Notice.class,1,5);
//方式二：
Map<String,String> map = new HashMap();
        map.put("start","1");
        map.put("page","5");
        Notice notice = restTemplate.getForObject("http://fantj.top/notice/list/"
                , Notice.class,map);
/** getForEntity()方法
 * 与getForObject()方法不同的是返回的是ResponseEntity对象，如果需要转换成pojo，还需要json工具类   * 的引入，这个按个人喜好用。不会解析json的可以百度FastJson或者Jackson等工具类。
 */
/**
 * POST请求
 */
@Test
public void rtPostObject(){
    RestTemplate restTemplate = new RestTemplate();
    String url = "http://47.xxx.xxx.96/register/checkEmail";
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    MultiValueMap<String, String> map= new LinkedMultiValueMap<>();
    map.add("email", "844072586@qq.com");
 
    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
    ResponseEntity<String> response = restTemplate.postForEntity( url, request , String.class );
    System.out.println(response.getBody());
}
/**
 * exchange 指定调用方式
 */
@Test
public void rtExchangeTest() throws JSONException {
    RestTemplate restTemplate = new RestTemplate();
    String url = "http://xxx.top/notice/list";
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("start",1);
    jsonObj.put("page",5);

    HttpEntity<String> entity = new HttpEntity<>(jsonObj.toString(), headers);
    ResponseEntity<JSONObject> exchange = restTemplate.exchange(url,
                                                                HttpMethod.GET, entity, JSONObject.class);
    System.out.println(exchange.getBody());
}
/**
 * excute 指定调用方式
 * excute()的用法与exchange()大同小异了，它同样可以指定不同的HttpMethod，不同的是它返回的对象是响应体所映射成的对象，而不是ResponseEntity。
 */
@Override
@Nullable
public <T> T postForObject(String url, @Nullable Object request, Class<T> responseType, Map<String, ?> uriVariables)
    throws RestClientException {

    RequestCallback requestCallback = httpEntityCallback(request, responseType);
    HttpMessageConverterExtractor<T> responseExtractor =
        new HttpMessageConverterExtractor<>(responseType, getMessageConverters(), logger);
    return execute(url, HttpMethod.POST, requestCallback, responseExtractor, uriVariables);
}
```

### sounarqube在jenkins上的配置

```
sonar.projectKey=operation-online
sonar.projectName=operation-online
sonar.projectVersion=1.0

sonar.language=java
sonar.sourceEncoding=UTF-8
sonar.scm.disabled=true

sonar.sources=./
#sonar.java.binaries=./
```

```
sonar.projectKey=songer
sonar.projectName=songer
sonar.projectVersion=1.0
sonar.sourceEncoding=UTF-8
sonar.modules=java-module
 
# Java module
java-module.sonar.projectName=Java Module
java-module.sonar.language=java
# .表示projectBaseDir指定的目录
java-module.sonar.sources=./
java-module.sonar.projectBaseDir=./
```

````
C:\Users\Administrator\.jenkins\plugins
````



参考文档：

* https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins

### springboot 整合 sitemesh3

第一步: 创建`WebSiteMeshFilter` 类

```java
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;
public class WebSiteMeshFilter extends ConfigurableSiteMeshFilter{  
  @Override   
  protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {     
     builder.addDecoratorPath("/strategy/shop/list", "/WEB-INF/views/decorators/decorator.jsp")           
     // Map decorators to path patterns.                  
     .addDecoratorPath("/strategy/**", "/WEB-INF/views/decorators/decorator.jsp")                // Exclude path from decoration.           
     .addExcludedPath("/login/**")            
     .addExcludedPath("/main/**")              
     .addExcludedPath("/popup/**");     
   builder.addTagRuleBundles(new DivExtractingTagRuleBundle());  
  }
}
```

第二部创建`WebConfig`类

```java
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
  

@Bean 
public FilterRegistrationBean filterRegistrationBean(@Qualifier("sitemesh3")WebSiteMeshFilter siteMeshFilter) {   
     FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();             
     filterRegistrationBean.setFilter(siteMeshFilter);        
     filterRegistrationBean.setEnabled(true);        
    filterRegistrationBean.addUrlPatterns("/*");        
    return filterRegistrationBean;   
  }
}
```

### springboot实现CORS 跨域请求

* https://blog.csdn.net/pjmike233/article/details/82461911

#### （全部跨域）

```java
#在webconfi中添加配置
@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
/*
* 实现跨域
*/
@Bean
public FilterRegistrationBean corsFilter() {	
     //1. 添加 CORS配置信息
    CorsConfiguration config = new CorsConfiguration();
    //放行哪些原始域
    config.addAllowedOrigin("*");
    //是否发送 Cookie
    config.setAllowCredentials(true);
    //放行哪些原始请求头部信息
    config.addAllowedHeader("*");
    //放行哪些请求方式
    config.addAllowedMethod("*");
    //2. 添加映射路径
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    source.registerCorsConfiguration("/**", config);
    FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
    bean.setOrder(0);
    return bean;
}
}
```

####  （局部跨域）

1、在控制器上使用注解 @CrossOrigin:

```java
@RestController
@CrossOrigin(origins = "*")
public class HelloController {
    @RequestMapping("/hello")
    public String hello() {
        return "hello world";
    }
}
```

2、使用 HttpServletResponse 对象添加响应头(Access-Control-Allow-Origin)来授权原始域，这里 Origin的值也可以设置为 “*”,表示全部放行。

```java
@RequestMapping("/index")
public String index(HttpServletResponse response) {
    response.addHeader("Access-Allow-Control-Origin","*");
    return "index";
}
```
ThreadLocal使用场景

```java
public final class SysSession {
    private static ThreadLocal<AuthenticatedUser> authenticatedUserLocal = new ThreadLocal<AuthenticatedUser>();
//### 所以只有那些一次请求有可能使用到多次的变量才存储到ThreadLocal中
```



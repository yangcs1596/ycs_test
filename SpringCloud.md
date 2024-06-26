

# 版本说明

```
https://github.com/alibaba/spring-cloud-alibaba/wiki/版本说明
```



# <span style="border-left: 5px solid rgb(248, 57, 41);">Sentinel+Nacos流量控制</span>

实现资源流控、降级、热点、授权

因为Sentinel控制台配置的规则是在内存中的，所以我们需要Nacos来存储规则实现持久化。

* `Sentinel`控制台安装

  可以在官网github上下载：https://github.com/alibaba/Sentinel/releases

* 启动脚本

  ```cmd
  java -Dserver.port=8080 -Dcsp.sentinel.dashboard.server=localhost:8080 -Dproject.name=sentinel-dashboard -jar sentinel-dashboard-1.8.6.jar 
  # 上面这种是将自己dashboard服务也注册上去，如果不需要则
  java -Dserver.port=8080 -jar sentinel-dashboard-1.8.6.jar
  ```

* 访问

  地址和账号密码 http://localhost:8080 账号：sentinel 密码：sentinel

## <span style="border-left: 5px solid rgb(248, 57, 41);">springboot项目接入Sentinel控制台配置规则</span>

* 引入依赖 在网关服务使用

```xml
<!-- SpringCloud Alibaba Sentinel -->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-sentinel</artifactId>
</dependency>

<!-- SpringCloud Alibaba Sentinel Gateway -->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-alibaba-sentinel-gateway</artifactId>
</dependency>
```

注意我这里没有写版本，因为我在父项目的pom文件中指定了阿里巴巴的依赖版本，子项目的相关依赖会自动寻找版本。

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-alibaba-dependencies</artifactId>
            <version>2.2.3.RELEASE</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

* 配置yml

```yml
spring:
  application:
    name: sentinel
  cloud:
    sentinel:
      transport:
        port: 8719
        dashboard: localhost:8080  #启动本项目后需要请求一次才能向sentinel控制台注册
```

Sentinel提供了多种数据源的支持，包括Nacos、Zookeeper、文件数据源等。

* 使用Nacos存储规则并实时更新
  Sentinel提供了多种数据源的支持，包括Nacos、Zookeeper、文件数据源等。

## Sentinel接入nacos数据源

### 引入依赖

```xml
<dependency>
    <groupId>com.alibaba.csp</groupId>
    <artifactId>sentinel-datasource-nacos</artifactId>
</dependency>
```

### **配置Nacos数据源**

```yml
spring:
  application:
    name: sentinel
  cloud:
    sentinel:
      transport:
        port: 8719
        dashboard: localhost:8080  #启动本项目后需要请求一次才能向sentinel控制台注册
      datasource: 
        ds2:
          nacos: 
            server-addr: 192.168.67.129:8848
            data-id: sentinel  
            group-id: Sentinel:Demo  
            #data-id和group-id等会需要在Nacos控制台新增一个同样的配置才能生效
            data-type: json #配置规则数据类
            rule-type: flow #flow代表流控类型
```

### 在nacos新增配置

新增注意data-id和group-id与上面sentinel的配置一直

```yml
[
    {
        "resource": "/",
        "limitApp": "default",
        "grade": 1,
        "count": 2,
        "strategy": 0,
        "controlBehavior": 0,
        "clusterMode": false
    }
]
```

* 启动效果

  启动项目，配置好Nacos后，我们可以直接在Sentinel控制台看到nacos的配置已经同步到Sentinel控制台了，并且规则已经生效了，以后该规则只需要在Naocs配置规则就能实时生效了

* 网关如果不成功就增加启动参数-Dcsp.sentinel.app.type=1 -Dcsp.sentinel.dashboard.server=localhost:8718; rule-type设置成gw-flow

# loadbalancer负载均衡

* Spring Cloud LoadBalancer提供了两种负载均衡算法：Round-Robin-based 和 Random，默认使用Round-Robin-based
* 可以通过实现`ServiceInstanceListSupplier`来筛选符合要求的服务实例
* 需要通过 `LoadBalancerClient` 注解，指定服务级别的负载均衡策略以及实例选择策略

例子

````yaml
# 负载均衡

- 假设preferHost为cai 则项目新增启动参数

```
-Dspring.cloud.nacos.discovery.metadata.preferHost=cai
```

- 客户端请求时,添加请求头LB-PREFER-HOST=cai，则会路由到相应主机

```
LB-PREFER-HOST=cai 
```
````

```xml
<!-- SpringCloud Alibaba Nacos -->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
    <optional>true</optional>
</dependency>

<!-- SpringCloud Alibaba Nacos Config -->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-nacos-config</artifactId>
    <optional>true</optional>
</dependency>

<!-- SpringCloud Loadbalancer -->
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-loadbalancer</artifactId>
    <optional>true</optional>
</dependency>
```

## 1、自定义负载均衡策略

### 1-1 自定义负载均衡

```java
自定义负载均衡策略 VersionGrayLoadBalancer

/**
 * Description:
 * 自定义灰度
 * 通过给请求头添加Version 与 Service Instance 元数据属性进行对比
 */
@Log4j2
public class VersionGrayLoadBalancer implements ReactorServiceInstanceLoadBalancer {
 
    private final ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider;
    private final String serviceId;
 
    private final AtomicInteger position;
 
    public VersionGrayLoadBalancer(ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider, String serviceId) {
        this(serviceInstanceListSupplierProvider,serviceId,new Random().nextInt(1000));
    }
 
    public VersionGrayLoadBalancer(ObjectProvider<ServiceInstanceListSupplier> serviceInstanceListSupplierProvider,
                                   String serviceId, int seedPosition) {
        this.serviceId = serviceId;
        this.serviceInstanceListSupplierProvider = serviceInstanceListSupplierProvider;
        this.position = new AtomicInteger(seedPosition);
    }
 
    @Override
    public Mono<Response<ServiceInstance>> choose(Request request) {
 
        ServiceInstanceListSupplier supplier = this.serviceInstanceListSupplierProvider.getIfAvailable(NoopServiceInstanceListSupplier::new);
 
        return supplier.get(request).next()
                .map(serviceInstances -> processInstanceResponse(serviceInstances,request));
 
    }
 
 
    private Response<ServiceInstance> processInstanceResponse(List<ServiceInstance> instances, Request request) {
        if (instances.isEmpty()) {
            log.warn("No servers available for service: " + this.serviceId);
            return new EmptyResponse();
        } else {
            DefaultRequestContext requestContext = (DefaultRequestContext) request.getContext();
            RequestData clientRequest = (RequestData) requestContext.getClientRequest();
            HttpHeaders headers = clientRequest.getHeaders();
 
            // get Request Header
            String reqVersion = headers.getFirst("version");
 
            if(StringUtils.isEmpty(reqVersion)){
                return processRibbonInstanceResponse(instances);
            }
 
            log.info("request header version : {}",reqVersion );
   // filter service instances
            List<ServiceInstance> serviceInstances = instances.stream()
                    .filter(instance -> reqVersion.equals(instance.getMetadata().get("version")))
                    .collect(Collectors.toList());
 
            if(serviceInstances.size() > 0){
                return processRibbonInstanceResponse(serviceInstances);
            }else{
                return processRibbonInstanceResponse(instances);
            }
        }
    }
 
    /**
     * 负载均衡器
     * 参考 org.springframework.cloud.loadbalancer.core.RoundRobinLoadBalancer#getInstanceResponse
     * @author javadaily
     */
    private Response<ServiceInstance> processRibbonInstanceResponse(List<ServiceInstance> instances) {
        int pos = Math.abs(this.position.incrementAndGet());
        ServiceInstance instance = instances.get(pos % instances.size());
        return new DefaultResponse(instance);
    }
 
}
```

### 1-2 用于替换默认的负载均衡算法

```java

/**
 * Description:
 * 自定义负载均衡器配置实现类
 */
public class VersionLoadBalancerConfiguration {
    @Bean
    ReactorLoadBalancer<ServiceInstance> versionGrayLoadBalancer(Environment environment,
                                                                 LoadBalancerClientFactory loadBalancerClientFactory) {
        String name = environment.getProperty(LoadBalancerClientFactory.PROPERTY_NAME);
        return new VersionGrayLoadBalancer(
                loadBalancerClientFactory.getLazyProvider(name, ServiceInstanceListSupplier.class), name);
    }
 
}
VersionLoadBalancerConfiguration配置类不能添加@Configuration注解。
在网关启动类使用注解@LoadBalancerClient指定哪些服务使用自定义负载均衡算法    
通过@LoadBalancerClient(value = "auth-service", configuration = VersionLoadBalancerConfiguration.class)，对于auth-service启用自定义负载均衡算法；
或通过@LoadBalancerClients(defaultConfiguration = VersionLoadBalancerConfiguration.class)为所有服务启用自定义负载均衡算法。
```

## 2、自定义服务实例筛选逻辑

### 2-1 自定义服务实例

```java
@Slf4j
public class PreferHostServiceInstanceListSupplier extends DelegatingServiceInstanceListSupplier {

    /**
     * Allows setting the name of the header used for passing the hint for PreferenceHost service instance filtering.
     */
    private static final String preferHostName = "LB-PREFER-HOST";

    private static final String DEFAULT_HOST = "DEFAULT-HOST";

    public PreferHostServiceInstanceListSupplier(ServiceInstanceListSupplier delegate) {
        super(delegate);
    }

    @Override
    public String getServiceId() {
        return delegate.getServiceId();
    }

    @Override
    public Flux<List<ServiceInstance>> get() {
        return delegate.get();
    }

    @Override
    public Flux<List<ServiceInstance>> get(Request request) {
        return delegate.get(request).map(instances -> filteredByPreferenceHost(instances, getPreferenceHost(request.getContext())));
    }

    private List<ServiceInstance> filteredByPreferenceHost(List<ServiceInstance> instances, String preferenceHost) {
        if (!StringUtils.hasText(preferenceHost)) {
            List<ServiceInstance> defaultPreferHostInstances = filterInstance(instances, "");
            if (defaultPreferHostInstances.size() > 0) {
                return defaultPreferHostInstances;
            }
            return instances;
        }
        List<ServiceInstance> filteredInstances = filterInstance(instances, preferenceHost);
        if (filteredInstances.size() > 0) {
            return filteredInstances;
        }
        // If instances cannot be found based on hint,
        // we return all instances retrieved for given service id.
        return instances;
    }

    private List<ServiceInstance> filterInstance(List<ServiceInstance> instances, String expect) {
        List<ServiceInstance> defaultPreferHostInstances = new ArrayList<>();
        for (ServiceInstance serviceInstance : instances) {
            if (serviceInstance.getMetadata().getOrDefault("preferHost", "").equals(expect)) {
                defaultPreferHostInstances.add(serviceInstance);
            }
        }
        return defaultPreferHostInstances;
    }

    private String getPreferenceHost(Object requestContext) {
        if (requestContext == null) {
            return null;
        }
        String hint = null;
        if (requestContext instanceof RequestDataContext) {
            hint = getPreferenceHostFromHeader((RequestDataContext) requestContext);
        }
        return hint;
    }

    private String getPreferenceHostFromHeader(RequestDataContext context) {
        if (context.getClientRequest() != null) {
            HttpHeaders headers = context.getClientRequest().getHeaders();
            if (headers != null) {
                return headers.getFirst(preferHostName);
            }
        }
        return null;
    }

}

```

### 2-2 写配置类

```java
/**
 * 自定义响应
 */
@ConditionalOnReactiveDiscoveryEnabled
public class CustomReactiveSupportLoadBalancerClientConfiguration {

    @Bean
    @ConditionalOnBean(ReactiveDiscoveryClient.class)
    @ConditionalOnMissingBean
    @Conditional(DefaultConfigurationCondition.class)
    public ServiceInstanceListSupplier discoveryClientServiceInstanceListSupplier(ConfigurableApplicationContext context) {
        return ServiceInstanceListSupplier.builder()
                .withDiscoveryClient()
                .with((c, delegate) -> new PreferHostServiceInstanceListSupplier(delegate))
                .build(context);
    }

}
/**
 * 自定义条件condition
 public class DefaultConfigurationCondition implements Condition {

    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        return LoadBalancerEnvironmentPropertyUtils.equalToOrMissingForClientOrDefault(context.getEnvironment(),
                "configurations", "default");
    }

}
 */
@Configuration(proxyBeanMethods = false)
@ConditionalOnBlockingDiscoveryEnabled
public class CustomBlockingSupportLoadBalancerClientConfiguration {

    @Bean
    @ConditionalOnBean(DiscoveryClient.class)
    @ConditionalOnMissingBean
    @Conditional(DefaultConfigurationCondition.class)
    public ServiceInstanceListSupplier discoveryClientServiceInstanceListSupplier(
            ConfigurableApplicationContext context) {
        return ServiceInstanceListSupplier.builder()
                .withBlockingDiscoveryClient()
                .with((c, delegate) -> new PreferHostServiceInstanceListSupplier(delegate))
                .build(context);
    }

}

/**
 * @author
 */
@Configuration(proxyBeanMethods = false)
@LoadBalancerClients(defaultConfiguration =
        {
                CustomReactiveSupportLoadBalancerClientConfiguration.class,
                CustomBlockingSupportLoadBalancerClientConfiguration.class
        }
)
@ConditionalOnProperty(value = "spring.cloud.loadbalancer.enabled", havingValue = "true", matchIfMissing = true)
public class CustomLoadBalancerCacheAutoConfiguration {

}
这个类文件放在auto自动注入文件夹spring.factories里，自动注入
这个类的作用只是包装，同在网关启动类使用注解@LoadBalancerClient指定哪些服务使用自定义负载均衡算法    
通过@LoadBalancerClient(value = "auth-service", configuration = VersionServiceInstanceListSupplierConfiguration.class)，对于auth-service启用自定义负载均衡算法；
或通过@LoadBalancerClients(defaultConfiguration = VersionServiceInstanceListSupplierConfiguration.class)为所有服务启用自定义负载均衡算法。
```



# Gateway网关服务

gateway官网：

> https://spring.io/projects/spring-cloud-gateway

取代Zuul网关

动态路由：能够匹配任何请求属性；
可以对路由指定**Predicate**（断言）和 **Filter**（过滤器）；
集成**Hystrix**的断路器功能；
集成SpringCloud服务发现功能；
易于编写的**Predicate**（断言）和**Filter**（过滤器）；
请求限流功能；
支持路径重写。



微服务网关是位于服务之前或者应用程序之前的一个层面，用于保护、增强和控制微服务的访问。

其常见的作用有：

1. 鉴权校验：验证是否认证和授权
2. 统一入口：提供所有微服务的入口点，起到隔离作用，保障服务的安全性
3. 限流熔断
4. 路由转发
5. 负载均衡
6. 链路追踪

### 增加actuator监控

通过Actuator可以在生产环境监控当前应用的健康，虚拟机等信息，通过前端以可视化的界面展示出来

```xml
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-gateway</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

配置

```yaml
server:
  port: 8080 #web服务端口
management:  #actuator
  server:
    port: 8081
  endpoints:
    web:
      base-path: /
      exposure:
        include: "*" #默认只有health和info
```
访问 /actuator/health 健康检查


`/gateway`为默认端点

| ID            | HTTP Method | Description            |
| ------------- | ----------- | ---------------------- |
| globalfilters | GET         | 展示所有的全局过滤器   |
| routefilters  | GET         | 展示所有的过滤器工厂   |
| refresh       | POST        | 清空路由缓存           |
| routes        | GET         | 展示路由列表           |
| routes/{id}   | GET         | 展示指定id的路由的信息 |
| routes/{id}   | POST        | 新增一个路由           |
| routes/{id}   | DELETE      | 删除一个路由           |

配置文件：

```properties
management.endpoint.gateway.enabled=true #default value
management.endpoints.web.exposure.include=gateway #暴露gateway端点，* 是暴露全部端点
```

* 全部路由的信息

`/actuator/gateway/routes`

默认情况下启用此功能。要禁用它

```
spring.cloud.gateway.actuator.verbose.enabled=false
```

* 全局过滤器（其它类推）

  ```
  GET`请向发出请求`/actuator/gateway/globalfilters
  ```

### 简单的配置

```yaml
spring:
  cloud:
    gateway:
      locator:
          enabled: true # 启用自动根据服务ID生成路由
          lower-case-service-id: true # 设置路由的路径为小写的服务ID
      routes:
        - id: laker
          uri: http://httpbin.org
          predicates:
            - Path=/get
         - id: notary-cloud-consumer-settlement
          uri: lb://notary-cloud-consumer-settlement  #lb代表负载均衡的意思/服务名
          predicates:
            - Path=/api/settlement/**
          filters:
            - StripPrefix=2
management:
  endpoints:
    web:
      exposure:
        include: "*"
        
 
### gateway 谓词的使用， 如host,method
server:
  port: 8080
spring:
  application:
    name: api-gateway
  cloud:
    gateway:
      routes:
        - id: gateway-service
          uri: https://www.baidu.com
          order: 0
          predicates:
            - Host=**.foo.org
            - Path=/headers
            - Method=GET
            - Header=X-Request-Id, \d+
            - Query=foo, ba.
            - Query=baz
            - Cookie=chocolate, ch.p\
## 各种 Predicates 同时存在于同一个路由时，请求必须同时满足所有的条件才被这个路由匹配。
## 一个请求满足多个路由的断言条件时，请求只会被首个成功匹配的路由转发
```

### 全局超时配置

```yaml
spring:
  cloud:
    gateway:
      httpclient:
        connect-timeout: 1000
        response-timeout: 5s
        
# 单独超时配置
        routes:
          - id: per_route_timeouts
                uri: https://example.org
                predicates:
                  - name: Path
                    args:
                      pattern: /delay/{timeout}
                metadata:
                  response-timeout: 200
                  connect-timeout: 200
```



### 路由谓词

| 路由谓词工厂 | Http协议匹配字段                                             | 备注   |
| ------------ | ------------------------------------------------------------ | ------ |
| **After**    | 谓词匹配在指定日期时间之后发生的请求                         | 不常用 |
| Before       | 在指定之前发生的请求                                         | 不常用 |
| Between      | 该谓词匹配之后`datetime1`和之前发生的请求`datetime2`         | 不常用 |
|              | predicates:        - Between=2017-01-20T17:42:47.789-07:00[America/Denver], 2017-01-21T17:42:47.789-07:00[America/Denver] |        |
| Cookie       | \- Cookie=somecookie, ch.p该谓词匹配具有给定名称且其值与正则表达式匹配的cookie | 不常用 |
| Header       | \- Header=X-Request-Id, \d+该谓词与具有给定名称的标头匹配    | 不常用 |
| Host         | \- Host=**.somehost.org,**.anotherhost.org                   | 不常用 |
| Method       | \- Method=GET,POST                                           | 不常用 |
| Path         | 路由谓词厂有两个参数：`PathMatcher` `patterns`和一个可选的标志叫`matchOptionalTrailingSeparator` | 常用   |
|              | \- Path=/red/{segment},/blue/{segment}   #匹配`/red/1`或`/red/blue`或`/blue/green` |        |
| Query        | \- Query=green  匹配  curl localhost:8080?green=x&id=2  \- Query=red, gree 请求包含一个参数匹配`red`，其值匹配`gree` |        |
| Weight       | `group`和`weight`（一个int）。权重是按组计算的  \- Weight=group1, 8  ##会将大约80％的流量转发 |        |



### 过滤器工厂

filters:

| 工厂名称            | 协议字段                                                     | 备注                                                         |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| AddRequestHeader    | filters:        - AddRequestHeader=X-Request-red, blue  #此清单将`X-Request-red:blue`标头添加到所有匹配请求的下游请求的标头中 |                                                              |
| AddRequestParameter | \- AddRequestParameter=red, blue 这将添加`red=blue`到所有匹配请求的下游请求的查询字符 |                                                              |
| AddResponseHeader   | 工厂需要`name`和`value`参数 \- AddResponseHeader=X-Response-Red, Blue |                                                              |
| FallbackHeaders     |                                                              |                                                              |
| RequestRateLimiter  | Redis限流器<br/>使用的算法是[令牌桶算法](https://en.wikipedia.org/wiki/Token_bucket)。<br/>spring:<br/>  cloud:<br/>    gateway:<br/>      routes:<br/>      - id: requestratelimiter_route<br/>        uri: https://example.org<br/>        filters:<br/>        - name: RequestRateLimiter<br/>          args:<br/>            redis-rate-limiter.replenishRate: 10 #属性是希望用户每秒允许多少个请求<br/>            redis-rate-limiter.burstCapacity: 20 #属性是允许用户在一秒钟内执行的最大请求数<br/>            redis-rate-limiter.requestedTokens: 1 #属性是一个请求要花费多少令牌。这是每个请求从存储桶中提取的令牌数，默认为`1`<br/> | 它引用一个名为的bean `myRateLimiter`。以下清单定义了一个使用`KeyResolver`<br/>spring:<br/>  cloud:<br/>    gateway:<br/>      routes:<br/>      - id: requestratelimiter_route<br/>        uri: https://example.org<br/>        filters:<br/>        - name: RequestRateLimiter<br/>          args:<br/>            rate-limiter: "#{@myRateLimiter}"<br/>            key-resolver: "#{@userKeyResolver}"<br/>————————————————<br/><br/>@Bean KeyResolver userKeyResolver() {    return exchange -> Mono.just(exchange.getRequest().getQueryParams().getFirst("user")); } |
| StripPrefix         | 要从请求中剥离的路径中的零件数 <br/>filters:        <br/>   - StripPrefix=2<br/> |                                                              |
| Retry               | retries：应尝试的重试次数。<br/>statuses：应重试的HTTP状态代码，使用表示org.springframework.http.HttpStatus。<br/>methods：应该重试的HTTP方法，以表示org.springframework.http.HttpMethod。<br/>series：要重试的一系列状态代码，使用表示org.springframework.http.HttpStatus.Series。<br/>exceptions：应重试的引发异常的列表。<br/>backoff：为重试配置的指数补偿<br/> | spring:<br/>  cloud:<br/>    gateway:<br/>      routes:<br/>      - id: retry_test<br/>        uri: http://localhost:8080/flakey<br/>        predicates:<br/>        - Host=*.retry.com<br/>        filters:<br/>        - name: Retry<br/>          args:<br/>            retries: 3<br/>            statuses: BAD_GATEWAY<br/>            methods: GET,POST<br/>            backoff:<br/>              firstBackoff: 10ms<br/>              maxBackoff: 50ms<br/>              factor: 2<br/>              basedOnPreviousValue: false<br/> |





# Feign 服务调用

### 在**消费端**引入 open-feign 依赖

```xml
<!-- 配置openfeign启动器 -->
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-openfeign</artifactId>
</dependency>

```

#开启

```java
@SpringCloudApplication
@EnableFeignClients // 开启Feign客户端
public class ConsumerApplication {
    public static void main(String[] args){
        SpringApplication.run(ConsumerApplication.class, args);
    }

}
```



### 客户端client

```java
@FeignClient("user-service")//生成一个代理对象， 并生成bean
public interface UserClient {
 
    @GetMapping("/user/{id}")
    User findOne(@PathVariable("id") Long id);
}
```

### Feign中本身已经集成了Ribbon依赖和自动配置

Fegin内置的Ribbon默认设置了请求超时时长，可以通过手动配置来修改这个超时时长，同时负载均衡策略在轮询的基础上增加了服务节点重试机制，一旦超时，会自动向下一个服务节点重新发起请求

```yaml
ribbon:
  ConnectTimeout: 2000 # 建立连接的超时时长(默认,注意这是连接微服务超时时间,不能更改)
  ReadTimeout: 1000 # 读取响应数据超时时长(注意这是调用微服务获取响应数据超时时间，默认1000)
  MaxAutoRetries: 0 # 调用的第一个节点的重试次数(默认)
  MaxAutoRetriesNextServer: 1 # 其他节点会重试多少个服务节点(默认)
  OkToRetryOnAllOperations: false # true所有超时请求都重试(默认false，代表只重试Get请求)，如果不能保证被调用服务的幂等性，请设置为false。
```



### Feign：Hystrix的支持

Feign默认也对Hystrix做了集成（只不过，默认情况下是关闭的）：

需要通过下面的参数来开启:

```yaml
feign:
  hystrix:
    enabled: true # 开启Feign的熔断功能(线程隔离与熔断) 
    

# 线程隔离超时时间

hystrix:
  command:
    default:
      execution:
        isolation:
          thread:
            timeoutInMilliseconds: 1000
```

例子： 定义UserClientFallback实现类，实现UserClient客户端接口，作为服务降级处理类，并生成Bean

```java
@Component // 生成bean
public class UserClientFallback implements UserClient {
    @Override
    public User findOne(Long id) {
        User user = new User();
        user.setId(1L);
        user.setName("用户异常");
        return user;
    }
}

// UserClient客户端接口中指定服务降级处理类
@FeignClient(value = "user-service", fallback = UserClientFallback.class)
public interface UserClient {
    @GetMapping("/user/{id}")
    User findOne(@PathVariable("id") Long id);
}
```

### get请求多入参的情况注解

* @SpringQueryMap

```java
@GetMapping("/page")
R<PageVO<AuthLoginLogVO>> page(@SpringQueryMap AuthLoginLogListParam param);
```

# Hystix 熔断器

```xml

<!-- 熔断和限流  -->
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-netflix-hystrix</artifactId>
</dependency>
```

网关中用到了ribbon，

```xml
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-netflix-ribbon</artifactId>
</dependency>
```

hystix有可视化界面

### [RestTemplate](https://so.csdn.net/so/search?q=RestTemplate&spm=1001.2101.3001.7020)开启ribbon的负载均衡，@LoadBalanced

```java

@Configuration
public class GateConfig {
	
	@Bean
	@LoadBalanced
	public RestTemplate restTemplate(ClientHttpRequestFactory factory) {
		RestTemplate restTemplate = new RestTemplate(factory);
		// 支持中文编码
		restTemplate.getMessageConverters().set(1, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		return restTemplate;
 
	}
 
	@Bean
	public ClientHttpRequestFactory simpleClientHttpRequestFactory() {
//        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
		HttpComponentsClientHttpRequestFactory httpRequestFactory = new HttpComponentsClientHttpRequestFactory();
 
		httpRequestFactory.setReadTimeout(5000);// 单位为ms
		httpRequestFactory.setConnectTimeout(5000);// 单位为ms
		return httpRequestFactory;
	}
 
//	@Bean
//    public RestTemplate restTemplate(RestTemplateBuilder builder){
//        return builder.build();
//    }
 
//	@Bean
//	public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
//		return builder.routes()
//			.route("path_route", r -> r.path("/get")
//				.uri("http://httpbin.org"))
//			
//			.route("host_route", r -> r.host("*.myhost.org")
//				.uri("http://httpbin.org"))
//			
//			.route("rewrite_route", r -> r.host("*.rewrite.org")
//				.filters(f -> f.rewritePath("/foo/(?<segment>.*)", "/${segment}"))
//				.uri("http://httpbin.org"))
//			
//			.route("hystrix_route", r -> r.host("*.hystrix.org")
//				.filters(f -> f.hystrix(c -> c.setName("slowcmd")))
//				.uri("http://httpbin.org"))
//			
//			.route("hystrix_fallback_route", r -> r.host("*.hystrixfallback.org")
//				.filters(f -> f.hystrix(c -> c.setName("slowcmd").setFallbackUri("forward:/hystrixfallback")))
//				.uri("http://httpbin.org"))
//			
//			.route("limit_route", r -> r
//				.host("*.limited.org").and().path("/anything/**")
//				.filters(f -> f.requestRateLimiter(c -> c.setRateLimiter(redisRateLimiter())))
//				.uri("http://httpbin.org"))
//			
//			.build();
//	}
 
//	@Bean
//	public RouteDefinitionWriter routeDefinitionWriter() {
//		return new InMemoryRouteDefinitionRepository();
//	}
//
//	@Bean
//	public DbRouteDefinitionRepository dbRouteDefinitionRepository() {
//		return new DbRouteDefinitionRepository();
//	}
}
```



### yml配置

```yaml
server: 
   port: 8888
 #链接建立超时时间
   connection-timeout: 10000 
   tomcat: 
     max-threads: 6 # 最大线程数
     min-spare-thread: 3 # 最小线程数
     accept-count: 10 # 队列长度
     max-connections: 1000 # 最大链接数
     
spring:
  application:
    name: gate
  servlet: 
    multipart: 
      max-file-size: 50MB #单个文件上传的大小限制，默认1MB
      max-request-size: 150MB #一次请求总共文件大侠限制。 如果用nginx，需要改nginx的限制，在server配置client_max_body_size 300M;
  redis:
    timeout: 6000ms
    database: 10 
    host: localhost #单实例redis用这个配置
    password: #单实例redis用这个配置
    port: 6379 #单实例redis用这个配置
#    password: Redis@123 #集群用这个配置
#    cluster: #集群用这个配置
#      nodes:
#        - 127.0.0.1:7011
#        - 127.0.0.1:7012
#        - 127.0.0.1:7013
#        - 127.0.0.1:7014
#        - 127.0.0.1:7015
#        - 127.0.0.1:7016
#      max-redirects: 2 #获取失败 最大重定向次数
    lettuce:
      pool: 
        max-active: 1000 #连接池最大连接数（使用负值表示没有限制）
        max-idle: 10 #连接池中的最大空闲连接
        min-idle: 3 #连接池中的最小空闲连接
        max-wait: -1 #连接池最大阻塞等待时间（使用负值表示没有限制）
  cloud:
    consul:
      host: 127.0.0.1  #注册中心的ip或host。也是集群地址，配置一个即可。注释掉整个consul这段就可以启动，即使没有注册中心也不报错。有这段就必须有一个可用的注册中心，否则启动报错
      port: 8500
      discovery:
        enabled: true #默认true。Consul Discovery Client是否注册到注册中心。和register同时设置成false，就不需要起consul服务。
        register: true #是否将服务注册到Consul集群中心.。这个参数和上面的enabled参数同时设置成false，应用才不会注册注册中心，才可以不起consul服务！
        deregister: true #默认true，服务停止时注销服务，即从服务列表中删除。设置成false的话，？？？
        #service-name: ${spring.application.name}  #注册在consul上面的名字，在consul的调用中，是通过此名字调用的。默认服务名,不要改
        instance-id: ${spring.application.name}-${spring.cloud.client.ip-address}:${server.port} #只供显示用,在ID列显示
        health-check-interval: 10s  #配置 Consul 健康检查频率，也就是心跳频率。
        health-check-timeout: 10s #健康检查超时
#        health-check-critical-timeout: 10s #注册成功之后，如果关闭微服务，consul将检测60s,如果60s之后还检测不到此服务，将会把此服务从注册列表中移除.如果想重启consul，服务能主动注册到consul，这个参数必须注释掉！！！
        #health-check-path: /tmp #健康检查路径
        prefer-ip-address: true #表示注册时使用IP而不是hostname
      retry:
        initial-interval: 1000   # 初始重试间隔（以毫秒为单位
        max-attempts: 3
        max-interval: 2000
        multiplier: 1.1
    gateway:
#      default-filters: 
#      - name: Hystrix
#        args: 
#          name: myfallback
#          fallbackUri: forward:/defaultfallback
      routes:
      - id: one
        uri: lb://one
        predicates: 
          - Path=/one/**
        filters:
        - StripPrefix=1
        - AddRequestHeader=X-Request-color, blue
        - AddRequestHeader=X-Request-temp, blue
        - name: RequestRateLimiter
          args:
            rate-limiter: "#{@urlAndChannelRedisRateLimiter}"
            key-resolver: "#{@selfUrlAndChannelKeyResolver}"
        - name: Hystrix
          args:  
            name: commandone
            fallbackUri: forward:/defaultfallback1
      - id: two
        uri: lb://two
        predicates: 
          - Path=/two/**
        filters:
        - StripPrefix=1
        - name: RequestRateLimiter
          args:
            rate-limiter: "#{@urlAndChannelRedisRateLimiter}"
            key-resolver: "#{@selfUrlAndChannelKeyResolver}" 
        - name: Hystrix
          args:  
            name: commandtwo
            fallbackUri: forward:/defaultfallback2
 
 
# hystrix 信号量隔离，timeoutInMilliseconds毫秒后自动超时.第3个值跟Hystrix的name属性是对应的。比如，你配置的是fallbackone，name就该这样配置fallbackone.也可以平铺，例如上面
       
hystrix:
  threadpool: 
    default: 
      coreSize: 10 
      maxQueueSize: -1 
      queueSizeRejectionThreshold: 1000 
  command: 
    myfallback: 
      metrics: 
        rollingStats: 
          timeInMilliseconds: 10000 #默认10000即10秒
      execution: 
        isolation: 
          strategy: THREAD # THREAD SEMAPHORE
          thread: 
            timeoutInMilliseconds: 5000
        timeout: 
          enabled: true #默认true，使用timeoutInMilliseconds作为超时时间，否则使用ribbon的超时
      circuitBreaker:
        forceClosed: false #默认false，想强制关闭熔断就改成true
        requestVolumeThreshold: 2 #窗口采样大小20
        sleepWindowInMilliseconds: 6000 #短路后休眠时间毫秒
        errorThresholdPercentage: 30 #判断出错百分比50
    commandone: 
      metrics: 
        rollingStats: 
          timeInMilliseconds: 10000 #默认10000即10秒
      execution: 
        isolation: 
          strategy: THREAD # THREAD SEMAPHORE
          thread: 
            timeoutInMilliseconds: 6000
        timeout: 
          enabled: true #默认true，使用timeoutInMilliseconds作为超时时间，否则使用ribbon的超时
      circuitBreaker:
        forceClosed: false #默认false，想强制关闭熔断就改成true
        requestVolumeThreshold: 2 #窗口采样大小20
        sleepWindowInMilliseconds: 6000 #短路后休眠时间毫秒
        errorThresholdPercentage: 30 #判断出错百分比50
    commandtwo: 
      metrics: 
        rollingStats: 
          timeInMilliseconds: 10000 #默认10000即10秒
      execution: 
        isolation: 
          strategy: THREAD # THREAD SEMAPHORE
          thread: 
            timeoutInMilliseconds: 3000
        timeout: 
          enabled: true #默认true，使用timeoutInMilliseconds作为超时时间，否则使用ribbon的超时
      circuitBreaker:
        forceClosed: false #默认false，想强制关闭熔断就改成true
        requestVolumeThreshold: 2 #窗口采样大小20
        sleepWindowInMilliseconds: 12000 #短路后休眠时间毫秒
        errorThresholdPercentage: 50 #判断出错百分比50
 
#实际的超时时间是(ReadTimeout+ConnectTimeout)*(MaxAutoRetries+1)*(MaxAutoRetriesNextServer+1)
#如果MaxAutoRetries和MaxAutoRetriesNextServer都设为0，那么实际超时就是(ReadTimeout+ConnectTimeout)了
ribbon: 
  eureka: 
    enabled: false
  eager-load: 
    enabled: true #饥饿加载，系统启动时创建好ribbon客户端而不是在使用时去创建
  ConnectTimeout: 2000 #单位ms,请求连接超时时间
  ReadTimeout: 4000 #单位ms,请求处理的超时时间
  OkToRetryOnAllOperations: false #对所有操作请求都进行重试
  MaxAutoRetriesNextServer: 0 #切换实例的重试次数
  MaxAutoRetries: 0 #对当前实例的重试次数
  ServerListRefreshInterval: 2000 #Interval to refresh the server list from the source
  NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RetryRule
#  listofServers:localhost:8001,localhost:8002,localhost:8003
 
one:
  ribbon: 
    eureka: 
      enabled: false
    eager-load: 
      enabled: true #饥饿加载，系统启动时创建好ribbon客户端而不是在使用时去创建
    ConnectTimeout: 2000 #单位ms,请求连接超时时间
    ReadTimeout: 4000 #单位ms,请求处理的超时时间
    OkToRetryOnAllOperations: false #对所有操作请求都进行重试
    MaxAutoRetriesNextServer: 0 #切换实例的重试次数
    MaxAutoRetries: 0 #对当前实例的重试次数
    ServerListRefreshInterval: 2000 #Interval to refresh the server list from the source
    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RetryRule
    
    
feign:
  hystrix: 
    enabled: false
 
#eureka:
#  instance:
#    prefer-ip-address: true
#    instance-id: ${spring.application.name}:${spring.cloud.client.ip-address}:${server.port}
#    lease-expiration-duration-in-seconds: 10
#    lease-renewal-interval-in-seconds: 3
#  client:
#    registry-fetch-interval-seconds: 5
#    serviceUrl:
#      defaultZone: http://localhost:8761/eureka/
 
#启用监控.开启监控后，可直接通过actuator的rest接口查看服务的详细信息。例如查看网关的路由：http://localhost:8888/actuator/gateway/routes
management:
  endpoints:
    web:
      exposure:
        include: 
        - "*"  # 开放所有端点health，info，metrics，通过actuator/+端点名就可以获取相应的信息。默认打开health和info
  endpoint:
    health:
      show-details: always  #未开启actuator/health时，我们获取到的信息是{"status":"UP"}，status的值还有可能是 DOWN。开启后打印详细信息
 
logging: 
  # logback.xml路径，默认为classpath:logback.xml
  pattern:  
    file: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
    console: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
  path: D:\cloudlogs\
  file: D:\cloudlogs\gate.log
  file.max-size: 3MB
  level: 
    root: info
    #com.bestvike: debug
#是否启动注册状态检查，启动后发现在注册中心状态有问题就不停的注册自己，直至成功。
my: 
  consul: 
    check: 
      register: false
      interval: 10
   
#限流参数格式： 系统名称_限流key: 限流速率@令牌桶大小.并有一个default配置。  
selfratelimiter:
  rateLimitChannel:
    default: 5@10
    one_channelA: 2@3
    one_channelB: 1@2
    two_channelA: 1@2
    two_channelB: 2@4
  rateLimitIP:
    default: 55@70
    one_192.168.124.17: 2@3
    two_192.168.124.18: 1@2
    two_192.168.124.19: 5@10
  rateLimitUrlAndChannel:
    default: 6600@8000
    url_1: /one/limit/sprint
    channel_url_1: channelA
    limit_url_1: 1@2
    url_2: /one/limit/sprint2
    channel_url_2: channelA
    limit_url_2: 2@3
    url_3: /one/limit/sprint
    channel_url_3: channelB
    limit_url_3: 3@4
   
#系统启动后调用的service进行初始化数据，按顺序执行InitDataService 
initservicelist:
  servicesMap: 
    1: initSysDataService 
    2: initRedisDataService
#    12: paramService2 
#    37: userServicegg 
#    3: userService3 
 
 
#jasypt加密后的密码
mypass:
  pass1: ENC(NfA+LtBfc26xLiHLb0EGXeNfU9TaE2tQIt7X94DrodPcUKV/tnTKQLz7bcLSM3i0)
  
  
#jasypt加密配置
jasypt:
  encryptor:
    password: miyao
    algorithm: PBEWITHHMACSHA512ANDAES_256
#    property:
#      prefix: "ENC@["
#      suffix: "]"
```



注意，每个微服务，我单独配置了Hystrix的一套配置参数。也可以把每个微服务的Hystrix去掉，用一个总的默认的配置：

```yaml
gateway:
#      default-filters: 
#      - name: Hystrix
#        args: 
#          name: myfallback
#          fallbackUri: forward:/defaultfallback
```
### ribon配置

```yaml
#实际的超时时间是(ReadTimeout+ConnectTimeout)*(MaxAutoRetries+1)*(MaxAutoRetriesNextServer+1)
#如果MaxAutoRetries和MaxAutoRetriesNextServer都设为0，那么实际超时就是(ReadTimeout+ConnectTimeout)了
ribbon: 
  eureka: 
    enabled: false
  eager-load: 
    enabled: true #饥饿加载，系统启动时创建好ribbon客户端而不是在使用时去创建
  ConnectTimeout: 2000 #单位ms,请求连接超时时间
  ReadTimeout: 4000 #单位ms,请求处理的超时时间
  OkToRetryOnAllOperations: false #对所有操作请求都进行重试
  MaxAutoRetriesNextServer: 0 #切换实例的重试次数
  MaxAutoRetries: 0 #对当前实例的重试次数
  ServerListRefreshInterval: 2000 #Interval to refresh the server list from the source
  NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RetryRule

#  listofServers:localhost:8001,localhost:8002,localhost:8003

one:
  ribbon: 
    eureka: 
      enabled: false
    eager-load: 
      enabled: true #饥饿加载，系统启动时创建好ribbon客户端而不是在使用时去创建
    ConnectTimeout: 2000 #单位ms,请求连接超时时间
    ReadTimeout: 4000 #单位ms,请求处理的超时时间
    OkToRetryOnAllOperations: false #对所有操作请求都进行重试
    MaxAutoRetriesNextServer: 0 #切换实例的重试次数
    MaxAutoRetries: 0 #对当前实例的重试次数
    ServerListRefreshInterval: 2000 #Interval to refresh the server list from the source
    NFLoadBalancerRuleClassName: com.netflix.loadbalancer.RetryRule
```

# 分布式事务seata 

## 整合服务 

*  https://www.jianshu.com/p/f699b3b558bd

注意先下载搭建seata  下载地址https://github.com/seata/seata

其它的分布式事务技术：TX-LCN（有可视化界面）@LcnTransaction

lcn和seata简单对比，seata更胜一筹把

相同点

```
a、都能解决分布式事务问题
b、都使用AOP代理事务
c、事务的提交和回滚都是由发起方决定。
```

不同点

```
核心：事务的回滚机制不一致，LCN是全局假关闭事务，Seata是采用undo_log生成逆向sql回滚操作。
a、LCN的事务代理是全局的，采用了假关闭模式。
Seata事务代理只是代理局部各自的事务，在原生sql的前后记录了操作的信息，存在了undo_log的日志中。
b、LCN的事务一直都锁着记录，只是不提交而已，容易造成数据的死锁。
Seata的局部事务已经写到了库中，避免了死锁现象，但容易出现脏读的情况。
c、LCN有控制台界面，Seata没有控制台界面
```

 

```xml
<dependency>
    <groupId>io.seata</groupId>
    <artifactId>seata-spring-boot-starter</artifactId>
    <version>最新版</version>
</dependency>
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-seata</artifactId>
    <version>2.2.1.RELEASE</version>
    <exclusions>
        <exclusion>
            <groupId>io.seata</groupId>
            <artifactId>seata-spring-boot-starter</artifactId>
        </exclusion>
    </exclusions>
</dependency>

还是无法启动，可以使用以下依赖：

<dependency>
     <groupId>com.alibaba.cloud</groupId>
     <artifactId>spring-cloud-starter-alibaba-seata</artifactId>
 </dependency>
```

@GlobalTransactional 开启分布式事务



# 服务监控

## Spring-Boot Admin

```xml
<spring-boot-admin.version>2.6.2</spring-boot-admin.version>
<!-- 客户端 -->
<dependency>
	<groupId>de.codecentric</groupId>
    <artifactId>spring-boot-admin-starter-client</artifactId>
    <version>${spring-boot-admin.version}</version>
</dependency>
<!-- 服务端 -->
<dependency>
	<groupId>de.codecentric</groupId>
    <artifactId>spring-boot-admin-starter-server</artifactId>
    <version>${spring-boot-admin.version}</version>
</dependency>
```

### 服务端配置

```java
@EnableAdminServer
@EnableDiscoveryClient
```

```properties
spring.application.name=admin-server
server.port=8769
```

### 客户端配置

```properties
spring.application.name=admin-client
server.port=8080
# 注册到Admin
spring.boot.admin.client.url=http://localhost:8769
management.endpoints.web.exposure.include=*
management.endpoint.health.show-details=ALWAYS
```

访问 http://localhost:8769

```yaml
spring:
  application:
    name: springcloud-admin-client
  boot:
    admin:
      client:
      #springboot admin client连接 spring boot admin server 端点地址springboot admin client连接 spring boot admin server 端点地址
        url: http://localhost:8788
        instance:
        #默认使用的是主机名注册，改为使用ip注册
          prefer-ip: true
management:
  endpoints:
    web:
      exposure:
        #开放所有页面节点  默认只开启了health、info两个节点
        include: '*'
  endpoint:
    health:
      #显示健康具体信息  默认不会显示详细信息
      show-details: always
# 利用info端点，加入版本等信息
info:
  versin: @project.version@
  name: @project.artifactId@
  group: @project.groupId@
  description: @project.description@
  #还可以自定义信息
  author: Coding Farmer
  blog: http://www.coding-farmer.cn
```



# 分表分库

## Sharding-JDBC

## mycat使用

安装

```
下载地址为：http://dl.mycat.org.cn/1.6.7.5/2020-4-10/
tar -zxvf  Mycat-server-1.6.7.5-release-20200422133810-linux.tar.gz -C /usr/local
配置环境变量
vi /etc/profile
添加如下配置信息：
export MYCAT_HOME=/usr/local/mycat
export PATH=$MYCAT_HOME/bin:$PATH:$JAVA_HOME/bin
```

配置mycat

```xml
1.修改server.xml文件
<?xml version="1.0" encoding="UTF-8"?>
<!-- - - Licensed under the Apache License, Version 2.0 (the "License"); 
	- you may not use this file except in compliance with the License. - You 
	may obtain a copy of the License at - - http://www.apache.org/licenses/LICENSE-2.0 
	- - Unless required by applicable law or agreed to in writing, software - 
	distributed under the License is distributed on an "AS IS" BASIS, - WITHOUT 
	WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. - See the 
	License for the specific language governing permissions and - limitations 
	under the License. -->
<!DOCTYPE mycat:server SYSTEM "server.dtd">
<mycat:server xmlns:mycat="http://io.mycat/">
	<user name="root" defaultAccount="true">
		<property name="password">123456</property>
		<property name="schemas">TESTDB</property>
		<property name="defaultSchema">TESTDB</property>
	</user>
</mycat:server>

2.修改schema.xml文件
<?xml version="1.0"?>
<!DOCTYPE mycat:schema SYSTEM "schema.dtd">
<mycat:schema xmlns:mycat="http://io.mycat/">
        <schema name="TESTDB" checkSQLschema="false" sqlMaxLimit="100" dataNode="dn1">
        </schema>
        <dataNode name="dn1" dataHost="host1" database="msb" />
        <dataHost name="host1" maxCon="1000" minCon="10" balance="0"
                          writeType="0" dbType="mysql" dbDriver="native" switchType="1"  slaveThreshold="100">
                <heartbeat>select user()</heartbeat>
                <writeHost host="hostM1" url="192.168.85.111:3306" user="root"
                                   password="123456">
                        <readHost host="hostS1" url="192.168.85.112:3306" user="root" password="123456"></readHost>
                </writeHost>
        </dataHost>
</mycat:schema>
```

```
mycat的启动有两种方式，一种是控制台启动，一种是后台启动，在初学的时候建议大家使用控制台启动的方式，当配置文件写错之后，可以方便的看到错误，及时修改，但是在生产环境中，使用后台启动的方式比较稳妥。
​ 控制台启动：去mycat/bin目录下执行 ./mycat console
​ 后台启动：去mycat/bin目录下执行 ./mycat start


从另外的虚拟机去登录访问当前mycat，输入如下命令即可
mysql -uroot -p123456 -P 9066 -h 192.168.85.111
```



# SkyWalking 性能监控

| 工具名称       | 代码入侵方式 | 性能   | ui       | 使用人数 | 粒度       | 告警   | 依赖分析 | traceID查询 |
| -------------- | ------------ | ------ | -------- | -------- | ---------- | ------ | -------- | ----------- |
| **SkyWalking** | **无侵入**   | **高** | **丰富** | **多**   | **方法级** | **有** | **有**   | **有**      |
| **Pinpoint**   | **无侵入**   | **低** | **丰富** | **多**   | **方法级** | **有** | **有**   | **有**      |
| **Zipkin**     | **侵入低**   | **中** | **一般** | **多**   | **接口级** | **无** | **有**   | **有**      |
| **Cat**        | **侵入高**   | **中** | **丰富** | **较多** | **代码级** | **有** | **无**   | **无**      |

## docker安装

docker-compose.yml

```yaml
version: '3'
services:
  elasticsearch:
    image: elasticsearch:7.14.2
    container_name: elasticsearch
    restart: always
    ports:
      - 9200:9200
      - 9300:9300
    environment:
      discovery.type: single-node
      TZ: Asia/Shanghai
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - /etc/localtime:/etc/localtime  
  skywalking-oap:
    image: apache/skywalking-oap-server:8.4.0-es6
    container_name: skywalking-oap
    depends_on:
      - "elasticsearch"
    links:
      - elasticsearch
    restart: always
    ports:
      - 11800:11800
      - 12800:12800
    environment:
      SW_STORAGE: elasticsearch
      SW_STORAGE_ES_CLUSTER_NODES: elasticsearch:9200
      SW_HEALTH_CHECKER: default
      SW_TELEMETRY: prometheus
      JAVA_OPTS: "-Xms512m -Xmx512m"
    healthcheck:
      test: ["CMD", "./bin/swctl", "ch"]
      interval: 30s
      timeout: 10s
      retries: 3
      #start_period: 40s  
    volumes:
      - /etc/localtime:/etc/localtime
  skywalking-ui:
    image: apache/skywalking-ui:8.4.0
    container_name: skywalking-ui
    depends_on:
      - skywalking-oap
    links:
      - skywalking-oap
    restart: always
    ports:
      - 3380:8080
    environment:
      SW_OAP_ADDRESS: skywalking-oap:12800
    volumes:
      - /etc/localtime:/etc/localtime 
```

## java服务接入agent

* 下载agent地址： https://archive.apache.org/dist/java-agent/  8.91版本

```cmd
java -javaagent:/data/skywalking-agent/agent/skywalking-agent.jar
-Dskywalking.agent.service_name=my-app-service
-Dskywalking.collector.backend_service=192.168.3.176:11800
-jar my-app-service.jar &
```

* 在代码中获取traceId

```xml
<dependency>
    <groupId>org.apache.skywalking</groupId>
    <artifactId>apm-toolkit-trace</artifactId>
    <version>8.9.0</version>
</dependency> 
```

```java
//判断是否是skywalking
private static final boolean SKYWALKING_TRACE_CONTENT_PRESENT = ClassUtils.isPresent("org.apache.skywalking.apm.toolkit.trace.TraceContext", null);

if (SKYWALKING_TRACE_CONTENT_PRESENT) {
    String traceId = TraceContext.traceId();
}
```




* Skywalking整合Log4j2在日志中打印TraceId
    添加依赖

```xml
<dependency>
    <groupId>org.apache.skywalking</groupId>
    <artifactId>apm-toolkit-log4j-2.x</artifactId>
    <version>8.9.0</version>
</dependency>
```

6.3.2 在log4j2的配置文件中获得TraceId

```properties
通过 - [%traceId] - 标签可获取全局TraceId 缩写格式:[%tid]
示例：%date{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{36} [%traceId] - %msg% 
```



# <span style="border-left: 5px solid rgb(248, 57, 41);">备注</span>



```shell
#skywalking参数备注
-javaagent:E:\tmp\skywalking\skywalking-agent\skywalking-agent.jar -Dskywalking.agent.service_name=lzmh-gateway -Dskywalking.collector.backend_service=127.0.0.1:11800
#sentinel参数备注
-Dcsp.sentinel.app.type=1 -Dcsp.sentinel.dashboard.server=localhost:8718
```


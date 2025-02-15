### 互联网技术

服务框架：Dubbo, Rest 服务

内存缓存：Redis, ehcache， MongoDb

消息中间件：ActiveMQ ,kafka，rabbitmq, RocketMq

分布式文件：FastDFS(小文件快)， HDFS(基于hdoop, 大文件数据处理好点)

安全框架：Apache shiro, spring-secutity, JWT Token, OAuth

任务调度：quartz ， xxl-job项目

持久层框架：mybatis， mybatis-plus,  hibernate 

日志 : log4j，slf4j

项目基础搭建：spring, springmvc, springboot, springcloud

环境搭建：linux

服务器：tomcat ,jetty weblogic，websphere

高并发分流技术: Nginx

模版引擎: FreeMarker，  Thymeleaf ， jsp ,  Apache Velocity   velocity是较早出现的用于代替jsp的模板语言 

服务注册中心、配置中心: nacos,   springcloud config, zookeeper

分布式事物：seata、tx-lcn、hmily

服务的熔断降级： Netflix的开源组件Hystrix,  openfeign

网关技术： springcloud Gateway技术  Zuul网关

客户端负载均衡： Netflix Ribbon

代码规范： sonarqube、 审查 upsource

 Feign：旨在使编写Java Http客户端变得更容易。 

其它中间件工具：  Logstash ， ElasticSearch ， canal，

容器技术： dockers、podman;     k8s、openshift;

API调试工具： Apifox、 Postman      fiddler抓包工具：app或者电脑端的请求抓取

代码版本管理：svn, git, gitlab, gitlib

dev敏捷模式：jenkins



Linx连接工具：全能终端神器 MobaXterm， X-shell,  FinalShell

```shell
Zuul：

使用的是阻塞式的 API，不支持长连接，比如 websockets。

底层是servlet，Zuul处理的是http请求

没有提供异步支持，流控等均由hystrix支持。

依赖包spring-cloud-starter-netflix-zuul。

Gateway：

Spring Boot和Spring Webflux提供的Netty底层环境，不能和传统的Servlet容器一起使用，也不能打包成一个WAR包。

依赖spring-boot-starter-webflux和/ spring-cloud-starter-gateway

提供了异步支持，提供了抽象负载均衡，提供了抽象流控，并默认实现了RedisRateLimiter。
```



#### 组件可视化软件

* redis

  `Redis DeskTop Manager `

   `Another Redis DeskTop Manager 是redis桌面可视化工具`

  https://github.com/uglide/RedisDesktopManager

  https://www.jb51.net/article/208969.htm

* linux

  `xshell` 

  `finalShell`



#### 软件备注

* **vs code**,  **webstorm** 边写前端js+html
* **datagrip**， **navicat**  连接数据库
* 构造原型工具 axure  生成的html文件放在tomcat的webapps下即可访问
* icon的地址 https://fontawesome.com

### 阿里资深架构师必备10个开发者神器

一、Java 线上诊断工具 Arthas

二、IDE 插件 Cloud Toolkit

三、混沌实验注入工具 ChaosBlade

四、Java 代码规约扫描插件

五、应用实时监控工具 ARMS

六、静态开源站点搭建工具 Docsite

七、Android 平台上的秒级编译方案 Freeline

八、性能测试工具 PTS

九、云效开发者工具KT

十、架构可视化工具 AHAS

## git项目可封装的地址

| 项目名称                                                     | 项目地址                                                     |
| :----------------------------------------------------------- | ------------------------------------------------------------ |
| canal 缓存同步工具                                           | https://github.com/alibaba/canal.git                         |
| canal胶水层 可封装                                           | https://gitee.com/throwableDoge/canal-glue.git               |
| dynamic-datasource-spring-boot-starter 动态数据源            | https://github.com/baomidou/dynamic-datasource-spring-boot-starter.git |
| guava-retrying 重试工具                                      | https://github.com/rholder/guava-retrying.git                |
| hutool  糊涂工具                                             | https://gitee.com/dromara/hutool.git                         |
| lock4j 日志包                                                | https://github.com/baomidou/lock4j.git                       |
| redisson封装不同模式                                         | https://gitee.com/yangxixi_323/spring-boot-distributed-redisson.git<br />https://gitee.com/xxy6910/redisson-dcs-lock.git |
| redis-cache-operator-java 缓存工具                           | https://github.com/xsg1995/redis-cache-operator-java.git     |
| redis-cache-封装可以仿造miaosha项目组件                      | https://gitee.com/asdsix/SpringCloud-miaosha/tree/version2/miaosha-common/miaosha-common-data/src/main/java/tech/tengshe789/miaosha/common/data/redis |
|                                                              |                                                              |
| rocketmq                                                     | https://github.com/apache/rocketmq-spring.git                |
| rocketmq-dashboard<br />rocketmq的可视化界面                 | https://github.com/apache/rocketmq-dashboard.git             |
| 通用的RocketMQ消息幂等去重消费者工具类，开箱即用             | https://gitee.com/johnvwan/RocketMQDedupListener.git         |
| ruoyi系统                                                    | https://gitee.com/y_project/RuoYi.git                        |
|                                                              | https://gitee.com/y_project                                  |
| swagger-starter                                              | https://github.com/SpringForAll/spring-boot-starter-swagger.git |
| xxl-job                                                      | https://gitee.com/xuxueli0323/xxl-job.git<br />https://github.com/zero9102/xxl-job-spring-boot-starter.git |
| 闪验                                                         | https://gitee.com/hiwepy/shanyan-spring-boot-starter.git     |
|                                                              |                                                              |
| 微信开发weixin-java-mp<br />微信端第三方对接开发             | https://gitee.com/binary/weixin-java-tools.git               |
| 项目推荐浏览页                                               | https://gitee.com/explore/backend                            |
| justAuth多登录开源库just-auth                                | https://github.com/justauth/JustAuth.git<br />https://github.com/justauth/justauth-spring-boot-security-starter.git |
| security安全校验                                             | https://github.com/spring-projects/spring-security/wiki/OAuth-2.0-Migration-Guide |
| 单商城开源系统ThinkPHP                                       | https://gitee.com/likeshop_gitee                             |
| DingTalk消息通知                                             | https://github.com/AnswerAIL/dingtalk-spring-boot-starter    |
| 异常通知的框架                                               | https://gitee.com/ITEater/prometheus-spring-boot-starter     |
| guerlab-sms 不同的短信通道支持                               | https://gitee.com/guerlab_net/guerlab-sms?_from=gitee_search |
| UMS 是一个非侵入式、与业务高度解耦、可自定义的用户管理脚手架 | https://gitee.com/pcore/UMS?_from=gitee_search               |
| IJPay聚合支付                                                | https://gitee.com/javen205/IJPay?_from=gitee_search          |
| 文件上传聚合存储平台                                         | https://spring-file-storage.xuyanwu.cn/#/存储平台            |
| [芋道源码](https://github.com/yudaocode)                     | 可以关注一下labs学习https://gitee.com/zhijiantianya          |
| 动态线程池，可简洁封装                                       | https://gitee.com/dromara/dynamic-tp.git                     |
| Java业务日志修改解析工具                                     | https://gitee.com/shagang/java-property-comparer <br />https://blog.csdn.net/weixin_46496706/article/details/124082342 |



## 其它一些项目学习

|                                          |                                                              |
| ---------------------------------------- | ------------------------------------------------------------ |
| wepush 简小的推送工具                    | https://gitee.com/zhoubochina/WePush.git                     |
| Jeewx-Boot 免费微信管家平台              | https://gitee.com/jeecg/jeewx-boot.git                       |
| spring-boot-admin 微服务监控             | https://gitee.com/mirrors/spring-boot-admin.git <br />原始仓库： https://github.com/codecentric/spring-boot-admin |
| douyin-sdk 抖音对接                      | https://toscode.gitee.com/amazecodecom/douyin-sdk.git<br />https://github.com/wulinyun/java-sdk-douyin.git |
|                                          |                                                              |
| 低代码开发平台                           | https://gitee.com/jeecg/jeecg-boot                           |
| 组件封装                                 | https://github.com/yangcs1596/boca                           |
| jnpf白皮书项目                           | https://github.com/anglamei/medical-java-cloud               |
| pigx学习微服务<br />这人4.2k的仓库就离谱 | https://github.com/cckmit/pigx-1.git <br />https://github.com/cckmit/wallet-parent.git<br />还有翻墙软件 |
| java加密和解密工具                       | https://mp.weixin.qq.com/s?__biz=Mzg5Mzg1ODg2OA==&mid=2247484590&idx=8&sn=fbcec5eba567697bda6dd6f0b272c8ff&chksm=c02921f5f75ea8e3bb9413de1274d9591d10e32427899c0751676076d3ff09ae1cc83ba08049&scene=27<br /><br />https://gitee.com/yuquan0405/org.yq.tools.encrypt.git |
|                                          |                                                              |
| 看着学的动态代码生成，数据库加载模板     | https://github.com/easy-do/game-server-manager<br />https://gitee.com/yuzhanfeng/game-server-manager一套游戏管理、开发、云部署的平台软件 |



#### Jar工具包解决功能记录

* net.coobird.thumbnailator    缩略图片  https://www.cnblogs.com/miskis/p/5500822.html

  ```java
  Thumbnails.of(new File("path/to/directory")
  .listFiles())         
  .size(640, 480)         
  .outputFormat("jpg")         
  .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
  ```

* com.fasterxml.jackson   https://www.jianshu.com/p/4bd355715419

  Jackson主要包含了3个模块：

  - jackson-core
  - jackson-annotations
  - jackson-databind

  Jackson有三种方式处理Json：

  1. 使用底层的基于Stream的方式对Json的每一个小的组成部分进行控制
  2. 使用Tree Model，通过JsonNode处理单个Json节点
  3. 使用databind模块，直接对Java对象进行序列化和反序列化

  **writeValue**（参数，obj）：

      参数1：
      	File： 将对象转为json字符串，保存到指定的文件中
      	Writer： 将对象转为json字符串，并将json数据填充到字符输出流中
      	outputStream： 将对象转为json字符串，并将json数据填充到字节输出流中

  **writeValueAsString**（obj）：

      	将对象转为json字符串
      	  <component name="RunDashboard">
          <option name="ruleStates">
            <list>
              <RuleState>
                <option name="name" value="ConfigurationTypeDashboardGroupingRule" />
              </RuleState>
              <RuleState>
                <option name="name" value="StatusDashboardGroupingRule" />
              </RuleState>
            </list>
          </option>
        </component>

```java
String res = new ObjectMapper().writeValueAsString(ReturnObject
                    .failureEnum(ReturnFailureEnum.USERNAME_OR_PASSWORD_ERROR));
response.getWriter().write(res);
```

反序列化

```java
Person person = objectMapper.readValue("{\"name\":\"davenkin\",\"address\":\"\",\"mobile\":null,\"extra\":\"extra-value\"}", Person.class);
```

##### - 图片处理之thumbnailator和TwelveMonkeys的使

谷歌开源工具-图片处理类库

```
<dependency>
    <groupId>net.coobird</groupId>
    <artifactId>thumbnailator</artifactId>
    <version>0.4.8</version>
</dependency>
```



##### - springboot搜索引擎 eclasticsearch

* 实时的全文检索
* logstash的安装配置（同步数据库表数据？）

* 教程：  https://www.cnblogs.com/yijialong/p/9729988.html

**下载Kibana**

* Kibana，就是我们所说的ES的图形化用户界面，用于方便用户进行操作。
* 网址： https://www.elastic.co/downloads/kibana



##### -jsch连接linux服务器执行命令等

```xml
<dependency>
    <groupId>com.jcraft</groupId>
    <artifactId>jsch</artifactId>
    <version>0.1.54</version>
</dependency> 
```

##### - 连接ftp服务器上传下载文件处理

https://www.jb51.net/article/270506.htm

### springboot开启异步

```
@Service
@EnableAsync
public class BaseInfoBiz {
	@Async
    public void test(){
    	****
    }
}
```

### 设计模式

#### 开发模式

https://www.cnblogs.com/JavaHxm/p/11016315.html 

总体来说设计模式分为三大类：

　　**创建型模式，**共五种：**工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式**。s

　　**结构型模式，**共七种：**适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式**。

　　**行为型模式，**共十一种：**策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。**

状态模式：如抓娃娃

**1、开闭原则（Open Close Principle）**

　　开闭原则就是说**对扩展开放，对修改关闭**。在程序需要进行拓展的时候，不能去修改原有的代码，实现一个热插拔的效果。所以一句话概括就是：为了使程序的扩展性好，易于维护和升级。想要达到这样的效果，我们需要使用接口和抽象类，后面的具体设计中我们会提到这点。

**2、里氏代换原则（Liskov Substitution Principle）**

　　里氏代换原则(Liskov Substitution Principle LSP)面向对象设计的基本原则之一。 里氏代换原则中说，任何基类可以出现的地方，子类一定可以出现。 LSP是继承复用的基石，只有当衍生类可以替换掉基类，软件单位的功能不受到影响时，基类才能真正被复用，而衍生类也能够在基类的基础上增加新的行为。里氏代换原则是对“开-闭”原则的补充。实现“开-闭”原则的关键步骤就是抽象化。而基类与子类的继承关系就是抽象化的具体实现，所以里氏代换原则是对实现抽象化的具体步骤的规范。—— From Baidu 百科

**3、依赖倒转原则（Dependence Inversion Principle）**

　　这个是开闭原则的基础，具体内容：真对接口编程，依赖于抽象而不依赖于具体。

**4、接口隔离原则（Interface Segregation Principle）**

　　这个原则的意思是：使用多个隔离的接口，比使用单个接口要好。还是一个降低类之间的耦合度的意思，从这儿我们看出，其实设计模式就是一个软件的设计思想，从大型软件架构出发，为了升级和维护方便。所以上文中多次出现：降低依赖，降低耦合。

**5、迪米特法则（最少知道原则）（Demeter Principle）**

　　为什么叫最少知道原则，就是说：一个实体应当尽量少的与其他实体之间发生相互作用，使得系统功能模块相对独立。

**6、合成复用原则（Composite Reuse Principle）**

　　原则是尽量使用合成/聚合的方式，而不是使用继承。

#### 开发模式用到的例子

##### springboot思路：

1、注册服务到一个容器管理bean, 利用构造器函数初始化对象
2、注入bean即可使用

(@Bean的修饰的方法参数会自动注入，1：复杂类型可以通过@Qualifier(value=“XXX”)限定; 2：对于普通类型使用@Value(XXX)指定)

例子

```java
@Bean
public xxx tt(Object obj){ //此处的obj，可以自动注入进来
    
}
```



* 创造者模式

  ```java
  建造者模式将很多功能集成到一个类里，这个类可以创造出比较复杂的东西
  ```

* 工厂模式

  ```java
  工厂模式关注的是创建单个产品
  使用抽象工厂模式（扩展性较好） 
  1、写一个接口，多个实现类
  2、写一个接口，多个工厂类去实现
  ```

* 适配器模式

  ```java
  1.类的适配器模式
  我的理解：public class Adapter extends Source implements Targetable { }
  主要是继承里面的方法，不局限于实现接口
  
  更好的兼容性
  2.对象的适配器模式
  让实现类持有Source类的实例，在接口方法用实例的方法
  public class Wrapper implements Targetable {  
    
      private Source source;  
        
      public Wrapper(Source source){   //这里是生成实例
          this.source = source;  
      }  
      @Override  
      public void method2() {  
          System.out.println("this is the targetable method!");  
      }  
    
      @Override  
      public void method1() {    //桥接模式与此很像，实现类具有实例，多一个抽象类
          source.method1(); //注意这段  
      }  
  } 
  3.接口的适配器模式（抽象模式）
  接口中定义了太多的方法，以致于有时我们在一些实现类中并不是都需要
  //抽象类实现接口
  public abstract class Wrapper2 implements Sourceable{ //策略模式也很像      
      public void method1(){}  
      public void method2(){}  
  } 
  //实现类继承
  public class SourceSub1 extends Wrapper2 implements Sourceable{  
      public void method1(){  
          System.out.println("the sourceable interface's first Sub1!");  
      }  
  }
  
  类的适配器模式：当希望将一个类转换成满足另一个新接口的类时，可以使用类的适配器模式，创建一个新类，继承原有的类，实现新的接口即可。
  
  对象的适配器模式：当希望将一个对象转换成满足另一个新接口的对象时，可以创建一个Wrapper类，持有原类的一个实例，在Wrapper类的方法中，调用实例的方法就行。
  
  接口的适配器模式：当不希望实现一个接口中所有的方法时，可以创建一个抽象类Wrapper，实现所有方法，我们写别的类的时候，继承抽象类即可。
  ```

* 代理模式

  ```java
  使用代理模式，可以将功能划分的更加清晰，有助于后期维护！
  和装饰器模式很像
  1 方法实现类和代理类都实现同一个接口
  2 代理类拥有实现类的实例
  3 代理器里面的方法可以有对事项方法做控制

// 动态代理

```java
创建代理对象
(T) Proxy.newProxyInstance(
                Thread.currentThread().getContextClassLoader(),
                new Class[]{clientType},
                new ProxyFallback(error, clientType)
创建代理对象                
Proxy.newProxyInstance(car.getClass().getClassLoader(), Car.class.getInterfaces(), new xxHandler());
代理关键
public class xxHandler implements InvocationHandler {
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("---------before-------");
        Object invoke = method.invoke(vehical, args);
        System.out.println("---------after-------");

        return invoke;
    }
}
    
AopContext.currentProxy() 代理service事务失效问题
```

  ```

* 外观模式

  ```java
  起到类和类之间解耦的作用
  
  ```

* 责任链模式

  https://mp.weixin.qq.com/s/LvgzVm67oZjOdfC3jZ4X0w

##### springboot的策略模式+工程模式例子

```java
@Service
public class FactoryForStrategy {

    @Autowired
    Map<String, Strategy> strategys = new ConcurrentHashMap<>(3);
    //注意此处map, Strategy是一个接口 
    //定义public interface Strategy，多个实现方法即可
    //@Component("one")
    //public class StrategyOne implements Strategy {}
    
    public Strategy getStrategy(String component) throws Exception{
        Strategy strategy = strategys.get(component);
        if(strategy == null) {
            throw new RuntimeException("no strategy defined");
        }
        return strategy;
    }

}
```

#### @Autowired注入类的list

```java
@Component
public class Test implements InitializingBean {
 // ####实现InitializingBean的作用
    @Autowired
    private List<ServiceTest> serviceTests;

    public String serviceTest() {
        StringBuffer sb = new StringBuffer();
        for (ServiceTest serviceTest : serviceTests) {
            sb.append(serviceTest.getName());
            sb.append(" ");
        }
        return sb.toString();
    }
  // #### 实例创建完成后会接着调用afterPropertiesSet方法
    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println(serviceTest());
    }
}
```



------



#### Spring事件分发

两种实现方式

* 有自定义监听器ApplicationListener
* 和注解监听器@EventListener

```java
/**事件源**/
public class Entry {
	private long id; // 编号   
    private String name; //标题
}

/**
 * 事件对象
**/
public class EntryEvent{ 
    public static final int ENTRY_ADDED = 100; //事件类型:博客文章被创建   
    public static final int ENTRY_DELETED = 101;//事件类型:博客文章被删除   
    public static final int ENTRY_MODIFIED = 102;//事件类型:博客文章被修改   
  
    private int eventType; //事件类型   
    private Entry entry; //博客文章对象   
    private Date date; //事件触发日期   
    private Map params; //事件辅助参数 
}

/**事件监听器和实现接口**/
public interface EntryListener {
    public abstract void entryAdded(EntryEvent entryevent);
}

/** 
 * 邮件管理器 实现类
 * @author Administrator 
 * 
 */  
public class EmailManager implements EntryListener{  
  
    @Override  
    public void entryAdded(EntryEvent entryevent) {  
  
        System.out.println("EmailManager 处理 博客文章被创建事件。");  
          
    }
}
```

##### 分发器

```java
public class EntryEventDispatcher {  
  
    private static EntryEventDispatcher instance = new EntryEventDispatcher();  
    private ArrayList listeners=new ArrayList();  
  
    public static EntryEventDispatcher getInstance() {  
        return instance;  
    }  
  
    private EntryEventDispatcher() {  
          
        String[] observers = PropertyMgr.getProperty("observers").split(",");  
        for(String s : observers) {  
              
            System.out.println(s);  
            try {  
                this.addListener((EntryListener)(Class.forName(s).newInstance()));  
            } catch (InstantiationException e) {  
                e.printStackTrace();  
            } catch (IllegalAccessException e) {  
                e.printStackTrace();  
            } catch (ClassNotFoundException e) {  
                e.printStackTrace();  
            }  
        }  
          
  
    }  
  
    public synchronized void addListener(EntryListener listener) {  
        System.out.println(":"+listener);  
        if (listener == null) {  
            System.out.println(":"+listener);  
            throw new NullPointerException();  
        } else {  
            listeners.add(listener);  
            return;  
        }  
    }  
  
    public synchronized void removeListener(EntryListener listener) {  
        listeners.remove(listener);  
    }  
  
    public void dispatchEvent(EntryEvent event) {  
        // System.out.println("msgDispatchEvent");   
        int eventType = event.getEventType();  
        long t1=System.currentTimeMillis();  
        System.out.println("kaishi="+t1);  
        for (int i = 0; i < listeners.size(); i++) {  
            try {  
                EntryListener listener = (EntryListener) listeners.get(i);  
                String name = listener.getClass().getName();  
                name = name.substring(name.lastIndexOf('.') + 1);  
  
                switch (eventType) {  
                case EntryEvent.ENTRY_ADDED: // 创建博客文章   
                    listener.entryAdded(event);  
                    break;  
  
                case EntryEvent.ENTRY_DELETED: // 删除博客文章   
                    listener.entryDeleted(event);   
                    break;  
  
                case EntryEvent.ENTRY_MODIFIED: //修改 博客文章   
                    listener.entryModified(event);  
                    break;  
  
                }    
            } catch (Exception e) {  
                // logger.error(e);   
            }    
        }    
        // Profiler.end("msgDispatchEvent");   
    }  
} 

@Test
	EntryManager eventManager=new EntryManager();  
	Entry entry=new Entry();  
	// 事件分发   
    EntryEvent event = new EntryEvent(EntryEvent.ENTRY_ADDED, entry, null);  
    EntryEventDispatcher.getInstance().dispatchEvent(event); 
```

java监听器的实现和原理

https://www.cnblogs.com/againn/p/9512013.html

首先创建一个事件源Robot：

```
 1 package com.ssm.listener.robotListener;
 2 
 3 /**
 4  * 事件源：机器人
 5  */
 6 public class Robot {
 7 
 8     private RobotListener listener;
 9 
10     /**
11      * 注册机器人监听器
12      * @param listener
13      */
14     public void registerListener(RobotListener listener){
15      this.listener  = listener;
16     }
17 
18     /**
19      * 工作
20      */
21     public void working(){
22         if(listener!=null){
23             Even even = new Even(this);
24             this.listener.working(even);
25         }
26         System.out.println("机器人开始工作......");
27     }
28 
29     /**
30      * 跳舞
31      */
32     public void dancing(){
33         if(listener!=null){
34             Even even = new Even(this);
35             this.listener.dancing(even);
36         }
37         System.out.println("机器人开始跳舞......");
38     }
39 
40 
41 }
```

 创建时间对象Even：

```
 1 package com.ssm.listener.robotListener;
 2 
 3 /**
 4  * 事件对象
 5  */
 6 public class Even {
 7 
 8     private Robot robot;
 9 
10     public Even(){
11         super();
12     }
13     public Even(Robot robot){
14         super();
15         this.robot = robot;
16     }
17 
18 
19     public Robot getRobot() {
20         return robot;
21     }
22 
23     public void setRobot(Robot robot) {
24         this.robot = robot;
25     }
26 }
```



创建时间监听器接口RobotListener：

```
 1 package com.ssm.listener.robotListener;
 2 
 3 /**
 4  * 事件监听器
 5  */
 6 public interface RobotListener {
 7 
 8     public void working(Even even);
 9     public void dancing(Even even);
10 }
```



```
 1 package com.ssm.listener.robotListener;
 2 
 3 public class MyRobotListener implements  RobotListener{
 4     @Override
 5     public void working(Even even) {
 6         Robot robot = even.getRobot();
 7         System.out.println("机器人工作提示：请看管好的你机器人，防止它偷懒！");
 8     }
 9 
10     @Override
11     public void dancing(Even even) {
12         Robot robot = even.getRobot();
13         System.out.println("机器人跳舞提示：机器人跳舞动作优美，请不要走神哦！");
14     }
15 }
```

事件监听器测试类

```
 1 package com.ssm.listener.robotListener;
 2 
 3 public class TestListener {
 4 
 5     public static void main(String[] args) {
 6         Robot robot = new Robot();
 7         robot.registerListener(new MyRobotListener());
 8         robot.working();
 9         robot.dancing();
10     }
11 }
```

##### 发送事件，实现监听 ApplicationEventPublisher

```java
// 发送事件
@Service
public class AService {
    @Autowired
    private ApplicationEventPublisher eventPublisher;

    public void sendMessage() {
        String s = "Hello";
        String b = "soul";
        eventPublisher.publishEvent(new DEvent(s + b, s, b));
    }
}

// 实现监听
@Component
@Slf4j
public class BListener implements ApplicationListener<DEvent> {
    @Override
    public void onApplicationEvent(DEvent applicationEvent) {
        log.info(">==== listen: {}", applicationEvent.getName(), applicationEvent.getText());
    }
}

//定义事件
@Data
public class DEvent extends ApplicationEvent {
    private final String name;
    private final String text;
}
```



### 减少if-else的方法

大概就是接口，多态等形式

* 工厂模式

  ```java
  //工厂类
  public class UserPayServiceStrategyFactory {
  
      private static Map<String,UserPayService> services = new ConcurrentHashMap<String,UserPayService>();
  
      public  static UserPayService getByUserType(String type){
          return services.get(type);
      }
  
      public static void register(String userType,UserPayService userPayService){
          Assert.notNull(userType,"userType can't be null");
          services.put(userType,userPayService);
      }
  }
  //引用 就可以找到自己要的service进行其它公用方法
  UserPayService strategy = UserPayServiceStrategyFactory.getByUserType(vipType);
  ```



### 1 开发常用的修饰符功能说明

#### 1-1 类 

***public***    可以从其他类中访问

***abstract***  本类不能被实例化

***final***    不能再声明子类

***protected***  只能从自己的类和它的子类中访问

***private***    只能在本类中访问 

***static***      外部类是不允许static修饰的，但是内部类却允许，重要是this和super都无法出现在static 修饰的方法中

#####  1-1-1 class反射方法

```java
//类名
Class clazz=Class.forName(String classname);//通过com.cloud.xxx.java类名获取Class

String methodName=“方法名称”；
Object[] methodparams=new Object[]{请求方法所需参数};
//根据方法名获取方法
Method method=clazz.getMethod(methodName,T.class);//T.class为该方法的参数类型多个使用数组Class[]{String.class,Integer.class}
Object obj=method.invoke(clazz.newInstance(), methodparams);//obj为clazz类的methodName方法执行结束返回的对象
```

备注： 根据反射 对业务代码的统一处理

##### <span style="color:red">1-1-2 知识点 被忽略的null异常</span>

```java
1、java switch 参数不能是null，swicth(null)会报java.lang.NullPointerException异常
2、变量==1 如果变量为null, 则会抛出 java.lang.NullPointerException异常
3、equals 一般常量放在前面比较
```

##### 1-1-3运行java文件

```cmd
#编译
javac Test.java  //涉及编码问题 javac -encoding UTF-8 Test.java
#运行
java Test // 文件名不能带.class；  文件不能够有 package；  文件里要有main方法；

```





#### 1-2 成员变量

一个类的成员变量的声明必须在类体中，而不能在方法中，方法中声明的是局部变量。

访问修饰符可以是4种中的任意一种。

**static**：类变量：一个类所拥有的变量，该类型的变量与类的实例对象无关，不管类创建了多少对象，系统仅在第一次调用类的时候为类变量分配内存，所有对象共享该类的类变量，因此可以通过类本身（类名）或者某个对象来访问类变量。

**final**：常量。成员变量定义时一般可以不初始化（给变量赋初值），但是final修饰成员变量时，必须在定义时就初始化，如： final int age = 20;这里的“=20”不能不写，否则编译就会报错。

**volatile**：声明一个可能同时被并存运行的几个线程所控制和修改的变量。

**transient**：声明一个该值不能被序列化的变量（对象被序列化后，该变量仍然存在，值以该类型的默认值来保存，如整型为0，String类型为null,boolean类型为false）。

执行的方法在栈，new一对象在堆开辟内存空间

#### 1-3方法

**abstract**：抽象方法：只有声明部分，方法体为空，具体在子类中完成。

**static**：类方法、静态方法：

　　　　1） 调用时，可以直接使用类名调用，也可以类的某个实例对象名调用

　　　　2）不能被单独对象拥有，属于整个类共享。

　　　　3） 不能处理非static修饰的成员变量。

**final**：最终方法，不能被子类重写@override的方法。

**native**：本地方法，表示用其他语言书写的特殊方法，包括C，C++，FORTRAN，汇编语言等。

**synchronized**:多线程调用时同步，当此方法被调用时，其他线程不能够调用该方法，直到该方法返回，用于避免在多线程操作时，数据的结果出现不一致。 

------

#### 1-4 接口

##### 1-4-1 特性

- 接口中每一个方法也是隐式抽象的,接口中的方法会被隐式的指定为 **public abstract**（只能是 public abstract，其他修饰符都会报错）。

- 接口中可以含有变量，但是接口中的变量会被隐式的指定为 **public static final** 变量（并且只能是 public，用 private 修饰会报编译错误）。

- 接口中的方法是不能在接口中实现的，只能由实现接口的类来实现接口中的方法。

  接口直接也可以继承

  public interface a extends b; 

##### 1-4-2 抽象类和接口的区别

* 抽象类中的方法可以有方法体，就是能实现方法的具体功能，但是接口中的方法不行。

- 抽象类中的成员变量可以是各种类型的，而接口中的成员变量只能是 **public static final** 类型的。

- 接口中不能含有静态代码块以及静态方法(用 static 修饰的方法)，而抽象类是可以有静态代码块和静态方法。

- 一个类只能继承一个抽象类，而一个类却可以实现多个接口。

  public abstract class c implement b ;

  public class  d extends c implement a;

##### 1-4-3 一个接口多个实现类的Spring注入方式

##### 1-4-4 接口的默认方法default

```java
##### 1-1 default的
#default是在java8中引入的关键字，也可称为Virtual
public interface Interface1{
    default void helloWorld() {
        System.out.println("hi i'm from Interface1");
    }
    #静态方法能被继承但不能被重写,接口中的静态方法不能被继承
}

```

#### 1-5 继承

##### 1.继承的主要作用在于，在已有基础上继续进行功能的扩充。

语法：`class 子类 extends 父类{}`  

##### 2 继承的限制

* 子类对象在进行实例化前首先调用父类构造方法，再调用子类构造方法实例化子类对象。

  **实际在子类构造方法中，相当于隐含了一个语句super()，调用父类的无参构造。同时如果父类里没有提供无参构造，那么这个时候就必须使用super(参数)明确指明要调用的父类构造方法。**

* 只允许单继承不允许多继承（一个子类继承一个父类

  **Java中不允许多重继承，但是允许多层继承！多层继承一般不会超过三层**

* 在继承时，子类会继承父类的所有结构。

  **在进行继承的时候，子类会继承父类的所有结构（包括私有属性、构造方法、普通方法）**
  **显示继承**：所有非私有操作属于显示继承（可以直接调用）。
  **隐式继承**：所有私有操作属于隐式继承（不可以直接调用，需要通过其它形式调用（get或者set））。

  发现子类能够使用的是所有非private操作

##### 3 泛型嵌套

* `List<String>` —- 参数化的类型 
  `List<E>` —- 泛型   
  `List<?>` —- 无限制通配符类型 
  `<E extends SomeClass>` —- 有限制类型参数 
  `List <? extends SomeClass>`—- 有限制通配符类型 
  `<T extends Comparable<T>>` —– 递归类型限制 
  `static <E> List<E> asList(E[] a)` —- 泛型方法

**Java泛型**中的标记符含义： 

 **E - Element (在集合中使用，因为集合中存放的是元素)**

 **T - Type（Java 类）**

 **K - Key（键）**

 **V - Value（值）**

 **N - Number（数值类型）**

 **R -** return（返回值）

**？ -  表示不确定的java类型**

##### 4、 泛型方法

```java
public <T> void show(T t),void前面的泛型T是什么作用
public <T>这个T是个修饰符的功能，表示是个泛型方法  <T> 不是返回值，表示传入参数有泛型
```



------



#### 1-7 java8的新特性

##### 1-7-1  Optional类使用

```java
Integer value1 = null;
// Optional.ofNullable - 允许传递为 null 参数
Optional<Integer> a = Optional.ofNullable(value1);
// Optional.of - 如果传递的参数是 null，抛出异常 NullPointerException
Optional<Integer> b = Optional.of(value2);

//获取类名称
Object.getClass().getSimpleName();


//#
Optional<Object> optional = list.stream().findFirst()

```

```java
    public String testSimple(Test4 test) {
        if (test == null) {
            return "";
        }
        if (test.getTest3() == null) {
            return "";
        }
        if (test.getTest3().getTest2() == null) {
            return "";
        }
        if (test.getTest3().getTest2().getInfo() == null) {
            return "";
        }
        return test.getTest3().getTest2().getInfo();
    }
```



但是使用Optional后，整个就都不一样了。

```java
 public String testOptional(Test test) {
        return Optional.ofNullable(test).flatMap(Test::getTest3)
                .flatMap(Test3::getTest2)
                .map(Test2::getInfo)
                .orElse("");
    }
```

1、Optional.ofNullable(test)，如果test为空，则返回一个单例空Optional对象，如果非空则返回一个Optional包装对象，Optional将test包装；

还有ifPresent()方法

```java
  public static <T> Optional<T> ofNullable(T value) {
        return value == null ? empty() : of(value);
    }
```

2、flatMap(Test::getTest3)判断test是否为空，如果为空，继续返回第一步中的单例Optional对象，否则调用Test的getTest3方法；

```java
public<U> Optional<U> flatMap(Function<? super T, Optional<U>> mapper) {
        Objects.requireNonNull(mapper);
        if (!isPresent())
            return empty();
        else {
            return Objects.requireNonNull(mapper.apply(value));
        }
    }
```

3、flatMap(Test3::getTest2)同上调用Test3的getTest2方法；

4、map(Test2::getInfo)同flatMap类似，但是flatMap要求Test3::getTest2返回值为Optional类型，而map不需要，flatMap不会多层包装，map返回会再次包装Optional；

```java
    public<U> Optional<U> map(Function<? super T, ? extends U> mapper) {
        Objects.requireNonNull(mapper);
        if (!isPresent())
            return empty();
        else {
            return Optional.ofNullable(mapper.apply(value));
        }
    }
```

5、orElse("");获得map中的value，不为空则直接返回value，为空则返回传入的参数作为默认值。

```javascript
orElseGet(() -> createUser());
```

```java
public T orElse(T other) {
    return value != null ? value : other;
}
```

例子：

```java
Optional.ofNullable(user)
    .ifPresent(u -> { dosomething();});

User user =Optional.ofNullable(user)
    .filter( u -> "zhang".equals(u.getUserName()))
    .orElseGet(() -> { return new User();});

String city = Optional.ofNullable(user)
    .map(u -> u.getAddress())
    .map(a -> a.getCity())
    .orElseThrow(() -> new Exception("取值错误"));
```



##### 1-7-2 @@FunctionalInterface都能实现Lambda，不加的话再运行期会校验是否是函数接口，加了编译的时候就会校验

* 什么是函数式接口  

```java
//什么是函数式接口
Runnable r = () -> System.out.println("hello world");
//当不指明函数式接口时，编译器会自动解释这种转化：
new Thread(
   () -> System.out.println("hello world")
).start();
//函数式接口只能有一个抽象方法，如果你尝试添加第二个抽象方法，将抛出编译时错误。
//自定义函数式接口
@FunctionalInterface 
public interface WorkerInterface {   
    public void doSomeWork(countRecoder, count);
    //可以定义多个静态方法
    static void printHello(){
        System.out.println("Hello");
    }
}
//lambda表达式的引用
(countRecoder, count) -> countRecoder.setCountOfFirstStage(count)
```

* 案例

```java
@FunctionalInterface
public interface XttblogService {
    void sayMessage(String message);
}
//引用
XttblogService xttblogService = message -> System.out.println("Hello " + message);
```

#### Spring本地缓存

本地缓存：GuavaCache、ehcache、CaffeineCache，分布式缓存(网络缓存)：redis、memcached

##### 1-7-3-1 使用ConcurrentHashMap实现本地缓存

使用简单，但还需要考虑淘汰、最大限制、缓存过期时间淘汰等等功能；

##### 1-7-3-2 基于Guava Cache实现本地缓存

```xml
 <dependency>
    <groupId>com.google.guava</groupId>
    <artifactId>guava</artifactId>
</dependency>

```

```java
Cache<String, String> cache = CacheBuilder.newBuilder()
    .initialCapacity(5)  // 初始容量
    .maximumSize(10)     // 最大缓存数，超出淘汰
    .expireAfterWrite(60, TimeUnit.SECONDS) // 过期时间
    .build();
    //通过asyncReloading实现全异步加载，包括refreshAfterWrite被阻塞的加载线程
    .build(CacheLoader.asyncReloading(loader, Executors.newCachedThreadPool()));
    
 CacheLoader loader = new CacheLoader<KeyValue<String, String>, DictDataRespDTO>() {
    @Override
    public DictDataRespDTO load(KeyValue<String, String> key) throws Exception {
    	return ObjectUtil.defaultIfNull([xx获取数据方法], DICT_DATA_NULL);
    }
}
```

##### 1-7-3-3   最佳内存缓存框架Caffeine

```xml
 <dependency>
     <groupId>com.github.ben-manes.caffeine</groupId>
     <artifactId>caffeine</artifactId>
</dependency>

@Configuration
@EnableCaching
public class CaffeineCacheConfig {
    @Bean
    public CacheManager cacheManager(){
        CaffeineCacheManager cacheManager = new CaffeineCacheManager();
        //Caffeine配置
        Caffeine<Object, Object> caffeine = Caffeine.newBuilder()
            //最后一次写入后经过固定时间过期
            .expireAfterWrite(10, TimeUnit.SECONDS)
            //缓存的最大条数
            .maximumSize(1000);
        cacheManager.setCaffeine(caffeine);
        return cacheManager;
    }
}
```



Caffeine是一种高性能的缓存库，是基于Java 8的最佳（最优）缓存框架。

```java
采用 cache和 持久化数据库如 redis 缓存查询结果来消峰和降低成本
//初始化cache对象
private Cache<String, Object> cache = CaffeineCacheBuilder.createCaffeineCacheBuilder()
    .limit(Integer.MAX_VALUE)
    .expireAfterWrite(5,TimeUnit.MINUTES)
    .buildCache();

LoadingCache<Key, Graph> graphs = Caffeine.newBuilder()
     .maximumSize(10_000)
     .expireAfterWrite(5, TimeUnit.MINUTES)
     .refreshAfterWrite(1, TimeUnit.MINUTES)
     .build(key -> createExpensiveGraph(key));

Cache<K， V>的get的方法定义
V get(@NonNull K var1, @NonNull Function<? super K, ? extends V> var2);

//备注 super代表的是下界范围，  extends代表的是上界范围

#使用
@Autowired
Cache<String, Object> caffeineCache;

@Override
public void addUserInfo(UserInfo userInfo) {
    // 加入缓存
    caffeineCache.put(String.valueOf(userInfo.getId()),userInfo);
}

@Override
public UserInfo getByName(Integer id) {
    // 先从缓存读取
    caffeineCache.getIfPresent(id);
    UserInfo userInfo = (UserInfo) caffeineCache.asMap().get(String.valueOf(id));
    if (userInfo != null){
        return userInfo;
    }
    // 如果缓存中不存在，则从库中查找
    userInfo = userInfoMap.get(id);
    // 如果用户信息不为空，则加入缓存
    if (userInfo != null){
        caffeineCache.put(String.valueOf(userInfo.getId()),userInfo);
    }
    return userInfo;
}
```

##### 1-7-3-4 本地缓存问题

* 缓存一致性

1、可以使用MQ的广播模式，当数据修改时向MQ发送消息，节点监听并消费消息，删除本地缓存，达到最终一致性

2、Canal + MQ  订阅数据库变更日志，再操作缓存

#### 1-8 多实现类的注入问题

**1. 首先， Interface1 接口有两个实现类 Interface1Impl1 和 Interface1Impl2**

**Interface1 接口：**

```java
package com.example.service;
public interface Interface1 {
    void fun1();
}
```

**以下是接口的两个实现类，请注意@service注解的使用方式，这里给每个实现类标注了不同的名称，方便在@Resource注入时区别注入**

**Interface1 接口实现类1：**

```java
@Service("s1")
public class Interface1Impl1 implements Interface1 { 
    @Override 
    public void fun1() { System.out.println("接口1实现类 ..."); }   
    public void fun2(){  System.out.println("接口1实现类1 fun2 ..."); } 
}
```

**Interface1 接口实现类2：**

```java
@Service("s2") 
public class Interface1Impl2 implements Interface1 {
    @Override 
    public void fun1() { System.out.println("接口1实现类 ..."); } 
    public void fun2(){ System.out.println("接口1实现类2 fun2 ..."); } 
} 
```

**2. 通过 @Autowired 和 @Qualifier 配合注入**

```java
@Autowired
@Qualifier("interface1Impl1")
Interface1 interface1;    //正常启动
```

**3. 使用@Resource注入，根据默认类名区分**

```java
@Resource(name = "interface1Impl1")
Interface1 interface1;    //正常启动
```

**4. 使用@Resource注入，根据@Service指定的名称区分**

```java
@Resource(name = "s1")
Interface1 interface1;    //正常启动
```

***

#### 1-9 @Deprecated画横线的方式

```java
/**
* @deprecated replaced by <code>getEncodingForIndex(int charsetIndex)</code>
*/
@Deprecated
public void method();

/** 
 * @deprecated {@link NotaryProductionProviderClient#findProductionVariable(String, String, String)}
 */
```



### 2 多线程

 	线程的创建方式中有三种，
 	一种是实现Runnable接口，
 	一种是继承Thread，但是这两种方式都有个缺点，那就是在任务执行完成之后无法获取返回结果，
 	于是就有第三种了Callable、Future接、FutureTask、ExecutorService取得返回的结果。 

```java
class XX implements Runnable
{
    private ..
    public void run(){
        while(true){
            ...
           try{ Thread.sleep(10);}
           catch(){}
        }
        
    }
    
}
```

####  2-0 synchronized

线程在执行期间不允许其它线程进入-------用同步  

`synchronized`的使用其实比较简单，可以用它来修饰实例方法和静态方法，也可以用来修饰代码块。

```java
class XX implements Runnable
{
    private ..;
    Object obj = new Object();
    public void run(){
        while(true){
            ...
            //同步代码块
            sysnchronized(obj){
                --同步code                
            }
        }
        
    }
    
}

同步的好处：解决了多线程的安全问题
弊端： 减低了效率
同步的前提：多个线程在同步中必须使用同一个锁obj。这才是对多个线程的同步。
```

补充一个常见的面试题：构造方法可以用synchronized关键字修饰吗？

> 不能，也不需要，因为构造方法本身就是线程安全的

```java
//同步函数
public sysnchronized void func(){
    
}

//同步函数用的锁就是this

//解决单例效率地的问题，用双重判断的形式。
class Single{
    private static Single s=null;
    private Single(){}
    public static Single getInstance(){
        if(s==null){
            synchronized (Object.class){
                if(s==null){
                    s=new Single();
                }
            }            
        }
        return s;
    }
}
```

解决需求生产一个，消费一个的情况

```java
wait(); //该方法可以让线程处于冻结状态，并将线程临时存储到线程池中。
notify(); //唤醒指定线程池中任意一个线程
notifyall(); //唤醒制定线程池中的所有线程

lock()  //解决多线程 的多生产多消费
Lock比sysnchronized
Lock接口就是同步的替代

//用块结构
Lock l = ...
l.lock();
try{
	code...
}
finally{
    l.unlock();
}
```

*栈  代码运行区  *栈  存放数据  *方法区

#### 2-1 多线程java多线程之Future和FutureTask 实现Callable

* #### newCachedThreadPool

  一句话说清：动态创建线程和移除60s不用的老线程。
  适合的场景：拥有大量执行时间短的异步任务。

* #### newFixedThreadPool

  一句话说清：创建固定数量的线程，如果全部线程被占用，新进的任务需进入阻塞队列等待。

* #### newScheduledThreadPool

  一句话说清：可以安排任务延迟多少时间后执行或周期执行

* #### newSingleThreadExecutor

  一句话说清：创建有且只有一个线程的线程池，除非遇到意外终止，否则一直都是这个线程在工作，并保证等待线程顺序执行。

而Callable的接口定义如下

```html
 public interface Callable<V> {      
     V   call()   throws Exception;   
   }
```

 该接口声明了一个名称为call()的方法，同时这个方法可以有返回值V，也可以抛出异常。 

```dart
Future<List> future = getDataFromRemoteByFuture();
        //do something....
        List data = future.get();
```

```java
// ExecutorService executor = Executors.newCachedThreadPool();
//  ### 不能使用Executors的方法创建线程池，这个是大量的生产事故得出来的结论
//new ThreadPoolExecutor(corePoolSize, maximumPoolSize, 0L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<Runnable>(100),newThreadFactoryBuilder().setNameFormat("PROS-%d").build());
private Future<List> getDataFromRemoteByFuture() {

        return threadPool.submit(new Callable<List>() {
            @Override
            public List call() throws Exception {
                return getDataFromRemote();
            }
        });
    }
```

**也可以利用FutureTask来获取结果：**

```dart
FutureTask<List> futureTask = new FutureTask<List>(new Callable<List>() {
            @Override
            public List call() throws Exception {
                return getDataFromRemote();
            }
        });
        threadPool.submit(futureTask);
        futureTask.get();


// Java 8之前：
new Thread(new Runnable() {
 @Override
 public void run() {
 System.out.println("Before Java8, too much code for too little to do");
 }
}).start();

//Java 8方式：
new Thread( () -> System.out.println("In Java8, Lambda expression rocks !!") ).start();
```

**实际例子**

```java
private final ExecutorService executorService;
try {
    List<FutureTask<Map<String, Object>>> futureTasks = new LinkedList<>();
    for (SignatureRequest signatureRequest : request.getStampInfos()) {//多个文件盖章
         Callable<Map<String, Object>> callable = () -> {
         String fileId = signatureSynthesis(signatureRequest, request.getSignType());
             //signatureSynthesis这个方法的要用@Override
         Map<String, Object> map = new HashMap<>();
         map.put("pdfId", signatureRequest.getPdfId());
         map.put("fileId", fileId);
         return map;
       };
    	FutureTask<Map<String, Object>> future = new FutureTask<>(callable);
   	 	executorService.submit(future);
    //                new Thread(future).start();
    	futureTasks.add(future);
    }
    for (FutureTask<Map<String, Object>> future:futureTasks) {
    	resultMap.add(future.get());
    }
} catch (Exception e) {
    log.error("生成签名失败", e);
    throw new BaseException(ERROR, "生成签名失败", e);
}

```



```java

for(int i = 0 ;i < 10 ; i++) {
    threadPool.execute(new Runnable() {
        public void run() {
            System.out.println(Thread.currentThread().getName()+" is running");
        }
    });
}

 ThreadPoolExecutor executor = new ThreadPoolExecutor(2, 4, 10, TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(4), new NameTreadFactory(), new MyIgnorePolicy());

## ArrayBlockingQueue 有界 PriorityBlockingQueue无界 DelayQueue  无界队列
    
ExecutorService pool = new ThreadPoolExecutor(1, 2, 1000, TimeUnit.MILLISECONDS, new PriorityBlockingQueue<Runnable>(),Executors.defaultThreadFactory(),new ThreadPoolExecutor.AbortPolicy());
for(int i=0;i<20;i++) {
    pool.execute(new ThreadTask(i));
}  
```



##### 2-1-1 定时线程池

```java
/**
 * 线程池，每个 JVM 使用一个线程去维护 keyAliveTime，定时执行 runnable
 */
private static final ScheduledExecutorService SCHEDULER = 
new ScheduledThreadPoolExecutor(1, 
new BasicThreadFactory.Builder().namingPattern("redisLock-schedule-pool").daemon(true).build());
static {
    SCHEDULER.scheduleAtFixedRate(() -> {
        // do something to extend time
    }, 0,  2, TimeUnit.SECONDS); //2s执行一次
}
```

##### 2-1-2 例子

```java
ThreadPoolTaskExecutor poolTaskExecutor = new ThreadPoolTaskExecutor();
//线程池所使用的缓冲队列
poolTaskExecutor.setQueueCapacity(200);
//线程池维护线程的最少数量
poolTaskExecutor.setCorePoolSize(5);
//线程池维护线程的最大数量
poolTaskExecutor.setMaxPoolSize(1000);
//线程池维护线程所允许的空闲时间
poolTaskExecutor.setKeepAliveSeconds(30000);
poolTaskExecutor.initialize();

@Bean
public TaskExecutor taskExecutor() {
    ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
    executor.setCorePoolSize(5);
    executor.setMaxPoolSize(10);
    return executor;
}
```



#### 2-2 函数式接口

* 无参无返回的普通接口

  例子

  ```java
  public class ScloudDemoTests {
  	// 定义接口
      public interface DoSomeThing {
          void doSome();
      }
  
      public static void doit(DoSomeThing doSomeThing){
          System.out.println("before");
          doSomeThing.doSome();
          System.out.println("end");
      }
      @Test
      public void test(){
          this.doit(() -> System.out.println("666"));
      }
  }
  
  ```

  

* Supplier接口

  java.util.function.Supplier<T> 接口仅包含一个无参的方法： T get() 。用来获取一个泛型参数指定类型的对象数据。

  **供给型接口 Supplier：T get（）**
  特点是，它的抽象方法：**无参有返回值**

  ```java
  Supplier<MakeCertResponse> issueSupplier = () -> doPost(MAKE_CERT_URL, request, MakeCertResponse.class)
  ```

  

* Consumer 接口

    java.util.function.Consumer<T> 接口则正好与Supplier接口相反，它不是生产一个数据，而是消费一个数据，其数据类型由泛型决定。

  **消费型接口Consumer：void accept（T t）**
  特点是，它的抽象方法：**有参无返回值**

  ```java
  import java.util.function.Consumer;
  
      public class DemoConsumer {
          private static void consumeString(Consumer<String> function) {
              function.accept("Hello");
          }
  
          public static void main(String[] args) {
              consumeString(s ‐ > System.out.println(s));
          }
      }
  ```

  

* Predicate 接口

  有时候我们需要对某种类型的数据进行判断，从而得到一个boolean值结果。这时可以使用java.util.function.Predicate<T> 接口。

  **判断型接口 Predicate：boolean test（T t）**
  **特点是，它的抽象方法；boolean test（有参）无论你给我什么参数，都是用来判断条件，**

  结果只有**true，false**

```java
import java.util.function.Predicate;

    public class DemoPredicateTest {
        private static void method(Predicate<String> predicate) {
            boolean veryLong = predicate.test("HelloWorld");
            System.out.println("字符串很长吗：" + veryLong);
        }

        public static void main(String[] args) {
            method(s ‐ > s.length() > 5);
        }
    }
```



* function接口

  Function 接口中最主要的抽象方法为： R apply(T t) ，根据类型T的参数获取类型R的结果。

   使用的场景例如：将 String 类型转换为 Integer 类型。

  **功能型接口 Function<T，R>：R apply（T t）**
  特点是，它的抽象方法：**有参有返回值**

```java
import java.util.function.Function;

public class Demo11FunctionApply {
    private static void method(Function<String, Integer> function) {
        int num = function.apply("10");
        System.out.println(num + 20);
    }

    public static void main(String[] args) {
        method(s ‐ > Integer.parseInt(s));
    }
}
```

**其它例子**

```java
public class Demo{
	public static void main(String[] args) {
		// 匿名内部类
		Runnable task = new Runnable() {
			@Override
			public void run() { // 覆盖重写抽象方法
				System.out.println("多线程任务执行中！");
			}
		};
		new Thread(task).start(); // 启动线程
	}
}
//函数式接口简化
public static void main(String[] args) {
    new Thread(() -> System.out.println("多线程任务执行中！")).start(); // 启动线程
}
```



#### 2-3 Java反应式框架Reactor中的Mono和Flux

响应流的特点

要搞清楚这两个概念，必须说一下响应流规范。它是响应式编程的基石。他具有以下特点：

- 响应流必须是无阻塞的。

- 响应流必须是一个数据流。

- 它必须可以异步执行。

- 并且它也应该能够处理背压

- Publisher(发布者) 数据提供者,提供给订阅者使用

  Subscription(订阅) 订阅者订阅的发布者提供的数据

  Subscriber(订阅者) 订阅发布者的数据

  Processor(处理器) 这个接口集成了发布者和订阅者接口,所以处理器是发布者和订阅者都可以使用处理器. 

##### Flux

`Flux` 是一个发出(emit)`0-N`个元素组成的异步序列的`Publisher<T>`,可以被`onComplete`信号或者`onError`信号所终止。在响应流规范中存在三种给下游消费者调用的方法 `onNext`, `onComplete`, 和`onError`

```java
public Flux<ClientUser> allUsers(){
    return Flux.just(new ClientUser("felord.cn", "reactive"),
            new ClientUser("Felordcn", "Reactor"));
}
```

* just
  可以指定序列中包含的全部元素。创建出来的 Flux 序列在发布这些元素之后会自动结束。

* fromArray()，fromIterable()和 fromStream()
  可以从一个数组、Iterable 对象或 Stream 对象中创建 Flux 对象。

* empty()
  创建一个不包含任何元素，只发布结束消息的序列,在响应式编程中，流的传递是基于元素的，empty表示没有任何元素，所以不会进行后续传递，需要用switchIfEmpty等处理

* error(Throwable error)
  创建一个只包含错误消息的序列。

* never()
  创建一个不包含任何消息通知的序列。使用示例：

```java
Flux.range(1, 10)
    .timeout(Flux.never(), v -> Flux.never())
    .subscribe(System.out::println);
上面表示用不超时
```

* range(int start, int count)

创建包含从 start 起始的 count 个数量的 Integer 对象的序列。



##### Mono

`Mono` 是一个发出(emit)`0-1`个元素的`Publisher<T>`,可以被`onComplete`信号或者`onError`信号所终止。

```java
public Mono<ClientUser> currentUser () {
    return isAuthenticated ? Mono.just(new ClientUser("felord.cn", "reactive"))
            : Mono.empty();
}
```



实际例子

```java
@ResponseBody
@RequestMapping("/global_error_code")
public Mono<String> globalErrorCode() {

    StringBuilder o = new StringBuilder();
    o.append("<table>")
        .append("<tr>").append("<th>代码</th>").append("<th>编码</th>").append("<th>说明</th>").append("</tr>");
    Consumer<ResponseCode> append = e -> {
        o.append("<tr>")
            .append("<td>").append(e.getCode()).append("</td>")
            .append("<td>").append(e.getMessage()).append("</td>")
            .append("<td>").append(ResultBody.failed(e).getMessage()).append("</td>")
            .append("</tr>");
    };

    return Mono.fromSupplier(() -> {
        ErrorCode.ALL_RESPONSE_CODE.forEach(append);
        o.append("</table>");
        return o.toString();
    });
}
```

1、通过Mono静态方法创建：

* empty()：创建一个不包含任何元素，只发布结束消息的序列。

  ```
   Mono. empty ().subscribe(System. out ::println);
  ```

  

* just()：可以指定序列中包含的全部元素。创建出来的 Mono序列在发布这些元素之后会自动结束。 

* justOrEmpty()：从一个 Optional 对象或可能为 null 的对象中创建 Mono。只有 Optional 对象中包含值或对象不为 null 时，Mono 序列才产生对应的元素。

* error(Throwable error)：创建一个只包含错误消息的序列。

```java
Mono.error(new RuntimeException("error"))
.subscribe(System.out::println, System.err::println);
```



* never()：创建一个不包含任何消息通知的序列。 

```java
Mono.never().subscribe(System.out::println);
```



* fromCallable()、fromCompletionStage()、fromFuture()、fromRunnable()和 fromSupplier()：

  分别从 Callable、CompletionStage、CompletableFuture、Runnable 和 Supplier 中创建 Mono。 

  ```java
  //通过fromRunnable创建，并实现异常处理
  Mono.fromRunnable(() -> {
  System.out.println("thread run");
  throw new RuntimeException("thread run error");
  }).subscribe(System.out::println, System.err::println);
   
  //通过fromCallable创建
  Mono.fromCallable(() -> "callable run ").subscribe(System.out::println);
   
  //通过fromSupplier创建
  Mono.fromSupplier(() -> "create from supplier").subscribe(System.out::println);
  ```

  

* delay(Duration duration)和 delayMillis(long duration)：创建一个 Mono 序列，在指定的延迟时间之后，产生数字 0 作为唯一值。

 2、通过Mono动态方法创建：
 通过 create()方法来使用 MonoSink 来创建 Mono。

#### 2-4 countDownLatch

- countDownLatch类中只提供了一个构造器：

```cpp
//参数count为计数值
public CountDownLatch(int count) {  };  
```

- 类中有三个方法是最重要的：

```java
//调用await()方法的线程会被挂起，它会等待直到count值为0才继续执行
public void await() throws InterruptedException { };   
//和await()类似，只不过等待一定的时间后count值还没变为0的话就会继续执行
public boolean await(long timeout, TimeUnit unit) throws InterruptedException { };  
//将count值减1
public void countDown() { };  
```

例子

```csharp
public class CountDownLatchTest {

    public static void main(String[] args) {
        final CountDownLatch latch = new CountDownLatch(2);
        System.out.println("主线程开始执行…… ……");
        //第一个子线程执行
        ExecutorService es1 = Executors.newSingleThreadExecutor();
        es1.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(3000);
                    System.out.println("子线程："+Thread.currentThread().getName()+"执行");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                latch.countDown();  //减一
            }
        });
        es1.shutdown();

        //第二个子线程执行
        ExecutorService es2 = Executors.newSingleThreadExecutor();
        es2.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("子线程："+Thread.currentThread().getName()+"执行");
                latch.countDown(); //减一
            }
        });
        es2.shutdown();
        System.out.println("等待两个线程执行完毕…… ……");
        try {
            latch.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("两个子线程都执行完毕，继续执行主线程");
    }
}
```

#### 2-5 锁和同步

锁和同步，学习多线程避不开的两个问题，Java提供了synchronized关键字来同步方法和代码块，还提供了很多方便易用的并发工具类，例如：LockSupport、CyclicBarrier、CountDownLatch、Semaphore…



同步机制包括: 锁, volatile 关键字, final 关键字,static 关键字,以及相关的 API,如 Object.wait()/Object.notify()等

##### 锁的实现

**加锁的过程必须是原子操作，否则会导致多个线程同时加锁成功。**

自旋是实现加锁最简单的方式，但是缺点也很明显：

- 自旋时CPU空转，浪费CPU资源。
- 如果使用不当，线程一直获取不到锁，会造成CPU使用率极高，甚至系统崩溃。

**yield+自旋**
要解决自旋锁的性能问题，首先就是尽可能的防止CPU空转，让获取不到锁的线程主动让出CPU资源。

获取不到锁的线程主动让出CPU资源，可以通过Thread.yield()实现。

bye()可以做如下优化：

```java
public void bye(){
    while (!lock()) {
        //获取不到锁，主动让出CPU资源
        Thread.yield();
    }
    String name = Thread.currentThread().getName();
    //加锁成功，执行业务逻辑
    System.out.println(name + ":加锁成功...");
    System.out.println(name + ":开始抢票...");
    //SleepUtil.sleep(1000);
    ticketCount--;
    System.out.println(name + ":抢到了，库存:" + ticketCount);
    System.out.println(name + ":释放锁.");
    unlock();
}
```

Thread.yield()虽然让出了CPU资源，但还是会继续争夺，很可能CPU下次还会继续分配时间片给该线程。

yield+自旋适用于**两个线程竞争**的情况，如果线程太多，频繁的yield也会增加CPU的调度开销。

**Sleep+自旋**
除了使用yield让出CPU资源外，还可以使用Sleep将获取不到锁的线程暂时休眠，不占用CPU的资源。

bye()可以做如下优化：

```java
public void bye(){
    while (!lock()) {
       //获取不到锁的线程,暂时休眠1ms，释放CPU资源
        SleepUtil.sleep(1);
    }
    String name = Thread.currentThread().getName();
    //加锁成功，执行业务逻辑
    System.out.println(name + ":加锁成功...");
    System.out.println(name + ":开始抢票...");
    //SleepUtil.sleep(1000);
    ticketCount--;
    System.out.println(name + ":抢到了，库存:" + ticketCount);
    System.out.println(name + ":释放锁.");
    unlock();
}
```

使用Sleep可以减轻CPU的压力，但是缺点也很明显：

- **sleep时间不可控**

###### **park+自旋**

```java
/**
 * @Description 抢票-park+自旋
 */
public class TicketPark {
    //加锁标记
    private AtomicBoolean isLock = new AtomicBoolean(false);
    //票库存
    private int ticketCount = 10;
    //等待线程队列
    private final Queue<Thread> WAIT_THREAD_QUEUE = new LinkedBlockingQueue<>();

    //抢票
    public void bye(){
        while (!lock()) {
            //获取不到锁的线程,添加到队列，并休眠
            lockWait();
        }
        String name = Thread.currentThread().getName();
        //加锁成功，执行业务逻辑
        System.out.println(name + ":加锁成功...");
        System.out.println(name + ":开始抢票...");
        ticketCount--;
        System.out.println(name + ":抢到了，库存:" + ticketCount);
        System.out.println(name + ":释放锁.");
        unlock();
    }

    //加锁的过程必须是原子操作，否则会导致多个线程同时加锁成功。
    public boolean lock(){
        return isLock.compareAndSet(false, true);
    }

    //释放锁
    public void unlock() {
        isLock.set(false);
        //唤醒队列中的第一个线程
        LockSupport.unpark(WAIT_THREAD_QUEUE.poll());
    }

    public void lockWait(){
        //将获取不到锁的线程添加到队列
        WAIT_THREAD_QUEUE.add(Thread.currentThread());
        //并休眠
        LockSupport.park();
    }
}
```

##### synchronized 同步

```java
package com.wbg;

import java.util.ArrayList;
import java.util.List;

public class kt {
    public static void main(String[] args) {
        System.out.println("使用关键字synchronized");
        SyncThread syncThread = new SyncThread();
        Thread thread1 = new Thread(syncThread, "SyncThread1");
        Thread thread2 = new Thread(syncThread, "SyncThread2");
        thread1.start();
        thread2.start();
    }
}
class SyncThread implements Runnable {
    private static int count;
    public SyncThread() {
        count = 0;
    }
    public  void run() {
       synchronized (this){
            for (int i = 0; i < 5; i++) {
                try {
                    System.out.println("线程名:"+Thread.currentThread().getName() + ":" + (count++));
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public int getCount() {
        return count;
    }
}


//同步函数
public sysnchronized void func(){
    
}
//同步函数用的锁就是this

//解决单例效率地的问题，用双重判断的形式。
class Single{
    private static Single s=null;
    private Single(){}
    public static Single getInstance(){
        if(s==null){
            sysnchronized(Single.clasee){
                if(s==null){
                    s=new Single();
                }
            }            
        }
        return s;
    }
}
```

##### ReentrantLock 重入锁

ReentrantReadWriteLock是读写锁

```java
private final Lock lock = new ReentrantLock();
public void add() {
    lock.lock();
    try {
        // 代码
    } finally {
        lock.unlock();
    }
}
```

注意点：这两种锁在在和@Transational同一个方法一起使用的情况下会出现，锁已经去除，但是事务还没提交的情况，造成脏读和数据不一致性等情况。 把事务提交封装到另一个service中

```java
public void test() {
    lock.lock();
    try {
      service.update
    } finally {
      lock.unlock();
    }
  }
// 另一个service里，同一个service里调用，事务失效
@Transactional
public void update(int id) {
    /*
          业务代码
         */
}
```

##### 数据库锁

```java
悲观锁 JPA有提供一个更简洁的方式，就是@Lock注解

/**
* 查询时加上悲观锁
* 在我们没有将其提交事务之前，其他线程是不能获取修改的，需要等待
* @param id clientId
* @return
*/
@Lock(value = LockModeType.PESSIMISTIC_WRITE)
@Query("select a from Client a where a.id = :id")
Optional<Client> findClientByIdWithPessimisticLock(Long id);
```

乐观锁

原理就是在实体中加一个字段当作版本号，比如我们加个字段version。

与悲观锁相同，jpa也提供了乐观锁的实现方式。

```java
@Data
@Entity
public class Article {
    ...
    
    @Version
    private Long version;
}
```

乐观锁适合写少读多的场景，写多的情况会经常回滚，消耗性能。

悲观锁适合写多读少的场景，使用的时候该线程会独占这个资源。

##### RedisLockRegistry redis的分布式锁

```xml
        <!-- redis -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.integration</groupId>
            <artifactId>spring-integration-redis</artifactId>
        </dependency>
        
```

```java
@Configuration
public class RedisLockConfiguration {

    @Bean
    @ConditionalOnMissingBean(RedisLockRegistry.class)
    public RedisLockRegistry redisLockRegistry(RedisConnectionFactory redisConnectionFactory, RedisExpireProperties expireProperties) {
        String registryKey = "lockRegistry";
        if (StringUtils.isNotBlank(expireProperties.getCachePrefix())) {
            registryKey = expireProperties.getCachePrefix() + "." + registryKey;
        }
        return new RedisLockRegistry(redisConnectionFactory, registryKey);
    }
}


//使用
@Autowired
private RedisLockRegistry redisLockRegistry;

Lock lock = redisLockRegistry.obtain("genebridge");
try {
    if (lock.tryLock(1, TimeUnit.SECONDS)) {
        log.info("【开始开始处理】\n");
        //开始处理
    }
}catch (Exception e) {
    log.error("异常:{}", e.getMessage());
    //异常处理
} finally {
    lock.unlock();
} 
```





#### 2-6 注入和策略问题

```
定义一个interface Animalservice
多个实现、或者 继承抽象类去实现 

注入
List<Animalservice>
Map<String, Animalservice>

render和event合理使用注入类

枚举enum的Switch
```





### System.getProperty()

| java.version                  | Java 运行时环境版本               |
| ----------------------------- | --------------------------------- |
| java.vendor                   | Java 运行时环境供应商             |
| java.vendor.url               | Java 供应商的 URL                 |
| java.home                     | Java 安装目录                     |
| java.vm.specification.version | Java 虚拟机规范版本               |
| java.vm.specification.vendor  | Java 虚拟机规范供应商             |
| java.vm.specification.name    | Java 虚拟机规范名称               |
| java.vm.version               | Java 虚拟机实现版本               |
| java.vm.vendor                | Java 虚拟机实现供应商             |
| java.vm.name                  | Java 虚拟机实现名称               |
| java.specification.version    | Java 运行时环境规范版本           |
| java.specification.vendor     | Java 运行时环境规范供应商         |
| java.specification.name       | Java 运行时环境规范名称           |
| java.class.version            | Java 类格式版本号                 |
| java.class.path               | Java 类路径                       |
| java.library.path             | 加载库时搜索的路径列表            |
| java.io.tmpdir                | 默认的临时文件路径                |
| java.compiler                 | 要使用的 JIT 编译器的名称         |
| java.ext.dirs                 | 一个或多个扩展目录的路径          |
| os.name                       | 操作系统的名称                    |
| os.arch                       | 操作系统的架构                    |
| os.version                    | 操作系统的版本                    |
| file.separator                | 文件分隔符（在 UNIX 系统中是“/”） |
| path.separator                | 路径分隔符（在 UNIX 系统中是“:”） |
| line.separator                | 行分隔符（在 UNIX 系统中是“/n”）  |
| user.name                     | 用户的账户名称                    |
| user.home                     | 用户的主目录                      |
| user.dir                      | 用户的当前工作目录                |

在java开发中经常用到System.getProperty("user.dir");获取用户的当前工作目录，百度后发现还有很多资源，记录下来，以后备用。



------



### 重要：一些面试基础问题

#### 什么是ThreadLocal变量？

ThreadLocal<T>是Java里一种特殊的变量。每个线程都有一个ThreadLocal就是每个线程都拥有了自己独立的一个变量，竞争条件被 彻底消除了。它是为创建代价高昂的对象获取线程安全的好方法，比如你可以用ThreadLocal让SimpleDateFormat变成线程安全的，因 为那个类创建代价高昂且每次调用都需要创建不同的实例所以不值得在局部范围使用它，如果为每个线程提供一个自己独有的变量拷贝，将大大提高效率。首先，通 过复用减少了代价高昂的对象的创建个数。其次，你在没有使用高代价的同步或者不变性的情况下获得了线程安全。线程局部变量的另一个不错的例子是 ThreadLocalRandom类，它在多线程环境中减少了创建代价高昂的Random对象的个数。

常用的方法 get,  set ,remove

备注：threadLocal每次取值之后，是为了避免内存溢出。

#### Java中堆和栈有什么不同？

为什么把这个问题归类在多线程和并发面试题里？因为栈是一块和线程紧密相关的内存区域。每个线程都有自己的栈内存，用于存储本地变量，方法参数和栈 调用，一个线程中存储的变量对其它线程是不可见的。而堆是所有线程共享的一片公用内存区域。对象都在堆里创建，为了提升效率线程会从堆中弄一个缓存到自己 的栈，如果多个线程使用该变量就可能引发问题，这时volatile 变量就可以发挥作用了，它要求线程从主存中读取变量的值。

####  有三个线程T1，T2，T3，怎么确保它们按顺序执行？

在多线程中有多种方法让线程按特定顺序执行，你可以用线程类的**join()方**法在一个线程中启动另一个线程，另外一个线程完成该线程继续执行。为了确保三个线程的顺序你应该先启动最后一个(T3调用T2，T2调用T1)，这样T1就会先完成而T3最后完成。

#### 如果你提交任务时，线程池队列已满。会时发会生什么？

这个问题问得很狡猾，许多程序员会认为该任务会阻塞直到线程池队列有空位。事实上如果一个任务不能被调度执行那么ThreadPoolExecutor’s submit()方法将会抛出一个RejectedExecutionException异常。

#### Java多线程中调用wait() 和 sleep()方法有什么不同？

Java程序中wait 和 sleep都会造成某种形式的暂停，它们可以满足不同的需要。wait()方法用于线程间通信，如果等待条件为真且其它线程被唤醒时它会释放锁，而 sleep()方法仅仅释放CPU资源或者让当前线程停止执行一段时间，但不会释放锁。

#### Java的start()和 run()方法区别

 调用 `start()` 方法方可启动线程并使线程进入就绪状态，直接执行 `run()` 方法的话不会以多线程的方式执行。

run()只会当做一个方法，还在主线程里面执行，并不是多线程。

#### 什么时候会死锁

- **互斥**：资源必须处于非共享模式，即一次只有一个进程可以使用。如果另一进程申请该资源，那么必须等待直到该资源被释放为止。
- **占有并等待**：一个进程至少应该占有一个资源，并等待另一资源，而该资源被其他进程所占有。
- **非抢占**：资源不能被抢占。只能在持有资源的进程完成任务后，该资源才会被释放。
- **循环等待**：有一组等待进程 `{P0, P1,..., Pn}`， `P0` 等待的资源被 `P1` 占有，`P1` 等待的资源被 `P2` 占有，......，`Pn-1` 等待的资源被 `Pn` 占有，`Pn` 等待的资源被 `P0` 占有。

注意，只有四个条件同时成立时，死锁才会出现。

#### MQ如何防止消息丢失

a. 生产者端

```java
可以开启confirm模式。在生产者哪里设置开启了confirm模式之后，每次写的消息都会分配一个唯一的id，然后如何写入了rabbitmq之中，rabbitmq会给你回传一个ack消息，告诉你这个消息发送OK了；如果rabbitmq没能处理这个消息，会回调你一个nack接口，告诉你这个消息失败了，你可以进行重试。而且你可以结合这个机制知道自己在内存里维护每个消息的id，如果超过一定时间还没接收到这个消息的回调，那么你可以进行重发
//开启confirm
channel.confirm();
//发送成功回调
public void ack(String messageId){
  
}

// 发送失败回调
public void nack(String messageId){
    //重发该消息
}
```

b. mq端 

设置持久化 到磁盘 

①创建queue的时候将其设置为持久化的，这样就可以保证rabbitmq持久化queue的元数据，但是不会持久化queue里面的数据。
②发送消息的时候讲消息的deliveryMode设置为2，这样消息就会被设为持久化方式，此时rabbitmq就会将消息持久化到磁盘上。
必须要同时开启这两个才可以。

```java
而且持久化可以跟生产的confirm机制配合起来，只有消息持久化到了磁盘之后，才会通知生产者ack，这样就算是在持久化之前rabbitmq挂了，数据丢了，生产者收不到ack回调也会进行消息重发。
```

c. 消费端

 关闭rabbitmq的自动ack，然后每次在确保处理完这个消息之后，在代码里手动调用ack 。

#### 什么是缓存雪崩

 缓存雪崩是指缓存中数据大批量到过期时间，而查询数据量巨大，引起数据库压力过大甚至down机。和缓存击穿不同的是，    缓存击穿指并发查同一条数据，缓存雪崩是不同数据都过期了，很多数据都查不到从而查数据库。 

* 缓存数据的过期时间设置随机，防止同一时间大量数据过期现象发生。
* 如果缓存数据库是分布式部署，将热点数据均匀分布在不同搞得缓存数据库中。
* 设置热点数据永远不过期。

#### 什么是缓存击穿

  缓存击穿是指缓存中没有但数据库中有的数据（一般是缓存时间到期），这时由于并发用户特别多，同时读缓存没读到数据，又同时去数据库去取数据，引起数据库压力瞬间增大，造成过大压力 

* 设置热点数据永远不过期
*  加互斥锁  如 synchronized 与ReentrantLock都用于线程同步锁，都是互斥锁 

#### 什么是缓存穿透

 缓存穿透是指**查询一个根本不存在的数据** ， 当并发流量大时，会很容易把DB打垮。

 缓存穿透将导致不存在的数据每次请求都要到存储层去查询，失去了缓存保护后端存储的意义。  

解决方法：

1. 缓存一个空对象（设置个有效期）

2. 布隆过滤器

    布隆过滤器可以用于检索一个元素是否在一个集合中。它的优点是空间效率和查询时间都远远超过一般的算法，**缺点是有一定的误识别率和删除困难。** 

   https://blog.csdn.net/weixin_43748936/article/details/110225696

    google guava包下有对布隆过滤器的封装，BloomFilter。 

   ```xml
   <!--使用Redis-->
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-data-redis</artifactId>
   </dependency>
   <!--借助guava的布隆过滤器-->
   <dependency>
       <groupId>com.google.guava</groupId>
       <artifactId>guava</artifactId>
       <version>22.0</version>
   </dependency>
   ```

   

   ```java
   /**
    * 防缓存穿透的：布隆过滤器
    *
    * @param id
    * @return
    */
   public Object getObjectByBloom(Integer id) {
       // 判断是否为合法id
       if (!bloomFilter.mightContain(id)) {
           // 非法id,则不允许继续查库
           return null;
       } else {
           // 从缓存中获取数据
           Object cacheValue = cache.get(id);
           // 缓存为空
           if (cacheValue == null) {
               // 从数据库中获取
               Object storageValue = storage.get(id);
               // 缓存空对象
               cache.set(id, storageValue);
           }
           return cacheValue;
       }
   } 
   ```

   

####  java实现线程几种方式 

1. 继承Thread类

   ```java
   public class MyThread extends Thread {
       @Override
       public void run(){
           super.run();
           System.out.println("执行子线程...");
       }
   }
   //使用
   MyThread myThread = new MyThread();
   myThread.start();
   ```

2. 实现Runnable接口

   ```java
   public class MyRunnable implements Runnable {
       @Override
       public void run() {
           System.out.println("执行子线程...");
       }
   }
   //使用
   Runnable runnable = new MyRunnable();
   Thread thread = new Thread(runnable);
   thread.start();
   ```

3. 实现Callable和Future创建线程

   线程有返回结果

   ```java
   import java.util.concurrent.Callable;
   public class MyCallable implements Callable {
       int i = 0;
       @Override
       public Object call() throws Exception {
           System.out.println(Thread.currentThread().getName()+"  i的值："+ i);
           return i++; //call方法可以有返回值
       }
   }
   //使用
    Callable callable = new MyCallable();
   for (int i = 0; i < 10; i++) {
       FutureTask task = new FutureTask(callable);
       new Thread(task,"子线程"+ i).start();
       try {
           //获取子线程的返回值
           System.out.println("子线程返回值："+task.get() + "\n");
       }  catch (Exception e) {
           e.printStackTrace();
       }
   }  
   ```

4. 通过线程池创建，线程池接口ExecutorService结合callable、feture实现有返回结果的多线程

### 3 IO流功能对象

**File类的对象代表一个文件或一个目录（文件夹）的路径**

```java
打印流 -- 输出流
PrintStream(字节流)       PrintWriter(字符流)
    
transient  //瞬态关键字  防止某些字段被序列化
    
```

**注意点：**   try{}catch{}finally{ **此处必须要对流进行关闭操作**} 否则会占用电脑内存。

文件存储需规范

<div style="color:red; text-align:center">文件系统存储规范</div>
为方便进行文件服务器冷热数据存放及备份，建议各个中心业务系统的文件存放规范如下：
1、将文件按照一定的存放规则，存到文件夹中，避免单个文件夹里面的文档过多。
文件分为业务类文件，模板类文件、当事人信息类文件等。
业务类文件，即办理业务时产生的文件
例如：
业务中心名称->业务模块->年份->月份->日期->订单号（卷宗号）
->模板->模板类别
->当事人文件->当事人编号
日期目录如：/2020/12/09/格式：/yyyy/mm/dd/
2、文件统一命名规则，系统生成的文件建议使用小写字母、数字、下划线，尽量不使用中
文、特殊字符等,文件名称尽量简短。
3、每年年初将一年前的业务文件存放冷数据盘。
4、5年以前的业务文件存放归档数据盘。
5、当事人信息文件、业务文件进行加密储存。

#### 3-1  文件上传的操作

```java
if (ImageUtils.isImage(newFile)) {
    if (!(newFile.getParentFile().exists())) { //File newFile
        if (!newFile.getParentFile().mkdirs()) {
            logger.error("文件夹创建失败");
            return ReturnObject.failureEnum(ReturnFailureEnum.SITE_MKDIR_ERROR);
        }
    }
    // 压缩图片格式的文件
    Thumbnails.of(inputStream).scale(1f).outputQuality(0.8f).toFile(newFile);
}

//方式二
import org.apache.commons.io.FileUtils;
FileUtils.copyInputStreamToFile(inputStream, newFile);

System.getProperty("line.separator") //换行符
```

#### 3-2  字节流的形式返回

```java
byte[] bytes = Files.readAllBytes(Paths.get("文件路径"));
response.reset();
response.getOutputStream().write(bytes);
response.getOutputStream().close();
```

```java
OutputStream out = response.getOutputStream();
InputStream in = new FileInputStream(file);
StreamUtils.copy(in, out);
```

```java
OnputStream out = response.getOutputStream();
InputStream in = new FileInputStream(file);
byte[] buff =new byte[1024];
//所读取的内容使用n来接收
int n;
//当没有读取完时,继续读取,循环
while((n=in.read(buff))!=-1){
    //将字节数组的数据全部写入到输出流中
    out.write(buff,0,n);
}
//强制将缓存区的数据进行输出
out.flush();
```

#### 3-3 批量下载 zip形式

引入jar包

```xml
<dependency>
    <groupId>org.apache.ant</groupId>
    <artifactId>ant</artifactId>
    <version>1.9.3</version>
</dependency>
```

实例

```java
public static void zipDownload(List<FileInfo> fileMap, HttpServletResponse response, HttpServletRequest request) throws IOException {
        // 处理响应头
        setResponse(response, request, "临时压缩文件", null);

        ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());
        InputStream in = null;
        byte[] data;
        String fileName;
        Map<String, Integer> entryNum = Maps.newHashMap();
        for (FileInfo fileInfo : fileMap) {
            // 避免文件名重复,给重复的文件编号
            fileName = getFileName(entryNum, fileInfo.getFileName(), false);
            zos.putNextEntry(new ZipEntry(fileName));
            try {
                // data = new StorageClient1().download_file1(fileInfo.getFileUrl());
                data = downloadHelper.downloadAsByteArray(fileInfo.getFileUrl());
                if (data == null || data.length <= 0) {
                    log.info("File[" + fileInfo.getId() + "] does not exist or cannot be read.");
                    continue;
                }
                in = new ByteArrayInputStream(data);
                StreamUtils.copy(in, zos);
            } catch (Exception e) {
                log.error("材料解密报错{}", e.toString());
            }
            zos.closeEntry();
            if (null != in) {
                in.close();
            }
        }

        zos.flush();
        zos.close();
    }
```



#### 3-4 路径问题

```java
ResourceUtils.getURL("classpath:").getPath()  //获取class的路径
//输出路径
System.getProperty("java.io.tmpdir");
```

System.getProperty()的参数有那些:

| java.version                  | Java运行时环境版本                |
| ----------------------------- | --------------------------------- |
| java.vendor                   | Java运行时环境供应商              |
| java.vendor.url               | Java供应商的 URL                  |
| java.home                     | Java安装目录                      |
| java.vm.specification.version | Java虚拟机规范版本                |
| java.vm.specification.vendor  | Java虚拟机规范供应商              |
| java.vm.specification.name    | Java虚拟机规范名称                |
| java.vm.version               | Java虚拟机实现版本                |
| java.vm.vendor                | Java虚拟机实现供应商              |
| java.vm.name                  | Java虚拟机实现名称                |
| java.specification.version    | Java运行时环境规范版本            |
| java.specification.vendor     | Java运行时环境规范供应商          |
| java.specification.name       | Java运行时环境规范名称            |
| java.class.version            | Java类格式版本号                  |
| java.class.path               | Java类路径                        |
| java.library.path             | 加载库时搜索的路径列表            |
| java.io.tmpdir                | 默认的临时文件路径                |
| java.compiler                 | 要使用的 JIT 编译器的名称         |
| java.ext.dirs                 | 一个或多个扩展目录的路径          |
| os.name                       | 操作系统的名称                    |
| os.arch                       | 操作系统的架构                    |
| os.version                    | 操作系统的版本                    |
| file.separator                | 文件分隔符（在 UNIX 系统中是“/”） |
| path.separator                | 路径分隔符（在 UNIX 系统中是“:”） |
| line.separator                | 行分隔符（在 UNIX 系统中是“/n”）  |
| user.name                     | 用户的账户名称                    |
| user.home                     | 用户的主目录                      |
| user.dir                      | 用户的当前工作目录                |

```java
 PrintWriter out = null;  
    try {  
        out = response.getWriter();  
        out.append(responseJSONObject.toString());   
    } catch (IOException e) {  
        e.printStackTrace();  
    } finally {  
        if (out != null) {  
            out.close();  
        }  
    }  

//response返回json数据
json = JSON.toJSON(obj);
out = response.getWriter();
out.append(json.toString());
out.flush();
out.close();
```

```java
/**
* 根据路径读取文件
**/
public byte[] getByte(String path) {
    if (StringUtils.isBlank(path)) {
        LOGGER.info("路径为空");
        return null;
    }
    String basePath = CommonPath.fileUploadRootPath;
    String filePath = basePath + path;
    byte[] b = null;
    try {
        File f = new File(filePath);
        if (f.exists() && f.isFile()) {
            b = FileUtils.readFileToByteArray(f);
        } else {
            LOGGER.info("文件不存在或文件是目录{}", filePath);
        }
    } catch (IOException e) {
        LOGGER.error("读文件异常{}", filePath, e);
        return null;
    }
    return b;
}
```



##### File、FileInputStream 转换为byte[]

```java
File file = new File("test.txt");
InputStream input = new FileInputStream(file);
byte[] bytes = new byte[input.available()];
input.read(bytes);
```

###### byte[]转换为InputStream

```java
byte[] bytes = new byte[1024];
InputStream input = new ByteArrayInputStream(bytes);
```

###### byte[]转换为File

```java
File file = new File("");
OutputStream os = new FileOutputStream(file);
BufferedOutputStream bos = new BufferedOutputStream(os);
bos.write(bytes);
```

字节流与字符流的区别

* 字符（Reader和 Writer）：中文，字符是只有在内存中才会形成的，操作字符、字符数组或字符串，

* 字节（InputStream 和OutputStream）：音频文件、图片、歌曲，所有的硬盘上保存文件或进行传输的时候，操作字节和字节数组或二进制对象,

字节流和字符流使用是非常相似的，那么除了操作代码的不同之外，还有哪些不同呢？

字节流在操作的时候本身是不会用到缓冲区（内存）的，是与文件本身直接操作的，而字符流在操作的时候是使用到缓冲区的

字节流在操作文件时，即使不关闭资源（close方法），文件也能输出，但是如果字符流不使用close方法的话，则不会输出任何内容，说明字符流用的是缓冲区，并且可以使用flush方法强制进行刷新缓冲区，这时才能在不close的情况下输出内容

```java
@RequestMapping("/GetFile")
public void getFile(HttpServletRequest request , HttpServletResponse response) throws IOException {
	//读取路径下面的文件
	File file = new File(importPath);
	File picFile = null;
	for(File f : file.listFiles()){
		if(f.getName().contains("文件名")){
			//根据路径获取文件
			picFile = new picFile(f.getPath());
			//获取文件后缀名格式
			String ext = picFile.getName()substring(picFile.getName().indexOf("."));
			//判断图片格式,设置相应的输出文件格式
			if(ext.equals("jpg")){
				response.setContentType("image/jpeg");
			}else if(ext.equals("JPG")){
				response.setContentType("image/jpeg");
			}else if(ext.equals("png")){
				response.setContentType("image/png");
			}else if(ext.equals("PNG")){
				response.setContentType("image/png");
			}
		}
	}
	//读取指定路径下面的文件
	InputStream in = new FileInputStream(picFile);
	OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
	//创建存放文件内容的数组
	byte[] buff =new byte[1024];
	//所读取的内容使用n来接收
	int n;
	//当没有读取完时,继续读取,循环
	while((n=in.read(buff))!=-1){
		//将字节数组的数据全部写入到输出流中
		ouputStream.write(buff,0,n);
	}
	//强制将缓存区的数据进行输出
	outputStream.flush();
	//关流
	outputStream.close();
	in.close();
} 
```

#### 3-5 uploadFile

```java
/**
     * 允许上传的文件类型
     */
private static final String LICIT_FILE_TYPE = ".jpg.jpeg.png.bmp.pdf.doc.docx.xls.xlsx";
/**
     * 留言上传文件
     * 大小限制10M
     * {params} request请求, size 文件大小, name文件名
     * @author: 杨春生
     * @Date: 2019-9-11
     */
@RequestMapping(value = {"/uploadMessageFile"},method = RequestMethod.POST)
@ResponseBody
public Map<String, Object> uploadMessageFile(HttpServletRequest request, @RequestParam("file") MultipartFile file){
    SysUserDTO loginSysUserDTO = getSysUserDTOCheckAuth(request);
    if (null == loginSysUserDTO) {
        return ReturnObject.failureEnum(ReturnFailureEnum.NOLOGIN);
    }
    if (null == file) {
        return ReturnObject.failureEnum(ReturnFailureEnum.MISSING_PARAMETERS);
    }
    String fileName = file.getOriginalFilename();
    String fileExt = SerialGenerator.getFileExt(fileName);
    long size = file.getSize();
    // 10M
    long maxFileLen = 10485760;
    if (size > maxFileLen) {
        return ReturnObject.failureEnum(ReturnFailureEnum.FILE_UPLOAD_SIZE_LIMIT);
    }
    if (!LICIT_FILE_TYPE.contains(fileExt)) {
        return ReturnObject.failureEnum(ReturnFailureEnum.SITE_FILE_TYPE_NOT_SUPPORT);
    }
    // 根据文件后缀，生成文件名
    String newFileName = SerialGenerator.generateFileName(null, fileExt);
    //消息文件的保存路径
    String filePath = CommonPath.messagelFileRelativePath(newFileName);
    File destFile = new File(CommonPath.fileUploadRootPath + filePath);
    try {
        FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);
    } catch (IOException e) {
        SYS_LOGGER.error("文件上传报错", e);
        return ReturnObject.error();
    }
    Map<String, Object> result = Maps.newHashMapWithExpectedSize(2);
    result.put("orginFileName",fileName);
    result.put("fileName",newFileName);
    result.put("filePath", filePath);
    result.put("fileLength", size);
    return ReturnObject.success(result);
}
```

```java
//路径问题
System.getProperty("java.io.tmpdir")
```



### 4 StringBuffer

* 能使用StringBuffer就使用这个   线程同步,支持并发  安全
* StringBuilder   可变的字符序列  比StringBuilder快，线程不同步的
* 一般建议使用StringBuffer

##### 4-1 split();注意分割

```java
1、“.”和“|”都是转义字符，必须得加"\\";
2、如果在一个字符串中有多个分隔符，可以用“|”作为连字符
String.split("分割1|分割2");
```

##### 4-2 CharSequence是一个描述字符串结构的接口

* Stirng类

  ```
  public final class String
  extends Object
  implements Serializable, Comparable<String>, CharSequence
  ```

* StringBuffer类

  ```
  public final class StringBuffer extends Object implements Serializable, CharSequence
  ```

* StringBuilder类

  ```
  public final class StringBuilder
  extends Object
  implements Serializable, CharSequence
  ```

  

### 5 集合 

#### 基础数据结构介绍

<span style="color:red">介绍下基础数据结构</span>

- 枚举（Enumeration）

- 位集合（BitSet）

- 向量（Vector） 

  是同步的，所以线程安全

- 栈（Stack） 

  vector的一个子类 ， 后进先出

  推荐用Deque替代stack 堆栈操作方法：push()、pop()、peek()。

  `Queue`是队列，只能一头进，另一头出

  `Deque`是双向队列

  ```java
  Queue queue = new LinkedList()`或`Deque deque = new LinkedList()
  ```

- 字典（Dictionary）

  已过期，业务实际用map

- 哈希表（Hashtable） 支持同步，线程安全

- 属性（Properties） 继承hashTable

  

### 5-1枚举

```java
 public static LinkedHashMap<String, String> values = null;

PaymentEnum(String value, String desc) {
    this.value = value;
    this.desc = desc;
}

static {
    values = Maps.newLinkedHashMapWithExpectedSize(values().length);
    for (PaymentEnum payment : values()) {
        values.put(payment.value, payment.desc);
    }
}
```



#### 1、List,Set继承接口Collection

* 存储对象，集合长度可变，可存储不同类型对象
* 迭代器  Iterator。hasnext()   next()  remove()
* List<E> 存入的顺序和取出的顺序一致    List集合特有的迭代器 ListIterator

  * Listd的具体子类 

  * Vector 数组 可变长度， 线程安全的 
  *  ArrayList   数组结构，长度可变，线程不安全的
  * LinkList   链表结构，线程不同步，线程不安全
* Set  不允许重复元素

  * HashSet集合  不允许重复元素
  * TreeSet

**Tip:Set里的元素是不能重复的，那么用什么方法来区分重复与否呢? 是用==还是 equals()?它们有何区别?**

​	Set 里的元素是不能重复的，那么用 iterator()方法来区分重复与否。 

​	equals()是判读两个 Set 是否相等。 

​	equals()和==方法决定引用值是否指向同一对象 equals()在类中被覆盖，为的是当两个分 离的对象的内容和类型相配的话，返回真值。

```java
实例化直接赋值
List<String> alpha = Arrays.asList("a", "b", "c", "d");
实例化
List<String> lists = new ArrayList<String>();
遍历循环
for(Object obj : List){}  //不使用角标
```

##### 1-1 比较器的使用 排序

```java
//自定义排序1
Collections.sort(list, new Comparator<Student>() {
    @Override
    public int compare(Student o1, Student o2) {
        return o1.getId() - o2.getId();
    }
});  
//自定义排序2
list.sort(new Comparator<Student>() {
    @Override
    public int compare(Student o1, Student o2) {
        return o1.getId() - o2.getId();
    }
}); 
```

##### 1-2 筛选 filter

```java
Boolean flag = List.stream().filter(w -> '1'.getValue().equals(w.getApplicationUserType())).findAny().isPresent();
// findAny() 返回任意一个对象
// isPresent() 判断是否是null
```

##### 1-3 List实体stream() 

```java
List<QuickNotaryDTO> list = quickNotaryService.find(id);
// 转map
Map<String, QuickNotaryDTO> map = list.stream().collect(toMap(QuickNotaryDTO::getNotaryCode, dto -> dto,
                                                        (key1,key2)->key2));
//getNotaryCode实体对象中的一个get方法
// {"NotaryCode()":{xxx},} // key 和 对象


//对象转换 方式一
List<VO> ll = Lists.transform(entityList, (entity) -> {
    VO vo = new VO();
    return vo;
});
//方式二
// 获取 users 集合中的 id 集合
List<Long> ids = users.stream().map(User::getId).collect(Collectors.toList());
// 获取 users 集合中的 id 集合并转为字符串, 通过 , 拼接
String idsTxt = users.stream().map(User::getId).map(String::valueOf).collect(Collectors.joining(","));
```



#### 2、Map 接口

* 键值  key -Value 存储     保证键的唯一性
  *  HashTable  Dictionary 线程安全, 同步的，不允许null键  null值
  *  HashMap   线程不安全，方法不同步的  允许null值 null键
  * TreeMap   不同步的，可以对map排序

```java
Map<String,Object> map=new HashMap<String,Object>(); //Maps.newHashMap();
//迭代的例子
for (Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
    String name = (String) iter.next();
    String values = map.get(name);
    templateContent = templateContent.replaceAll(name, values);
}
```

Map.Entry是Map声明的一个内部接口，此接口为泛型，定义为Entry<K,V>。它表示Map中的一个实体（一个key-value对）

因为Map这个类没有继承Iterable接口所以不能直接通过map.iterator来遍历(list，set就是实现了这个接口，所以可以直接这样遍历),所以就只能先转化为set类型，用entrySet()方法，其中set中的每一个元素值就是map中的一个键值对，也就是Map.Entry<K,V>了，然后就可以遍历了。
基本上 就是遍历map的时候才用得着它吧。

##### 2-1 map获取所有的Key和Value

```java
// 1
java.util.Iterator it = map.entrySet().iterator();
while(it.hasNext()){
      java.util.Map.Entry entry = (java.util.Map.Entry)it.next();
      entry.getKey()      //返回对应的键
      entry.getValue()   //返回对应的值
}
// 2
Map<String,String> testData = new HashMap<String, String>();
Set<String>   keys = testData.keySet();
for(String key :keys){
    System.out.println(key+" "+testData.get(key));
}
// 3
Set<Entry<String, String>> entries = testData.entrySet();
for (Entry<String, String> entry : entries) {    
    System.out.println(entry.getKey()+":"+entry.getValue());
}
// 4
for(Object m:map.values()){
    System.out.println(m);
}
```

##### 2-2 map.stream()

```java
//map转list java8新特性
List<Value> values = map.values().stream().collect(Collectors.toList());
//for循环去转
```

##### 2-3 put的源代码

 HashMap 采用一种所谓的“Hash 算法”来决定每个元素的存储位置。当程序执行 map.put(String,Obect)方法 时，系统将调用String的 hashCode() 方法得到其 hashCode 值——每个 Java 对象都有 hashCode() 方法，都可通过该方法获得它的 hashCode 值。得到这个对象的 hashCode 值之后，系统会根据该 hashCode 值来决定该元素的存储位置。 

 值得注意的是**HashMap不是线程安全**的，如果想要线程安全的HashMap，可以通过Collections类的静态方法synchronizedMap获得线程安全的HashMap。

```java
Map map = Collections.synchronizedMap(new HashMap());
```

 **ConcurrentHashMap** 是线程安全的

```java
public V put(K key, V value) {  
        if (key == null)  
            return putForNullKey(value);  
        int hash = hash(key.hashCode());  
        int i = indexFor(hash, table.length);  
        for (Entry e = table[i]; e != null; e = e.next) {  
            Object k;  //判断当前确定的索引位置是否存在相同hashcode和相同key的元素，如果存在相同的hashcode和相同的key的元素，那么新值覆盖原来的旧值，并返回旧值。  //如果存在相同的hashcode，那么他们确定的索引位置就相同，这时判断他们的key是否相同，如果不相同，这时就是产生了hash冲突。  //Hash冲突后，那么HashMap的单个bucket里存储的不是一个 Entry，而是一个 Entry 链。  //系统只能必须按顺序遍历每个 Entry，直到找到想搜索的 Entry 为止——如果恰好要搜索的 Entry 位于该 Entry 链的最末端(该 Entry 是最早放入该 bucket 中)，  //那系统必须循环到最后才能找到该元素。  if (e.hash == hash && ((k = e.key) == key || key.equals(k))) {  
                V oldValue = e.value;  
                e.value = value;  return oldValue;  
            }  
        }  
        modCount++;  
        addEntry(hash, key, value, i);  return null;  
    }  
```

#### 3、Table的使用



#### 4、parallelStream使用

```
并行流
由于并行流使用多线程，则一切线程安全问题都应该是需要考虑的问题，如：资源竞争、死锁、事务、可见性等等。
```

#### 5、 ImmutableMap不可变的Map guava提供

链式map  MapBuilder hutool提供

```java
Map<String, String> stringStringMap = ImmutableMap.<String,String>builder()
    .put("page","page/page/index")
    .put("templateId","")
    .put("templateId","")
    .put("formId","")
    .build();
```

### 5-2 Deque双向队列 和栈stack

Deque有三种用途：

* 普通队列(一端进另一端出):
  Queue queue = new LinkedList()或Deque deque = new LinkedList()

* 双端队列(两端都可进出)
  Deque deque = new LinkedList()
* 堆栈
  Deque deque = new LinkedList()

```java
Queue是先进先出（FIFO)的单向队列
Deque是Queue的一个子接口，双端队列是指该队列的两端既能入队也能出队，
    如果将Deque限制为只从一端入队和出队，则可实现栈`先进后出`的数据结构。
堆栈(stack)，后进先出
 
   
```

* Deque接口扩展(继承)了 Queue 接口。在将双端队列用作队列时，将得到 FIFO（先进先出）行为。将元素添加到双端队列的末尾，从双端队列的开头移除元素。从 Queue 接口继承的方法完全等效于 Deque 方法

| **Queue方法**                                                | **等效Deque方法** |
| ------------------------------------------------------------ | ----------------- |
| add(e)                                                       | addLast(e)        |
| offer(e)                                                     | offerLast(e)      |
| remove()                                                     | removeFirst()     |
| poll() 返回当前队列顶部的对象并将其删除。如果队列为空，则此方法返回null | pollFirst()       |
| element()                                                    | getFirst()        |
| peek() 此方法返回当前队列顶部的对象，而不删除它。如果队列为空，则此方法返回null。 | peekFirst()       |

* 双端队列也可用作 LIFO（后进先出）堆栈。应优先使用此接口而不是遗留 Stack 类。在将双端队列用作堆栈时，元素被推入双端队列的开头并从双端队列开头弹出。堆栈方法完全等效于 Deque 方法，如下表所示：

| **堆栈方法**   | **等效Deque方法** |
| -------------- | ----------------- |
| push(e)        | addFirst(e)       |
| pop() 取出队头 | removeFirst()     |
| peek()         | peekFirst()       |

方法详细： https://blog.csdn.net/weixin_44008257/article/details/108013581

![image-20211104114554264](.\image\image-20211104114554264.png)

### 6 gc 垃圾回收

```java
System.gc()；   //启动垃圾回收
 
 //在某个类中 使用此方法 ，即回收的时候会运行该方法
public void finalize(){

}
```

Tip:

堆栈：先进后出

队列：先进先出





### 7 映射

```java
Class className= class.forName("className");  //获取类名 或者直接xx.class.getMethod()
Method method=className.getMethod(MethodName,XXX.class，"参数".getClass());// 构造函数  注意getClass()可能会改变
method.invoke(className.newInstance,"参数")；  //执行（实例对象， 参数）
```

```java
BeanUtils.copyProperties(源对象, 目标对象);  //另一个实体
```

#### lambda类的映射

```java
//定义表达式， 如果一个函数式接口实现了Serializable接口，那么它的实例就会自动生成了一个返回SerializedLambda实例的writeReplace方法，可以从SerializedLambda实例中获取到这个函数式接口的运行时信息。
@FunctionalInterface
public interface SFuntion<T> extends Serializable{ //只有extends才会有 "writeReplace"方法》？
    Object get(T source)
}
//lambda表达式例子
test(User::getName)
test(SFuntion<T> fn)
//根据入参方法Serializable fn
Method method = fn.getClass().getDeclareMethod("writeReplace");
method.setAccessible(Boolean.TRUE); //true为关闭安全检查，提升反射速度
SerializedLambda lambda = (SerializedLambda)method.invoke(fn);
String methodName = lambda.getImplMethodName(); //此处即可获取lambda表达式的方法名称
```

#### 利用反射获取任意包下所有类

```java
ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
// 监听的包
String basePackage = "com.lhz.wx.test";
String resourcePattern = "/**/*.class";
String pattern = ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX +
    ClassUtils.convertClassNameToResourcePath(basePackage) + resourcePattern;
//  获取指定包路径下的类资源
Resource[] resources = resourcePatternResolver.getResources(pattern);
//MetadataReader 的工厂类
MetadataReaderFactory readerfactory = new CachingMetadataReaderFactory(resourcePatternResolver);
for (Resource resource : resources) {
    //用于读取类信息
    MetadataReader reader = readerfactory.getMetadataReader(resource);
    //扫描到的class
    String classname = reader.getClassMetadata().getClassName();
    Class<?> clazz = Class.forName(classname);
}
```

##### 获取类注解(伪代码)

```java
Class<?> clazz = Class.forName(classname);
// 1、判断类中是否存在ClassAnnotation注解，如果存在则打印
ClassAnnotation classAnnotation = clazz.getAnnotation(ClassAnnotation.class);
if (classAnnotation != null) {
    // 获取属性
    System.out.println("类中注解——code：" + classAnnotation.code() + "；name：" + classAnnotation.name());
}
```

##### 获取方法注解(伪代码)

```java
Method[] methods = clazz.getMethods();
    for (Method method : methods) {
    MethodAnnotation methodAnnotation = method.getAnnotation(MethodAnnotation.class);
    if (methodAnnotation != null) {
    // 获取属性
    System.out.println("方法中注解——code：" + methodAnnotation.code() + "；name：" + methodAnnotation.name());
    }
}
```



##### 获取字段注解(伪代码)	

```java
Field[] fields = clazz.getFields();
for (Field field : fields) {
    FiledAnnotation filedAnnotation = field.getAnnotation(FiledAnnotation.class);
    if (filedAnnotation != null) {
        // 获取属性
        System.out.println("字段中注解——code：" + filedAnnotation.code() + "；name：" + filedAnnotation.name());
    }
}
```



#### 只拷贝非null值

```java
public static String[] getNullPropertyNames (Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

        Set<String> emptyNames = new HashSet<String>();
        for(java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) emptyNames.add(pd.getName());
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }

public static void copyPropertiesIgnoreNull(Object src, Object target){
    BeanUtils.copyProperties(src, target, getNullPropertyNames(src));
}
```

hutool开源库为我们提供了更为强大的Bean工具-BeanUtil，

```
<dependency>
    <groupId>cn.hutool</groupId>
    <artifactId>hutool-all</artifactId>
    <version>4.1.14</version>
</dependency> 
```



```java
BeanUtil.copyProperties(oldDetail.get(),
                        userDetail,
                        true, 
                        CopyOptions.create().setIgnoreNullValue(true).setIgnoreError(true));

editable 限制的类或接口，必须为目标对象的实现接口或父类，用于限制拷贝的属性，例如一个类我只想复制其父类的一些属性，就可以将editable设置为父类。
ignoreNullValue 是否忽略空值，当源对象的值为null时，true: 忽略而不注入此值，false: 注入null
ignoreProperties 忽略的属性列表，设置一个属性列表，不拷贝这些属性值
ignoreError 是否忽略字段注入错误
可以通过CopyOptions.create()方法创建一个默认的配置项，通过setXXX方法设置每个配置项。  
```



### 8 序列化

我们有时候将一个 java 对象变成字节流的形式传出去或者从一个字节流中恢复成一个 java 

对象，例如，要将 java 对象存储到硬盘或者传送给网络上的其他计算机，这个过程我们可 

以自己写代码去把一个 java 对象变成某个格式的字节流再传输，但是，jre 本身就提供了这 

种支持，我们可以调用 OutputStream 的 writeObject 方法来做，如果要让 java 帮我们做， 

**要被传输的对象必须实现** **serializable** **接口**，这样，javac 编译时就会进行特殊处理，编译 

的类才可以被 writeObject 方法操作，这就是所谓的序列化。需要被序列化的类必须实现 

Serializable 接口，该接口是一个 mini 接口，其中没有需要实现的方法， 

implements Serializable **只是为了标注该对象是可被序列化的**。

`transient` 关键字表示某个属性不需要被序列化传输

https://blog.csdn.net/qq_30436011/article/details/115391150

#### 8-1 自定义序列化

```java
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@JacksonAnnotationsInside
@JsonSerialize(using = ImagePrefixSerializer.class)
@JsonDeserialize(using = ImagePrefixDeserialize.class)
public @interface ImagePrefix {

}

/**
 * add image prefix
*/
@Component
public class ImagePrefixSerializer extends JsonSerializer<String> {

    @Autowired(required = false)
    private CoreProperties coreProperties;

    @Override
    public void serialize(String o, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeString(addPrefixIfExist(o));
    }

    public String addPrefixIfExist(String text) {
        if (!StringUtils.hasText(text) || hasNotPrefix()) {
            return text;
        }
        text = StringUtils.trimWhitespace(text);

        String prefix = coreProperties.getImgPrefix();
        String[] array = StringUtils.commaDelimitedListToStringArray(text);

        for (int i = 0; i < array.length; i++) {
            String item = array[i];
            if (!StringUtils.startsWithIgnoreCase(item, "http")) {
                array[i] = prefix + item;
            }
        }
        return StringUtils.arrayToCommaDelimitedString(array);
    }

    private boolean hasNotPrefix() {
        return coreProperties == null || !StringUtils.hasText(coreProperties.getImgPrefix());
    }

}
```

#### 8-2 脱敏序列化实现

https://blog.csdn.net/qq_28369007/article/details/119006766



### 9 过滤json

```java
SimplePropertyPreFilter filter = new SimplePropertyPreFilter
 (需要过滤属性的类.class, "需要使用的属性(可以为多个)");  
调用时：
String json = JSON.toJSONString(user, filter);

//Object data = JSON.toJSON(list，filter);
```

#### 9-1、接口数据校验@validation

https://blog.csdn.net/u012693530/article/details/80831408

| 限制                      | 说明                                                         |
| :------------------------ | :----------------------------------------------------------- |
| @Null                     | 限制只能为null                                               |
| @NotNull                  | 限制必须不为null                                             |
| @AssertFalse              | 限制必须为false                                              |
| @AssertTrue               | 限制必须为true                                               |
| @DecimalMax(value)        | 限制必须为一个不大于指定值的数字                             |
| @DecimalMin(value)        | 限制必须为一个不小于指定值的数字                             |
| @Digits(integer,fraction) | 限制必须为一个小数，且整数部分的位数不能超过integer，小数部分的位数不能超过fraction |
| @Future                   | 限制必须是一个将来的日期                                     |
| @Max(value)               | 限制必须为一个不大于指定值的数字                             |
| @Min(value)               | 限制必须为一个不小于指定值的数字                             |
| @Past                     | 限制必须是一个过去的日期                                     |
| @Pattern(value)           | 限制必须符合指定的正则表达式                                 |
| @Size(max,min)            | 限制字符长度必须在min到max之间                               |
| @Past                     | 验证注解的元素值（日期类型）比当前时间早                     |
| @NotEmpty                 | 验证注解的元素值不为null且不为空（字符串长度不为0、集合大小不为0） |
| @NotBlank                 | 验证注解的元素值不为空（不为null、去除首位空格后长度为0），不同于@NotEmpty，@NotBlank只应用于字符串且在比较时会去除字符串的空格 |
| @Email                    | 验证注解的元素值是Email，也可以通过正则表达式和flag指定自定义的email格式 |

#### 9-2 Fastjson的SerializerFeature序列化属性

https://blog.csdn.net/qq_34412985/article/details/81985459

* JSONObject.toJSONString(Object object, SerializerFeature... features)

QuoteFieldNames———-输出key时是否使用双引号,默认为true

WriteMapNullValue——–是否输出值为null的字段,默认为false

WriteNullNumberAsZero—-数值字段如果为null,输出为0,而非null

WriteNullListAsEmpty—–List字段如果为null,输出为[],而非null

WriteNullStringAsEmpty—字符类型字段如果为null,输出为”“,而非null

WriteNullBooleanAsFalse–Boolean字段如果为null,输出为false,而非null

### 10 通配符和泛型

#### 泛型 T

* 定义在类后面

  ```java
  public class TestClassDefine<T, S extends T>{}
  ```

* 定义在方法`装饰符`后面

  ```java
   public <T, S extends T> T testGenericMethodDefine(T t, S s){}
  //<T> T 表示返回的是一个泛型  传参是T 方法前一定要加<T> 你直接换成<E>会更容易理解的
  //T t 表示传递的参数是一个泛型
  
  // 定义返回 public class ApiResponse<T>
  public <T> ApiResponse<T> test (); 指定类型 调用 ApiResponse<String> test = this.<String>test();
  ```

#### 通配符 ？

* ```java
  List<?> unknownList
  ```

  ？表示不确定的 java 类型
  
  对于参数值是`未知类型`的容器类，`只能`读取其中元素，`不能`向其中添加元素， 因为，其类型是未知，所以编译器无法识别添加元素的类型和容器的类型是否兼容，唯一的例外是NULL
  
* 泛型中通配符常用的 T，E，K，V，？

### 11  transient 关键字的不会被序列化

```java
public class Person implements Serializable {
  private static final long serialVersionUID = 1905122041950251207L;

  private String name;
  private transient Address address;  // Noncompliant; Address isn't serializable
}
```

```java
import java.util.UUID;

public abstract class BaseUUID {

    /**
     * 获取UUID串
     * @return
     */
    public static String random() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取UUID串
     * @param prefix 前缀
     * @return
     */
    public static String random(String prefix) {
        return prefix + UUID.randomUUID().toString().replaceAll("-", "");
    }
}
```

#### instanceof  测试一个对象是否为一个类的实例

```java
boolean result = obj instanceof Class；
Object instanceof Map ;判断对象object是否是Map的实例
```

### 12 String和Interger的互转

#### 12-1 Integer转String

```java
//方法一:Integer类的静态方法toString()
Integer a = 2;
String str = Integer.toString(a)

//方法二:Integer类的成员方法toString()
Integer a = 2;
String str = a.toString();

//方法三:String类的静态方法valueOf()
Integer a = 2;
String str = String.valueOf(a); 
```

#### 12-2 String转Integer

当我们要把String转化为Integer时，一定要对String进行非空判断，否则很可能报空指针异常。

```java
String str = "...";
Integer i = null;
if(str!=null){
     i = Integer.valueOf(str);
}
```



------

### 13 Spring Boot Starter

#### 13-1 参考地址 

https://www.cnblogs.com/adversary/p/10346278.html

https://www.jianshu.com/p/1d547c7a5670

https://mp.weixin.qq.com/s/a--34E6iFTopUVC6orW7Jw 微信牛？

#### 13-2  Spring 配置类不为扫描、未注册Bean

* **需求描述**

　　当我们想要利用SpringBoot封装一套组件并发布给第三方使用时，我们就不得不考虑我们的组件能否被使用者正确引入使用，此处描述的时打包成 jar 包后 Spring 配置类不为扫描、未注册Bean的问题。



```
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
com.notarycloud.common.autoconfigure.ui.LogRecordPlusUiStart,\
com.notarycloud.common.autoconfigure.file.FileConverterAutoConfiguration
```

此方法最关键的为 <span style="color:red"> resources/META-INF/spring.factories </span>文件，当项目启动时，Spring会扫描所有jar包下面的 spring.factories 文件，进行相应的自动配置处理

#### 13-3 元数据的配置

参考地址 https://blog.csdn.net/dupeng0811/article/details/89876444

https://mp.weixin.qq.com/s/a--34E6iFTopUVC6orW7Jw

新建META-INF/spring-configuration-metadata.json文件，进行配置。

```json

{
  "groups": [
    {
      "name": "hello",
      "type": "com.example.springbootstarterhello.HelloProperties",
      "sourceType": "com.example.springbootstarterhello.HelloProperties"
    }
  ],
  "properties": [
    {
      "name": "hello.msg",
      "type": "java.lang.String",
      "description": "打招呼的内容，默认为“World!”",
      "sourceType": "com.example.springbootstarterhello.HelloProperties",
      "defaultValue": "World!"
    }
  ],
  "hints": []
}
```



spring-boot-configuration-processor依赖就可以做到，它的基本原理是在编译期使用注解处理器自动生成spring-configuration-metadata.json文件

------

### 14  白名单/*和/**的区别

/* 是拦截所有的文件夹，不包含子文件夹
/** 是拦截所有的文件夹及里面的子文件夹

相当于/*只有后面一级

/** 可以包含多级

./表示当前目录

../表示上层目录

/表示根目录

### 15 classpath:和classpath\*:的含义

```java
1、classpath：表示从类路径中加载资源，classpath:和classpath:/是等价的，都是相对于类的根路径。资源文件库标准的在文件系统中，也可以在JAR或ZIP的类包中。

2、classpath*：假设多个JAR包或文件系统类路径都有一个相同的配置文件，
classpath:只会在第一个加载的类路径下查找，而classpath*:会扫描所有这些JAR包及类路径下出现的同名文件。
  注意：用classpath*:需要遍历所有的classpath，所以加载速度是很慢的；因此，在规划的时候，应该尽可能规划好资源文件所在的路径，
尽量避免使用classpath*。
```







------





------



## 代码整理

### 1、Comparable<T> 和 Comparator<T>

```java
public class Apple implements Comparable<Apple> {
    /**
     * 苹果的重量
     */
    private int  weight;

    /**
     * 自然排序即从小到大
     * 返回1的，代表此对象比参数对象大，排在后面，这样就可以控制降序或升序排列
     */
    @Override
    public int compareTo(Apple apple) {
        if (this.weight > apple.getWeight())
        {
            return -1;
        }
        else if (this.weight < apple.getWeight())
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
}
#####分割线########
/**
* 使用方式为  Arrays.sort(apples, new WeightComparator());
* 故Comparator为一个比较器
**/
public class WeightComparator implements Comparator<Apple> {
    /**
     * 苹果的重量
     */
    private int  weight;

    /**
     * 自然排序即从小到大
     * 返回1的，代表此对象比参数对象大，排在前面，这样就可以控制降序或升序排列
     */
    @Override
    public int compare(Apple a, Apple b) {
        if (a.getWeight() > b.getWeight())
        {
            return 1;
        }
        else if (a.getWeight() < b.getWeight())
        {
            return -1;
        }
        else
        {
            return 0;
        }
    }
}
```



### 2、向下递归示例

```java
//xxx组织机构树形列表方法
public List<Organization> xxxTreeOrg（xxx xx）{
   //所有的组织机构list
　　List<Organization> allOrganizationList = xxxDao.findAllOrgList();

   //所有一级组织机构List
　　List<Organization> oneOrganizationList = xxxDao.findOneOrgList();

　　for (Organization oneOrganization : oneOrganizationList) {
    　　oneOrganization.setChild(doOrgIterator(oneOrganization, allOrganizationList));
　　}　　return oneOrganizationList;
}

        
//向下递归的方法
private List<Organization> doOrgIterator(Organization oneOrganization, List<Organization> allOrganizationList) {
　　List<Organization> childList = new ArrayList<>();
　　for (Organization organization : allOrganizationList) {
    　　if(oneOrganization.getId().intValue() == organization.getPid().intValue()) {
    　　　　organization.setChild(doOrgIterator(organization, allOrganizationList));
    　　　　childList.add(organization);
   　　 }
　　}
　　return childList;
}
```





------

## 常见异常

异常分为免检异常和必检异常。

Runtime和Error以及他们的子类都称为免检异常，所有其他的异常都称为必检异常

| Exception                      | 异常层次结构的根类                                           |
| ------------------------------ | ------------------------------------------------------------ |
| NullPointerException           | 尝试访问未实例化（null）的对象                               |
| ArrayIndexOutOfBoundsException | 数组下标越界                                                 |
| ArithmeticException            | 算术计算异常（如把零作为除数）                               |
| IllegalArgumentException       | 方法接收到非法参数                                           |
| InputMismatchException         | 实际输入的数据类型和预想得到的数据类型不匹配（例如：input.nextInt()时输入浮点数） |
| NumberFormatException          | 数字格式转换异常（如把“123abc”转换成数字）                   |
| ClassCastexException           | 两个类型不兼容时引发的运行时异常（例如：子类转换成父类）     |
| ClassNotFoundException         | 无法找到指定类异常（通常在程序通过字符串加载类似抛出）       |
| SQLException                   | 执行sql语句时的异常                                          |
| IOEException                   | 执行文件IO（读写）操作时出现的异常                           |

------



```java
request.getServletPath()
request.getPathInfo()
request.getContextPath()
request.getRequestURI()
request.getRequestURL()
request.getServletContext().getRealPath()
 ———————————————— 
http://localhost:8080/testweb/abc/def/ghi/test.html (url-pattern=/abc/def/*) 
打印的值为：
servletPath:/abc/def
contextPath:/testweb
contextPath2:/testweb
pageInfo:/ghi/test.html
uri:/testweb/abc/def/ghi/test.html
url:http://localhost:8080/testweb/abc/def/ghi/test.html
realPath:G:\java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\testweb\

通过观察打印结果，我们可以总结： 
 getServletPath():获取能够与“url-pattern”中匹配的路径，注意是完全匹配的部分，*的部分不包括。 
 getPageInfo():与getServletPath()获取的路径互补，能够得到的是“url-pattern”中*d的路径部分 
 getContextPath():获取项目的根路径 
 getRequestURI:获取根路径到地址结尾 
 getRequestURL:获取请求的地址链接（浏览器中输入的地址） 
 getServletContext().getRealPath(“/”):获取“/”在机器中的实际地址 
 getScheme():获取的是使用的协议(http 或https) 
 getProtocol():获取的是协议的名称(HTTP/1.11) 
 getServerName():获取的是域名(xxx.com) 
 getLocalName:获取到的是IP

```



```java
public Object get(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> param,
		ReturnResultInterface returnResult, OrderProposerDTO condition) {
		log.info("请求地址：{}，参数：{}", request.getRequestURL(), param);
		List arrList = new ArrayList();
		Map<Integer, String> values = OrderProposerConstants.ApplicationUserTypeEnum.getValues();
		for (Map.Entry<Integer, String> integerStringEntry : values.entrySet()) {
			DataDTO dataDTO =new DataDTO();
			dataDTO.setCode(String.valueOf(integerStringEntry.getKey()));
			dataDTO.setName(integerStringEntry.getValue());
			arrList.add(dataDTO);
		}
		Object data = JSON.toJSON(arrList);
		if (data != null) {
			returnResult.setData(data.toString());
		}
		returnResult = resultUtils.handleReturnResult(returnResult);
		return returnResult;
```



------

## JAVA的eclipse的一些快捷键

https://blog.csdn.net/chushoutaizhong/article/details/51997929

```
ALt + /  补齐代码
ctrl + shift + o  快速import  
ctrl + 1  提示
ctrl + alt + 上下键复制
ctrl + /  ctrl+shift +/  注释代码
ctrl + shift + F 格式化代码
Shift +Alt +T :  重构  
Shift +Alt +M:  提取函数  
Shift +Alt +R:  重命名  
shift +Alt +Z:  代码块
Shift +Alt +C:  更改函数标记 
ctrl + alt + v  快速返回对象类型


Idea的快捷键
Shift+Click，可以关闭文件
Alt+Q，可以看到当前方法的声明
Ctrl+Alt+T，可以把代码包在一个块内，例如：try/catch
Ctrl+Enter，导入包，自动修正
Ctrl+Alt+B，跳转到方法实现处
Ctrl+Alt+L，格式化代码 
Ctrl+O，重写方法
Ctrl+Alt+O，优化导入的类和包
Ctrl+Shift+Space，自动补全代码
Ctrl + P 方法参数提示
Ctrl+R，替换文本
Ctrl+F，查找文本
Ctrl+/或Ctrl+Shift+/，注释（//或者/**/）
Ctrl+Alt+left/right，返回至上次浏览的位置
Ctrl + Shift + Z   取消撤销
Ctrl + Alt + U  向上继承关系 diagram
菜单栏 Navigate F4 向下查看继承关系
```

> IntelliJ-Idea开发工具来编写HTML代码时常用的快捷键  输入然后+Tab键

```xml
  1、link:css      引入css文件      <link rel="stylesheet" href="">
  2、script:src    引入js文件       <script src=""></script>
  3、ul+            ul以及一个li
  4、script         html中插入js
  5、a:link         <a href=”http://”></a>
  6、html:5         h5结构
  7、div.class1     class:class1    <div class="class1"></div>
  8、div#id1        id:id1          <div id="id1"></div>
  9、div.class1.class2   class:class1,class2    <div class="class1 class2"></div>
  10、a.mail          <a href=''mailto:''></a>
  11、form:get        get表单
  12、input:hidden    hidden输入框
  13、head>link:css   head+link
  14、p+P             两个p
  15、p*3             3个p
  16、ul>li.item$*5    创建ul下有个li同时class分别为item1，item2...5个
  17、pos             position，组合可用pos:s|a|r|f
  18、t               top，组合a auto
  19、r               right，组合a 
  20、l               left
  21、b               bottom
  22、z               z-index
  23、fl              float
  24、cl              clear
  25、d               display 组合可用n|b|i|ib
  26、ov              overflow
  27、v               visibility
  28、zoo             zoom:1
  29、cp              clip
  30、bx              box-sizing
  31、bxsh:w          -webkit-box-shadow:0 0 0 #000;
```

### RestfulToolkit插件

### MyBatis Log Plugin

### Translation

### GsonFormat

### Alibaba Java Coding Guidelines

### Maven Helper

解决Maven依赖冲突的好帮手，可以快速查找项目中的依赖冲突，并予以解决！

### Vue.js

Vue.js支持插件，写过前端的朋友肯定用过，可以根据模板创建.vue文件，也可以对Vue相关代码进行智能提示

### element

Element-UI支持插件，可以对Element-UI中的标签进行智能提示，有了它就不用盲写相关代码了

### IDEA创建项目绕过JDK17的方法

```
https://start.aliyun.com/
```



### Lombox插件

- idea — setting — plugins, 
  搜索栏中输入**Lombok**。
- 使用学习参考：https://blog.csdn.net/a2267378/article/details/81180373
- 在日常开发中，我们尽量少直接使用@Data注解，而是换成@Setter、@Getter、@NoArgsConstructor、@AllArgsConstructor、@ToString即可

```java
常用的 lombok 注解：

@Data   ：注解在类上；包含了@ToString，@EqualsAndHashCode，@Getter / @Setter和@RequiredArgsConstructor的功能，提供类所有属性的 getter 和 setter 方法，此外还提供了equals、canEqual、hashCode、toString 方法

@Setter：注解在属性上；为属性提供 setter 方法

@Getter：注解在属性上；为属性提供 getter 方法

@ToString：注解在类上；生成toString()方法，默认情况下，它会按顺序（以逗号分隔）打印你的类名称以及每个字段。可以这样设置不包含哪些字段@ToString(exclude = "id") / @ToString(exclude = {"id","name"})

如果继承的有父类的话，可以设置callSuper 让其调用父类的toString()方法，例如：@ToString(callSuper = true)

@EqualsAndHashCode：注解在类上；生成hashCode()和equals()方法，默认情况下，它将使用所有非静态，非transient字段。但可以通过在可选的exclude参数中来排除更多字段。或者，通过在parameter参数中命名它们来准确指定希望使用哪些字段。

@NonNull：  注解在属性上；标识属性是不能为空，为空则抛出异常。

@Slf4j ：注解在类上；根据用户实际使用的日志框架生成log日志对象。

@Log4j ：注解在类上；为类提供一个 属性名为log 的 log4j 日志对象

@NoArgsConstructor：注解在类上；为类提供一个无参的构造方法。当类中有final字段没有被初始化时，编译器会报错，此时可用@NoArgsConstructor(force = true)，然后就会为没有初始化的final字段设置默认值 0 / false / null。对于具有约束的字段（例如@NonNull字段），不会生成检查或分配，因此请注意，正确初始化这些字段之前，这些约束无效。

@AllArgsConstructor：注解在类上；为类提供一个全参的构造方法

默认生成的方法是public的，如果要修改方法修饰符可以设置AccessLevel的值，例如：@Getter(access = AccessLevel.PROTECTED)

@RequiredArgsConstructor：注解在类上；会生成构造方法（可能带参数也可能不带参数），如果带参数，这参数只能是以final修饰的未经初始化的字段，或者是以@NonNull注解的未经初始化的字段
都会针对final成员变量生成构造函数，所以，可以省略@Autowired、@Inject、@Resource等依赖注入注解。

@RequiredArgsConstructor(staticName = "of")会生成一个of()的静态方法，并把构造方法设置为私有的。
```

------

##### `@Builder`

注释为你的类生成相对略微复杂的构建器API。`@Builder`可以让你以下面显示的那样调用你的代码，来初始化你的实例对象：

```java
Student.builder()
               .sno( "001" )
               .sname( "admin" )
               .sage( 18 )
               .sphone( "110" )
               .build();
```

用了@Builder若要使用无参构造方法，用注解@Tolerate

```java
@Builder
@Data
public class XX(){
    //-----
    @Tolerate
    public XX(){
        
    }
}
```

```
【总结】
（1）不用@Builder.Default，为成员变量设置默认值，new出来的对象自带默认值
（2）启用@Builder.Default，new出来的对象为空对象，不带默认值
（3）启用@Builder.Default，不设置-> Student.builder().build()，为默认值
（4）启用@Builder.Default，设置-> Student.builder().age(4).build()，为设置的值
```



##### `@SneakyThrows` 异常包装用法

```java
public class SneakyThrowsExample implements Runnable {
  //用法1
  @SneakyThrows(UnsupportedEncodingException.class)
  public String utf8ToString(byte[] bytes) {
    return new String(bytes, "UTF-8");
  }
  //用法二
  @SneakyThrows
  public void run() {
    throw new Throwable();
  }
}
```

##### `@Cleanup` 清理流对象,不用手动去关闭流

```java
@Cleanup
OutputStream outStream = new FileOutputStream(new File("text.txt"));
@Cleanup
InputStream inStream = new FileInputStream(new File("text2.txt"));
byte[] b = new byte[65536];
while (true) {
   int r = inStream.read(b);
   if (r == -1) break;
   outStream.write(b, 0, r); 
}
```

##### `@FieldDefaults` 设置属性的使用范围，如private、public等，也可以设置属性是否被final修饰。

##### `@UtilityClass`工具类再也不用定义static的方法了，直接就可以Class.Method 使用





idea的p3c插件  代码规范

* idea — setting — plugins,

  搜索 Alibaba Java Coding Guidelines 插件

#### Math

Math.round(11.5)等於多少? Math.round(-11.5)等於多少? 

```
Math 类中提供了三个与取整有关的方法：ceil、floor、round，这些方法的作用与它们的英
文名称的含义相对应，例如，ceil 的英文意义是天花板，该方法就表示向上取整，
Math.ceil(11.3)的结果为12,Math.ceil(-11.3)的结果是-11；floor 的英文意义是地板，该方法
就表示向下取整，Math.ceil(11.6)的结果为11,Math.ceil(-11.6)的结果是-12；最难掌握的是
round 方法，它表示“四舍五入”，算法为 Math.floor(x+0.5)，即将原来的数字加上0.5后再向
下取整，所以，Math.round(11.5)的结果为12，Math.round(-11.5)的结果为-11。
```

#### JAVA方法声明中参数的那三个小数点

 我们看如下一个方法的声明。

```java
public static void tst( Object... initargs){   //三个小数点
	System.out.println(initargs.length);
	System.out.println(initargs[0]);
 
}

//参数中那三个小数点代表什么意思呢？这代表方法自动重载。也就是我们如下的代码都是合法的。
tst();//0，报异常
tst(1);//1，1
tst(1,2);//2，1
tst(1,2,3);//3，1
```

#### 代码中的注释

  **TODO: + 说明**：
如果代码中有该标识，说明在标识处有功能代码待编写，待实现的功能在说明中会简略说明。

**FIXME: + 说明**：
如果代码中有该标识，说明标识处代码需要修正，甚至代码是错误的，不能工作，需要修复，如何修正会在说明中简略说明。

**XXX: + 说明**：
如果代码中有该标识，说明标识处代码虽然实现了功能，但是实现的方法有待商榷，希望将来能改进，要改进的地方会在说明中简略说明。  

##### 常用doc注释说明

* 以下为javadoc 需要熟知的注释标签:
  @see 引用类/方法。

  @author: 作者。

  @date：日期。

  @version: 版本号。

  @throws：异常信息。

  @param：参数

  @return： 方法返回值。

  @since: 开源项目常用此标签用于创建日期 。

  {@value}: 会使用该值，常用于常量。

  {@link} 引用类/方法。

  {@linkplain} 与@link功能一致。

* 常用标签

<p></p>: 表示一整段文字的描述，没有换行
<b></b>: 表示文字用粗黑体

{@link Class#Method}: 表示蓝色高亮显示，而且点击可以跳转到对应Class#Method

{@link #Method}: 表示蓝色高亮显示，而且点击可以跳转到当前Class 的 Method

<code></code>: 表示文字用代码的字体表示出来，没有高亮，但是字体跟普通注释不一样 

{@see Class#Method}: 注释会自动添加“See Also xxxxx” 后面的Class#Method 也会高亮显示并且自动链接跳转

Note : '#' 一般表示 '.' ，例如 Intent.getIntExtra(String name), 用注释文字写成 Intent#getIntExtra(String name)

4、 {@link}与@see的简单使用以及区别

@see 标签允许用户引用其他类的文档。具体使用方式如下：
@see classname
@see fully-qualified-classname
@see fully-qualified-classname#方法名称
@see fully-qualified-classname#属性名称
我在使用的时候，发现这个只能单独一行顶头写，如果不顶头写就不管用了，没了链接的效果。
但是，{@link}这个却可以随便放。
具体使用方法和上面那个@see是一样的。

------

 

## Request

* request.setAttribute()的用法

  request在当次的请求的url之间有效一次传参数，速度快，缺点是参数只能取一次

  <%Object a = (Object)request.getSession().getAttribute("cha");%>

#### 1、 请求转发

```java
HttpServletRequest req = (HttpServletRequest) request;
HttpServletResponse resp = (HttpServletResponse) response;
//request.getRequestDispatcher的方法
request.getRequestDispatcher("/flagship/error/offline.html").forward(req,resp);
注：.forward(req,resp)；为默认格式。
```

#### 2、 请求包含

```java
//request.getRequestDispatcher的方法
request.getRequestDispatcher("/flagship/error/offline.html").include(req,resp);
注：.include(req,resp)；为默认格式。
```

读取配置文件

```java
XXX.class.getClassLoader().getResourceAsStream("static/license.xml");
```



## response

* 请求重定向

  response.sendRedirect("a.jsp?a=cha")；
  
  那么在a.jsp页面上直接<%=request.getParameter("a")%>

${pageContext.request.contextPath }

#### 实现图片预览

```java
//返回图片流实现预览  方式一
try {
    byte[] bytes = Files.readAllBytes(Paths.get(Constant.FILE_UPLOAD_PATH +file_path));   //图片文件路径
    response.reset();
    response.getOutputStream().write(bytes);
    response.getOutputStream().close();
}catch (Exception e){
    e.printStackTrace();
}
```

```java
//预览  方式二
response.setCharacterEncoding("UTF-8");
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
response.setContentType("text/html");//此处根据是word，image类型设置
StreamUtils.copy(in, out);  //in为文件读取的流，out = response.getOutputStream();
```

在服务器设置响应头，告诉浏览器以utf-8的编码显示数据，如果不写会出现中文乱码
response.setHeader("content-type", "text/html;charset=UTF-8");

```js
if (response) {
          var url = process.env.KK_PATH + 'onlinePreview?url=' + encodeURIComponent(process.env.KK_PATH + response.data)
          var winHeight = window.document.documentElement.clientHeight - 10
          window.open(url, '_blank', 'height=' + winHeight + ',top=80,left=80,toolbar=no, menubar=no, scrollbars=yes, resizable=yes')
        }
```



#### 实现浏览器下载

~~~java
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StreamUtils;
//实现下载的功能时候 设置response
response.setHeader("content-type", "application/octet-stream");
response.setContentType("application/octet-stream");
//application/octet-stream 二进制流，不知道下载的类型
response.setHeader("Content-Disposition", 
                   "attachment;filename=" + FilenameUtils.getName());
//Content-Disposition 的作用
//当Content-Type 的类型为要下载的类型时 , 这个信息头会告诉浏览器这个文件的名字和类型。
// java.net.URLEncoder.encode(fileName, "UTF-8")); 解决文件名中文乱码问题
StreamUtils.copy(in, out);  
//in为文件读取的流，OutputStream out = response.getOutputStream();
~~~

* .setContentType("text/html; charset=utf-8"); **html**
  .setContentType("text/plain; charset=utf-8"); **文本** 

  text/javascript   **json数据**		"image/bmp"	 **BMP**		image/jpeg	**JPG**  等等

* ContentType 对照表   http://tool.oschina.net/commons

  Header  通用信息头

------

## 提取中文

```java
// 提取中文
    public static String getChinese(String paramValue) {
        String regex = "([\u4e00-\u9fa5]+)";
        StringBuffer str = new StringBuffer("");
        Matcher matcher = Pattern.compile(regex).matcher(paramValue);
        while (matcher.find()) {
            str.append(matcher.group(0));
        }
        return str.toString().replace("宋体", "");
    }
```

### 实现文档的格式转换

1、poi + itext。

先转html再绘制，听说格式有差异。

比较复杂，格式兼容差，跨平台。

2、借助openoffice

我觉得不要选这个，openoffice和ms office的格式差异挺大的，还不如jacob。

3、jacob + ms office

需要借助本地office，格式兼容最好，最后的备选方案。 借助ms office之类的必定只能兼容windows，不支持linux。

4、docx4j的export pdf组件。

我觉得如果是格式不是很复杂的情况，应该用这个比较好（在office开源界，poi第一它应该第二），或者是第5项中的其他方案。

[plutext/docx4j-export-FO](https://link.zhihu.com/?target=https%3A//github.com/plutext/docx4j-export-FO)

5、aspose等其他组件。

------

## Spring 获取bean容器的五种方法

```java
#1
ApplicationContext ac = new FileSystemXmlApplicationContext("applicationContext.xml");
ac.getBean("beanId");
```

方法二：通过Spring提供的工具类获取ApplicationContext对象

```java
import org.springframework.web.context.support.WebApplicationContextUtils;
ApplicationContext ac1 = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletContext sc);
ApplicationContext ac2 = WebApplicationContextUtils.getWebApplicationContext(ServletContext sc);
ac1.getBean("beanId");
ac2.getBean("beanId");
说明：
这种方式适合于采用Spring框架的B/S系统，通过ServletContext对象获取ApplicationContext对象，然后在通过它获取需要的类实例。

上面两个工具方式的区别是，前者在获取失败时抛出异常，后者返回null。
```

 方法三：继承自抽象类ApplicationObjectSupport
方法四：继承自抽象类WebApplicationObjectSupport
方法五：实现接口ApplicationContextAware 

#### 说明

SpringContextHolder 可以方便地引用各种 bean 而不需要注入，通常用它来获取延时加载的 bean 信息。
BeanFactoryPostProcessor 接口主要是为了使 SpringContextHolder 提前初始化，尽量在所有 bean 初始化之前。
ApplicationContextAware 接口主要是为了注入 ApplicationContext。

```java
@Component
public class SpringUtil implements ApplicationContextAware {

    private static ApplicationContext applicationContext;
}
```

#### Web

* RequestContextHolder 

  RequestContextHolder：持有上下文的Request容器

  通过RequestContextHolder的静态方法可以随时随地取到当前请求的request对象



## Spring的扩展接口了解（启动只执行一次）

```java
BeanPostProcessor  ---对象初始化触发
BeanFactoryPostProcessor   --在spring容器初始化之后触发，而且只会触发一次.
BeanDefinitionRegistryPostProcessor    

```

## Spring 的Bean  自定义初始化几种方式

* **@PostConstruct** 

*  @Bean(initMethod=”init”)

* **实现 initializingBean 接口的afterPropertiesSet()方法**

* 构造器注入

* 实现ApplicationListener 的 onApplicationEvent()方法|| @EventListener注解，可以实现同样的效果

* SpringBoot 提供了一个CommanLineRunner接口，用来实现在应用启动后的逻辑控制， 还有类似的  ApplicationRunner

* 实现SmartInitializingSingleton的afterSingletonsInstantiated()方法

* `SmartInitializingSingleton`和`Lifecycle`、`SmartLifecycle`都是在所有的单实例bean创建(getBean方法)之后执行。

* InitializingBean的作用是Bean注入到Spring容器且初始化后，执行特定业务化的操作。Spring允许容器中的Bean，在Bean初始化完成后或者Bean销毁前，执行特定业务化的操作afterPropertiesSet

  

```java
这几种初始化的顺序为：

1、构造器方法
2、@PostConstruct 注解方法
3、InitializingBean的afterPropertiesSet()
4、Bean定义的initMethod属性方法
```



还记得我们前面定义的 UserPayServiceStrategyFactory 中提供了的 Register 方法吗？他就是用来注册策略服务的。

接下来，我们就想办法调用 Register 方法，把 Spring 通过 IOC 创建出来的 Bean 注册进去就行了。

这种需求，可以借用 Spring 中提供的 InitializingBean 接口，这个接口为 Bean 提供了属性初始化后的处理方法。

它只包括 afterPropertiesSet 方法，凡是继承该接口的类，在 Bean 的属性初始化后都会执行该方法。

```java
//例子
@Service
public class ParticularlyVipPayService implements UserPayService,InitializingBean {

    @Override
    public BigDecimal quote(BigDecimal orderPrice) {
         if (消费金额大于30元) {
            return 7折价格;
        }
    }

    //这里进行了注册Register  至此工厂模式完成
    @Override
    public void afterPropertiesSet() throws Exception {
        UserPayServiceStrategyFactory.register("ParticularlyVip",this);
    }
}
```





## Springboot的使用gizp 压缩配置

### 1. 配置

SpringBoot 默认是不开启 gzip 压缩的，需要我们手动开启，在配置文件中添加两行

```yml
server:
  compression:
    enabled: true
    min-response-size: 1024
    mime-types: application/json,application/xml,text/html,text/plain,text/css,application/x-javascript
#注意下上面配置中的mime-types，在 spring2.0+的版本中，默认值如下，所以一般我们不需要特意添加这个配置
```

Nginx开启gzip压缩

```nginx
gzip on; #开启Gzip
gzip_min_length 1k; #不压缩临界值，大于1K的才压缩，一般不用改
gzip_buffers 4 16k;
#gzip_http_version 1.0;
gzip_comp_level 2; #压缩级别，1-10，数字越大压缩的越好，时间也越长
gzip_types text/plain application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;
gzip_vary off;
```

## Mybatis

备注： mybatis的方法xml中和实体映射， 会执行对应属性的 set方法。



#{}占位符    会带单引号''   模糊查询 “%”#{id}“%”

${}拼接字符    只能用${value}  ， 可能引起sql注入问题

```xml

<select id="selectPostIn" resultType="domain.blog.Post">
	SELECT *
    FROM POST P
    WHERE ID in
<foreach item="item" index="index" collection="list"
	open="(" separator="," close=")">
	#{item}
</foreach>
</select>
```

  在使用foreach的时候最关键的也是最容易出错的就是**collection**属性，该属性是必须指定的，但是在不同情况 下，该属性的值是不一样的，主要有一下3种情况：

       1. 如果传入的是单参数且参数类型是一个List的时候，collection属性值为list
    2. 如果传入的是单参数且参数类型是一个array数组的时候，collection的属性值为array
    3. 如果传入的参数是多个的时候，我们就需要把它们封装成一个Map了，当然单参数也可以封装成map，实际上如果你在传入参数的时候，在breast里面也是会把它封装成一个Map的，map的key就是参数名，所以这个时候collection属性值就是传入的List或array对象在自己封装的map里面的key 

#### sql片段 includ

```xml
这个元素可以被用来定义可重用的 SQL 代码段，可以包含在其他语句中。比如：
<sql id=”userColumns”> id,username,password </sql>
这个 SQL 片段可以被包含在其他语句中，例如：
<select id=”selectUsers” parameterType=”int” resultType=”hashmap”>
	select <include refid=”userColumns”/>
	from some_table
	where id = #{id}
</select>
```

#### parameterType

#### resultType

```xml
当使用resultType做SQL语句返回结果类型处理时，对于SQL语句查询出的字段在相应的pojo中必须有和它相同的字段对应，而resultType中的内容就是pojo在本项目中的位置。
mapper.selectUsers(@param("num") int num)
<select id=”selectUsers” parameterType=”int”
resultType=”com.model.POJO”>
```

#### resultMap

```xml
//字段的别名
<resultMap id="userResultMap" type="User">
    <id property="id" column="user_id" />
    <result property="username" column="user_name"/>
    <result property="password" column="hashed_password"/>
</resultMap>
引用它的语句使用 resultMap 属性就行了（注意我们去掉了 resultType 属性）。比如：
<select id=”selectUsers” parameterType=”int”
resultMap=”userResultMap”>
    select user_id, user_name, hashed_password
    from some_table
    where id = #{id}
</select>
```

##### 一对一、一对多

```xml
<resultMap type="com.lzmh.composite.modular.settlement.model.vo.SettleSiteOrderVO" id="SiteOrderResult">
        <id property="siteSn" column="site_sn"/>
        <result property="billSn" column="bill_sn"/>
        <result property="orderSn" column="order_sn"/>
        <result property="suckType" column="suck_type"/>
        <result property="suckAppId" column="suck_app_id"/>
        <result property="couponPrice" column="coupon_price"/>
        <result property="orderIncome" column="order_income"/>
        <association property="siteItem" column="site_sn" javaType="com.lzmh.composite.modular.settlement.model.vo.SettleSiteOrderItemVO" resultMap="siteOrderItemResult"/>
        <collection property="codeList" javaType="java.util.List" resultMap="siteOrderCodeResult"/>
    </resultMap>
映射到实体的map或者list


-- 嵌套查询
<!--association使用select属性引入另外一条SQL语句 -->
<association property="card "
 javaType="card"
 column="cid" <!--引入另外定制sql的参数值，这里是person表里的外键cid-->
 select="cn.wyu .mapper.CardMapper.findCardById"></association>

<collection
property="orders"javaType="list"ofType="Order "
column="id" <!--这里是user表中的id-->
select="cn.wyu .mapper.0rderMapper.find0rderByUid"></collection>


```

##### 实际例子

```java
实体
@TableName("sys_user")
public class SysUser {
	...
    @TableField(exist = false)
    private SysDept dept; //对应resultMap的association

    @TableField(exist = false)
    private List<SysRole> roles; //对应resultMap的collection
    ...
}
```

```xml
<sql id="selectUserVo">
        select u.id,
               u.dept_id,
               d.id as deptId,
               d.parent_id,
               d.status as dept_status,
               r.id as roleId,
               r.role_name,
               r.role_key,
               r.role_sort,
               r.ds_type as role_ds_type,
               r.data_scope,
               r.status as role_status
        from sys_user u
                 left join sys_dept d on u.dept_id = d.id
                 left join sys_user_role ur on u.id = ur.user_id
                 left join sys_role r on r.id = ur.role_id
<select id="selectUserByUserId" parameterType="Long" resultMap="SysUserResult">
    <include refid="selectUserVo"/>
    where u.id = #{userId}
</select>

# 示例
<resultMap type="com.lzmh.api.system.domain.SysUser" id="SysUserResult">
        <id property="id" column="id"/>
        <result property="deptId" column="dept_id"/>
        <result property="tenantId" column="tenant_id"/>
        <result property="nickname" column="nickname"/>
        <result property="email" column="email"/>
        <result property="phone" column="phone"/>
        <result property="sex" column="sex"/>
        <result property="avatar" column="avatar"/>
        <association property="dept" column="dept_id" javaType="SysDept" resultMap="deptResult"/>
        <collection property="roles" javaType="java.util.List" resultMap="RoleResult"/>
    </resultMap>

    <resultMap id="deptResult" type="com.lzmh.api.system.domain.SysDept">
        <id property="id" column="deptId"/>
        <result property="parentId" column="parent_id"/>
        <result property="deptName" column="dept_name"/>
        <result property="orderNum" column="order_num"/>
        <result property="leader" column="leader"/>
        <result property="status" column="dept_status"/>
    </resultMap>

    <resultMap id="RoleResult" type="com.lzmh.api.system.domain.SysRole">
        <id property="id" column="roleId"/>
        <result property="roleName" column="role_name"/>
        <result property="roleKey" column="role_key"/>
        <result property="roleSort" column="role_sort"/>
        <result property="dsType" column="role_ds_type"/>
        <result property="dataScope" column="data_scope"/>
        <result property="status" column="role_status"/>
    </resultMap>
```



#### choose, when, otherwise 

不想应用所有的条件，相反我们想选择很多情况下的一种

```xml
<select id=”findActiveBlogLike”
 parameterType=”Blog” resultType=”Blog”>
    SELECT * FROM BLOG WHERE state = „ACTIVE‟
    <choose>
    	<when test=”title != null”>
    		AND title like #{title}
    	</when>
    	<when test=”author != null and author.name != null”>
    		AND title like #{author.name}
   	 	</when>
    	<otherwise>
    		AND featured = 1
    	</otherwise>
    </choose>
</select>
```

#### trim, where, set

where标签可以去掉第一个前 And

```xml
<select id=”findActiveBlogLike”
parameterType=”Blog” resultType=”Blog”>
    SELECT * FROM BLOG
    <where>
        <if test=”state != null”>
        	state = #{state}
        </if>
        <if test=”title != null”>
        	AND title like #{title}
        </if>
        <if test=”author != null and author.name != null”>
        	AND title like #{author.name}
        </if>
    </where>
</select>

如果 where 元素没有做出你想要的，你可以使用 trim 元素来自定义。比如，和 where
元素相等的 trim 元素是：
<trim prefix="WHERE" prefixOverrides="AND |OR ">
…
</trim>

和动态更新语句相似的解决方案是 set。set 元素可以被用于动态包含更新的列，而不包
含不需更新的。比如：
<update id="updateAuthorIfNecessary"
	parameterType="domain.blog.Author">
	update Author
    <set>
        <if test="username != null">username=#{username},</if>
        <if test="password != null">password=#{password},</if>
        <if test="email != null">email=#{email},</if>
        <if test="bio != null">bio=#{bio}</if>
    </set>
    where id=#{id}
</update>
这里，set 元素会动态前置 SET 关键字，而且也会消除任意无关的逗号，那也许在应用
条件之后来跟踪定义的值。
<trim prefix="SET" suffixOverrides=",">
…
</trim>
注意这种情况下我们覆盖一个后缀，而同时也附加前缀。
```

#### CDATA

* mybatis的xml文件中需要写一些特殊字符，如><&这些字符在xml解析的时候会被转义，但是我们不希望它被转义，这时候就使用<![CDATA[]]>

```xml

<if test="time != null and time !='' ">
   <![CDATA[  and Time > #{time}  ]]>
</if>
```

#### 条件判断

if 的连接条件判断  用 and 、 or

```xml
if标签里面的test判断是可以使用工具类来做判断的，毕竟test后面跟的也是一个布尔值，其用法是：

<if test="@完整的包名类名@方法名(传参)">
例如：
<if test="@com.xxx.util.MybatisTestUtil@isNotEmpty(obj)"> 
    
#判断数组是否包含某个元素
<if test="list.contains(xxx)">
	//...
</if>
```

#### Insert标签

映射插入方法的返回类型可以是`void`或`int`（在这种情况下，它将返回插入行的编号）。您可以执行以下机制来返回生成的 id：

```xml
方式一 返回自增主键
<insert id="insert" useGeneratedKeys="true" keyProperty="id" >
    
方式二 使用 selectKey 返回主键的值
<insert id="insert" parameterClass="MyParameter">
  <selectKey resultType="Long" order="AFTER" keyProperty="id">
      SELECT LAST_INSERT_ID()
   </selectKey>
  INSERT INTO mytable(col1, col2) VALUES (#{val1}, #{val2})
</insert>
```



### 使用@Param 和不使用@Param的区别

区别是：使用注解可以不用加parameterType

mabatis

1、如果传递过来是单参数，且没有以@Param注解进行命名，则直接将单参数作为真实的参数调用SqlSession的对应方法。

2、如果传递过来的不是单参数或者是包含以@Param注解进行命名的参数，则会将对应的参数转换为一个Map进行传递。具体规则如下：

   会把对应的参数按照顺序以param1、param2、paramN这样的形式作为Key存入目标Map中，第一个参数是param1，第N个参数是paramN。

​    如果参数是以@Param注解命名的参数，则以@Param指定的名称作为Key存入目标Map中。

​    如果参数不是以@Param注解命名的，则按照顺序以0、1、N这样的形式作为Key存入目标Map中，第一个参数是0，第N个参数是N。

## [MyBatis-Plus](https://mp.baomidou.com/)

* https://mp.baomidou.com/guide/wrapper.html#querywrapper

```java
#方式一  这种只能one()和list()返回实体对象
OrderBase orderBase = orderBaseProviderService
                    .lambdaQuery()
                    .eq(OrderBase::getThirdOrderId, orderBaseInfo.getThirdOrderId())
                    .one();
#方式二  这种可以返回map
LambdaQueryWrapper<OrderBase> lambdaQueryWrapper = new QueryWrapper<OrderBase>()
                    .lambda()
                    .eq(OrderBase::getThirdOrderId, orderBaseInfo.getThirdOrderId());
            orderBaseProviderService.getOne(lambdaQueryWrapper);
```



###  @TableField

* 完成字段自动填充

## ActiveMQ消息队列

### 应用场景

* 消息队列中间件是分布式系统中重要的组件，主要解决应用耦合，异步消息，流量削锋等问题。实现高性能，高可用，可伸缩和最终一致性[架构](http://lib.csdn.net/base/architecture)。是大型分布式系统不可缺少的中间件。

* 目前在生产环境，使用较多的消息队列有ActiveMQ，RabbitMQ，ZeroMQ，Kafka，MetaMQ，RocketMQ等。

异步处理，应用解耦，流量削锋和消息通讯四个场景。

```
场景说明：用户注册后，需要发注册邮件和注册短信。传统的做法有两种1.串行的方式；2.并行方式。
场景说明：用户下单后，订单系统需要通知库存系统。传统的做法是，订单系统调用库存系统的接口。  应用解耦
应用场景：秒杀活动，一般会因为流量过大，导致流量暴增，应用挂掉。为解决这个问题，一般需要在应用前端加入消息队列    流量削锋
日志处理是指将消息队列用在日志处理中，比如Kafka的应用，解决大量日志传输的问题。
```

- 日志采集客户端，负责日志数据采集，定时写受写入Kafka队列；
- Kafka消息队列，负责日志数据的接收，存储和转发；
- 日志处理应用：订阅并消费kafka队列中的日志数据；

------

## EXCEL导出实例

```xml
<dependency>
    <groupId>cn.hutool</groupId>
    <artifactId>hutool-all</artifactId>
    <version>4.1.5</version>
</dependency>
<!-- excel解析 -->
<dependency>
	<groupId>org.apache.poi</groupId>
	<artifactId>poi-ooxml</artifactId>
	<version>3.9</version>
</dependency>
```

测试类

```JAVA
@RequestMapping(value = "/testExport", method = RequestMethod.GET)
public void bathInternalUser(HttpServletResponse response) {
    List<Map<String,Object>> testData = new ArrayList<>();
    Map<String,Object> map = new HashMap<>();
    map.put("name", "大熊");
    map.put("phone", "13500000000");
    map.put("gender", "男");
    map.put("birthday", "2018-01-17");
    map.put("address", "中国");
    map.put("companyName", "技术有限公司");
    map.put("position", "工程师");
    map.put("remark", "无用数据不需要导出");
    testData.add(map);

    // 导出数据
    FileExportParams fileExportParams = new FileExportParams();
    fileExportParams.setFileName("测试导出EXCEL报表");
    fileExportParams.setDatas(testData);
    // 文件首栏顺序对应数据的Key值
    fileExportParams.setHeaders(new String[]{"姓名","性别","手机","地址","生日","公司","职位"});
    fileExportParams.setKeys(new String[]{"name","gender","phone","address","birthday","companyName","position"});
    ExportUtil.outputFile(fileExportParams, response);
}
```

工具类

```java

public class ExportUtil {
	
	private final static Logger logger = LoggerFactory.getLogger(ExportUtil.class);
	
	/**
	 * 输出文件到浏览器
	 * @param params
	 * @param response
	 */
	public static void outputFile(FileExportParams params, HttpServletResponse response){
			
		try {
			InputStream in = new ByteArrayInputStream(exportExcel(params));
			// 设置response的Header
			response.reset();
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(params.getFullName(), "UTF-8"));
			response.setContentType("application/octet-stream");
			IOUtils.copy(in, response.getOutputStream());
			
		} catch (IOException e) {
			logger.error("【导出excel出错】",e);
			throw new RuntimeException("导出excel出错");
		}
	    
	}
	
	/**
	 * 导出到excel
	 * @param params
	 * @return
	 * @throws IOException
	 */
	public static byte[] exportExcel(FileExportParams params) throws IOException {
		if (".xlsx".equalsIgnoreCase(params.getFileType())) {
			logger.info("导出.xlsx文件");
			return createExcel(params,new XSSFWorkbook());
		}
		
		if (".xls".equalsIgnoreCase(params.getFileType())) {
			logger.info("导出.xls文件");
			return createExcel(params,new HSSFWorkbook());
		}
		
		return new byte[0];
	}
	
	
	/**
	* 创建Excel文件
	* @return 临时文件保存地址
	* @throws IOException
	*/
	private static byte[] createExcel(FileExportParams params,Workbook workBook) throws IOException {
		
		createSheet(params,workBook);
		
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		workBook.write(os);
		
		return os.toByteArray();  
	}
	
	/**
	 * 导出到excel - 写到临时文件输出
	 * @param params
	 * @return
	 * @throws IOException
	 */
	public static String getExcelPath(FileExportParams params) throws IOException {
		if (".xlsx".equalsIgnoreCase(params.getFileType())) {
			logger.info("导出.xlsx文件");
			return createExcelPath(params,new XSSFWorkbook());
		}
		
		if (".xls".equalsIgnoreCase(params.getFileType())) {
			logger.info("导出.xls文件");
			return createExcelPath(params,new HSSFWorkbook());
		}
		
		return null;
	}
	
	
	/**
	 * 创建Excel文件 - 写到临时文件输出
	 * @return 临时文件保存地址
	 * @throws IOException
	 */
	private static String createExcelPath(FileExportParams params,Workbook workBook) throws IOException {
		
		createSheet(params,workBook);
		
		/*
		 * 输出新建的excel，保存到本地临时文件
		 */
		String filePath = params.getFilePath();
		File tempFile = new File(filePath);
    	if (!tempFile.exists()) {
    		tempFile.mkdirs();
	    }
	        
    	filePath = params.getFilePath().concat("/").concat(params.getFullName());
    	
        FileOutputStream fileOut = new FileOutputStream(filePath);  	  
		workBook.write(fileOut);
		fileOut.flush();
		fileOut.close();
		logger.info("导出excel临时文件存储地址：{}",filePath);
		return filePath;  
	}
	
 
	/**
	 * 创建一个工作表，设置格式
	 * @param params
	 * @param workBook
	 */
	private static void createSheet(FileExportParams params, Workbook workBook) {
		// 创建一个工作薄对象
		Sheet sheet = workBook.createSheet();
		
		/*
		 * 创建样式对象
		 */
		CellStyle titleCellStyle = workBook.createCellStyle(); 
		// 指定单元格居中对齐，边框为细  
		titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
		titleCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
		titleCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);  
		titleCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);  
		titleCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);  
		titleCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
		// 设置填充色  
		titleCellStyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);  
		titleCellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);  
		// 指定当单元格内容显示不下时自动换行  
		titleCellStyle.setWrapText(true);  
		// 设置单元格字体  
		Font titleFont = workBook.createFont();  
		titleFont.setFontHeightInPoints((short) 12);  
		titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
		titleCellStyle.setFont(titleFont);  
		
		/*
		 *  创建单元格样式  
		 */
		CellStyle cellStyle = workBook.createCellStyle();
		// 指定单元格居中对齐，边框为细  
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);  
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);  
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);  
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
		// 设置单元格字体  
		Font font = workBook.createFont();  
		font.setFontHeightInPoints((short) 11);  
		font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);  
		cellStyle.setFont(font);
		
		setExportData(sheet,titleCellStyle,cellStyle,params);
		
	}
	
	/**
	 * 设置导出数据
	 * @param result
	 */
	private static void setExportData(Sheet sheet,CellStyle titleCellStyle,CellStyle cellStyle,FileExportParams params) {
		/*
		 * 设置表头
		 */
		Row headerRow = sheet.createRow(0);
		Cell headerCell = null;
		String[] headers = params.getHeaders();
		for (int c = 0; c < headers.length; c++) {  
			headerCell  = headerRow.createCell(c);  
			headerCell.setCellStyle(titleCellStyle);  
			headerCell.setCellValue(headers[c]);  
			sheet.setColumnWidth(c, (30 * 160));  
		}
		
		/*
		 * 设置正文
		 */
		List<Map<String,Object>> datas = params.getDatas();
		String[] keys = params.getKeys();
		
		int i = 1;//正文从第二行开始
		for (Map<String,Object> map : datas) {
			Row row = sheet.createRow(i++);
			int j = 0;//开始列
			for (String key : keys) {
				if (ArrayUtils.contains(keys, key)) {
					Object value = map.get(key) == null ? "" :  map.get(key);
					Cell cell = row.createCell(j++);
					cell.setCellStyle(cellStyle);  
					cell.setCellValue(value.toString());
				}
			}
		}		
	} 
}
```

参数类

```java
public class FileExportParams implements Serializable{
	
	private static final long serialVersionUID = -600144284024163528L;
 
	/**
	 * 导出数据
	 */
	private List<Map<String,Object>> datas;
	
	/**
	 * 导出文件类型,默认=".xlsx"
	 */
	private String fileType = ".xlsx";
	
	/**
	 * 导出文件名称
	 */
	private String fileName;
	
	/**
	 * 导出excel表头字段
	 */
	private String[] headers;
	
	/**
	 * 导出文件存储目录,例如：E:/work/git
	 */
	private String filePath;
	
	/**
	 * 导出excel表头字段对应的数据Key值
	 */
	private String[] keys;
 
	public List<Map<String, Object>> getDatas() {
		return datas;
	}
 
	public void setDatas(List<Map<String, Object>> datas) {
		this.datas = datas;
	}
 
	public String getFileType() {
		return fileType;
	}
 
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
 
	public String getFilePath() {
		return filePath;
	}
 
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
 
	public String[] getHeaders() {
		return headers;
	}
 
	public void setHeaders(String[] headers) {
		this.headers = headers;
	}
 
	public String getFileName() {
		return fileName;
	}
 
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
 
	/**
	 * 拼接文件名和后缀
	 * @return
	 */
	public String getFullName() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String fileName = (sdf.format(new Date())).concat(this.fileType);
		if (StringUtils.isNotBlank(this.fileName)) {
			fileName = this.fileName.concat("-").concat(fileName);
		}
		return fileName;
	}
 
	public String[] getKeys() {
		return keys;
	}
 
	public void setKeys(String[] keys) {
		this.keys = keys;
	}	
}
```

## Spring的xml的一些配置详解



```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

    <import resource="引入其他bean xml配置文件" />
    <bean id="bean标识" class="玩转类型名称"/>
    <alias name="bean标识" alias="别名" />
</beans>

bean配置
格式
<bean id="bean唯一标识" name="bean名称" class="完整类型名称" factory-bean="工厂bean名称" factory-method="工厂方法"/>
<!-- bean名称：user4，多个别名：[user4_1,user4_2,user4_3,user4_4] -->
<bean id="user4" name="user4_1,user4_2;user4_3 user4_4" class="com.javacode2018.lesson001.demo2.UserModel"/>

scop的说明https://www.itdaan.com/blog/2014/05/08/461c414960ac472bcff63dd95c19dee5.html
<!--
constructor-arg：通过构造函数注入。 
property：通过setter对应的方法注入。-->
使用方式一： 还可以用 factory-method指定构造方法
<bean id="student" class="com.rc.sp.Student">
    <constructor-arg name="id" value="1"/>
    <constructor-arg name="name" value="student"/>
    <constructor-arg name="dream">
        <list>
            <value>soldier</value>
            <value>scientist</value>
            <value>pilot</value>
        </list>
    </constructor-arg>
    <constructor-arg name="score">
        <map>
            <entry key="math" value="90"/>
            <entry key="english" value="85"/>
        </map>
    </constructor-arg>
    <constructor-arg name="graduation" value="false"/>
</bean>
说明：
<constructor-arg name="id" value="1"/>也可以改成<constructor-arg index="0" value="1"/>方式；boolean的值既可以用0/1填充，也可以用true/false填充。

使用方式二：
<constructor-arg type="java.lang.String" value="classpath:application.properties" />
使用方式三：
<constructor-arg ref="spellChecker"/> ref指向另一个bean

```



## 附录

------

XML并不是所有都要用到，按需配置，这些只是记录学习。

### web.xml

#### 监听器

```xml
<!--配置session失效时间，单位：分钟-->
<session-config>
    <session-timeout>100</session-timeout>
</session-config>

<!--+++++++++++++++ context-param 开始 ++++++++++++++++++++++++++++++++++++++++++++++++++-->
<!--加载log4j-->
<context-param>
    <param-name>log4jConfigLocation</param-name>
    <param-value>classpath:property/log4j.properties</param-value>
</context-param>

<!--Spring刷新Log4j配置文件变动的间隔,单位为毫秒 -->
<context-param>
    <param-name>log4jRefreshInterval</param-name>
    <param-value>10000</param-value>
</context-param>
```

```xml
<!--spring配置文件-->
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:spring-config.xml</param-value>
</context-param>
<!-- 编码过滤器 -->
<filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <async-supported>true</async-supported>
    <init-param>
        <param-name>encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
</filter>
<filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
<!--Log4j监听-->
<listener>
    <listener-class>org.springframework.web.util.Log4jConfigListener</listener-class>
</listener>
<!--Spring监听器-->
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
<!--request监听-->
<listener>
    <listener-class>
        org.springframework.web.context.request.RequestContextListener
    </listener-class>
</listener> 

<!--  初始化 application 此处需要注意是否自己需要 -->
<listener>
    <listener-class>com.java456.service.impl.InitComponent</listener-class>
</listener>
<!-- Spring监听器结束 -->
```

##### InitComponent.java

```java
@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{	
	private static ApplicationContext applicationContext;		
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application=sce.getServletContext();
		ConfigService configService=(ConfigService) applicationContext.getBean("configService");
		//把config  初始到全局缓存中
		Config config = configService.findById(1);
		//保存到 缓存中
		application.setAttribute("config", config);		
	}	
	public void contextDestroyed(ServletContextEvent sce) {
	}	
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException     {
        this.applicationContext=applicationContext;
    }
}
```

#### 添加对springmvc的支持

```xml
<!-- 添加对springmvc的支持 -->
<servlet>
    <servlet-name>springMVC</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:spring-mvc.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
    <async-supported>true</async-supported>
</servlet><!-- 过虑所有 -->
<servlet-mapping>
    <servlet-name>springMVC</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping> 
```

#### shiro过滤器定义

```xml
<!-- shiro过滤器定义 -->
<filter>  
    <filter-name>shiroFilter</filter-name>  
    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>  
    <init-param>  
        <!-- 该值缺省为false,表示生命周期由SpringApplicationContext管理,设置为true则表示由ServletContainer管理 -->  
        <param-name>targetFilterLifecycle</param-name>  
        <param-value>true</param-value>  
    </init-param>  
</filter>  
<filter-mapping>  
    <filter-name>shiroFilter</filter-name>  
    <url-pattern>/*</url-pattern>  
</filter-mapping>
```

### application.xml

```xml
<!-- 自动扫描 service 所有使用注解的类型 注意修改成自己的包名-->
<context:component-scan base-package="com.lsd"/>
```

#### 加载一个properties文件

```xml
<!-- 第一种方式：加载一个properties文件 -->
<bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
    <property name="location" value="classpath:jdbc.properties"/>
</bean>
或者 ： <context:property-placeholder location="classpath:jdbc.properties"/>
<!-- 第二种方式：加载多个properties文件-->
<bean id="configProperties" class="org.springframework.beans.factory.config.PropertiesFactoryBean">
    <property name="locations">
        <list>
            <value>classpath:jdbc.properties</value>
            <value>classpath:common.properties</value>
            <value>classpath*:property/*.properties</value> 表示所有 *
        </list>
    </property>
    <property name="fileEncoding" value="UTF-8"/>
</bean>
```

#### 配置数据源

```xml
<!-- druid 配置数据源 本地 数据库 -->
<bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource"
      destroy-method="close" >
    <property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
    <property name="url" value="jdbc:mysql://localhost:3306/db_book_manage?useUnicode=true&amp;characterEncoding=UTF-8&amp;useSSL=false&amp;serverTimezone=UTC"/>
    <property name="username" value="root"/>
    <property name="password" value="123456"/>
</bean>
<!-- c3p0 配置数据源 本地 数据库 -->
<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource" >
    <property value="${jdbc.driver}" name="driverClass"/>
    <property value="${jdbc.url}" name="jdbcUrl"/>
    <property value="${jdbc.username}" name="user"/>
    <property value="${jdbc.password}" name="password"/>
    <property value="${c3p0.maxPoolSize}" name="maxPoolSize"/>
    <property value="${c3p0.minPoolSize}" name="minPoolSize"/>
    <property value="${c3p0.autoCommitOnClose}" name="autoCommitOnClose"/>
    <property value="${c3p0.checkoutTimeout}" name="checkoutTimeout"/>
    <property value="${c3p0.acquireRetryAttempts}" name="acquireRetryAttempts"/>
</bean>

```

#### 配置SqlSessionFactory对象

```xml
<!-- 配置SqlSessionFactory对象 -->
<!-- mybatis和spring完美整合，不需要mybatis的配置映射文件 扫描所有mapper文件-->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"/>
    <!-- 扫描model包 使用别名 -->
	<property name="typeAliasesPackage" value="com.chatRobot.model" />
    <!-- 自动扫描mapping.xml文件 -->
    <property name="mapperLocations" value="classpath:mapping/*.xml"></property>
</bean>
<!-- spring与mybatis整合配置，扫描所有dao -->
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="com.**.mapper"/>
    <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>
</bean>
```

#### 事务管理

```xml
<!--事务管理 begin -->
<bean id="transactionManager"
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="dataSource"/>
</bean>
<!-- (开启注解事务管理)
<tx:annotation-driven transaction-manager="transactionManager"/> 可用这一句代替下面所有至</aop>-->
<!--事物aop切面 -->
<tx:advice id="transactionAdvice" transaction-manager="transactionManager">
    <tx:attributes>
        <tx:method name="insert*" propagation="REQUIRED"/>
        <tx:method name="update*" propagation="REQUIRED"/>
        <tx:method name="delete*" propagation="REQUIRED"/>
        <tx:method name="save*" propagation="REQUIRED"/>
        <tx:method name="trst*" propagation="REQUIRED"/>
        <tx:method name="process" propagation="REQUIRED"/>
    </tx:attributes>
</tx:advice>

<aop:config>
    <!--配置多个切入点 -->
    <aop:pointcut id="projectPointCut" expression="execution (* com.wxmp.wxcms.service.*.*(..))"/>
    <aop:advisor advice-ref="transactionAdvice" pointcut-ref="projectPointCut"/>
</aop:config>
<!--事务管理 end -->
```

#### Shiro过滤器

```xml
<!-- Shiro过滤器 -->
<bean id="shiroFilter" class="org.apache.shiro.spring.web.ShiroFilterFactoryBean">  
    <!-- Shiro的核心安全接口,这个属性是必须的 -->  
    <property name="securityManager" ref="securityManager"/>
    <!-- 身份认证失败，则跳转到登录页面的配置 -->  
    <!-- 要求登录时的链接(登录页面地址)，非必须的属性，默认会自动寻找Web工程根目录下的"/login.jsp"页面 -->  
    <property name="loginUrl" value="/login"/> 
    <!-- 角色  权限  认证失败，则跳转到的配置 --> 
    <property name="unauthorizedUrl" value="/fail.html" />
    <!-- Shiro连接约束配置,即过滤链的定义 -->  
    <property name="filterChainDefinitions">  
        <value>
            /login=anon   <!-- 不需要权限-->
            /admin/**=authc   <!-- 需要登陆权限-->
            /station/pc/manage=authc 
            /youpin/pc/manage=authc 
            /user/pc/manage=authc
            /dingdan/pc/manage=authc
            /config/pc/manage=authc
            /hongbao/pc/manage=authc
            /client/pc/manage=authc
            /weixin/tongbu=authc
            /admin/refund/delete=perms["refund:del"]
        </value>  
    </property>
</bean> 
<!-- 保证实现了Shiro内部lifecycle函数的bean执行 -->    
<bean id="lifecycleBeanPostProcessor" class="org.apache.shiro.spring.LifecycleBeanPostProcessor"/> <!-- 开启Shiro注解 -->
<bean class="org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator" depends-on="lifecycleBeanPostProcessor"/>  
<bean class="org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor">  
    <property name="securityManager" ref="securityManager"/>  
</bean> 
```

#### 配置定时任务

```xml
<!-- 定时任务 -->
    <context:component-scan base-package="com.java456.quartz" />
    <!--加载定时任务 -->
    <task:annotation-driven />
```

### spring-mvc.xml

```xml
<!--1 自动扫描  @Controller 注意修改成自己的包名-->
<context:component-scan base-package="com.lsd.controller"/>

<!--避免IE执行AJAX时，返回JSON出现下载文件 -->
<bean id="mappingJacksonHttpMessageConverter"
      class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
    <property name="supportedMediaTypes">
        <list>
            <value>text/html;charset=UTF-8</value>
        </list>
    </property>
</bean>

<!--2 定义跳转的文件的前后缀 ，视图模式配置 -->
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/jsp/" />
    <property name="suffix" value=".jsp"/>
</bean>

<!--
constructor-arg：通过构造函数注入。 
property：通过setter对应的方法注入。-->

<!--3 文件上传配置 -->
<bean id="multipartResolver" 		  class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    <!-- 默认编码 -->
    <property name="defaultEncoding" value="UTF-8"/>
    <!-- 上传文件大小限制为31M，31*1024*1024 -->
    <property name="maxUploadSize" value="32505856"/>
    <!-- 内存中的最大值 -->
    <property name="maxInMemorySize" value="4096"/>
</bean>

<!--4  自动加载 开启SpringMVC注解模式 -->
<mvc:annotation-driven />

```

#### 拦截器、监听器、过滤器

```xml
<!-- 多个拦截器 -->
<mvc:interceptors>
    <mvc:interceptor>
        <mvc:mapping path="/**"/>
        <!-- 自定义的拦截器类 -->
        <bean class="com.itheima.springmvc.interceptor.Interceptor1"/>
    </mvc:interceptor>
    <!-- 		<mvc:interceptor>
    <mvc:mapping path="/**"/>
    自定义的拦截器类
    <bean class="com.itheima.springmvc.interceptor.Interceptor2"/>
   </mvc:interceptor> -->
</mvc:interceptors>
```

##### Interceptor1.java

```java
public class Interceptor1 implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("方法前 1");
		//判断用户是否登陆  如果没有登陆  重定向到登陆页面   不放行   如果登陆了  就放行了
		// URL  http://localhost:8080/springmvc-mybatis/login.action
		//URI /login.action
		String requestURI = request.getRequestURI();
		if(!requestURI.contains("/login")){
			String username = (String) request.getSession().getAttribute("USER_SESSION");
			if(null == username){
				response.sendRedirect(request.getContextPath() + "/login.action");
				return false;
			}
		}
		return true;
	}
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("方法后 1");
		
	}
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("页面渲染后 1");
		
	}
}
```

#### 转换器

```xml
<!-- 配置Conveter转换器  转换工厂 （日期、去掉前后空格）。。 -->
<bean id="conversionServiceFactoryBean" class="org.springframework.format.support.FormattingConversionServiceFactoryBean">
    <!-- 配置 多个转换器-->
    <property name="converters">
        <list>
            <bean class="com.itheima.springmvc.conversion.DateConveter"/>
        </list>
    </property>
</bean>
```

##### DateConveter.java

```java
public class DateConveter implements Converter<String, Date>{

	public Date convert(String source) {
		// TODO Auto-generated method stub
		try {
			if(null != source){//2016:11-05 11_43-50
				DateFormat df = new SimpleDateFormat("yyyy:MM-dd HH_mm-ss");
				return df.parse(source);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
```

### 日志文件

#### logback.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="true">
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>
    <root level="debug">
        <appender-ref ref="STDOUT"/>
    </root>
</configuration>

#其它配置
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">
<!--定义日志文件的存储地址 勿在 LogBack 的配置中使用相对路径-->
<property name="LOG_HOME" value="/home" />
<!-- 控制台输出 -->
<appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
    <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->
    <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
    </encoder>
</appender>
<!-- 按照每天生成日志文件 -->
<appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
    <!--日志文件输出的文件名-->
    <FileNamePattern>${LOG_HOME}/TestWeb.log.%d{yyyy-MM-dd}.log</FileNamePattern>
    <!--日志文件保留天数-->
    <MaxHistory>30</MaxHistory>
    </rollingPolicy>
    <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
    <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->
    <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
    </encoder>
    <!--日志文件最大的大小-->
    <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
    <MaxFileSize>10MB</MaxFileSize>
    </triggeringPolicy>
</appender>

<!-- 日志输出级别 -->
<root level="INFO">
    <appender-ref ref="STDOUT" />
</root>
</configuration>
```

#### log4j.properties

```properties
log4j.rootLogger=INFO,Console,File


#控制台日志

log4j.appender.Console=org.apache.log4j.ConsoleAppender

log4j.appender.Console.Target=System.out

log4j.appender.Console.layout=org.apache.log4j.PatternLayout

log4j.appender.Console.layout.ConversionPattern=[%p][%t][%d{yyyy-MM-dd HH\:mm\:ss}][%C] - %m%n


#普通文件日志

log4j.appender.File=org.apache.log4j.RollingFileAppender

log4j.appender.File.File=logs/ssm.log

log4j.appender.File.MaxFileSize=10MB

#输出日志，如果换成DEBUG表示输出DEBUG以上级别日志

log4j.appender.File.Threshold=ALL

log4j.appender.File.layout=org.apache.log4j.PatternLayout

log4j.appender.File.layout.ConversionPattern=[%p][%t][%d{yyyy-MM-dd HH\:mm\:ss}][%C] - %m%n 
```


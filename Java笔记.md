*互联网技术

服务框架：Dubbo, zookeeper, Rest 服务

缓存：Redis, ehcache

消息中间件：ActiveMQ ,kafka

分布式文件：FastDFS

安全框架：Apache shiro

任务调度：quartz 

持久层框架：mybatis 

日志 : log4j，slf4j

项目基础搭建：spring, springmvc

环境搭建：linux

服务器：tomcat ,jetty weblogic，websphere

高并发分流技术: Nginx

模版引擎: FreeMarker  

服务注册中心、配置中心: nacos

服务的熔断降级： Netflix的开源组件Hystrix

#### 软件备注

* **vs code**,  **webstorm** 边写前端js+html
* **datagrip**， **navicat**  连接数据库

#### Jar包解决功能记录

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



##### springboot搜索引擎 eclasticsearch

* 实时的全文检索
* logstash的安装配置（同步数据库表数据？）

* 教程：  https://www.cnblogs.com/yijialong/p/9729988.html

**下载Kibana**

* Kibana，就是我们所说的ES的图形化用户界面，用于方便用户进行操作。

* 网址： https://www.elastic.co/downloads/kibana

#### springboot开启异步

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

总体来说设计模式分为三大类：

　　**创建型模式，**共五种：**工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式**。

　　**结构型模式，**共七种：**适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式**。

　　**行为型模式，**共十一种：**策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。**

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

#### Spring事件分发

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

### 1 开发常用的修饰符功能说明

#### 1-1 类 

***public***    可以从其他类中访问

***obstract***  本类不能被实例化

***final***    不能再声明子类

***protected***  只能从自己的类和它的子类中访问

***private***    只能在本类中访问 

***static***      外部类是不允许static修饰的，但是内部类却允许，重要是this和super都无法出现在static 修饰的方法中

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

##### 1-4-2 抽象类和接口的区别

* 抽象类中的方法可以有方法体，就是能实现方法的具体功能，但是接口中的方法不行。

- 抽象类中的成员变量可以是各种类型的，而接口中的成员变量只能是 **public static final** 类型的。
- 接口中不能含有静态代码块以及静态方法(用 static 修饰的方法)，而抽象类是可以有静态代码块和静态方法。
- 一个类只能继承一个抽象类，而一个类却可以实现多个接口。

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

#### 1-5 java8的新特性

##### 1-5-1  Optional类使用

```java
Integer value1 = null;
// Optional.ofNullable - 允许传递为 null 参数
Optional<Integer> a = Optional.ofNullable(value1);
// Optional.of - 如果传递的参数是 null，抛出异常 NullPointerException
Optional<Integer> b = Optional.of(value2);

//获取类名称
Object.getClass().getSimpleName();

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

#### 1-6 多实现类的注入问题

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

### 2 创建线程都用实现接口 Runnable

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

线程在执行期间不允许其它线程进入-------用同步   synchronized

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
            sysnchronized)(Single.clasee){
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

#### 2-1 多线程java多线程之Future和FutureTask

```dart
Future<List> future = getDataFromRemoteByFuture();
        //do something....
        List data = future.get();
```

```java
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

### 3 IO流功能对象

```java
打印流 -- 输出流
PrintStream(字节流)       PrintWriter(字符流)
    
transient  //瞬态关键字  防止某些字段被序列化
    
```

**注意点：**   try{}catch{}finally{ **此处必须要对流进行关闭操作**} 否则会占用电脑内存。

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

* 能使用StringBuffer就使用这个   线程同步  不安全
* StringBuilder   可变的字符序列  比StringBuilder快，线程不同步的
* 一般建议使用StringBuilder   

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

#### 1、List,Set继承接口Collection

* 存储对象，集合长度可变，可存储不同类型对象
* 迭代器  Iterator。hasnext()   next()  remove()
* List<E> 存入的顺序和取出的顺序一致    List集合特有的迭代器 ListIterator

  * Listd的具体子类

  * Vector 数组 可变长度
  *  ArrayList   数组结构，长度可变
  * LinkList   链表结构，线程不同步
* Set  不允许重复元素

  * HashSet集合  不允许重复元素
  * TreeSet

**Tip:Set里的元素是不能重复的，那么用什么方法来区分重复与否呢? 是用==还是 equals()?它们有何区别?**

​	Set 里的元素是不能重复的，那么用 iterator()方法来区分重复与否。 

​	equals()是判读两个 Set 是否相等。 

​	equals()和==方法决定引用值是否指向同一对象 equals()在类中被覆盖，为的是当两个分 离的对象的内容和类型相配的话，返回真值。

```java
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
Map<String, QuickNotaryDTO> map = list.stream().collect(toMap(QuickNotaryDTO::getNotaryCode, dto -> dto),
                                                        (key1,key2)->key2);
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
  * 子类  HashTable  同步的，不允许null键  null值
  *  HashMap   同步的  允许null值 null键
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
Class className= class.forName("className");  //获取类名
Method method=className.getMethod(MethodName,XXX.class，"参数".getClass());// 构造函数  注意getClass()可能会改变
method.invoke(className.newInstance,"参数")；
```

```java
BeanUtils.copyProperties(源对象, 目标对象);  //另一个实体
```

### 8 序列化

我们有时候将一个 java 对象变成字节流的形式传出去或者从一个字节流中恢复成一个 java 

对象，例如，要将 java 对象存储到硬盘或者传送给网络上的其他计算机，这个过程我们可 

以自己写代码去把一个 java 对象变成某个格式的字节流再传输，但是，jre 本身就提供了这 

种支持，我们可以调用 OutputStream 的 writeObject 方法来做，如果要让 java 帮我们做， 

**要被传输的对象必须实现** **serializable** **接口**，这样，javac 编译时就会进行特殊处理，编译 

的类才可以被 writeObject 方法操作，这就是所谓的序列化。需要被序列化的类必须实现 

Serializable 接口，该接口是一个 mini 接口，其中没有需要实现的方法， 

implementsSerializable **只是为了标注该对象是可被序列化的**。

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

JSONObject.toJSONString(Object object, SerializerFeature... features)

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
  //<T> T 表示返回的是一个泛型
  //T t 表示传递的参数是一个泛型
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

#### Lombox插件

- idea — setting — plugins, 
  搜索栏中输入**Lombok**。
- 使用学习参考：https://blog.csdn.net/a2267378/article/details/81180373
- 在日常开发中，我们尽量少直接使用@Data注解，而是换成@Setter、@Getter、@NoArgsConstructor、@AllArgsConstructor、@ToString即可

```
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

@RequiredArgsConstructor：注解在类上；会生成构造方法（可能带参数也可能不带参数），如果带参数，这参数只能是以final修饰的未经初始化的字段，或者是以@NonNull注解的未经初始化的字段@RequiredArgsConstructor(staticName = "of")会生成一个of()的静态方法，并把构造方法设置为私有的。
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

## Mybatis

#{}占位符    会带单引号''   模糊查询 “%”#{id}“%”

${}拼接字符    只能用${value}  

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

CDATA

* mybatis的xml文件中需要写一些特殊字符，入><&这些字符在xml解析的时候会被转义，但是我们不希望它被转义，这时候就使用<![CDATA[]]>

```xml

<if test="time != null and time !='' ">
   <![CDATA[  and Time > #{time}  ]]>
</if>
```

### [MyBatis-Plus](https://mp.baomidou.com/)

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



####  @TableField

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


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
  
  ```maven脚手架生成命令
  mvn archetype:create-from-project
  ```

### GitHub的命令

* https://www.cnblogs.com/mlw1814011067/p/9908856.html

1. 创建项目根目录

```
mkdir 文件夹名
```

　　2. 初始化文件夹

```
git init
```

　　3. 配置用户名和邮箱（第一次配置后，不需要再登录）

```
git config user.name 名字
git config user.email 邮箱

--------------------------------
git config --global user.name 名字
git config --global user.email 邮箱
这个是针对当前电脑下的所有本地参数（项目根目录文件夹）
```

　　4. 随时查看文件状态

```
git status 
-------------有三种状态
changes to be commited :     这样的文件以及位于暂存区
Untracked files:             这样的文件是新创建的，第一次进入
```

　　5. 将工作区的文件，放到暂存区

```
git add 文件名/文件夹名
git add . 这种方式运用较多，将当前文件夹中的所有文件都放到暂存区去
```

　　6. 将暂存区的文件，放到主仓库去

```
git commit 会进入vi编辑器界面，按i/a进入编辑状态，esc退出编辑状态，：wq保存退出。必须要写内容，要不然就没办法放到主仓库去
git commit -m 日志内容,就会跳过vi编辑界面
```

　　7. 成功后，查看暂存区是否还有内容

```
git status
得到 nothing to commit，working directory clean 就表示文件都已经上传到主仓库中
```

　　8. 查看日志

```
git log
commit：********    版本号
 Author：ouyang <oy1990425@163.com>
 Date:时间
```

　　9. 将本地仓库的内容上传到服务器仓库上

```
git push  git仓库地址  master
```

　　10. 第一次从服务器上跟新文件数据到另一台电脑上时

```
git clone git仓库地址 master（也可以写另外的名字）
 电脑会在当前目录下，新建一个master的本地仓库
```

#### 常用命令：

git init 新建一个空的仓库
git status 查看状态
git add . 添加文件
git commit -m '注释' 提交添加的文件并备注说明
git remote add origin git@github.com:jinzhaogit/git.git 连接远程仓库
git push -u origin master 将本地仓库文件推送到远程仓库
git log 查看变更日志
git reset --hard 版本号前六位 回归到指定版本
git branch 查看分支
git branch newname 创建一个叫newname的分支
git checkout newname 切换到叫newname的分支上
git merge newname 把newname分支合并到当前分支上
git pull origin master 将master分支上的内容拉到本地上

git fetch 将某个远程主机的更新，全部取回本地

```
git fetch <远程主机名> <分支名>
```

git rebase的使用

* Git 操作
  假设Git目前只有一个分支master。开发人员的工作流程是

  git clone master branch
  **在自己本地checkout -b local创建一个本地开发分支**
  在本地的开发分支上开发和测试
  阶段性开发完成后（包含功能代码和单元测试），可以准备提交代码
  首先切换到master分支，git pull拉取最新的分支状态
  然后切回local分支
  通过git rebase -i 将本地的多次提交合并为一个，以简化提交历史。本地有多个提交时,如果不进行这一步,在git rebase master时会多次解决冲突(最坏情况下,每一个提交都会相应解决一个冲突)
  git rebase master 将master最新的分支同步到本地，这个过程可能需要手动解决冲突(如果进行了上一步的话,只用解决一次冲突)
  然后切换到master分支，git merge将本地的local分支内容合并到master分支
  git push将master分支的提交上传

  ```
  本地开发分支可以灵活管理
  git checkout master
  git pull
  git checkout local
  git rebase -i HEAD~2  //合并提交 --- 2表示合并两个
  git rebase master---->解决冲突--->git rebase --continue
  git checkout master
  git merge local
  git push
  ```

  


#### github下载部分文件方法

```
将https中的路径/tree/master换成/trunk/即可

若要换成某个分支的 则将 /tree/master 换成 /branches/分支名/ 即可
```

#### git的subModel语句记录

https://blog.csdn.net/caz28/article/details/107547745

```shell
//添加子项目链接到main里的主项目了
git submodule add https://xxxxx/sub_mod.git sub_mod
//子项目若为空，则执行如下
git submodule init &&　git submodule update
//更新update
git submodule update --recursive --remote
```

1. 假设当前工作目录是 /home/caz/main/，当前项目远程仓库是 https://xxxxx/main.git。
2. 在main目录里，

```bash
git submodule add https://xxxxx/sub_mod.git sub_mod
```

​	这样就把sub_mod这个子项目链接到main里的主项目了。
​	在main目录里，会多出一个**.gitmodules**文件，和一个**sub_mod**目录。

3. 然后，git add 这些文件目录，git commit，git push，就提交到远程git仓库了。
4. 其他用户clone了这个main项目后，git submodule，会看到相关sub_mod信息，也有sub_mod目录和.gitmodules文件，但sub_mod没有checkout，sub_mod目录里是空的。
5. 这时候，

```bash
git submodule init &&　git submodule update
```

就可以checkout出sub_mod来了。
也可以：

```bash
git clone --recursive https://xxxxx/main.git
```

这一步相当于git clone xxx && git submodule init &&　git submodule update
使用submodule的好处是，不用先检出sub_mod，再copy到main里来，sub_mod也可以随时更新，main里也不会有烦人的untrack文件信息。

如果主项目里有多个submodel，用下面命令更新。

```bash
git submodule foreach git pull
```

1. 如果要删除submodel，比较麻烦：

```bash
git rm -r --cached sub_mod
//删除目录。
rm .gitmodules
//删除文件
vim .git/config
```

删除config中的submodel配置。
4.git add
5.git commit



#### git的cherry pick功能

###### 合并分支有两种操作:

一种情况是你需要将你分支的所有代码变动,此时可以采用分支合并
merge
另一种情况,只需要提交几个改动,不需要全部合并(有些情况下整个分支合并冲突太多处理起来过于麻烦)

#### GitLab安装教程



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

* java的opsForValue().的方法说明

```java
#String
//设置value
set(K key, V value)
get(Object key)
append(K key, String value)  
set(K key, V value, long timeout, TimeUnit unit)
long size = template.opsForValue().size("key"));

#HaspMap
Long delete(H key, Object… hashKeys);
//从键中获取指定的哈希
get(H key, Object hashKey) //获取hashMap指定的键value
Set keys(H key); //获取所有的key值
void putAll(H key, Map<? extends HK, ? extends HV> m);
void put(H key, HK hashKey, HV value); //设置散列hashKey的值
List values(H key);
Map<HK, HV> entries(H key); //获取整个哈希存储根据密钥

#List
Long leftPush(K key, V value);//将所有指定的值插入存储在键的列表的头部。如果键不存在，则在执行推送操作之前将其创建为空列表。 rightPush
Long leftPushAll(K key, V… values); //批量把一个数组插入到列表中 rightPushAll
void set(K key, long index, V value);//在列表中index的位置设置value值
V index(K key, long index);//根据下表获取列表中的值，下标是从0开始的
V leftPop(K key);//弹出最左边的元素，弹出之后该值在列表中将不复存在 rightPop

#Set
Long add(K key, V… values);//无序集合中添加元素，返回添加个数
Long remove(K key, Object… values);//移除集合中一个或多个成员
V pop(K key);//移除并返回集合中的一个随机元素
Cursor scan(K key, ScanOptions options);//遍历set
```

#### 分布式锁

https://www.jianshu.com/p/eac5480921e7

```java
/**用法**/
private final ExecutableLockRegistry lockRegistry;
lockRegistry.obtainExecutableLock("notarycloud:file-preview:" + fileId)
            .execute(() -> this.getExistsPreviewFileOrConvertIt(file));

public class ExecutableLockRegistry implements LockRegistry {

    private LockRegistry lockRegistry;

    public ExecutableLockRegistry(LockRegistry lockRegistry) {
        this.lockRegistry = lockRegistry;
    }

    @Override
    public Lock obtain(Object o) {
        return lockRegistry.obtain(o);
    }

    public ExecutableLock obtainExecutableLock(Object o) {
        return new ExecutableLock(obtain(o));
    }

}
```

```java
@Slf4j
public class ExecutableLock implements Lock {

    private final Lock delegate;

    public ExecutableLock(Lock lock) {
        this.delegate = lock;
    }

    public <R> R execute(Supplier<R> bizFun) {
        return execute(bizFun, false);
    }

    public void execute(Runnable runnable) {
        execute(runnable, false);
    }

    public void execute(Runnable runnable, boolean ignoreReleaseLockError) {
        Supplier<Void> supplier = () -> {
            runnable.run();
            return null;
        };
        execute(supplier, ignoreReleaseLockError);
    }

    public <R> R execute(Supplier<R> bizFun, boolean ignoreReleaseLockError) {
        Throwable error = null;
        try {
            delegate.lock();
            return bizFun.get();
        } catch (Throwable e) {
            log.warn("execute with lock has some exception.", e);
            error = e;
            throw e;
        } finally {
            try {
                delegate.unlock();
            } catch (Exception releaseLockError) {
                if (ignoreReleaseLockError) {
                    log.debug("release lock failed", releaseLockError);
                } else {
                    rethrowReleaseLockException(releaseLockError, error);
                }
            }
        }
    }

    @Override
    public void lock() {
        delegate.lock();
    }

    @Override
    public void lockInterruptibly() throws InterruptedException {
        delegate.lockInterruptibly();
    }

    @Override
    public boolean tryLock() {
        return delegate.tryLock();
    }

    @Override
    public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
        return delegate.tryLock(time, unit);
    }

    @Override
    public void unlock() {
        delegate.unlock();
    }

    @Override
    public Condition newCondition() {
        return delegate.newCondition();
    }

    private void rethrowReleaseLockException(Throwable releaseLockError, Throwable lockError) {
        ReflectionUtils.rethrowRuntimeException(new ReleaseLockException(releaseLockError, lockError));
    }

    private static class ReleaseLockException extends Exception {

        protected ReleaseLockException(Throwable releaseLockError, Throwable lockError) {
            super(releaseLockError.getMessage(), lockError == null ? releaseLockError : lockError);
        }

    }

}

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

#### @NonNUll和@NULLable区别

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



##### @ControllerAdvice 全局异常处理器

```java
@ControllerAdvice
public class MyGlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public ModelAndView customException(Exception e) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", e.getMessage());
        mv.setViewName("myerror");
        return mv;
    }
}
```



```java
@ControllerAdvice，是Spring3.2提供的新注解，从名字上可以看出大体意思是控制器增强
```

- `@ControllerAdvice`是一个`@Component`，

  用于定义`@ExceptionHandler`，`@InitBinder`和`@ModelAttribute`方法，适用于所有使用`@RequestMapping`方法。

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

##### @import

> 1、<span style="color:red">**@Import只能用在类上**</span> ，@Import通过快速导入的方式实现把实例加入spring的IOC容器中
>
> 2、加入IOC容器的方式有很多种，@Import注解就相对很牛皮了，<span style="color:red">**@Import注解可以用于导入第三方包**</span> ，当然@Bean注解也可以，但是@Import注解快速导入的方式更加便捷
>
> 3、@Import注解有三种用法

* #### 第一种用法：直接填class数组

  **直接填对应的class数组，class数组可以有0到多个。**

  语法如下：

  ```javascript
  @Import({ 类名.class , 类名.class... })
  public class TestDemo {
  
  }
  ```

  对应的import的bean都将加入到spring容器中，这些在容器中bean名称是该类的**全类名** ，比如com.yc.类名

  

* #### 第二种用法：ImportSelector方式【重点】

这种方式的前提就是一个类要实现ImportSelector接口，假如我要用这种方法，目标对象是Myclass这个类，分析具体如下：

创建Myclass类并实现ImportSelector接口

```java
public class Myclass implements ImportSelector {
//既然是接口肯定要实现这个接口的方法
    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[0];
    }
}
```

分析实现接口的selectImports方法中的：

- 1、返回值： 就是我们实际上要导入到容器中的组件全类名【**重点** 】
- 2、参数： AnnotationMetadata表示当前被@Import注解给标注的所有注解信息【不是重点】

> 需要注意的是selectImports方法可以返回空数组但是不能返回null，否则会报空指针异常！

以上分析完毕之后，具体用法步骤如下：

第一步：创建Myclass类并实现ImportSelector接口，这里用于演示就添加一个全类名给其返回值

```java
public class Myclass implements ImportSelector {
    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[]{"com.yc.Test.TestDemo3"};
    }
}
```

第二步：编写TestDemo 类，并标注上使用ImportSelector方式的Myclass类

```java
@Import({TestDemo2.class,Myclass.class})
public class TestDemo {
        @Bean
        public AccountDao2 accountDao2(){
            return new AccountDao2();
        }

}
```



#### @PostConstruct、  @PreDestroy注解

@PostConstruct该注解被用来修饰一个非静态的void（）方法。

​     被@PostConstruct修饰的方法会在服务器**加载Servlet**的时候运行，并且只会被服务器执行一次。

PostConstruct在构造函数之后执行，init（）方法之前执行。

​     通常我们会是在Spring框架中使用到@PostConstruct注解 该注解的方法在整个Bean初始化中的执行顺序：

**Constructor(构造方法) -> @Autowired(依赖注入) -> @PostConstruct(注释的方法)**



```java

@Component
public class MyUtils {
 
    private static MyUtils          staticInstance = new MyUtils();

    @Autowired
    private MyMethorClassService    myService;
   // 必须是servelet，即必须注入spring容器ioc
    @PostConstruct
    public void init(){
        staticInstance.myService = myService;
    }

    public static Integer invokeBean(){
        return staticInstance.myService.add(10,20);
    }
}
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
    //如果这里不返回响应结果result，则目标对象实际返回值会被置为null
        Object result = point.proceed();
        return result;
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

```java
#例子2  自定义注解的切面
@Aspect
@Component
public class TokenCheckInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(TokenCheckInterceptor.class);

    @Autowired
    private MerchantService merchantService;

    public TokenCheckInterceptor() {
        System.out.println("===>check start");
    }

    @Pointcut("@annotation(com.xf.harbor.config.TokenCheck)")
    private void anyMethod() {
    }

    @Around("anyMethod()")
    public Object checkRequestHead(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.debug("===>check access token start:{}", joinPoint.getArgs());
        long begin = System.nanoTime();

        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.setCharacterEncoding("UTF-8");
        HttpServletResponse response =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        String token = request.getHeader("X-XfAuth-Token");
        logger.debug("===> request token is {}", token);
        String[] listAterTokenSplit = token.split("-");
        String ak = listAterTokenSplit[1];
        String ipAddr = request.getHeader("X-Real-IP");
        if (ipAddr == null || ipAddr.equals("")) {
            ipAddr = request.getRemoteAddr();
        }
        logger.info("request X-Real-IP ipAddr={}", ipAddr);
        int expireTime = Integer.parseInt(listAterTokenSplit[2]);
        if (expireTime < MyUtil.getCurrentTimestamp()) { //token 超时
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.token_timeout.getStatus(), ResponseCodeEnums.token_timeout.getMessage()));
            return null;
        }

        Object[] args = joinPoint.getArgs();
        String requestBody = new Gson().toJson(args[0]);

        String sk = "";
        String allowIps = "";
        try {
            Merchant merchant = merchantService.getMerchant(ak);
            if (merchant != null) {
                sk = merchant.getSecretKey();
                allowIps = merchant.getAllowIps();
            }
            logger.info("===> access key is: {}", ak);
            //check ipAddr
            if (!StringUtils.equals(allowIps, "*")) {
                String[] ips = allowIps.split(",");
                if (!Arrays.asList(ips).contains(ipAddr)) {
                    writeResponse(response,
                            new ApiResponse(ResponseCodeEnums.limited_ip.getStatus(), ResponseCodeEnums.limited_ip.getMessage()));
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.system_exception.getStatus(), ResponseCodeEnums.system_exception.getMessage()));
            return null;
        }

        String requestUri = request.getRequestURI();
        String requestMethod = request.getMethod();
        String queryParam = getParamString(request.getParameterMap());

        logger.info(
                "===>get the equest url:{}; and request method:{}; "
                        + "request param is {};request body is {}",
                requestUri, requestMethod, queryParam, requestBody);

        AuthTokenHelper helper = new AuthTokenHelper();
        helper.setAccessKey(ak);
        helper.setSecretKey(sk);

        if (helper.verifyToken(token, requestUri, requestMethod, queryParam, requestBody)) {
            Object o = joinPoint.proceed();
            long end = System.nanoTime();
            logger.info("API deal time log {}:{}",
                    joinPoint.getTarget().getClass() + "." + joinPoint.getSignature().getName(),
                    (end - begin) / 1000000);
            return o;
        } else {
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.token_mismatch.getStatus(), ResponseCodeEnums.token_mismatch.getMessage()));
            return null;
        }
    }

    private String getParamString(Map<String, String[]> parameterMap) {
        String queryParam = null;
        if (parameterMap.size() > 0) {
            ArrayList<String> parameterKey = new ArrayList<>(parameterMap.keySet());
            Collections.sort(parameterKey);
            ArrayList<String> keyQuotValues = new ArrayList<>();
            for (String key : parameterKey) {
                keyQuotValues.add(String.format("%s=%s", key, parameterMap.get(key)[0]));
            }
            queryParam = StringUtils.join(keyQuotValues, "&");
        }
        return queryParam;
    }

    private void writeResponse(HttpServletResponse response, ApiResponse apiResponse) throws IOException {
        logger.info("===>token check failed.return response={}", new Gson().toJson(apiResponse));
        String responseMap = new Gson().toJson(apiResponse);
        response.setContentType("application/json;charset=utf-8");
        response.getOutputStream().write(responseMap.getBytes());
        response.flushBuffer();
    }

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

#### JackSon中@JsonInclude注解详解

​		比如说我有个场景，返回前端的实体类中如果某个字段为空的话那么就不返回这个字段了，如果我们平时遇到这个问题，那么真的该脑壳疼了。幸亏有我们今天的主角，这个注解就是用来在实体类序列化成json的时候在某些策略下，加了该注解的字段不去序列化该字段

```java
//Include.Include.ALWAYS 默认全部属性起作用 
//Include.NON_DEFAULT 属性为默认值不序列化 
//Include.NON_EMPTY 属性为 空（“”） 或者为 NULL 都不序列化 
//Include.NON_NULL 属性为NULL 不序列化

public class User {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String username;
    private String password;
    private Integer age;
    }

#2代码上
ObjectMapper mapper = new ObjectMapper();
mapper.setSerializationInclusion(Include.NON_NULL);
```

#### @Cacheable 方法缓存主键

是一个既可以应用于方法级别，也可用于类级别的注解。自spring3.1开始就通过它实现了缓存管理。

1. `@Cacheable`能干什么？
    为了通俗易懂的理解，举个栗子：一个方法,`getBooksByUsernameAndLanguage(String username, int language)`，显然，是一个获取数据库里所有我的英文书对象的方法，返回应该是一个列表。如果这个函数的返回值很大，而且会在页面上被经常调用，那么每一次调用都要重新连接数据库并返回一个数据量庞大的list，可能页面响应和资源占用会比较大。而我们希望的是，第一次调用这个方法时，返回的数据能被放到服务器端的缓存里，以便于后面要调用这个方法时，能直接从缓存里取到，这样就不用再查数据库占用资源了。而`@Cacheable`的作用就是这个。

   ```java
   //value自定义缓存名称，key用双引号,里面#加上方法的参数:获取方法的参数,  ''表示在参数之间添加分隔符
   @Cacheable(value = "PERSON",key = "#tagId+'_'+#zz")
   public List<Person> getPersonByTagid(Long tagId,String zz)
   ```

   

#### Springboot JDK8自定义注解

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

注解一般与aop联合使用

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

##### 获取注解的三个方式,

```java
/**是否存在对应 Annotation 对象*/
public boolean isAnnotationPresent(Class<? extends Annotation> annotationClass) 
{
    return GenericDeclaration.super.isAnnotationPresent(annotationClass);
}
/**获取 Annotation 对象*/
public <A extends Annotation> A getAnnotation(Class<A> annotationClass) 
{
    return (A) annotationData().annotations.get(annotationClass);
}
/**获取所有 Annotation 对象数组*/   
public Annotation[] getAnnotations() 
{
    return AnnotationParser.toArray(annotationData().annotations);
}
```

##### @FunctionalInterface的使用 函数式编程

* 必须注解在接口上

  被注解的接口有且只有一个抽象方法

  被注解的接口可以有默认方法/静态方法，或者重写Object的方法

### 单点登录的实现

* **jsonwebtoken跨域登录**

由于**多终端跨域**的出现，很多的站点通过 `web api restful` 的形式对外提供服务，采用了前后端分离模式进行开发，因而在身份验证的方式上可能与传统的基于 `cookie` 的 `Session Id` 的做法有所不同，除了面临跨域提交 `cookie` 的问题外，更重要的是，有些终端可能根本不支持 `cookie`。

`JWT（JSON Web Token）` 是一种身份验证及授权方案，简单的说就是调用端调用 `api` 时，附带上一个由 `api` 端颁发的 `token`，以此来验证调用者的授权信息。

```xml
<!-- JWT相关 -->
<dependency>
   <groupId>io.jsonwebtoken</groupId>
   <artifactId>jjwt</artifactId>
   <version>0.7.0</version>
</dependency>
```

```java
https://www.jianshu.com/p/5858b2a9b509
```

* **cas单点登录系统**

  https://www.cnblogs.com/wlwl/p/10056067.html

```xml
<!-- CAS依赖包 -->
<dependency>
    <groupId>net.unicon.cas</groupId>
    <artifactId>cas-client-autoconfig-support</artifactId>
    <version>1.5.0-GA</version>
</dependency>
```



### Node使用

#### Node模块引入的加载顺序问题

* ##### vue项目main.js文件下import router from ‘./router‘默认导入router文件夹下index.js的原因

```
1. 首先寻找目录下有没有router.js或者router.node,如果有就导入
2. 如果没有看是否有router目录,如果没有就require失败,抛出异常"Cannot find module ‘./router’"
3. 如果有router目录会在其下寻找package.json文件,如果有则按照package的配置来导入
4. 如果没有package.json,看是否有index.js或者index.node,如果有就导入没有就失败
```



#### 创建一个新项目

* **vue init**

```
是vue-cli2.x的初始化方式，可以使用github上面的一些模板来初始化项目

webpack是官方推荐的标准模板名
使用方式：vue init webpack 项目名称

electron-vue的模板
使用方式：vue init simulatedgreg/electron-vue 项目名称


```

* vue create

  ```
  - 是vue-cli3.x的初始化方式，模板是固定的，模板选项可自由配置
  使用方式：vue create 项目名称
  ```

  

```cmd
$ cd my-project
$ cnpm install
$ cnpm run dev
 DONE  Compiled successfully in 4388ms
```

------

#### Vue的语法

```js
#vue的一些语法用法 模板
<p>{{ message }}</p>
<div v-html="message"></div>
	# v-model 指令来实现双向数据绑定：
<input v-model="message">
	# v-bind 样式绑定
<div v-bind:class="{'class1': use}">
    # v-on 监听 DOM 事件
<!-- 完整语法 --><a v-on:click="doSomething"></a>
<!-- 缩写 --><a @click="doSomething"></a>
```

```js
#vue在element-ui里的一些用法
template（模版） 在这里属于一个固定用法： <template slot-scope="scope">
<el-table-column label="日期" width="180">
    <template slot-scope="scope">
        <i class="el-icon-time"></i>
		<span style="margin-left: 10px">{{ scope.row.date }}</span>
	</template>
</el-table-column>
```

* 依懒项升级

```cmd
首先安装依赖
npm install -g npm-check-updates
然后检测依赖版本
ncu
更新dependencies到新版本：
ncu -u
更新全部到最新版本：
npm run install
```



#### Vue.js的实例

```js
var detail = new Vue({
    el: '#app',
    directives: {},//钩子函数的用法，自定义指令
    data: {
        #数据属性
    },
    components:{}, #组件注册，自定义局部组件
    props: {}, #父组件向子组件传递数据
    mounted: function () {
        #初始化
    },
    methods: {
        #函数方法
    },
    computed: {
        #computed中的函数必须用return返回最终的结果；属性的结果会被缓存，除非依赖的响应式属性变化才会重新计算。
        testFunction: function(){
    		return "";
		}
    },
     #render渲染函数
     render(h, context) {
        const { icon, title } = context.props
        const vnodes = []

        if (icon) {
          vnodes.push(<svg-icon icon-class={icon} />)
        }

        if (title) {
          vnodes.push(<span slot="title">{title}</span>)
        }
        return vnodes
      },
    /**使用场景
    computed 　　　　
        当一个属性受多个属性影响的时候就需要用到computed
        最典型的例子： 购物车商品结算的时候
    watch
        当一条数据影响多条数据的时候就需要用watch
        搜索数据**/
    watch:{
        #data里的数据属性监听 监听属性的变化
    }
    filters:{
    	#过滤器
 	}
})
```

##### Vue使用draggable实现拖拽

##### Vue使用goJs实现绘制流程图

##### Vue使用bpmn绘制流程图

* https://blog.csdn.net/haoyanyu_/article/details/100702315

```cmd
#安装
npm install bpmn-js
npm install bpmn-js-properties-panel //节点信息编辑面板
```



```cmd
#引用
import BpmnModdle from 'bpmn-js'; //默认入口是Viewer.js文件，只有预览流程图的功能；
import BpmnModdle from 'bpmn-js/lib/Modeler'; //如果手动引入bpmn-js/lib/Modeler，则具备左侧工具栏，可以编辑流程图
```



```vue
<template>
	<div style="">
		<div id="js-canvas"></div>
		<div id="js-properties-panel"></div>
		<div>
			<a-button @click="download">保存到本地</a-button>
			<button @click="createNew">新建</button>
		</div>
		<!-- <a-modal></a-modal> -->
	</div>
</template>
<script>
import BpmnModdle from 'bpmn-js/lib/Modeler';
import diagramXml from '../../../assets/diagram.bpmn'; //xml文件
import propertiesProviderModule from 'bpmn-js-properties-panel/lib/provider/camunda';

export default {
	name: 'bpmn',
	data() {
		return {
			viewer: null,
			canvas: null,
			bpmnText: '',
		}
	},
	mounted() {
		this.$nextTick().then(() => {

			this.canvas = document.getElementById('js-canvas')

			this.viewer = new BpmnModdle({
				container: this.canvas,
				keyboard: {
					bindTo: window
				},
				propertiesPanel: {
					parent: '#js-properties-panel'
				},
				additionalModules: [
					propertiesProviderModule
				]
			})
			this.create()
		})
	},
	methods: {
		download() {
			this.viewer.saveXML({ format: true }, (err, xml) => {
				if (xml) {
					this.bpmnText = xml
					var a = document.createElement('a');
					a.href = 'data:application/bpmn20-xml;charset=UTF-8,' + encodeURIComponent(xml)
					a.download = 'diagram.bpmn';
					document.body.appendChild(a);
					a.click();
					document.body.removeChild(a);
					a = null;
				}

			})
		},
		create() {
			this.bpmnText = diagramXml
			this.viewer.importXML(diagramXml, err => {
				if (err) {
					throw (err)
				}
				this.viewer.get('canvas').zoom('fit-viewport')
				var eventBus = this.viewer.get('eventBus');

				var events = [
					'element.click',
					'element.dblclick'
				]
				events.forEach(event => {
					eventBus.on(event, (e) => {
					})
				})
			})

		},
		createNew() {
			this.viewer.createDiagram(err => {
				if (err) {
					throw (err)
				}
				this.viewer.get('canvas').zoom('fit-viewport')
				var eventBus = this.viewer.get('eventBus');

				var events = [
					'element.click',
					'element.dblclick'
				]
				events.forEach(event => {
					eventBus.on(event, (e) => {
						// console.log(event, 'on', e.element.id)
					})
				})
			})
		}
	}
}
</script>
<style>
//引入样式，否则显示不出内容
@import 'bpmn-js/dist/assets/diagram-js.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn-codes.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn-embedded.css';
@import 'bpmn-js-properties-panel/dist/assets/bpmn-js-properties-panel.css';
</style>
```



#### 路由和组件的懒加载

```vue
路由和组件的常用两种懒加载方式：
1、vue异步组件实现路由懒加载
　　component：resolve=>(['需要加载的路由的地址'，resolve])
2、es提出的import(推荐使用这种方式)
　　const HelloWorld = （）=>import('需要加载的模块地址')
###例子#########
<template>
  <div class="hello">
  <One-com></One-com>
  1111
  </div>
</template>

<script>
export default {
  components:{
    "One-com":resolve=>(['./one'],resolve)
     // "One-com": resolve => require(['../components/study/css'],resolve)
     // "One-com": ()=>import("./one");
  },
  data(){
  }
}
</script>
```

#### 组件传递参数

```vue
#1 子组件主动获取父组件的数据和方法：  
    this.$parent.数据
    this.$parent.方法
#2 父组件传递参数
<child-first :value="form" :father="this"></child-first>//父组件 把当前对象传过去
//接收父组件传过来的对象  
props:{
    value:{},
    father:Object
}
```

##### 全局自定义组件、指令

```js
export default {
	install(Vue,option){
		组件
		指令
		混入
		挂载vue原型
	}
}
```

* 全局自定义组件

* 全局自定义指令

  ```js
  export default{
  	install(Vue){
  		Vue.directive('pre',{
  			inserted(button,bind){
  				button.addEventListener('click',()=>{
  					if(!button.disabled){
  						button.disabled = true;
  						setTimeout(()=>{
  							button.disabled = false
  						},1000)
  					}
  				})
  			}
  		})
  	}
  }
  ```

  在main.js中引用

```js
import pre from '@/aiqi'
Vue.use(pre)
```



#### this.$的调用参数或方法

* this.$refs //获取dom元素

```vue
<input ref='aaa' type="text" />

this.$refs.aaa.value='20' //this.$refs['aaa']
```

获取this.$refs.aaa 里面的数据是，只能在mounted里获取，created是获取不到的

* this.emit //子组件通过this.$emit方式向父组件传递参

```vue
//子组件调用  this.$emit('closeMain',flag);
//父组件传递子组件方法如下 v-on可以用@代替
<indexImportOrder ref="indexImportOrder" v-on:closeMain="closeMain"/>
父组件实现方法
closeMain(arguments){
    ....
},


父组件调用子组件的方法
this.$refs.child.method();
this.$refs.child.$emit("childmethod")
this.$refs.child.$on("childmethod")
```

* this.$store //全局 

  https://blog.csdn.net/lemonC77/article/details/95077691 
  
  *  this.$store.dispatch('login', param).then( ()=> {})来调取store里的user.js的login方法，从而要更新。

```js
export default new Vuex.Store({
    state,
    getters,
    actions, //Action 提交的是 mutation，而不是直接变更状态。 Action 可以包含任意异步操作通过通过 store.dispatch 方法触发
    mutations,  //mutations类似于事件注册，必须用 commit()方法调用
    modules,
})

用法： $store.state
```

**注：必须要用commit(‘SET_TOKEN’, tokenV)调用mutations里的方法，才能在store存储成功。**

* this.router //路由

* this.$set //触发对象更新

  **当你发现你给对象加了一个属性，在控制台能打印出来，但是却没有更新到视图上时，也许这个时候就需要用到this.$set（）这个方法了**

  ```vue
  this.$set( target, key, value )
  ```

  



#### axios的使用 推荐用vue-resource

```js
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

# vue的ajax不要用axios, 这个在ie11不兼容, 用vue-resource

<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>

https://www.runoob.com/vue2/vuejs-ajax.html
```

```js
// 基于全局Vue对象使用http
Vue.http.get('/someUrl', [options]).then(successCallback, errorCallback);
Vue.http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);

// 在一个Vue实例内使用$http
this.$http.get('/someUrl', [options]).then(successCallback, errorCallback);
this.$http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);


get和post的携带参数方式不一样
http.get(URL,{  
        params: {  
            "id":id  
        }  
    })  
```

#### mapGetters的用法

```js
export default {
    computed: {
      ...mapGetters([
        'singer'
      ]),
    }
    ....
  }  
最终会转换成

  export default {
    computed: {
      singer() {
        return this.$store.state.singer  
          //这里要注意store的注册用法
      }
    }
    ...
  }  
```

#### 查看依赖版本号

- version 必须确切匹配这个version
- \>version 必须大于这个version
- \>=version 必须大于等于这个version
- < version 必须小于这个version
- <=version 必须小于等于这个version
- ~version 大约相当于version
- ^version 与version兼容
- 1.2.x 可以是1.2.0、1.2.1等，但不能是1.3.0
- http://… URL作为依赖项
- \* 匹配任何版本
- “”(空字符串) 匹配任何版本，和*一样
- version1 - version2 相当于 >=version1 <=version2
- range1 || range2 range1或range2其中一个满足时采用该version
- git… Git URL作为依赖项
- user/repo GitHub URLs
- tag 一个以tag发布的指定版本，参考[npm-tag](https://docs.npmjs.com/cli/tag)
- path/path/path 本地Paths

#### npm install的几种命令形式

我们在使用 npm install 安装模块的模块的时候 ，一般会使用下面这几种命令形式：

```shell
npm install moduleName # 安装模块到项目目录下` 
npm install -g moduleName # -g 的意思是将模块安装到全局，具体安装到磁盘哪个位置，要看 npm config prefix 的位置。
npm install -save moduleName # -save 的意思是将模块安装到项目目录下，并在package文件的dependencies节点写入依赖
npm install -save-dev moduleName # -save-dev 的意思是将模块安装到项目目录下，并在package文件的devDependencies节点写入依赖。`

#安装指定版本
npm install -g moduleName@Version
#卸载
npm uninstall moduleName

```

那么问题来了，在项目中我们应该使用四个命令中的哪个呢？这个就要视情况而定了。下面对这四个命令进行对比，看完后你就不再这么问了。

##### npm install moduleName 命令

```
安装模块到项目node_modules目录下。
不会将模块依赖写入devDependencies或dependencies 节点。
运行 npm install 初始化项目时不会下载模块。
```

##### npm install -g moduleName 命令

```
 安装模块到全局，不会在项目node_modules目录中保存模块包。
 不会将模块依赖写入devDependencies或dependencies 节点。
 运行 npm install 初始化项目时不会下载模块。
```

##### npm install -save moduleName 命令

```
 安装模块到项目node_modules目录下。
 会将模块依赖写入dependencies 节点。
 运行 npm install 初始化项目时，会将模块下载到项目目录下。
 运行npm install --production或者注明NODE_ENV变量值为production时，**会**自动下载模块到node_modules目录中。
```

##### npm install -save-dev moduleName 命令

```
 安装模块到项目node_modules目录下。
 会将模块依赖写入devDependencies 节点。
 运行 npm install 初始化项目时，会将模块下载到项目目录下。
 运行npm install --production或者注明NODE_ENV变量值为production时，**不会**自动下载模块到node_modules目录中。
```

**备注：**

devDependencies 节点下的模块是我们在开发时需要用的，比如项目中使用的 gulp ，压缩css、js的模块。这些模块在我们的项目部署后是不需要的，所以我们可以使用 -save-dev 的形式安装。像 express 这些模块是项目运行必备的，应该安装在 dependencies 节点下，所以我们应该使用 -save 的形式安装。

------

##### vue使用ESLint代码规范和格式规范prettier

在vue-cli在init初始化时会询问是否需要添加ESLint，确认之后在创建的项目中就会出现.eslintignore和.eslintrc.js两个文件。

>  .eslintignore类似Git的.gitignore用来忽略一些文件不使用ESLint检查。
>  .eslintrc.js是ESLint配置文件，用来设置插件、自定义规则、解析器等配置。
>
> 



> 如何在老项目中增加规则https://blog.csdn.net/IT_HLM/article/details/78776630



> #### 需要安装`prettier`
>
> 首先肯定是需要安装`prettier`，并且你的项目中已经使用了ESLint，有`eslintrc.js`配置文件
>
> ```
> npm i -D prettier
> ```
>
> #### 配合ESLint检测代码风格
>
> 安装插件：
>
> ```
> npm i -D eslint-plugin-prettier
> ```
>
> 接下来，我们需要在rules中添加，`"prettier/prettier": "error"`，表示被prettier标记的地方抛出错误信息。
>
> ```
> //.eslintrc.js
> {
>   "plugins": ["prettier"],
>   "rules": {
>     "prettier/prettier": "error"
>   }
> }
> ```
>
> 如果你的eslint是直接通过cli方式启动的，那么只需要在后面加上fix即可，如：`eslint --fix`。
>
> #### 如果与已存在的插件冲突怎么办
>
> ```
> npm i -D eslint-config-prettier
> ```
>
> 通过使用eslint-config-prettier配置，能够关闭一些不必要的或者是与prettier冲突的lint选项。这样我们就不会看到一些error同时出现两次。**使用的时候需要确保，这个配置在extends的最后一项。**
>
> ```js
> //.eslintrc.js
> {
>   extends: [
>     'standard', //使用standard做代码规范
>     "prettier",
>   ],
> }
> 
> //实际例子.eslintrc.js
> module.exports = {
>   root: true,
>   env: {
>     node: true
>   },
>   extends: ['plugin:vue/essential', 'plugin:prettier/recommended', 'eslint:recommended'],
>   rules: {
>     'no-console': ['error', { allow: ['warn', 'error'] }],
>     'no-debugger': 'error',
>     'space-before-function-paren': 0, // 函数（）前面是否必须要空格
>     'no-multiple-empty-lines': [1, { max: 2 }], // 空行最多不能超过2行
>     'no-tabs': 0,
>     'no-multi-spaces': 2,
>     'no-mixed-spaces-and-tabs': 0,
>     'no-irregular-whitespace': 2,
>     // indent: [2, 2],
>     'vue/require-default-prop': 0,
>     'vue/no-use-v-if-with-v-for': [
>       'error',
>       {
>         allowUsingIterationVar: true
>       }
>     ],
>     'vue/no-parsing-error': [
>       'error',
>       {
>         'invalid-first-character-of-tag-name': false
>       }
>     ],
>     'vue/html-self-closing': [
>       'error',
>       {
>         html: {
>           void: 'always',
>           normal: 'always',
>           component: 'always'
>         },
>         svg: 'always',
>         math: 'always'
>       }
>     ],
>     'prettier/prettier': 'error'
>   },
>   parserOptions: {
>     parser: 'babel-eslint'
>   }
> }
> 
> ```
>
> #### 什么？你们项目没有启用ESLint
>
> 不要慌，没有ESLint也不要怕，可以通过[onchange](https://www.npmjs.com/package/onchange)进行代码的监听，然后自动格式化代码。只要在package.json的scripts下添加如下代码，然后使用`npm run format`，我们就能监听src目录下所有的js文件并进行格式化：
>
> ```
> "scripts": {
>   "format": "onchange 'src/**/*.js' -- prettier --write {{changed}}"
> }
> ```
>
> 当你想格式化的文件不止js文件时，也可以添加多个文件列表。
>
> ```
> "scripts": {
>   "format": "onchange 'test/**/*.js' 'src/**/*.js' 'src/**/*.vue' -- prettier --write {{changed}}"
> }
> ```

#### 如何对Prettier进行配置

一共有三种方式支持对Prettier进行配置：

1. 根目录创建`.prettierrc `文件，能够写入YML、JSON的配置格式，并且支持`.yaml/.yml/.json/.js`后缀；
2. 根目录创建`.prettier.config.js `文件，并对外export一个对象；
3. 在`package.json`中新建`prettier`属性。

下面我们使用`prettierrc.js`的方式对prettier进行配置，同时讲解下各个配置的作用。

```js
module.exports = {
  "printWidth": 80, //一行的字符数，如果超过会进行换行，默认为80
  "tabWidth": 2, //一个tab代表几个空格数，默认为80
  "useTabs": false, //是否使用tab进行缩进，默认为false，表示用空格进行缩减
  "singleQuote": false, //字符串是否使用单引号，默认为false，使用双引号
  "semi": true, //行位是否使用分号，默认为true
  "trailingComma": "none", //是否使用尾逗号，有三个可选值"<none|es5|all>"
  "bracketSpacing": true, //对象大括号直接是否有空格，默认为true，效果：{ foo: bar }
  "parser": "babylon" //代码的解析引擎，默认为babylon，与babel相同。
}
```

配置大概列出了这些，还有一些其他配置可以在[官方文档](https://prettier.io/docs/en/options.html)进行查阅。

最后贴一下我们项目中的完整配置，是在vue-cli生成的代码基础上修改的，并且使用standard做代码规范：

```js
module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint'
  },
  env: {
    browser: true,
    es6: true
  },
  extends: [
    // https://github.com/standard/standard/blob/master/docs/RULES-en.md
    'standard',
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    'plugin:vue/essential',
    "plugin:prettier/recommended",
  ],
  // required to lint *.vue files
  plugins: [
    'vue'
  ],
  // add your custom rules here
  rules: {
    "prettier/prettier": "error",
    // allow async-await
    'generator-star-spacing': 'off',
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off'
  }
}
```



#### Tomcat部署vue项目

* tomcat部署

1. 将vue项目打包，会生成一个dist文件夹

```
npm run build
```

1. 将dist文件夹中的内容复制到Tomcat的webapps/ROOT目录下（Tomcat默认的根目录就是webapps/ROOT目录）
2. 启动Tomcat，浏览器访问 `http://localhost:8080/` 即可

* linux部署

利用nginx转发地址？

#### nrm的使用

nrm(npm registry manager )是npm的镜像源管理工具，有时候国外资源太慢，使用这个就可以快速地在 npm 源间切换

```shell
npm install -g nrm@1.1.0，#全局安装nrm
nrm ls  #-- 查看所有镜像源 * 为当前使用源
nrm use taobao #如果要切换到taobao源，执行命令
nrm add group http://nexus-nc.fxnotary.com/repository/npmjs-group/   
nrm add <registry> <url>，#其中reigstry为源名，url为源的路径。
nrm del <registry> #删除对应的源。
nrm test npm #测试相应源的响应时间
```

```shell
#查看所有源
方式1. npm config list
方式2. npm get registry

# [临时使用]
npm install --registry=https://registry.npm.taobao.org

# [一般永久使用]通过 config 配置指向国内镜像源
# cnpmjs.org
$ npm config set registry http://registry.cnpmjs.org
# npm.taobao.org
$ npm config set registry http://registry.npm.taobao.org

如果有一天，换的源用不上了，用rm命令删掉它：npm config rm registry
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

- 访问map中的key

```bash
${key}
```

- 访问pojo中的属性

```bash
${key.property}
```

- 取集合中的数据

```xml
<#list studentList as student>
 <tr> 
<td>${student.id}</td>
<td>${studnet.name}</td>
</tr>
</#list>
```

- 取循环中的下标

```bash
<#list studentList as student>
    ${student_index}
</#list>
```

- 判断

```csharp
<#if student_index % 2 == 0>
<#else>
</#if>
```

- 日期类型格式化

```xml
<!-- 可以使用?date,?time,?datetime,?string(parten)-->
当前日期：${date?string("yyyy/MM/dd HH:mm:ss")}
```

- null值的处理

```kotlin
${val!"val的值为null"}<br>
    判断val的值是否为null：<br>
    <#if val??>
    val中有内容
    <#else>
    val的值为null
    </#if>
```

- Include标签

```cpp
<#include "hello.ftl">
```



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

* 字符串的操作

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

#### java中利用ftl生成文件

```java
@Test
public void genFile() throws Exception {
    // 第一步：创建一个Configuration对象，直接new一个对象。构造方法的参数就是freemarker对于的版本号。
    Configuration configuration = new Configuration(Configuration.getVersion());
    // 第二步：设置模板文件所在的路径。
    configuration.setDirectoryForTemplateLoading(new File("D:/workspace/e3/e3-item-web/src/main/webapp/WEB-INF/ftl"));
    // 第三步：设置模板文件使用的字符集。一般就是utf-8.
    configuration.setDefaultEncoding("utf-8");
    // 第四步：加载一个模板，创建一个模板对象。
    Template template = configuration.getTemplate("hello.ftl");
    // 第五步：创建一个模板使用的数据集，可以是pojo也可以是map。一般是Map。
    Map dataModel = new HashMap<>();
    //向数据集中添加数据
    dataModel.put("hello", "this is my first freemarker test.");
    // 第六步：创建一个Writer对象，一般创建一FileWriter对象，指定生成的文件名。
    Writer out = new FileWriter(new File("D:/aaa/out/hello.html"));
    // 第七步：调用模板对象的process方法输出文件。
    template.process(dataModel, out);
    // 第八步：关闭流。
    out.close();
}
```



### java打包项目的配置

src/main/java下的默认只打包java文件，如果想打包xml文件，则加如下配置

```xml
#pom.xml
<build>
    <!-- 资源目录 -->    
    <resources>    
        <resource>    
            <!-- 设定主资源目录  -->    
            <directory>src/main/java</directory>    

            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，只处理如下配置中包含的资源类型 -->     
            <includes>
                <include>**/*.xml</include>
            </includes>  

            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，不处理如下配置中包含的资源类型（剔除下如下配置中包含的资源类型）-->      
            <excludes>  
                <exclude>**/*.yaml</exclude>  
            </excludes>  
<!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，指定处理后的资源文件输出目录，默认是${build.outputDirectory}指定的目录-->      
            <!--<targetPath>${build.outputDirectory}</targetPath> -->      

            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，是否对主资源目录开启资源过滤 -->    
            <filtering>true</filtering>     
        </resource>  			
    </resources> 	
</build>
```

#### 默认resources目录下的文件都会被打包

如果想resources目录下的xml文件不被打包，可通过如下配置:

```html
<!--过滤resource下的文件-->
	<resources>  
        <resource>  
            <directory>src/main/resources</directory>  
            <includes>  
                <include>*.properties</include>  <!--打包properties文件-->
            </includes>  
            <excludes>  
                <exclude>*.xml</exclude>  <!--过滤xml与yaml文件-->
                <exclude>*.yaml</exclude>  
            </excludes>  
        </resource>  
```

插件完成

```xml
<build>
    <plugin>  
        <artifactId>maven-resources-plugin</artifactId>  
        <executions>  
            <execution>  
                <id>copy-resources</id>  
                <phase>validate</phase>  
                <goals>  
                    <goal>copy-resources</goal>  
                </goals>  
                <configuration>  
<!-- 并把文件复制到target/conf目录下-->
                    <outputDirectory>${project.build.directory}/conf</outputDirectory>  
                    <resources>  
                        <resource>  
                            <directory>src/main/resources</directory>  
<!-- 指定不需要处理的资源 <excludes> <exclude>WEB-INF/*.*</exclude> </excludes> -->  
							<excludes> <exclude>**/*.xml</exclude> </excludes>
                            <filtering>true</filtering>  
                        </resource>  
                    </resources>  
                </configuration>  
            </execution>  
        </executions> 
    </plugin> 
</build>build>
```



#### pluginManagement说明

假如存在两个项目，项目A为项目B的父项目，其关系通过pom文件的关系确定。项目A的父pom文件片段如下：

```xml
<build>
<pluginManagement>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-source-plugin</artifactId>
            <version>2.1</version>
            <configuration>
                <attach>true</attach>
            </configuration>
            <executions>
                <execution>
                    <phase>compile</phase>
                    <goals>
                        <goal>jar</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</pluginManagement>
</build>
```

如果项目B也想使用该plugin配置，则在项目B的子pom文件中只需要如下配置：

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-source-plugin</artifactId>
    </plugin>
</plugins>
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

### Hikari 号称“史上最快连接池”

```yaml
# 数据库配置
spring:
  datasource:
  type: com.zaxxer.hikari.HikariDataSource
  driverClassName: com.mysql.jdbc.Driver
  url: jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf-8&useSSL=false
  username: root
  password: root
  # Hikari 连接池配置
  # 最小空闲连接数量
  hikari:
    minimum-idle: 5
    # 空闲连接存活最大时间，默认600000（10分钟）
    idle-timeout: 180000
    # 连接池最大连接数，默认是10
    maximum-pool-size: 10
    # 此属性控制从池返回的连接的默认自动提交行为,默认值：true
    auto-commit: true
    # 连接池名称
    pool-name: MyHikariCP
    # 此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
    max-lifetime: 1800000
    # 数据库连接超时时间,默认30秒，即30000
    connection-timeout: 30000
    connection-test-query: SELECT 1
```



### Kibana 可视化工具 

* 与 搜索引擎Elasticsearch 合作
* 日志可视化工具

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



#### basicPublish方法

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

### nginx笔记

#### 安装

**nginx官网** http://nginx.org/en/download.html

```
进入用户组目录
# cd usr/local/src
下载组件
安装顺序 openssl安装  pcre安装 zlib安装 nginx安装

1.安装gcc、g++，用来编译源码；
$ yum install -y gcc gcc-c++
2.PCRE，Perl正则表达式；
$ yum install pcre pcre-devel
3.zlib，gzip压缩；
$ yum install zlib zlib-devel
4.OpenSSL，SSL协议。
$ yum install openssl openssl-devel
安装nginx
# 下载源码
$ wget http://nginx.org/download/nginx-1.13.0.tar.gz
# 解压源码
$ tar xvf nginx-1.13.0.tar.gz
# 进入源码目录
$ cd nginx-1.13.0
# 配置、编译、安装
$ ./configure
$ make
$ make install

找一下nginx安装到什么位置上了
# whereis nginx
# cd user/local/nginx

vim /usr/local/nginx/conf/nginx.conf 
启动
# user/local/nginx/sbin/nginx
```

报错了，error while loading shared libraries: libpcre.so.1: cannot open shared object file: No such file or directory，按照下面方式解决

```
1.用whereis libpcre.so.1命令找到libpcre.so.1在哪里
2.用ln -s /usr/local/lib/libpcre.so.1 /lib64命令做个软连接就可以了
3.用sbin/nginx启动Nginx
4.用ps -aux | grep nginx查看状态
# whereis libpcre.so.1
# ln -s /usr/local/lib/libpcre.so.1 /lib64
# sbin/nginx[root@localhost nginx]# ps -aux | grep nginx 
```

#### 常用命令

```
启动
[root@localhost ~]# /usr/local/nginx/sbin/nginx
停止/重启
[root@localhost ~]# /usr/local/nginx/sbin/nginx -s stop(quit、reload)
命令帮助
[root@localhost ~]# /usr/local/nginx/sbin/nginx -h
验证配置文件
[root@localhost ~]# /usr/local/nginx/sbin/nginx -t
配置文件
[root@localhost ~]# vim /usr/local/nginx/conf/nginx.conf
```

#### 配置

Nginx 是一款自由的、开源的、高性能的 HTTP **服务器和反向代理服务器**；同时也是一个 IMAP、POP3、SMTP 代理服务器。

Nginx 可以作为一个 HTTP 服务器进行网站的发布处理，另外 Nginx 可以作为**反向代理进行负载均衡**的实现。

```
cd /etc/nginx/
vim nginx.conf
cd /usr/sbin/
./nginx -s reload
```

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

#### 其它说明配置

**1、nginx作为静态资源服务器配置**

```
`location ^~/ceng/ {``   ``alias F:/html/html2/;``   ``#add_header Cache-Control no-store;``   ``#add_header expire -1;``}``location ^~/hehe/ {``   ``alias F:/html/;``  ``#add_header Cache-Control no-store;``  ``#add_header expire -1;``}`
```

 **强调** location 后的 "^~" 顺序不能反了

 

**2、nginx作为反向代理服务器配置**

```
`location ~ ^/test/{``   ``proxy_pass http:``//hello;``   ``proxy_read_timeout 180;``   ``client_max_body_size  1000m;``   ``proxy_redirect http:``//hello http://127.0.0.1:8001;` `}`
```

proxy_redirect参数说明：

   这个参数只在发生重定向时生效，

 前提：proxy_redirect http://hello http://127.0.0.1:8001; 其中 http://hello 为param1，http://127.0.0.1:8001为param2， host为http/https+IP+端口号

## RabbitMQ的和前端消息交互

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

## RocketMQ的使用

### 1、集成

```xml
<!--springcloud alibaba集成rocketmq 引入依赖-->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-stream-rocketmq</artifactId>
</dependency>

其它一些配置详解
#https://github.com/alibaba/spring-cloud-alibaba/wiki/RocketMQ
<dependency>
  <groupId>com.alibaba.cloud</groupId>
  <artifactId>spring-cloud-stream-binder-rocketmq</artifactId>
</dependency>
或者可以使用 Spring Cloud Stream RocketMQ Starter：
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-stream-rocketmq</artifactId>
</dependency>

```

```java
messageDelayLevel=1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h

Message msg=new Message();
msg.setTopic("TopicA");
msg.setTags("Tag");
msg.setBody("this is a delay message".getBytes());
//设置延迟level为5，对应延迟1分钟
msg.setDelayTimeLevel(5);
producer.send(msg);
```





## LINUX

### 查看日志的一些linux命令

```
# 查看文件，实时显示最后一页
tail  -f  filename        
# 实时查看日志文件 后一百行
tail - 100f  

# sz命令发送文件到本地：
sz filename
# rz命令本地上传文件到服务器：
rz  弹出回话框，选择文件上传
rz -y 文件名 上传并覆盖
 

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

.tar
打包语法：tar cvf newFileName.tar fileName || dirName 
解包语法：tar xvf newFileName.tar fileName（-C dirName）

打包成tar.gz格式压缩包
# tar -zcvf renwolesshel.tar.gz /renwolesshel
解压tar.gz格式压缩包
# tar zxvf renwolesshel.tar.gz
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

```js
#查询关键字
/+关键字 ，回车即可。此为从文档当前位置向下查找关键字，按n键查找关键字下一个位置；
?+关键字，回车即可。此为从文档挡圈位置向上查找关键字，按n键向上查找关键字；
```

#### linux定时任务

```shell
#添加任务
crontab -e
* * * * * /usr/local/sbin/test.sh

crontab -l #查看所有的定时任务


#不输出内容
*/5 * * * * /root/XXXX.sh &>/dev/null 2>&1
#将正确和错误日志都输出到 /tmp/load.log
*/1 * * * * /root/XXXX.sh > /tmp/load.log 2>&1 &
```

```shell
#linux应该都有crontab，没有的话可以安装一下：
yum install  vixie-cron
yum install  crontabs

安装完以后开启crontab服务
service crond start
用以下的方法启动、关闭这个cron服务： 
service crond start //启动服务 
service crond stop //关闭服务 
service crond restart //重启服务 
service crond reload //重新载入配置
加入开机自动启动: 
[root@CentOS ~]# chkconfig –level 35 crond on
取消开机自动启动crond服务: 
[root@CentOS ~]# chkconfig crond off

chmod 755 hello.sh，否则没有执行权限
新增调度任务可用两种方法： 
1)、在命令行输入: crontab -e 然后添加相应的任务，wq存盘退出。 
2)、直接编辑/etc/crontab 文件，即vi /etc/crontab，添加相应的任务。 
*/5 * * * * /usr/local/sbin/test.sh >> /usr/local/sbin/hello.sh

```

编写第一个shell文件，

```shell
#!/bin/bash
echo "hello world !!"

#!/bin/bash是必须要写的，表示要是/bin/bash这个执行脚本的命令执行接下来写的脚本, 
```



#### 查看端口是否被占用

```
netstat -ano | findstr 8080

或者 lsof -i:端口号
#查找进程
ps -ef|grep xxx
```

​	   杀死占用端口的进程

```
taskkill -pid 进程pid -f  //根据pid杀死的进程
```

#### 查看磁盘情况

```sh
#查看当前目录情况
df -h
df -i 查看inode使用情况 删除需慎重
#查看指定目录情况
df -h /usr/
#计算当前目录的大小
du -sh /usr/
```

#### 修改时区

```shell
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" >/etc/timezone

Linux ln命令是一个非常重要命令，它的功能是为某一个文件在另外一个位置建立一个同步的链接。
当我们需要在不同的目录，用到相同的文件时，我们不需要在每一个需要的目录下都放一个必须相同的文件，我们只要在某个固定的目录，放上该文件，然后在 其它的目录下用ln命令链接（link）它就可以，不必重复的占用磁盘空间。 
```

ln 命令说明

**软链接**

- 1.软链接，以路径的形式存在。类似于Windows操作系统中的快捷方式
- 2.软链接可以 跨文件系统 ，硬链接不可以
- 3.软链接可以对一个不存在的文件名进行链接
- 4.软链接可以对目录进行链接

**硬链接**

- 1.硬链接，以文件副本的形式存在。但不占用实际空间。
- 2.不允许给目录创建硬链接
- 3.硬链接只有在同一个文件系统中才能创建

**必要参数**

- -b 删除，覆盖以前建立的链接
- -d 允许超级用户制作目录的硬链接
- -f 强制执行
- -i 交互模式，文件存在则提示用户是否覆盖
- -n 把符号链接视为一般目录
- -s 软链接(符号链接)
- -v 显示详细的处理过程

------

### OpenOffice服务的启动命令

KKFileView预览项目 https://kkfileview.keking.cn/zh-cn/docs/production.html

* 在解压路径bin文件，运行startup脚本(Windows下以管理员身份运行`startup.bat`，Linux以root用户运行`startup.sh`）

* 浏览器访问本机8012端口（[http://127.0.0.1:8012](http://127.0.0.1:8012/) ）即可看到项目演示用首页

  

```js
#2、用以下命令启动OpenOffice服务 
cd D:\Program Files (x86)\OpenOffice 4\program
soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard 
# 远程调用
soffice -headless -accept="socket,host=192.168.88.65,port=8100;urp;" -nofirststartwizard &
```

* 自动启动

  ```
  修改配置文件
  vi /etc/rc.local
  
  添加如下命令
  soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &
  ```

  

```linux
#linux启动服务  好像和windows一样
1 /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard  临时启动
2 nohup /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &  后台启动
```

```java
# 关键转换代码
connection = new SocketOpenOfficeConnection("192.168.88.65", 8100);
connection.connect();
DocumentConverter converter = new StreamOpenOfficeDocumentConverter(connection); DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
DocumentFormat txt = formatReg.getFormatByFileExtension("odt");
DocumentFormat pdf = formatReg.getFormatByFileExtension("pdf");
converter.convert(inputFile, txt, outputFile, pdf);
connection.disconnect();

```



* CMD端口的问题



------

### springboot的邮件发送

#### 1.引入依赖

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-mail</artifactId>
</dependency>
<dependency>
    <groupId>com.sun.mail</groupId>
    <artifactId>javax.mail</artifactId>
    <version>1.6.2</version>
</dependency>
```

#### 2.发件人账号信息写入配置文件

```yml
spring:
    mail:
        default-encoding: utf-8  #设置编码格式
        host: smtp.qq.com        #这里用的是QQ邮箱，所以是qq.com
        password: *************  #注意此密码不是邮箱登陆密码，而是邮箱的授权码
        username: *******@qq.com #邮箱账号
```

#### 3.例子

```java
	@Value("${spring.mail.username}")
    private String from;
 
    @Autowired
    private JavaMailSender javaMailSender;
 
   /**
     * 功能描述：发送html邮件
     *
     * @param to      发送目标邮箱
     * @param subject 邮件标题
     * @param content 邮件内容
     */
    public void sendHtmlMail(String to, String subject, String content) throws MessagingException {
        //创建message
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        //发件人
        helper.setFrom(from);
        //收件人
        helper.setTo(to);
        //邮件标题
        helper.setSubject(subject);
        //true指的是html邮件
        helper.setText(content, true);
        //发送邮件
        javaMailSender.send(message);
    }
```

#### 4.调用示例

```java
 mailService.sendHtmlMail("5***17@qq.com", "helloWorld", "<h1 style='color:red'>helloWorld</h1>");
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



### POM配置私服maven地址

Nexus搭建私有仓库

Nexus的type说明

| type   | 具体说明                                   |
| :----- | :----------------------------------------- |
| hosted | 本地存储。像官方仓库一样提供本地私库功能   |
| proxy  | 提供代理其它仓库的类型                     |
| group  | 组类型，能够组合多个仓库为一个地址提供服务 |

注意只有类型为hosted才可以上传jar包，其它都不行

pom的仓库配置

```xml
<repositories>
    <repository>
        <id>nexus</id>
        <url>http://nexus.company.com/repository/maven-public/</url>
        <releases>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
            <checksumPolicy>warn</checksumPolicy>
        </releases>
        <snapshots>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
            <checksumPolicy>warn</checksumPolicy>
        </snapshots>
    </repository>
</repositories>
<distributionManagement>
    <repository>
        <!--id的名字可以任意取，但是在setting文件中的属性<server>的ID与这里一致-->
        <id>releases</id>
        <!--指向仓库类型为host(宿主仓库）的储存类型为Release的仓库-->
        <url>http://47.96.4.110:8081/repository/java-release/</url>
    </repository>
    <snapshotRepository>
        <id>snapshots</id>
        <!--指向仓库类型为host(宿主仓库）的储存类型为Snapshot的仓库-->
        <url>http://47.96.4.110:8081/repository/java-snapshot/</url>
    </snapshotRepository>
</distributionManagement>

```

#maven的conf的setting.xml文件设置

```xml
<!--此处设置的用户名和密码都是nexus的登陆配置-->
 <servers>
     <server>
         <id>releases</id>  <!--对应pom.xml的id=releases的仓库-->
         <username>xuxiaoxiao</username>
         <password>xuxiaoxiao123</password>
     </server>
     <server>
         <id>snapshots</id> <!--对应pom.xml中id=snapshots的仓库-->
         <username>xuxiaoxiao</username>
         <password>xuxiaoxiao123</password>
     </server>
</servers>
```

##### 在项目所在文件夹根目录使用maven命令打包时：

```
<!-- 不执行单元测试，也不编译测试类 -->
mvn install -Dmaven.test.skip=true

```

或

```xml
<!--不执行单元测试，但会编译测试类，并在target/test-classes目录下生成相应的class -->
mvn install -DskipTests=true
<!--不执行测试用例，但编译测试用例类生成相应的class文件至target/test-classes下。 -->
mvn clean package -DskipTests -U  //删除再打包，跳过测试 --常用

mvn package   // 生成target目录，编译、测试代码，生成测试报告，生成jar/war文件
<!-- -U 强制刷新本地仓库不存在release版和所有的snapshots版本。-->
<!--清空本地仓库的命令-->
mvn dependency:purge-local-repository
<!--查看jar包之间的依赖-->
mvn dependency:tree -U
mvn dependency:tree -U -f notary-cloud-provider-order/pom.xml
```

##### Maven父pom和子pom的版本号一并批量修改

```xml
Maven Release Plugin插件
1 设置新的版本号
mvn versions:set -DnewVersion=3.2.11.1-SNAPSHOT
2 撤销设置
mvn versions:revert
3 提交设置
mvn versions:commit

Versions Maven Plugin插件
mvn release:update-versions -DdevelopmentVersion=3.7.2-SNAPSHOT


//发布版本，添加tag
- mvn -DdevelopmentVersion=3.2.0-SNAPSHOT -DreleaseVersion=3.1.0 -Dresume=false -DignoreSnapshots=true -B release:prepare

//mvn release:prepare 发版本
//mvn release:rollback 回滚命令
//mvn release:clean 清除宏文件
//mvn release:perform 执行发布
```

##### git打tag命令

// 查看本地的所有Tag

```
git tag 可带上可选的 -l 选项 --list
```

创建tag命令

```
#轻量标签
git tag v1.4-lw
#带标注
git tag -a v1.0 -m "对Tag的描述信息"
```

 提交tag命令

```
git push origin v3.6.0
#这个是推送所有标签
git push origin --tags
```

删除tag命令

```
删除本地tag
git tag -d v3.7.0
要删除远程服务器上的tag，可以使用如下的命令：
git push origin --delete tag v3.7.0
```

##### git 根据tag创建分支

在项目中我们需要根据tag创建分支.现将创建步骤总结一下.在你的dev分支上有一个tag为v1.0

1.执行:git origin fetch 获得最新.

2.通过:git branch <new-branch-name> <tag-name> 会根据tag创建新的分支。

例如:git branch newbranch v1.0 . 会以tag v1.0创建新的分支newbranch。

3.可以通过git checkout newbranch 切换到新的分支。

4.通过 git push origin newbranch 把本地创建的分支提交到远程仓库。

现在远程仓库也会有新创建的分支了。

```shell
#删除本地分支
git branch -d  branch-name
#强制删除
git branch -D branch-name
#删除远程分支(慎用)：
git push origin --delete dev20181018
```

##### 强制git push命令慎用

```shell
#慎用
git push -f origin development 
#注释： origin远程仓库名，master分支名，-f为force，意为：强行、强制
```



#### Maven的脚本

```
<!-- 发布到私服 -->
mvn clean deploy -X -Dmaven.test.skip=true

如果想发布到snapshot仓库中，则需要在版本号后加上-SNAPSHOT(注意这里必须是大写)
snapshot快照库和release发布库
我们在开发阶段，可以将公用库的版本设置为快照版本，而被依赖组件则引用快照版本进行开发，在公用库的快照版本更新后，我们也不需要修改pom文件提示版本号来下载新的版本，直接mvn执行相关编译、打包命令即可重新下载最新的快照库了，从而也方便了我们进行开发。
```



```xml
发布到指定仓库
mvn deploy:deploy-file -DgroupId=com.xy.oracle -DartifactId=ojdbc14 -Dversion=10.2.0.4.0 -Dpackaging=jar -Dfile=E:\ojdbc14.jar -Durl=http://127.0.0.1:8081/nexus/content/repositories/thirdparty/ -DrepositoryId=thirdparty
```

#### Maven的scm配置git

* https://my.oschina.net/u/3744526/blog/4673956

```xml
<scm>#git项目地址可以用SSH  也可以用 HTTPS的          <connection>scm:git:http://10.69.205.31:8886/mazhenbang/maven_scm.git</connection>    #git项目地址可以用SSH  也可以用 HTTPS的    <developerConnection>scm:git:http://10.69.205.31:8886/mazhenbang/maven_scm.git</developerConnection>
    #git项目浏览器里的地址  <url>http://10.69.205.31:8886/mazhenbang/maven_scm/tree/master</url>
</scm>
#不要忘记加distributionManagement 否则发布不上去
```

#### maven中pom的scope理解

```
compile:默认值，表示当前依赖包，要参与当前项目的编译，后续测试，运行时，打包
provided:代表在编译和测试的时候用，运行，打包的时候不会打包进去
test：表示当前依赖包只参与测试时的工作：比如Junit,只在test目录生效
runtime：表示当前依赖包只参与运行周期，其他跳过了
system：从参与度和provided一致，不过被依赖项不会从maven远程仓库下载，而是从本地的系统拿。需要
systemPath属性来定义路径
#特殊
import 只能用在dependencyManagement块中，它将spring-boot-dependencies 中dependencyManagement下的dependencies插入到当前工程的dependencyManagement中，所以不存在依赖传递。 
当没有<scope>import</scope>时，意思是将spring-boot-dependencies 的dependencies全部插入到当前工程的dependencies中，并且会依赖传递。
```

#### maven中的各种打包类型

```xml
<packaging>pom</packaging>
packing默认是jar类型，
pom ---------> 父类型都为pom类型
jar ---------> 内部调用或者是作服务使用（一般只有class编译后文件）
war ---------> 需要部署的项目（war是一个web模块，其中需要包括WEB-INF）

```



#### maven的内置属性

```xml
Maven的六类属性，${project.basedir}，${project.build.directory}

${project.build.sourceDirectory}：项目的主源码目录，默认为 src/main/java

${project.build.testSourceDirectory}：项目的测试源码目录，默认为 src/test/java

${project.build.directory}：项目构件输出目录，默认为 target/

${project.outputDirectory}：项目主代码编译输出目录，默认为 target/classes/

${project.testOutputDirectory}：项目测试代码编译输出目录，默认为 target/test-classes/

${project.groupId}：项目的 groupId

${project.artifactId}：项目的 artifactId

p r o j e c t . v e r s i o n ： 项 目 的 v e r s i o n ， 与 {project.version}：项目的 version，与project.version：项目的version，与{version}等价

p r o j e c t . b u i l d . f i a n l N a m e ： 项 目 打 包 输 出 文 件 的 名 称 。 默 认 为 {project.build.fianlName}：项目打包输出文件的名称。默认为project.build.fianlName：项目打包输出文件的名称。默认为{project.artifactId}-${project.version}
```

* 设置编码格式

 ```xml
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
</properties>
 ```

* mvn

```xml
maven 默认的打包类型为 jar，
在项目聚合的时候，需要显式的将 父项目的 packing 指定为 pom，
然后再指定所属的子模块，如下所示
<packing>pom</packing>
<modules>
       <module>kern-base</module>
       <module>kern-dao</module>
       <module>kern-service</module>
       <module>kern-control</module>
</modules>
如果没有将packing 指定为pom ，那么子模块之间将无法正常的进行依赖传递。
我们执行的maven命令的时候将首先对父项目执行，而后当 父项目 的packing 类型为 pom 时，将对所有的子模块执行同样的命令，否则将无法执行同样的命令，那么依赖的传递将无法由maven 编译或者打包命令 得以执行。
```

* mvn的私服仓库配置

  ```xml
  <build>
      <plugins>
          <plugin>
              <groupId>org.apache.maven.plugins</groupId>
              <artifactId>maven-compiler-plugin</artifactId>
              <version>3.6.1</version>
              <configuration>
                  <source>1.8</source>
                  <target>1.8</target>
                  <encoding>UTF-8</encoding>
                  <optimize>true</optimize>
                  <showDeprecation>true</showDeprecation>
                  <showWarnings>true</showWarnings>
                  <compilerArgument>-Xlint:all,-serial,-path,-rawtypes,-unchecked</compilerArgument>
                  <!-- 跳过main-->
                  <skip>true</skip>
              </configuration>
          </plugin>
      </plugins>
     #静态文件的打包
      <resources>
          <resource>
              <directory>src/main/resources</directory>
              <includes>
                  <!-- 此处设置打成jar包后保留的静态资源文件 .txt .xml等-->
                  <include>**/*.md</include>
              </includes>
          </resource>
      </resources>
  </build>
  #需要package打包发到私服时，配置私服仓库
  然后在本地maven的settings.xml中加入配置server id要一致
  <!-- 使用分发管理将本项目打成jar包，直接上传到指定服务器 -->
  <distributionManagement>
      <!--正式版本-->
      <repository>
          <!-- nexus服务器中用户名：在settings.xml中<server>的id-->
          <id>yang</id>
          <!-- 这个名称自己定义 -->
          <name>Release repository</name>
          <url>http://192.168.1.105:8081/repository/yang/</url>
      </repository>
  	<!--快照
  	<snapshotRepository>
  		<id>nexus-snapshots</id>
  		<name>Snapshots repository</name>
  		<url>http://192.168.1.105/repository/yang/</url>
  	</snapshotRepository>-->
  </distributionManagement>
  ```

#### mvn命令jar包发到私服命

```shell
mvn deploy:deploy-file 
-Dfile=jar包 
-Dmaven.test.skip=true  
-DgroupId=groupID 
-DartifactId=artifacid 
-Dversion=版本号 
-Dpackaging=jar 
-Durl=http://ip:port/nexus/content/repositories/thirdparty/ 
-DrepositoryId=nexus
这个是为了避免打包多时间戳
-DuseUniqueVersions=false

说明：
DrepositoryId : 身份信息。可能是setting里的配置
```

**备注： 注意不要换行和多余空格**

```shell
mvn install:install-file 
-Dfile=D:\\asciidoctorj-pdf-1.5.0-alpha-zh.16.jar 
-DgroupId=org.asciidoctor 
-DartifactId=asciidoctorj-pdf 
-Dversion=1.5.0-alpha-zh.16 
-Dpackaging=jar
--------
然后再执行 mvn install

```

**用Maven属性渲染application.yml**

在pom文件build中配置

```xml
<build>
    <resources>
      <resource>
        <directory>src/main/resources</directory>
        <includes>
          <include>**/*</include>
        </includes>
        <filtering>true</filtering>
      </resource>
    </resources>
</build>

```

```xml
deploy去掉时间戳
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-war-plugin</artifactId>
    <version>3.1.0</version>
    <configuration>
        <archive>
            <manifest>
                <useUniqueVersions>false</useUniqueVersions>
            </manifest>
        </archive>
    </configuration>
</plugin>
```

### JenKins项目管理工具

* 安装BlueOcean插件的界面更美观 https://blog.csdn.net/fly910905/article/details/80331830

#### SHELL语法参数化脚本构建

1、dubbo的shell脚本

```shell
rm -f /root/.m2/repository/com/online/notary/online-service-api/1.0.0/online-service-api-1.0.0.jar
rm -f /root/.m2/repository/com/online/notary/online-common/1.0.0/online-common-1.0.0.jar
cp /root/.jenkins/workspace/测试环境-在线受理-项目/online-common/target/online-common-1.0.0.jar /root/.m2/repository/com/online/notary/online-common/1.0.0/
cp /root/.jenkins/workspace/测试环境-在线受理-项目/online-service-api/target/online-service-api-1.0.0.jar /root/.m2/repository/com/online/notary/online-service-api/1.0.0/

```

```shell
docker服务器
如有参数脚本执行命令： startup.sh conumer-order 18022
#! /bin/sh 文件名startup.sh
serviceName=$1
port=$2
containerId=`docker ps -a|grep $serviceName|awk '{print $1}'`
echo $containerId
if [ $containerId ]; then
     docker stop $containerId
	 docker rm $containerId
fi

docker run  -it -v  /usr/share/fonts:/usr/share/fonts  -d -p  $port:8080 --name $serviceName -m 1280M --env SKYWALKING_COLLECTOR_ARRE="192.168.88.116:11800" --env PROFILES_ACTIVE="test" --env SERVER_HOST="192.168.88.115" --env SERVER_PORT="$port" `docker images |grep $serviceName |awk '{print $2,$3}' |grep latest|awk '{print $2}'`
/*********这条是vue的脚本构建***********/
docker run  -d -p $port:8080 --name $serviceName  `docker images |grep $serviceName |awk '{print $2,$3}' |grep latest|awk '{print $2}'`  

```

###### docker启动的命令详解

```sh
-v 本地目录:容器目录。挂载主机的本地目录 /usr/ToolsAPIDir 目录到容器的/ToolsAPIDir1 目录，本地目录的路径必须是绝对路径
-a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项；
-d: 后台运行容器，并返回容器ID；
-i: 以交互模式运行容器，通常与 -t 同时使用；
-P: 随机端口映射，容器内部端口随机映射到主机的端口
-p: 指定端口映射，格式为：主机(宿主)端口:容器端口
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
-m :设置容器使用内存最大值；

-–name=“容器新名字”: 为容器指定一个名称；
--dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致；
--dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致；
-h "mars": 指定容器的hostname；
-e username="ritchie": 设置环境变量；
--env-file=[]: 从指定文件读入环境变量；
--cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行；
--net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型；
--link=[]: 添加链接到另一个容器；
--expose=[]: 开放一个端口或一组端口；
--volume , -v: 绑定一个卷
volumes：Docker管理宿主机文件系统的一部分，默认位于 /var/lib/docker/volumes 目录中；（最常用的方式）
```

```shell
# docker volume create edc-nginx-vol // 创建一个自定义容器卷
# docker volume ls // 查看所有容器卷
# docker volume inspect edc-nginx-vol // 查看指定容器卷详情信息
```

###### docker的例子

1、pom.xml添加docker打包插件

```
 <plugin>
	 <groupId>com.spotify</groupId>
	 <artifactId>dockerfile-maven-plugin</artifactId>
	 <version>1.3.6</version>
	 <configuration>
		 <repository>${project.artifactId}</repository>
		 <buildArgs>
	 		<JAR_FILE>target/${project.build.finalName}.jar</JAR_FILE>
		 </buildArgs>
	 </configuration>
 </plugin>
```

2、在src同级目录下创建Dockerfile

```dockerfile
FROM openjdk:8-jdk-alpine
或者FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-prometheus-java8
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

如服务的配置
FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-prometheus-openjdk
ADD target/${project.artifactId}-${project.version}.${project.packaging} ${project.artifactId}.${project.packaging}
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8080
EXPOSE 1234
ENTRYPOINT java -javaagent:/prometheus/${jmx_prometheus_javaagent.name}=1234:/prometheus/jmx_exporter.yaml -jar  -Xmx1024m -Dspring.profiles.active=${PROFILES_ACTIVE} -Dserver.port=8080 ${project.artifactId}.${project.packaging}
```

3、构建步骤

```
3.1 编译打包成jar包 mvn package -Dmaven.test.skip=true
3.2 将jar包打包成docker镜像：mvn dockerfile:build
```

4、运行命令：

```shell
docker run -d \
    -p 8001:8001 \
    -e "SPRING_PROFILES_ACTIVE=dev" \
    --name auth \
    -v /tmp/cloud-ac-service/auth/:/var/log/cloud-ac-service/auth \
    auth:latest
4.1 命令说明
使用 -e "SPRING_PROFILES_ACTIVE=dev"  指定spring profile
使用 -v /tmp/cloud-ac-service/auth/:/var/log/cloud-ac-service/auth  挂载日志目录

#sonarqube例子
docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest
```



##### springboot启动包选择环境

```shell
#文件名如startup.sh
sudo cp /home/gzy/online-service/online-service-1.0.0.jar /home/online_dubbox/online-service/20659/online-service-20659.jar
#####################
sudo /home/online_dubbox/online-service/20659/online-service-sit-20659.sh restart

#文件名 online-service-sit-20659.sh
#!/bin/sh/执行的脚本.sh
## java env
export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64
export JRE_HOME=$JAVA_HOME/jre

API_NAME=operation-online-back-api-20566
JAR_NAME=$API_NAME\.jar
SERVICE_DIR=/home/zxsl/online_dubbox/operation-online-back-api/20566
#PID  代表是PID文件
PID=$API_NAME\.pid

cd $SERVICE_DIR

#使用说明，用来提示输入参数
usage() {
    echo "Usage: sh 执行脚本.sh [start|stop|restart|status]"
    exit 1
}

#检查程序是否在运行
is_exist(){
  pid=`ps -ef|grep $JAR_NAME|grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}

#启动方法
start(){
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is already running PID=${pid} <<<"
#nohup 指后台运行
  else
    nohup $JRE_HOME/bin/java -Xms512m -Xmx1024m -jar $JAR_NAME --spring.profiles.active=common-pro,pro --dubbo.protocol.port=20666 --server.port=7671 --dubbo.service.shutdown.wait=180000 --dubbo.registry.file=/home/zxsl/online_dubbox/operation-online-service/20666/dubbo-registry.properties >/dev/null 2>&1 &
    echo $! > $SERVICE_DIR/$PID
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") start $JAR_NAME successed PID=$! <<<"
   fi
  }

#停止方法 3分钟停止不了，则强制停止
stop(){
  #is_exist
  pidf=$(cat $SERVICE_DIR/$PID)
  kill $pidf
  rm -rf $SERVICE_DIR/$PID
  sleep 2
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} PID = $pid begin kill -15 $pid  <<<"
    kill -15 $pid
    sleep 2
  fi
  i=0
  while true
  do
    is_exist
    if [ $? -eq "0" ]; then
	  if [[ $i -eq 181 ]]; then
	   echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} PID = $pid begin kill -9 $pid  <<<"
	   kill -9  $pid
	   sleep 2
	  else
        echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is working on the unfinished service. Please wait later....  <<<"
        sleep 1
		i=$(($i+1))
	  fi
    else
      echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} process stopped <<<"
      break;
    fi
  done

}

#输出运行状态
status(){
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is running PID is ${pid} <<<"
  else
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is not running <<<"
  fi
}

#重启
restart(){
  stop
  start
}

#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "restart")
    restart
    ;;
  *)
    usage
    ;;
esac
exit 0
```

##### springboot运行jar包选择环境

```sh
java -jar  spring-boot-demo-0.0.1-SNAPSHOT.jar --SOME_ENV=always --spring.profiles.active=prod
```

#### windowns启动jar命令

```
java -jar *.jar（*替换为需启动的jar包名称)
```



#### K8S的命令服务构建

```shell
#查看已经建的命名空间namespace
kubectl get ns

#跑java服务很简单，只需要写一个deloyment的yaml来制作pod，再写一个制作service的yaml来制作service，就ok了。 运行
kubectl apply -f xxx.yaml
#查看
docker images
#查看部分docker images|grep order

#order-consumer
#查看
kubectl -n notarycloud get po -owide
#115上执行的命令
#1
docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044
#2
docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044
#uat环境上执行的命令
#3 kubectl是k8s命令
kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044

#解释
#docker tag 是在115把最新的latest 打一个新的tag比如2020071711
#docker push 是把这个景象推送到镜像仓库
#kubectl -n notarycloud set image deployment 这句是在227执行，用新的镜像替换旧的镜像
#
#order-provider
kubectl -n notarycloud get po -owide 
docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511
#
docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511
#
kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511


```

 kubectl -n notarycloud get po -owide 的命令展示列的信息

| NAME    | READY | STATUS  | RESTARTS | AGE  | IP       | NODE   | NOMINATED NODE | READINESS GATES |
| ------- | ----- | ------- | -------- | ---- | -------- | ------ | -------------- | --------------- |
| nacos-0 | 1/1   | running | 0        | 27m  | 192.168. | k8s229 | <none>         | <none>          |



```shell
#k8s的其它命令
# 降为一个副本,确保配置有reload  测试环境目前只有一个副本，此命令不用执行
kubectl -n notarycloud scale deploy/mycat --replicas=1
# 恢复副本数量 测试环境目前只有一个副本，此命令不用执行
kubectl -n notarycloud scale deploy/mycat --replicas=2
```

##### 删除所有被驱逐的容器Evicted 

```cmd
#删除所有的
kubectl get pods --all-namespaces -o json | jq '.items[] | select(.status.reason!=null) | select(.status.reason | contains("Evicted")) | "kubectl delete pods \(.metadata.name) -n \(.metadata.namespace)"' | xargs -n 1 bash -c

#在命名空间中删除处于失败状态的Pod 
kubectl -n default delete pods --field-selector=status.phase=Failed

#
kubectl delete pod {podName}
#删除命名空间下的无效容器
kubectl -n notarycloud delete po/mycat- -hmkm7

```

```cmd
#更多详细信息
kubectl -n notarycloud describe  pod/postgresql-etcd-k8s229
# 伸缩 pod 副本
# 可用于将Deployment及其Pod缩小为零个副本，实际上杀死了所有副本。当您将其缩放回1/1时，将创建一个新的Pod，重新启动您的应用程序。
kubectl scale deploy/nginx-1 --replicas=0
kubectl scale deploy/nginx-1 --replicas=1

# 查看前一个 pod 的日志，logs -p 选项 
kubectl logs --tail 100 -p user-klvchen-v1.0-6f67dcc46b-5b4qb > pre.log
```



##### 用k8s的构建

```go
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'maven', image: 'maven:3-jdk-8-slim', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'docker', image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.12', ttyEnabled: true, command: 'cat')
	],
	volumes: [
		hostPathVolume(mountPath: '/home/jenkins/agent', hostPath: '/mnt/storage/docker/data/jenkins'),
		hostPathVolume(mountPath: '/root/.m2', hostPath: '/mnt/storage/docker/data/jenkins/.m2'),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
			stage('代码检出'){
				git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud.git'
			}
			
			stage('Maven构建') {
				container('maven') {
				    parallel (
						"autoconfigure": {
							stage('autoconfigure') {
								sh """
									# note: $PWD=/home/jenkins/agent/notary-cloud.git/
									# mvn -f commons/notary-cloud-common-autoconfigure/pom.xml deploy
									mvn -f pom.xml clean -Dmaven.test.skip=true install deploy
								"""
							}
						}
					)
				}
				container('maven') {
				    parallel (
						"order": {
							stage('order') {
								sh """
									mvn -f consumers/notary-cloud-consumer-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
									mvn -f providers/notary-cloud-provider-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
								"""
							}
						}
					)
				}
			}
			
			
			stage('镜像推送') {
				container('docker') {
					parallel (
						"order": {
							stage('order') {
								sh """
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER;
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER;
								"""
							}
						}
					)
				}
			}
			
			
			stage('K8S部署') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER --record;
						kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER --record;
					"""
				}
			}

    }
}

```

# PipeLine语法学习

https://www.w3cschool.cn/jenkins/jenkins-jg9528pb.html

https://www.jianshu.com/p/f1167e8850cd

https://testerhome.com/wiki/pipelinedoccn

```groovy
pipeline{
    agent any  //全局必须带有agent表明此pipeline执行节点
    stages{
        stage('代码检出'){
		   git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-order.git'
			}
        stage("first stage"){
            agent { label 'master' }  //具体执行的步骤节点，非必须
            steps{
                echo "this is first step"
            }
        }
    }
}
```

```go
#!groovy
pipeline {
  agent any
  tools {
    jdk 'java'
    maven 'maven'
  }
  stages {
    stage('git') {
      steps {
        git branch: '3.2.2', credentialsId: 'bbbc7963-0bb7-4b15-95a0-9d8e2c5c2b15', url: 'http://gitlab-sc.fxnotary.com/notary-cloud/notary-cloud-root.git'
      }
    }
    stage('build-deploy') {
      steps {
        sh 'mvn clean deploy -DskipTests'
      }
    }
  }
}

```



## Jenkis pipeline构建项目实践-编写podTemplate实现和k8s对接

```groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'maven', image: 'maven:3-jdk-8-slim', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'docker', image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.12', ttyEnabled: true, command: 'cat')
	],
	nodeSelector:'ci=jenkins',
	volumes: [
		nfsVolume(mountPath: '/home/jenkins/agent', serverAddress: '192.168.88.225', serverPath: '/mnt/file', readOnly: false),
		nfsVolume(mountPath: '/root/.m2', serverAddress: '192.168.88.225', serverPath: '/mnt/file/.m2', readOnly: false),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
			stage('代码检出'){
				git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-order.git'
			}
			
			def BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
			
			stage('Maven构建') {
				container('maven') {
				    parallel (
						"autoconfigure": {
							stage('autoconfigure') {
								sh """
									# note: $PWD=/home/jenkins/agent/notary-cloud.git/
									# mvn -f commons/notary-cloud-common-autoconfigure/pom.xml deploy
									mvn -f pom.xml clean -Dmaven.test.skip=true install deploy
								"""
							}
						}
					)
				}
				container('maven') {
				    parallel (
						"order": {
							stage('order') {
								sh """
									mvn -f notary-cloud-consumer-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
									mvn -f notary-cloud-provider-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
								"""
							}
						}
					)
				}
			}
			
			
			stage('镜像推送') {
				container('docker') {
					parallel (
						"order": {
							stage('order') {
								sh """
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION};
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION};
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION};
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION};
								"""
							}
						}
					)
				}
			}
			
			
			stage('K8S部署') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-consumer-order -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
						kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-provider-order -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
					"""
				}
			}

    }
}

```



### 例子2

```groovy
#!groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"

properties([
        parameters([
                string(
                        name: "gitRepositoryUrl",
                        description: "库地址",
                        defaultValue: "ssh://git@notarycloud-gitlab-ce/notary-cloud/notary-cloud-settlement.git"
                ),
                string(
                        name: "gitBranchName",
                        description: "分支名称",
                        defaultValue: "release"
                ),
                text(
                        name: "services",
                        description: "需要发布的服务名称(换行分割)",
                        defaultValue: "consumer-settlement\nprovider-settlement"
                )
        ]),
])

class BuildCli {

    def services = []
    def pom
    def version
    def originVersion

    BuildCli(serviceText, pom) {
        this.services = serviceText.split("\n").collect { it.trim() }
        this.pom = pom
        this.originVersion = pom.getVersion()
        this.version = pom.getVersion().replace("-SNAPSHOT", "")
    }

    def tag() {
        def o = ""
        services.each {
            o += """
            docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:latest registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version};
            docker push registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:latest;
            docker push registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version};
        """
        }
        return o
    }

    def deploy() {
        def o = ""
        services.each {
            o += """
                kubectl -n notarycloud set image deployment notary-cloud-${it} notary-cloud-${it}=registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version} --record;
                kubectl -n notarycloud patch deployment notary-cloud-${it} -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
            """
        }
        return o
    }

    @Override
    String toString() {
        return "${pom.getName()}-${originVersion}"
    }

}

podTemplate(
        label: label,
        containers: [
                containerTemplate(
                        name: "maven-docker-kubectl",
                        image: "registry.k8s.ing:5000/jenkins/maven-docker-kubectl:3",
                        ttyEnabled: true,
                        command: "cat"
                )
        ],
        nodeSelector: "ci=jenkins",
        volumes: [
                nfsVolume(mountPath: "/home/jenkins/agent", serverAddress: "192.168.88.225", serverPath: "/mnt/file", readOnly: false),
                nfsVolume(mountPath: "/root/.m2", serverAddress: "192.168.88.225", serverPath: "/mnt/file/.m2", readOnly: false),
                hostPathVolume(mountPath: "/var/run/docker.sock", hostPath: "/var/run/docker.sock")
        ])

{
    node(label) {
        stage("代码检出") {
            git branch: params.gitBranchName,
                credentialsId: "e71846ca-cbc1-4122-9f4f-5ea617666617",
                url: params.gitRepositoryUrl
        }
        def buildCli = new BuildCli(params.services, readMavenPom())
        stage("Build") {
            echo "########## Build ${buildCli.toString()} ##########"
            container("maven-docker-kubectl") {
                stage("Maven构建") {
                    sh "mvn clean -Dmaven.test.skip=true install deploy -f pom.xml -U"
                }
                stage("Image构建") {
                    sh "mvn dockerfile:build -f pom.xml"
                }
                stage("Tag & Push Image") {
                    echo buildCli.tag()
                    sh buildCli.tag()
                }
                stage("K8S Deploy") {
                    echo buildCli.deploy()
                    sh buildCli.deploy()
                }
            }
        }
    }
}

```

例子三

```groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(
    label: label, 
    containers: [
		containerTemplate(
            name: 'node', 
            image: 'node:lts-slim', 
            ttyEnabled: true, 
            command: 'cat'),
		containerTemplate(name: 'docker', 
                          image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', 
                          image: 'registry.k8s.ing:5000/jenkins/maven-docker-kubectl:3', ttyEnabled: true, command: 'cat')
	],
	nodeSelector:'ci=jenkins',
	volumes: [
		nfsVolume(mountPath: '/home/jenkins/agent', serverAddress: '192.168.88.225', serverPath: '/mnt/file', readOnly: false),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
		stage('CI') {
			stage('Checkout scm'){
				git branch: '3.5.0', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-admin.git'
			}
			
			def BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
			
			stage('Build artifics') {
				container('node') {
					sh """
					    yarn --registry http://nexus-nc.fxnotary.com/repository/npmjs-group/;
						yarn install;
						yarn build;
					"""
				}
			}
			
			stage('Push Docker image') {
				container('docker') {
					parallel (
						"front image": {
							stage('front image') {
								sh """
								docker build -t registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest .
								docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION};
								docker push registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest;
								docker push registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION};
								"""
							}
						}
					)
				}
			}
			
			stage('Deploy to K8S') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-admin-front notary-cloud-admin-front=registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-admin-front -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
					"""
				}
			}
			
        }
    }
}

```



3、脚本释义
podTemplate节指定创建pod的模板和环境

> Name：为pod的名称前缀
> Cloud：为构建pod的云环境，需要和前面新建的云环境名称一样
> Namespace：创建pod所在的namespace
> Label: 创建pod对应的标签
> serviceAccount：pod使用sa，这里使用default, 所以前文创建jenkins master deployment的时候多创建了一个default-role,这样自动创建出来的的jenkins-slave具有对应的api权限

containerTemplate节

> 指定创建容器的模板，当云环境里面配置pod模板后，容器模板以云环境的配置为准。

Volumes节

> 配置jenkins-slave pod挂载的卷，当云环境里面配置pod模板后，挂载卷以云环境配置为准

stage节为具体的pipeline步骤

> 这里第一步进行svn代码迁出；
> 第二步进行编译，并把包传到共享卷上面；
> 第三步对pod进行删除，因为应用采用deployment方式部署，所以可以实现重新创建pod，达到更新的效果。

# kubectl常用示例

* http://zhangblog.com/2020/08/09/kubernetes05/ 帮助文档地址

## 查看类命令

```shell
# 获取节点和服务版本信息
kubectl get nodes
# 获取节点和服务版本信息，并查看附加信息
kubectl get nodes -o wide

# 获取pod信息，默认是default名称空间
kubectl get pod
# 获取pod信息，默认是default名称空间，并查看附加信息【如：pod的IP及在哪个节点运行】
kubectl get pod -o wide
# 获取指定名称空间的pod
kubectl get pod -n kube-system
# 获取指定名称空间中的指定pod
kubectl get pod -n kube-system podName
# 获取所有名称空间的pod
kubectl get pod -A 
# 查看pod的详细信息，以yaml格式或json格式显示
kubectl get pods -o yaml
kubectl get pods -o json

# 查看pod的标签信息
kubectl get pod -A --show-labels 
# 根据Selector（label query）来查询pod
kubectl get pod -A --selector="k8s-app=kube-dns"

# 查看运行pod的环境变量
kubectl exec podName env
# 查看指定pod的日志
kubectl logs -f --tail 500 -n kube-system kube-apiserver-k8s-master

# 查看所有名称空间的service信息
kubectl get svc -A
# 查看指定名称空间的service信息
kubectl get svc -n kube-system

# 查看componentstatuses信息
kubectl get cs
# 查看所有configmaps信息
kubectl get cm -A
# 查看所有serviceaccounts信息
kubectl get sa -A
# 查看所有daemonsets信息
kubectl get ds -A
# 查看所有deployments信息
kubectl get deploy -A
# 查看所有replicasets信息
kubectl get rs -A
# 查看所有statefulsets信息
kubectl get sts -A
# 查看所有jobs信息
kubectl get jobs -A
# 查看所有ingresses信息
kubectl get ing -A
# 查看有哪些名称空间
kubectl get ns

# 查看pod的描述信息
kubectl describe pod podName
kubectl describe pod -n kube-system kube-apiserver-k8s-master  
# 查看指定名称空间中指定deploy的描述信息
kubectl describe deploy -n kube-system coredns

# 查看node或pod的资源使用情况
# 需要heapster 或metrics-server支持
kubectl top node
kubectl top pod 

# 查看集群信息
kubectl cluster-info   或  kubectl cluster-info dump
# 查看各组件信息【172.16.1.110为master机器】
kubectl -s https://172.16.1.110:6443 get componentstatuses
```

## 操作类命令

```shell
# 创建资源
kubectl create -f xxx.yaml
# 应用资源
kubectl apply -f xxx.yaml
# 应用资源，该目录下的所有 .yaml, .yml, 或 .json 文件都会被使用
kubectl apply -f <directory>
# 创建test名称空间
kubectl create namespace test

# 删除资源
kubectl delete -f xxx.yaml
kubectl delete -f <directory>
# 删除指定的pod
kubectl delete pod podName
# 删除指定名称空间的指定pod
kubectl delete pod -n test podName
# 删除其他资源
kubectl delete svc svcName
kubectl delete deploy deployName
kubectl delete ns nsName
# 强制删除
kubectl delete pod podName -n nsName --grace-period=0 --force
kubectl delete pod podName -n nsName --grace-period=1
kubectl delete pod podName -n nsName --now
```

## 进阶命令操作

```shell
# kubectl exec：进入pod启动的容器
kubectl exec -it podName -n nsName /bin/sh    #进入容器
kubectl exec -it podName -n nsName /bin/bash  #进入容器

# kubectl label：添加label值
kubectl label nodes k8s-node01 zone=north  #为指定节点添加标签 
kubectl label nodes k8s-node01 zone-       #为指定节点删除标签
kubectl label pod podName -n nsName role-name=test    #为指定pod添加标签
kubectl label pod podName -n nsName role-name=dev --overwrite  #修改lable标签值
kubectl label pod podName -n nsName role-name-        #删除lable标签

# kubectl滚动升级； 通过 kubectl apply -f myapp-deployment-v1.yaml 启动deploy
kubectl apply -f myapp-deployment-v2.yaml     #通过配置文件滚动升级
kubectl set image deploy/myapp-deployment myapp="registry.cn-beijing.aliyuncs.com/google_registry/myapp:v3"   #通过命令滚动升级
kubectl rollout undo deploy/myapp-deployment 或者 kubectl rollout undo deploy myapp-deployment    #pod回滚到前一个版本
kubectl rollout undo deploy/myapp-deployment --to-revision=2  #回滚到指定历史版本

# kubectl scale：动态伸缩
kubectl scale deploy myapp-deployment --replicas=5  # 动态伸缩
kubectl scale --replicas=8 -f myapp-deployment-v2.yaml  #动态伸缩【根据资源类型和名称伸缩，其他配置「如：镜像版本不同」不生效】
```

# 

#### 自动化构建一些插件

* DingTask 钉钉消息通知机器人
* 这里一定要注意Remote Directory  配置的目录，所有推到这台机器的文件，都只能保存到这个目录下面。最好不要配置 "/"
* `Publish Over SSH`,`Maven Integration plugin`,`Git plugin`



#### sounarQube代码质量监控在jenkins上的配置

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

```shell
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

##### sonarQube配合maven使用

* setting.xml的配置

```xml
<profile>
    <id>sonar</id>
    <activation>
        <activeByDefault>true</activeByDefault>
    </activation>
    <properties>
        <sonar.jdbc.url>jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8</sonar.jdbc.url>
        <sonar.jdbc.driver>com.mysql.jdbc.Driver</sonar.jdbc.driver>
        <sonar.jdbc.username>sonar</sonar.jdbc.username>
        <sonar.jdbc.password>sonar</sonar.jdbc.password>
        <sonar.host.url>http://localhost:9000</sonar.host.url>
    </properties>
</profile>
```

* 执行 **mvn clean install  sonar:sonar**
* 或者**mvn install -Dmaven.test.skip=true sonar:sonar**

#### skywalking

分布式跟踪的应用程序性能监控系统

```dockerfile
FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-openjdk
ADD target/${project.artifactId}-${project.version}.${project.packaging} ${project.artifactId}.${project.packaging}
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8080
ENTRYPOINT java -jar -javaagent:/agent/skywalking-agent.jar -Dskywalking.agent.service_name=${project.artifactId} -Dskywalking.collector.backend_service=${SKYWALKING_COLLECTOR_ARRE}  -Dskywalking.agent.sample_n_per_3_secs=1500 -Xmx1024m -Dspring.profiles.active=${PROFILES_ACTIVE} -Dserver.port=8080 ${project.artifactId}.${project.packaging}
```

### Spring-boot-admin的非常好用的监控和管理的源软件

* 实现钉钉机器人通知 https://blog.csdn.net/yuancao24/article/details/83576194

### Swagger2的 实时生成文档api

```xml
#引入依赖
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>2.9.2</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>2.9.2</version>
</dependency>
```

```java
#静态资源时候可能会拦截
/**
     * 静态资源使用
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/**").addResourceLocations(
                    "classpath:/static/");
            registry.addResourceHandler("swagger-ui.html").addResourceLocations(
                    "classpath:/META-INF/resources/");
            registry.addResourceHandler("/webjars/**").addResourceLocations(
                    "classpath:/META-INF/resources/webjars/");
    }
```

```java
Api
ApiModel
ApiModelProperty
ApiOperation
ApiParam
ApiResponse
ApiResponses
ResponseHeader
#常用注解
@Api(value="用户controller",tags={"用户操作接口"})
@Api(value = "/user", description = "Operations about user")
@ApiOperation(value="获取用户信息",tags={"获取用户信息copy"},response = Order,,notes="注意问题点")
 "用于方法；表示一个http请求的操作"
 @ApiParam() 用于方法，参数，字段说明；表示对参数的添加元数据（说明或是否必填等） 
 public User getUserInfo(@ApiParam(name="id",value="用户id",required=true) Long id,@ApiParam(name="username",value="用户名") String username) {
 
 @ApiModel()用于类 ；表示对类进行说明，用于参数用实体类接收 
 @ApiModel(value="user对象",description="用户对象user")
 @ApiModelProperty()用于方法，字段
  @ApiModelProperty(value="用户名",name="username",example="xingguo")

@ApiResponses({ @ApiResponse(code = 400, message = "Invalid Order") })

```



参考文档：

* https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins

### springboot 整合 sitemesh3

Sitemesh 是一个网页布局和修饰的框架，基于 Servlet 中的 Filter

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

### springboot使用ElasticSearch搜索引擎

* https://www.cnblogs.com/yijialong/p/9729988.html

#### Logstash详解之——input模块

实例

```
input {
    stdin {
    }
    jdbc {
      # mysql数据库连接
      jdbc_connection_string => "jdbc:mysql://192.168.88.65:3306/online_operation?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
      # mysqly用户名和密码
      jdbc_user => "root"
      jdbc_password => "2ojf#sojo23@29"
      # 驱动配置
      jdbc_driver_library => "/home/gzy/logstash-6.4.2/config/conf.d/mysql/mysql-connector-java-5.1.46.jar"
      # 驱动类名
      jdbc_driver_class => "com.mysql.jdbc.Driver"
      jdbc_paging_enabled => true
      jdbc_page_size => "500"
      # 执行指定的sql文件
      statement_filepath => "/home/gzy/logstash-6.4.2/config/conf.d/mysql/tb_notary.sql"
      # 设置监听 各字段含义 分 时 天 月  年 ，默认全部为*代表含义：每分钟都更新
      schedule => "*/10 * * * *"
      # 索引类型
      type => "tb_notary"
      use_column_value => true
      tracking_column_type => "timestamp"
      tracking_column => "gmt_modified"
      last_run_metadata_path => "/home/gzy/logstash-6.4.2/config/conf.d/mysql/lastrun/tb_notary.point"
    }
}

filter {
    json {
        source => "message"
        remove_field => ["message"]
    }
}

output {
    if[type]=="tb_notary"{
      elasticsearch {
        #es服务器
        hosts => ["localhost:9200"]
        #ES索引名称
        index => "tb_notary"
        #自增ID
        document_id => "%{id}"
        #manage_template => true  
        #使用templates
        template => "/home/gzy/logstash-6.4.2/config/templates/tb_notary.json"
        template_name => "tb_notary"
        template_overwrite => true
      }
    }
    stdout {

    }
}

```

```
logstash -f /etc/logstash.d/
#logstash 会自动读取 /etc/logstash.d/ 目录下所有 *.conf的文本文件，然后在自己内存里拼接成一个完整的大配置文件，再去执行。
```



```shell
input{
    file{
        #path属性接受的参数是一个数组，其含义是标明需要读取的文件位置
        path => [‘pathA’，‘pathB’]
        #表示多就去path路径下查看是够有新的文件产生。默认是15秒检查一次。
        discover_interval => 15
        #排除那些文件，也就是不去读取那些文件
        exclude => [‘fileName1’,‘fileNmae2’]
        #被监听的文件多久没更新后断开连接不在监听，默认是一个小时。
        close_older => 3600
        #在每次检查文件列 表的时候， 如果一个文件的最后 修改时间 超过这个值， 就忽略这个文件。 默认一天。
        ignore_older => 86400
        #logstash 每隔多 久检查一次被监听文件状态（ 是否有更新） ， 默认是 1 秒。
        stat_interval => 1
        #sincedb记录数据上一次的读取位置的一个index
        sincedb_path => ’$HOME/. sincedb‘
        #logstash 从什么 位置开始读取文件数据， 默认是结束位置 也可以设置为：beginning 从头开始
        start_position => ‘beginning’
        #注意：这里需要提醒大家的是，如果你需要每次都从同开始读取文件的话，关设置start_position => beginning是没有用的，你可以选择sincedb_path 定义为 /dev/null
    }            

}
input{
    jdbc{
    #jdbc sql server 驱动,各个数据库都有对应的驱动，需自己下载
    jdbc_driver_library => "/etc/logstash/driver.d/sqljdbc_2.0/enu/sqljdbc4.jar"
    #jdbc class 不同数据库有不同的 class 配置
    jdbc_driver_class => "com.microsoft.sqlserver.jdbc.SQLServerDriver"
    #配置数据库连接 ip 和端口，以及数据库    
    jdbc_connection_string => "jdbc:sqlserver://200.200.0.18:1433;databaseName=test_db"
    #配置数据库用户名
    jdbc_user =>   
    #配置数据库密码
    jdbc_password =>
    #上面这些都不重要，要是这些都看不懂的话，你的老板估计要考虑换人了。重要的是接下来的内容。
    # 定时器 多久执行一次SQL，默认是一分钟
    # schedule => 分 时 天 月 年  
    # schedule => * 22  *  *  * 表示每天22点执行一次
    schedule => "* * * * *"
    #是否清除 last_run_metadata_path 的记录,如果为真那么每次都相当于从头开始查询所有的数据库记录
    clean_run => false
    #是否需要记录某个column 的值,如果 record_last_run 为真,可以自定义我们需要表的字段名称，
    #此时该参数就要为 true. 否则默认 track 的是 timestamp 的值.
    use_column_value => true
    #如果 use_column_value 为真,需配置此参数. 这个参数就是数据库给出的一个字段名称。当然该字段必须是递增的，可以是 数据库的数据时间这类的
    tracking_column => create_time
    #是否记录上次执行结果, 如果为真,将会把上次执行到的 tracking_column 字段的值记录下来,保存到 last_run_metadata_path 指定的文件中
    record_last_run => true
    #们只需要在 SQL 语句中 WHERE MY_ID > :last_sql_value 即可. 其中 :last_sql_value 取得就是该文件中的值
    last_run_metadata_path => "/etc/logstash/run_metadata.d/my_info"
    #是否将字段名称转小写。
    #这里有个小的提示，如果你这前就处理过一次数据，并且在Kibana中有对应的搜索需求的话，还是改为true，
    #因为默认是true，并且Kibana是大小写区分的。准确的说应该是ES大小写区分
    lowercase_column_names => false
    #你的SQL的位置，当然，你的SQL也可以直接写在这里。
    #statement => SELECT * FROM tabeName t WHERE  t.creat_time > :last_sql_value
    statement_filepath => "/etc/logstash/statement_file.d/my_info.sql"
    #数据类型，标明你属于那一方势力。单了ES哪里好给你安排不同的山头。
    type => "my_info"
    }
    #注意：外载的SQL文件就是一个文本文件就可以了，还有需要注意的是，一个jdbc{}插件就只能处理一个SQL语句，
    #如果你有多个SQL需要处理的话，只能在重新建立一个jdbc{}插件。
}
input {
  beats {
    #接受数据端口
    port => 5044
    #数据类型
    type => "logs"
  }
  #这个插件需要和filebeat进行配很这里不做多讲，到时候结合起来一起介绍。
}
```

```shell

```

``` json
#templates 文件tb_notary.json
{
    "index_patterns": [
      "tb_tag"
    ],
    "settings": {
      "index": {
        "number_of_shards": 5,
        "number_of_replicas": 1,
        "codec": "best_compression"
      },
      "analysis" : {
            "analyzer" : {
                "pinyin_analyzer" : {
                    "tokenizer" : "my_pinyin"
                    },
                "comma":{
                  "type": "pattern",
                  "pattern": ",",
                  "lowercase": false
                },
                 "nohtml": {
                  "tokenizer": "ik_max_word",
                  "char_filter": ["html_strip"]
                }
            },
            "tokenizer" : {
                "my_pinyin" : {
                    "type" : "pinyin",
                    "keep_separate_first_letter" : false,
                    "keep_full_pinyin" : true,
                    "keep_original" : true,
                    "limit_first_letter_length" : 16,
                    "lowercase" : true,
                    "remove_duplicated_term" : true
                }
            }
        }
    },
    "mappings": {

      "doc": {
        "_meta": {
          "logstash-version": "6.4.2"
        },
        "dynamic": "true",

        "properties": {
                    "tagName": {
                      "type": "text",
                      "analyzer":"ik_smart",
                      "search_analyzer": "ik_smart",

                      "fields": {
                        "keyword": {
                          "type": "keyword",
                          "ignore_above": 4096
                        },
                        "pinyin":{
                          "type": "text",
                          "analyzer":"pinyin"
                        }
                      }
                    },
                    "gmtCreate": {
                                        "type":   "date",
                                        "format": "yyyy-MM-dd HH:mm:ss||epoch_millis"
                                    },
                    "gmtModified": {
                                        "type":   "date",
                                        "format": "yyyy-MM-dd HH:mm:ss||epoch_millis"
                                    }
                }
      }
    },
    "aliases": {}
}

```





### MYCAT爬坑

总结：  因为mycat中分片表中的分片字段是不能更新的，所以减少left join 的复杂SQL

* mycat 8066查询端口

* mycat 9066管理端口

  ```mssql
  # 动态加载schema.xml配置
  reload @@config;
  # 动态加载所有配置
  reload @@config_all;
  ```

  

### 其它

### NACOS

#### nacos生产环境的集群负载

JenKins

GitLab  ;  GitBook

```cmd
1、是修改了文件，没有任何 git 操作
git checkout -- aaa.html // 指定还原`aaa.html`文件
git checkout -- * 		 // 还原所有文件
2、修改了文件，并提交到暂存区（即：编辑之后，进行git add 但没有 git commit -m "留言xxx"）
git log --oneline         // 可以省略
git reset HEAD            // 回退到当前版本
git checkout -- aaa.html
3、修改了文件，并提交到仓库区（即：编辑之后，进行git add 并且 git commit -m "留言xxx"）
git log --oneline   // 可以省略
git reset HEAD^    // HEAD^ 是回退到上个版本	HEAD~数字 是回退到数字个版本
git checkout -- aaa.html
```



# 工具总结

pdman

onlyOffice开源文档编辑器

**前端：** Vue.js  React.js  微信小程序、 ElementUI 、BootStrap、TOPUI、LayUI

**后端：**Redis、MQ、SringBoot、Dubbo、SringCloud、Nacos、Mycat、Mybatis-PLUS、

**Linux：**Nginx、Docker、Kubernetes、Jenkins、kibana、elasticsearch、fastDFS、Portainer

**代码管理：** SVNtortoise、Git、GitLable、私服Nexus
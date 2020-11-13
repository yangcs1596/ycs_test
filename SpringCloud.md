# <span style="border-left: 5px solid rgb(248, 57, 41);">Sentinel+Nacos</span>

实现资源流控、降级、热点、授权

因为Sentinel控制台配置的规则是在内存中的，所以我们需要Nacos来存储规则实现持久化。

* `Sentinel`控制台安装

  可以在官网github上下载：https://github.com/alibaba/Sentinel/releases

* 启动脚本

  ```cmd
  java -Dserver.port=8080 -Dcsp.sentinel.dashboard.server=localhost:8080 -Dproject.name=sentinel-dashboard -jar sentinel-dashboard-1.8.0.jar
  ```

* 访问

  地址和账号密码 http://localhost:8080 账号：sentinel 密码：sentinel

## <span style="border-left: 5px solid rgb(248, 57, 41);">springboot项目接入Sentinel控制台配置规则</span>

* 引入依赖

```引入依赖
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-alibaba-sentinel</artifactId>
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

## <span style="border-left: 5px solid rgb(248, 57, 41);">springboot项目接入nacos</span>

* 引入依赖

  ```xml
  <dependency>
      <groupId>com.alibaba.csp</groupId>
      <artifactId>sentinel-datasource-nacos</artifactId>
  </dependency>
  ```

* **配置Nacos数据源**

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

* 在nacos新增配置

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



# <span style="border-left: 5px solid rgb(248, 57, 41);">markdown语法流程图</span>

```flow
st=>start: 开始
op=>operation: My Operation
cond=>condition: Yes or No?
e=>end
st->op->cond
cond(yes)->e
cond(no)->op

```






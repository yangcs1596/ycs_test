### 静态代码块

java类什么时候加载？，加载类的原理机制是怎么样的？

答：

很多人都不是很清楚java的class类什么时候加载在运行内存中，其实类加载的时间是发生在一下几种情况：

1.实例化对象时，就像spring管理的bean一样，在tomcat启动时就实例化了bean，那么这个对象bean的类就加载了

2.通过类名调用静态变量的时候（类名.class除外）



### java数字求和变成有很多小数位的小数?

```java
现象：
Double d1=904163.08;
Double d2=210298.99;
// 结果是：1114462.0699999998
```

```java
//修改方法 
BigDecimal b1 = new BigDecimal(Double.toString(904163.08));
BigDecimal b2 = new BigDecimal(Double.toString(210298.99));
//结果1114462.07
System.out.println(b1.add(b2).doubleValue());
```



## JVM调优

### jstat命令

 界面不太友好 

### headdump分析

不能重启服务后再dump, 会找不到

### mat工具分析

### gc日志分析

#### JMC工具

火焰图

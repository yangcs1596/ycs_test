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

### 排查命令工具

```
1、查看进程占用CPU情况：top -Hp [pid]
2、查看系统线程状态相关信息并追加到文件：jstack [pid] > [file]
3、查看虚拟机配置参数信息：jinfo -flags [pid]
4、jstat命令
   ***** 查询进程GC情况：jstat -gc [pid]
   ***** 每隔1秒查询进程GC情况，共20次：jstat -gc [pid] 1000 20
   ***** 同2，关注各个区域所占百分比：jstat -gcutil [pid] 1000 20
   注：显示Eden区、Survivor区、老年代、元空间、已用空间、垃圾收集时间合计等。

5、jmap命令

   ***** 显示堆中对象的统计信息：jmap -histo:live [pid] | head -20
   ***** 显示堆的详细信息：jmap -heap [pid]
   ***** 生成堆转储快照文件：jmap -dump:format=b,file=[name].hprof [pid]
   注：如果需要，通过参数 -XX:+HeapDumpOnOutOfMemoryError 可以让虚拟机在出现内存溢出异常的时候Dump出当前的内存堆转储快照。该命令有可能会导致Full GC。
   
###工具###
1、MemoryAnalyzer 
可集成鱼elipse 也可以单独使用
2、JProfiler
可集成于idea，也可单独使用。这边使用JProfiler对快照文件进行简单分析。
3、JConsole
jdk自带的可视化监控工具之一，可查看：
* 内存使用量，包括Old Gen、Eden Space、Survivor Space、Metaspace等使用量；
* 线程，包括峰值、活动的线程数，可监测死锁等；
* 类，包括已加载类数、加载总数等；
* 虚拟机概要等；
4、JVisualVM
jdk自带的可视化监控工具之一，可查看：


########常用jvm参数########
* 设置堆的初始容量：-Xms1024m
* 设置堆的最大容量：-Xmx1024m
* 设置年轻代容量：-Xmn512m
* 设置线程栈大小：-Xss128k
* 设置老年代与新生代配比：-XX:NewRatio=2
* 设置M区的初始容量：-XX:MetaspaceSize=256m
* 打印GC停顿时间：-XX:+PrintGCTimeStamps
* 打印GC停顿时间：-XX:+PrintGCDateStamps
* 打印GC详细日志：-XX:+PrintGCDetails
* 打印GC信息：-verbose:gc
* 指定GC日志的位置：-Xloggc:gc.log
* 设置Eden区与Survivor区配比：-XX:SurvivorRatio=8
* 启用CMS收集器：-XX:+UseConcMarkSweepGC
* 启用G1收集器：-XX:+UseG1GC
```



## JVM调优

堆区：

1、存储的全部是对象，每个对象都包含一个与之对应的class的信息。(class的目的是得到操作指令)

2、jvm只有一个堆区(heap)被所有线程共享，堆中不存放基本类型和对象引用，只存放对象本身 。

栈区:

1、每个线程包含一个栈区，栈中只保存基础数据类型的值和对象以及基础数据的引用

2、每个栈中的数据(基础数据类型和对象引用)都是私有的，其他栈不能访问。

3、栈分为3个部分：基本类型变量区、执行环境上下文、操作指令区(存放操作指令)。

方法区:

1、又叫静态区，跟堆一样，被所有的线程共享。方法区包含所有的class和static变量。

2、方法区中包含的都是在整个程序中永远唯一的元素，如class，static变量。 



### oom内存泄漏

* 不再会被使用的对象或者变量占用的内存不能被回收，就是内存泄露。

* **强引用**，使用最普遍的引用，一个对象具有强引用，不会被垃圾回收器回收。当内存空间不足，Java虚拟机宁愿抛出OutOfMemoryError错误，使程序异常终止，也不回收这种对象。

  **如果想取消强引用和某个对象之间的关联，可以显式地将引用赋值为null，这样可以使JVM在合适的时间就会回收该对象。**

  **弱引用**，JVM进行垃圾回收时，无论内存是否充足，都会回收被弱引用关联的对象。在java中，用java.lang.ref.WeakReference类来表示。可以在缓存中使用弱引用。

* GC回收机制-如何找到需要回收的对象

  JVM如何找到需要回收的对象，方式有两种：

  - 引用计数法：每个对象有一个引用计数属性，新增一个引用时计数加1，引用释放时计数减1，计数为0时可以回收，
  - 可达性分析法：从 GC Roots 开始向下搜索，搜索所走过的路径称为引用链。当一个对象到 GC Roots 没有任何引用链相连时，则证明此对象是不可用的，那么虚拟机就判断是可回收对象。

  > 引用计数法，可能会出现A 引用了 B，B 又引用了 A，这时候就算他们都不再使用了，但因为相互引用 计数器=1 永远无法被回收。

#### ThreaLocal内存泄漏总结

````
总结
由于Thread中包含变量ThreadLocalMap，因此ThreadLocalMap与Thread的生命周期是一样长，如果都没有手动删除对应key，都会导致内存泄漏。

但是使用弱引用可以多一层保障：弱引用ThreadLocal不会内存泄漏，对应的value在下一次ThreadLocalMap调用set(),get(),remove()的时候会被清除。

因此，ThreadLocal内存泄漏的根源是：由于ThreadLocalMap的生命周期跟Thread一样长，如果没有手动删除对应key就会导致内存泄漏，而不是因为弱引用。

ThreadLocal正确的使用方法
每次使用完ThreadLocal都调用它的remove()方法清除数据
将ThreadLocal变量定义成private static，这样就一直存在ThreadLocal的强引用，也就能保证任何时候都能通过ThreadLocal的弱引用访问到Entry的value值，进而清除掉 。


````

**2. 查看JVM信息**

2.1 查看整个JVM内存状态

```
jmap -heap [pid]
```

2.2 查看JVM堆中对象详细占用情况

```
jmap -histo [pid]
```

#### dump文件生成的命令

```shell
1、获取应用的pid
使用ps -ef | grep java查询服务器上的java应用进程信息，找到应用进程及id

可使用dmesg命令查看操作系统kill进程日记。
dmesg | egrep -i 'killed process' 
dmesg -T | grep 'Out of memory' 
dmesg －T | grep -E -i -B100 'killed process'

2、人工使用jmap获取dump信息
jmap -dump:format=b,file=/home/app/dump.out 17740
注：/home/app/dump.out表示生成的dump文件的存放地址及文件名，17740表示1中查询到的应用pid

出现OOM时自动生成堆dump
JVM启动命令增加两个参数:
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/home/dumps.out
所以启动命令
nohup java -jar -Xms32M -Xmx32M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/usr/local user-0.0.1-SNAPSHOT.jar  > log.file  2>&1 &

Jprofiler，有可视化界面，功能也比较完善，能够打开JVM工具(通过-XX:+HeapDumpOnOutOfMemoryError JVM参数触发)创建的hporf文件。

3、分析dump文件
可使用jstack命令分析，也可以使用eclipse memory analyzer工具分析


#
找到最耗内存的对象方法：jmap -histo:live 10765 | more
输入命令后，会以表格的形式显示存活对象的信息，并按照所占内存大小排序
```

- 执行代码时，通过设置JVM参数达到OOM的目的

```shell
 java -Xmx10m -Xms10m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=oom.hprof OomDemo 
```

-XX:+HeapDumpOnOutOfMemoryError和-XX:HeapDumpPath参数分别用于指定发生OOM是否要导出堆以及导出堆的文件路径

* 这个方法也可以通过jmap实时生成

```shell
jmap -dump:format=b,file=$java_pid.hprof     #java_pid为java进程ID

#
注意：获取dump文件必须是一出现内存异常就获取dump文件，这样获取的文件信息才比较准确，如果过了一段时间在导出dump文件，就会因gc的缘故，导致信息不准确，所以推荐java命令方式启动获取dump文件
```

* 使用MAT打开刚刚导出的hprof文件，选择报告里的泄露嫌疑分析 Leak Suspects Report




#### 性能分析工具jprofile

```

###工具###
1、MemoryAnalyzer 
可集成鱼elipse 也可以单独使用
2、JProfiler
可集成于idea，也可单独使用。这边使用JProfiler对快照文件进行简单分析。
3、JConsole
jdk自带的可视化监控工具之一，可查看：
* 内存使用量，包括Old Gen、Eden Space、Survivor Space、Metaspace等使用量；
* 线程，包括峰值、活动的线程数，可监测死锁等；
* 类，包括已加载类数、加载总数等；
* 虚拟机概要等；
4、JVisualVM
jdk自带的可视化监控工具之一，可查看：
```



### jstat命令

 界面不太友好 

### headdump分析

不能重启服务后再dump, 会找不到

### mat工具分析

### gc日志分析

```
java  -Xloggc:gc.log -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -jar mybatis-generator-1.0-SNAPSHOT.jar

nohup java -Xms512m -Xmx1024m -Xloggc:/opt/gc.log -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -jar lzmh-app.jar > out.log 2>&1 &

```



#### JMC工具

火焰图 （async-profiler）

### 线程

#### 一、查看进程所有线程的方法

* 1、top方法

ps -ef|grep 进程名称或者进程号

* 2、ps 方法

ps -T -p 进程号

* 3、pstree

pstree -Aup -h pid

#### 二、 杀掉某个进程的线程（未找到相关方法）

 1、lsof 方法

lsof -iTCP |grep ip

* 杀死僵尸进程

查看僵死进程：

 ps -A -o stat,ppid,pid,cmd | grep -e '^[Zz]'

杀掉进程

kill -9 pid



# java常用命令

```shell
1、jmap
生成dump文件: jmap -dump:live,format=b,file=dump.hprof 69616
jmap -heap pid 统计堆内存情况:  jmap -histo:live 69616

2、jps 
输出应用程序main.class的完整package名或者应用程序jar文件完整路径名。
-l	输出主类全名或jar路径
-q	只输出LVMID
-m	输出JVM启动时传递给main()的参数
-v	输出JVM启动时显示指定的JVM参数。

top | grep java

3、jstack 
jstack  pid 用于生成java虚拟机当前时刻的线程快照

4、jinfo
jinfo -flags pid : 打印当前指定java进程中已经设定的所有JVM参数信息
jinfo -flag [+|-] pid : 打开或关闭参数: jinfo -flag +PrintGC 7663
jinfo -sysprops pid : 打印当前java进程中设定的系统环境参数: jinfo -sysprops 7663
```




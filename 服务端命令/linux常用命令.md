## LINUX

Linux 最常用命令：能解决 95% 以上的问题  https://mp.weixin.qq.com/s/viqLYxd8HL99KntfTi9Ezg

### 文件操作

```shell
#新增文件
touch fileName
同时创建两个文件
touch test1.txt test2.txt
批量创建文件（如创建2000个文件）
touch test{0001..2000}.txt
#查看当前路径
pwd
#创建目录
mkdir /tmp/test
#创建递归目录
mkdir -p directory/../.. 
#删除文件
rm -rf '文件夹'  //千万注意不能使用【 rm -rf /* 】会导致系统瘫痪
#复制文件
cp /root/a.txt  /tmp/
#复制目录
cp -r /root /root2
#移动文件或者修改文件名
mv source target
```

```shell
cp [选项] 源文件 目标文件

选项：
-a：相当于 -d、-p、-r 选项的集合，这几个选项我们一一介绍；
-d：如果源文件为软链接（对硬链接无效），则复制出的目标文件也为软链接；
-i：询问，如果目标文件已经存在，则会询问是否覆盖；
-l：把目标文件建立为源文件的硬链接文件，而不是复制源文件；
-s：把目标文件建立为源文件的软链接文件，而不是复制源文件；
-p：复制后目标文件保留源文件的属性（包括所有者、所属组、权限和时间）；
-r：递归复制，用于复制目录；
-u：若目标文件比源文件有差异，则使用该选项可以更新目标文件，此选项可用于对文件的升级和备用。
```





### 清空文件内容

```shell
# > 这是一个重定向输出的符号
cat /dev/null > cloudbis.log

echo "">file_name
推荐使用cat命令。

使用vi/vim命令打开文件后，输入"%d"清空，后保存即可。但当文件内容较大时，处理较慢，命令如下：
vim file_name
:%d
```

### 日志关键字查找

```shell
#查看匹配的行数
grep -o 'x' /ect/tomcat.log |wc-|
#查看记录明细，查看后10行
grep '关键字' -A 1  /ect/tomcat.log|tail -n 10
例：grep 'error' -A 10  sdcc.log|tail -n 100

#查看一条前10行
grep -C 10 ‘具体行的唯一表示’ /etc/tomcat.log
#查看一条前后10行
cat -n hrun.log | grep "新增用户" -C 10
```

### lrzsz

```
lrzsz是一款程序，在linux中可以代替ftp的上传和下载

yum install -y lrzsz
```

### yum 安装指定目录

```cmd
指定目录安装：会把依赖、应用程序安装到指定目录
yum install  java-1.8.0-openjdk --installroot=/home/xxx/percona-xtrabackup/
```

### Linux 查看占用资源cpu、内存最大的进程命令

```shell
#CPU
ps aux|head -1;ps aux|grep -v PID|sort -rn -k 3|head
#内存
ps aux|head -1;ps aux|grep -v PID|sort -rn -k 4|head
```

### Linux 用户操作

```shell
### 
#切换用户命令
su - username #切换后则完全切换到了目标用户的环境
su username   #切换后的环境变量大部分还是切换前用户的环境
```

**文件位置：**

* /etc/passwd ：保存用户名称、宿主目录、登录shell等基本信息

* /etc/shadow ：保存用户的账号、密码等有效信息

- /etc/group —— 管理用户组相关信息
- /etc/gshadow —— 管理用户组管理员相关信息

```shell
## /etc/passwd
示例： head -5 /etc/passwd**
账号名称 : 密码 : UID : GID : 用户信息说明列 : 主文件夹 : shell
root : x : 0 : 0 : root : /root : /bin/bash
【/bin/bash】说明：登录Shell信息（/bin/bash为可登录系统，/sbin/nologin和bin/false为禁用户登录系统)

## /etc/shadow 参数说明
账号名称 : 密码 : 最近改动密码的日期 : 密码不可被改变的天数 : 密码需要重新更改的天数 : 更改提醒天数 : 密码过期后账号的宽限时间 : 账号失效日期 : 保留
root : (字符串，此处打码) : 200 : 0 : 99999 : 7 : : :

## /etc/group
用户组名称 : 用户组密码 : GID : 此用户组包含的账号名称

root : x : 0 : root
## /etc/gshadow
用户组名 : 密码 : 用户组管理员账号 : 该用户组包含的账号名称
root : : : root
```

#### 新增用户 useradd

https://zhuanlan.zhihu.com/p/105482468

```shell
# useradd [options] [username]
# passwd [options] [username] 重设密码
# adduser， useradd 默认不在 /home 下创建用户同名的主文件夹，而 adduser 默认创建
```

#### 文件权限chmod

```shell
语法：chmod [OPTION]... MODE[,MODE]... FILE...
其中的命令选项说明如下：
操作对象：
    u：用户user，表示文件或目录所有者
    g：用户组group，表示文件或目录所属组
    o：其他用户other
    a：所有用户all
操作符：
    +：添加权限
    -：减少权限
    =：给定特定权限
赋予的权限：
    r：读权限
    w：写权限
    x：执行权限
    
## 示例 将shell脚本变成可执行文件
chmod +x 文件名
 
```

#### 文件所属组chown

* 只允许root管理员

```shell
语法：chown [OPTION]... [OWNER][:[GROUP]] FILE...
其中的命令选项说明如下：
    -c : 显示更改的部分的信息
    -f : 忽略错误信息
    -h :修复符号链接
    -v : 显示详细的处理信息
    -R : 处理指定目录以及其子目录下的所有文件
 
chown [-cfhvR] [--help] [--version] user[:group] file...
    -c : 显示更改的部分的信息
    -f : 忽略错误信息
    -h : 修复符号链接
    -v : 显示详细的处理信息
    -R : 处理指定目录以及其子目录下的所有文件
    --help : 显示辅助说明
    --version : 显示版本
```

* 示例 文件权限操作

```shell
用法：chown 【选项】 用户【：用户组】 file
   
将test.java 文件所属的用户设置成 yangyuanliang
chown yangyuanliang test.php
     

将test.java 文件的所属用户设置成yangyuanliang，所属用户组设置成staff   
chown yangyuanliang:staff test.php

 
将test 及其内部文件所属用户设置成yangyuanliang，所属用户组设置成staff
chown -R yangyuanliang:staff  test/
```

#### 修改文件属组chgrp

* 只允许root管理员

```shell
语法：chgrp [OPTION]... GROUP FILE...
其中的命令选项说明如下：
-v：显示指令执行过程
-c：效果类似“-v”参数，但是只回报更改的部分
-f：不显示错误信息
-h：只修改符号连接的文件，而不对其他任何相关文件进行变动
-R：递归处理，即将指定目录下的所有文件及子目录一并处理
根据配置场景更改文件所属群组。
-c或--changes 效果类似"-v"参数，但仅回报更改的部分。
-f或--quiet或--silent 　不显示错误信息。
-h或--no-dereference 　只对符号连接的文件作修改，而不更动其他任何相关文件。
-R或--recursive 　递归处理，将指定目录下的所有文件及子目录一并处理。
-v或--verbose 　显示指令执行过程。
--help 　在线帮助。
--reference=<参考文件或目录> 　把指定文件或目录的所属群组全部设成和参考文件或目录的所属群组相同。
--version 　显示版本信息。
```



```
#更改权限
chgrp  用户名组  文件名  -R
切换所在组
chown 用户名组  文件名  
```



## Linux在任意目录下执行指定的脚本

### 安装jdk

### 环境变量

```shell
env 查看所有变量
```

```shell
## /etc/profile 配置java和maven环境
export PATH USER LOGNAME MAIL HOSTNAME HISTSIZE HISTCONTROL
export JAVA_HOME=/opt/jdk/jdk1.8.0_321
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export MAVEN_HOME=/opt/docker/maven/apache-maven-3.8.5
export PATH=${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH


#一种全局默认的路径为/etc/profile在profile中，它默认会再加载/etc/bash.bashrc。
#另一种用户自己的就是$HOME目录下的.profile它默认会载加载.bashrc文件。
#方式一
view /etc/profile
export PATH="变量路径"

## 重新加载 一定要执行
source profile

#方式二修改.bashrc
 vim /root/.bashrc
export PATH="变量路径"

#关键字
nohup 表示不关闭，后台运行进程
kill -9  进程号

#直接在shell下用export命令修改
#export PATH="$var_PATH"
#export 可查看当前系统下的所有环境变量.

编辑后需要生效
source /etc/profile

source .bash_profile


将shell脚本变成可执行文件
chmod +x 文件名
```

#### Linux的host配置

```linux
vim /etc/hosts
#生效
sudo /etc/init.d/networking restart
```



### 一些linux命令

#### 命令详解

```shell
$# 是传给脚本的参数个数
$0是脚本本身的名字
$1是传递给该shell脚本的第一个参数
$2是传递给该shell脚本的第二个参数
$@ 是传给脚本的所有参数的列表
$*是以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个
$$ 是脚本运行的当前进程ID号

if[[ -f $home/$1 ]] 表示的是判断$home/$1是不是文件,并且存在 $1表示的是你执行脚本的第一个参
-e filename 如果 filename存在，则为真
-d filename 如果 filename为目录，则为真
-f filename 如果 filename为常规文件，则为真
-L filename 如果 filename为符号链接，则为真
-r filename 如果 filename可读，则为真
-w filename 如果 filename可写，则为真
-x filename 如果 filename可执行，则为真
-s filename 如果文件长度不为0，则为真
-h filename 如果文件是软链接，则为真

if  [ -z $string  ]             如果string 为空，则为真
if  [ -n $string  ]             如果string 非空(非0），返回0(true)  
逻辑与 –a                   条件表达式的并列
if [ 表达式1  –a  表达式2 ]
逻辑或 -o                   条件表达式的或
if [ 表达式1  –o 表达式2 ]

逻辑非 !条件表达式的相反
if [ ! 表达式 ]
```



##### 解压缩

```shell
# 查看文件，实时显示最后一页
tail  -f  filename        
# 实时查看日志文件 后一百行
tail - 100f  

#关键字查找
cat xx.log | grep 关键字

# sz命令发送文件到本地：
sz filename
# rz命令本地上传文件到服务器：
rz  弹出回话框，选择文件上传
rz -y 文件名 上传并覆盖
 
 #pwd

ps -ef | grep 'name'
查看当前所处的路径：    pdw
netstat -lnp|grep 端口号
 
 #chown
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
rm -rf * 删除当前目录的所有文件


.tar
打包语法：tar cvf newFileName.tar fileName || dirName 
解包语法：tar xvf newFileName.tar fileName（-C dirName）

打包成tar.gz格式压缩包
# tar -zcvf renwolesshel.tar.gz /renwolesshel
解压tar.gz格式压缩包
# tar zxvf renwolesshel.tar.gz

#.zip 
解压：unzip FileName.zip 
压缩：zip FileName.zip DirName 
1.查看压缩文件中包含的文件:unzip -l 压缩文件名
2.查看压缩文件的目录信息:unzip -v 压缩文件名
3.解压到当前文件夹unzip 压缩文件名
4.解压到指定文件夹unzip 压缩文件名 -d 指定目录

-r	递归压缩目录，及将制定目录下的所有文件以及子目录全部压缩。
-m	将文件压缩之后，删除原始文件，相当于把文件移到压缩文件中。
-v	显示详细的压缩过程信息。
-q	在压缩的时候不显示命令的执行过程。
-压缩级别	压缩级别是从 1~9 的数字，-1 代表压缩速度更快，-9 代表压缩效果更好。
-u	更新压缩文件，即往压缩文件中添加新文件。
——————————————— 

.war
解压
#jar -xvf file.war
打包
#jar -cvfM0 file2.war <目标目录>
参数说明
    -c  创建war包
    -v  显示过程信息
    -f  指定 JAR 文件名，通常这个参数是必须的
    -M  不产生所有项的清单（MANIFEST〕文件，此参数会忽略 -m 参数
    -0  这个是阿拉伯数字，只打包不压缩的意思
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

#### linux-crontab定时任务

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

#### Windowns的操作

```cmd
tasklist | findstr 端口号
或者
netstat -ano |findstr 端口号

杀死进程
taskill -PID 进程号 -F
```

#### 查看内存情况

```sh
#动态查看
top
#查看虚拟内存使用情况
vmstat 
#查看磁盘
df -h
#查看是哪个目录占的空间
du -h --max-depth=1 
#查看内存
free  

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


用free -m查看的结果：
查看内存使用
# free -h 
# free -m
total:总计物理内存的大小。
used:已使用多大。
free:可用有多少。
Shared:多个进程共享的内存总额。
Buffers/cached:磁盘缓存的大小。
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



#### 查看IO使用情况

```shell
top命令 查看进程
#退出 top 的命令为 q （在 top 运行中敲 q 键一次）
#如想查看oracle用户的进程内存使用情况的话可以使用如下的命令：
$ top -u oracle
	PID：进程的ID
　　USER：进程所有者
　　PR：进程的优先级别，越小越优先被执行
　　NInice：值
　　VIRT：进程占用的虚拟内存
　　RES：进程占用的物理内存
　　SHR：进程使用的共享内存
　　S：进程的状态。S表示休眠，R表示正在运行，Z表示僵死状态，N表示该进程优先值为负数
　　%CPU：进程占用CPU的使用率
　　%MEM：进程使用的物理内存和总内存的百分比
　　TIME+：该进程启动后占用的总的CPU时间，即占用CPU使用时间的累加值。
　　COMMAND：进程启动命令名称
　　
  top -n 2 -d 2.5 |grep Cpu 表示 -d 每2.5刷新一次，总共刷新-n 2次
  top -b p 2>/tmp/top.txt   表示将top进程表在/tmp/top.txt中打印两次。
#
vmstat 2 5
如果发现等待的进程和处在非中断睡眠状态的进程数非常多，并且发送到块设备的块数和从块设备接收到的块数非常大，那就说明磁盘io比较多。

#查看内存使用情况
用free -m查看的结果
```

#### 查看进程所在的目录

```shell
#
ps -ef|grep 应用名

ll /proc/PID
```

#### 清空输入的历史命令

```shell
有时候发现上下键出现太多没有用的命令或者打错的命令，可以使用以下两种方法清空命令

一、$ history -c
该命令可以清空本次登入的所有输出命令，但不清空.bash_history文件，所以下次登陆后，旧命令还将出现，历史命令是存在于当前用户根目录下的./bash_history文件。

二、echo > $HOME/.bash_history
每个用户根目录下都有一个.bash_history文件用于保存历史命令，当每次注销时，本次登陆所执行的命令将被写入该文件。所以可以清空该文件，下次登陆后上次保存的命令将消失，清空效果将在下次登陆生效。
```

#### 软连接

```shell
ln -s /usr/local/lib/libpcre.so.1 /lib64命令做个 软连接就可以了
```



#### 两台linux之间传输文件命令

```shell

scp 文件名 –用户名@计算机IP或者计算机名称:远程路径
#文件
scp local_file remote_username@remote_ip:remote_folder 
或者 
scp local_file remote_username@remote_ip:remote_file 
或者 
scp local_file remote_ip:remote_folder 
或者 
scp local_file remote_ip:remote_file

#将本地目录拷贝到远程
scp -r 目录名 用户名@计算机IP或者计算机名称:远程路径
#从远程将目录拷回本地
scp -r 用户名@计算机IP或者计算机名称:目录名 本地路径
命令格式
scp -r local_folder remote_username@remote_ip:remote_folder 
或者 
scp -r local_folder remote_ip:remote_folder 
第1个指定了用户名，命令执行后需要再输入密码；
第2个没有指定用户名，命令执行后需要输入用户名和密码；


scp不需要输入密码的方法
方法：
假设A机器向B机器scp
只需要将A机器的公钥放到B机器中的 authorized_keys 就可以了
这样ssh / scp都不需要输入密码了。
1、生成钥匙对 ssh-keygen -t rsa
2、将 /root/.ssh/ 目录中的 id_rsa.pub 文件复制到 服务器 B 的 /root/.ssh/ 目录中，并改名为 authorized_keys
 scp .ssh/id_rsa.pub root@192.168.0.2:/root/.ssh/authorized_keys
以后从服务器 S scp 到服务器 B 就不需要密码了。
3、使用此方法需要注意：复制的两台计算机需要用相同的账户名，这里都是用的root。为了安全起见，需要在两台机器中创建相同的账号，然后在服务器 S 上用 su 命令切换至该账号下，然后执行第1步，第2步中复制文件时可能 ~/.ssh/ 目录并不存在，需要手动创建。
在第2步中如果机器中已经存在authorized_keys文件，则需注意，这个文件可以包含多个SSH验证信息，这时可用 cat >> 命令将验证文件内容附加上去。
```

#### sed好用的通道命令

```shell
sed -i 's/原字符串/新字符串/' /home/1.txt  只对发现的第一个
sed -i 's/原字符串/新字符串/g' /home/1.txt

sed -i 's/d/7523/g' /home/1.txt

#sed的q参数可以帮助我们在检测到想要的内容后退出，语法如下：
sed '/xxx/q'
#jenkins打印服务的启动日志
tail -f xxx.log | sed '/成功标志日志|失败标志日志/q'
```

```shell
调用sed命令有两种形式：

sed [options] 'command' file(s)
 
sed [options] -f scriptfile file(s)
常用选项：

-n∶使用安静(silent)模式。在一般sed 的用法中，所有来自 STDIN的资料一般都会被列出到萤幕上。但如果加上 -n 参数后，则只有经过sed特殊处理的那一行(或者动作)才会被列出来。
-e∶直接在指令列模式上进行 sed 的动作编辑；
-f∶直接将 sed 的动作写在一个档案内， -f filename 则可以执行 filename 内的sed动作；
-r∶sed 的动作支援的是延伸型正规表示法的语法。(预设是基础正规表示法语法)
-i∶直接修改读取的档案内容，而不是由萤幕输出。       


常用命令：

a∶新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
c∶取代， c 的后面可以接字串，这些字串可以取代n1,n2 之间的行！
d∶删除，因为是删除啊，所以 d后面通常不接任何咚咚；
i∶插入， i的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
p∶列印，亦即将某个选择的资料印出。通常 p 会与参数 sed-n 一起运作～
s∶取代，可以直接进行取代的工作哩！通常这个 s的动作可以搭配正规表示法！例如 1,20s/old/new/g 就是啦！
```



#### shell执行mysql文件

```shell
mysql -h host -P port_number -u username -p password <file_to_execute.sql
```



#### /bin/sh -c的作用

```shell
使用 sudo 只是让 echo 命令具有了 root 权限，但是没有让 “>” 和 ">>" 命令也具有 root 权限，所以 bash 会认为这两个命令都没有像 test.csv文件写入信息的权限。
sudo echo "信息" >> test.csv
sudo /bin/sh -c 'echo "hahah" >> test.asc'

利用 "sh -c" 命令，它可以让 bash 将一个字串作为完整的命令来执行，这样就可以将 sudo 的影响范围扩展到整条命令。
```

#### passwd 修改用户密码

```shell
passwd mybk
```



### Linux开放防火墙端口号

#### 1、防火墙

```shell
systemctl status firewalld   #查看防火墙状态
systemctl start firewalld    #开启防火墙
systemctl stop firewalld     #关闭防火墙
service firewalld start      #开启防火墙
若遇到无法开启
先用：systemctl unmask firewalld.service 
然后：systemctl start firewalld.service 
####查看对外开放的端口状态
netstat  -ntulp                #查询端口使用情况
netstat  -ntulp | grep 8080    #查询8080端口

firewall-cmd --zone=public --list-ports #查询防火墙开放的所有端口
firewall-cmd --list-all   # 查看防火墙规则
####对外开发端口
firewall-cmd --query-port=6379/tcp               #查看6379端口是否已开
firewall-cmd --add-port=123/tcp --permanent      #添加指定需要开放的端口123
firewall-cmd --query-port=123/tcp                #查询指定端口123是否开启成功
firewall-cmd --permanent --remove-port=123/tcp   #移除指定端口123
firewall-cmd --reload                            #重载入添加的端口
———————————————— 
firewall-cmd --reload # 重新加载

#### iptables
sudo iptables -nL --line-number                               #查看
sudo iptables -D INPUT 5                      #根据行号删除某个规则，注意 INPUT为规则名称(chain INPUT)
sudo iptables -D OUTPUT -p tcp --dport 443 -j ACCEPT          #删除
"sudo iptables -A INPUT -p tcp --dport $PORT -j DROP"         #关闭某个端口
"sudo iptables -A OUTPUT -p tcp --dport $PORT -j DROP"        #关闭某个端口
sudo iptables -I INPUT -p tcp --dport 8011 -j ACCEPT         #开启8011端口

iptables -A OUTPUT -s 192.168.88.94 -p tcp -m tcp --dport 15674 -j ACCEPT  #指定ip
iptables -R TEST_CHAIN 1  -s 10.0.0.12 -p tcp -m multiport  --dports 80,443,8080 -j REJECT #替换
#multiport可以指定多个端口，最多15个

/etc/rc.d/init.d/iptables save #保存配置 
sudo iptables restart #重启服务 

###查看防火墙端口号
1、lsof -i:端口号
2、netstat -tunlp|grep 端口号
可以通过"netstat -anp" 来查看哪些端口被打开

#windows
netstat -aon|findstr "8081"
tasklist|findstr "9088"

systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld
systemctl enable firewalld

service iptables status
启动指令:service iptables start   
重启指令:service iptables restart   
关闭指令:service iptables stop 
 


也可以直接编辑配置文件，添加iptables防火墙规则：
iptables的配置文件为/etc/sysconfig/iptables

编辑配置文件：

vi /etc/sysconfig/iptables
```

* 防火墙端口访问限制

编辑`/etc/sysconfig/iptables`，添加

```js
-A INPUT -m state --state NEW -m tcp -p tcp -s 127.0.0.1 --dport 6379 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 126.212.173.185 --dport 6379 -j ACCEPT
#如果访问ip没有限制，就不需要添加-s ip地址了
#对了，一定要在最后添加
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited

COMMIT
#防火墙重启命令
 service iptables start
```

## 



#### 2、 如何使用telnet测试端口？

```
（1）telnet IP 端口。
（2）telnet 域名 端口。

ping ip 查看网络是否通畅
```

#### 3、如何做端口映射

```shell
假设我们有一台计算机,有两块网卡,eth0连外网,ip为1.2.3.4; eth1连内网,ip为192.168.0.1
发往地址1.2.3.4的81端口的ip包转发到ip地址192.168.0.2的8180端口,设置如下:
#将1.2.3.4：81转发到192.168.0.2：8180
1. iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 81 -j DNAT --to -destination 192.168.0.2:8180
#网段？
2. iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.0.0 -d 192.168.0.2 -p tcp -m tcp --dport 8180 -j SNAT --to-source 192.168.0.1
真实的传输过程如下所示:
假设某客户机的ip地址为6.7.8.9,它使用本机的1080端口连接1.2.3.4的81端口,发出的ip包源地址为6.7.8.9,源端口为1080,目的地址为1.2.3.4,目的端口为81.
主机1.2.3.4接收到这个包后，根据net第一条规则,将该ip包的目的地址更该为192.168.0.2,目的端口更该为8180,同时在连接跟踪表中创建一个条目,(可从/proc/net/ip_conntrack文件中看到),然后发送到路由模块,通过查路由表,确定该ip包应发送到eth1接口.在向eth1接口发送该ip包之前,
根据nat表的第二条规则,如果该ip包来自同一子网,则将该ip包的源地址更该为192.168.0.1,同时更新该连接跟踪表中的相应条目,然后送到eth1接口发出.
```

在网上搜索好多，对[linux](https://so.csdn.net/so/search?from=pc_blog_highlight&q=linux)配置[端口映射](https://so.csdn.net/so/search?from=pc_blog_highlight&q=端口映射)都不够详细，我在RedHat8.0上用iptables配置了端口映射，讲述详细的配置过程，供大家参考。

* **步骤/方法**

1. 首先应该做的是/etc/sysctl.conf配置文件的 net.ipv4.ip_forward = 1 默认是0。
   这样允许iptalbes FORWARD。
2. 在/etc/rc.d/init.d目录下有iptables 文件，使用格式如下
   Usage: ./iptables {start|stop|restart|condrestart|status|panic|save}
   相当与service iptables {....}
   把iptables 服务停止，清除以前的规则，存盘
   到/etc/rc.d/init.d目录下，运行
   ./iptables stop
   iptalbes -F
   iptalbes -X
   iptalbes -Z
   ./iptables save
3. 重新配置规则
   iptables -t nat -A PREROUTING -d 219.239.xx.xx -p tcp --dport 8080 -j DNAT --to-destination 172.18.10.205:80
   iptables -t nat -A POSTROUTING -d 172.18.10.205 -p tcp --dport 80 -j SNAT --to 172.18.10.212
   iptables -A FORWARD -o eth0 -d 172.18.10.205 -p tcp --dport 80 -j ACCEPT
   iptables -A FORWARD -i eth0 -s 172.18.10.205 -p tcp --sport 80 -j ACCEPT
   DNAT SNAT 的请参考帮助，这里不再陈述。
4. 新的规则存盘
   ./iptables save
   规则存盘后在/etc/sysconfig/iptables这个文件里面，若你对这个文件很熟悉
   直接修改这里的内容也等于命令行方式输入规则。
5. 启动iptables 服务
   ./iptables start
   在/proc/net/ip_conntrack文件里有包的流向，如下面
   tcp 6 53 TIME_WAIT src=221.122.59.2 dst=219.239.xx.xx sport=7958 dport=8080 packets=9 bytes=1753
   src=172.18.10.205 dst=172.18.10.212 sport=80 dport=7958 packets=9 bytes=5777 [ASSURED] use=1

### linux修改主机名

阿里云服务器nacos注册后可能是127.0.0.1的IP问题

 配置的没有识别到主机名称需要把/etc/hosts配置 hostname对应到实际ip

```shell
//1、 查看主机名称
hostnamectl status

# 显示结果
Static hostname: ibp1hgw1v5d5ugts0xw1v
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 20190711105006363114529432776998
           Boot ID: 79c2e549f6b340dbb9c9087e19b7cc7b
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-957.21.3.el7.x86_64
      Architecture: x86-64

//2、配置/etc/hosts 文件
172.22.196.189 ibp1hgw1v5d5ugts0xw1v  ibp1hgw1v5d5ugts0xw1v

看静态、瞬态或灵活主机名，分别使用“–static”，“–transient”或“–pretty”选项
想要永久性修改主机名需要同时修改静态、瞬态和灵活主机名.
sudo hostnamectl set-hostname "新主机名"

hostnamectl status --static
hostnamectl status --transient
hostnamectl status --pretty
```

* 2、或者这样修改主机名

```
vi /etc/sysconfig/network
---------------------------------
HOSTNAME=自定义主机名
---------------------------------
```

* 3、修改hosts文件，让服务器认得这个名字

```
vi /etc/hosts
---------------------------------
127.0.0.1  server1
---------------------------------
```

* 4、重启后生效

```
reboot
```



## 命令详解

### 1、Curl

https://sukbeta.github.io/curl-shell-args/

```shell
curl [option] [url]
利用URL规则在命令行下工作的文件传输工具，可以说是一款很强大的http命令行工具。它支持文件的上传和下载
#有时候shell脚本可以放在http页面上，不用download，可以直接执行。
#-s方式
curl -s http://sukbeta.github.io/web/shell.sh | bash -s arg1 arg2
#< 方式
bash <(curl -s http://sukbeta.github.io/web/shell.sh) arg1 arg2
#若参数中带有”-“，则可使用长选项”–”解决
curl -s http://sukbeta.github.io/web/shell.sh | bash -s -- arg1 arg2
#若参数为”-p arg -d arg”,则可使用以下命令执行
curl -s http://sukbeta.github.io/web/shell.sh | bash -s -- 
#不止是curl的输入，其他方式的输入也满足。可以通过以下例子深入理解下
echo 'i=1; for a in $@; do echo "$i = $a"; i=$((i+1)); done' | bash -s -- -a1 -a2 -a3 --long some_text
```

示例

```shell

## get例子
curl --header "Authorization: 62b94903e4b0e57be39dbfc4" --header "id:5" --insecure  -X GET 'http://121.40.86.195:9200'
## post
curl -H "Content-Type: application/json" \
-X POST \
\-d '{"user_id": "123", "coin":100, "success":1, "msg":"OK!" }' "http://192.168.0.1:8001/test"

```





```shell
#curl [option] [url]
curl  -sk https://192.168.72.145/safe/soft/sdserver-installer.sh | bash -s -- 192.168.72.145 ljq NF-7400L
说明：
curl http://sukbeta.github.io/web/shell.sh | bash
通常我们可以用curl的方式执行http页面上的shell脚本。
-s 不输出任何东西
-k 允许不使用证书到SSL站点

#参数说明
-A/--user-agent <string>              设置用户代理发送给服务器
-b/--cookie <name=string/file>    cookie字符串或文件读取位置
-c/--cookie-jar <file>                    操作结束后把cookie写入到这个文件中
-C/--continue-at <offset>            断点续转
-D/--dump-header <file>              把header信息写入到该文件中
-e/--referer                                  来源网址
-f/--fail                                          连接失败时不显示http错误
-o/--output                                  把输出写到该文件中
-O/--remote-name                      把输出写到该文件中，保留远程文件的文件名
-r/--range <range>                      检索来自HTTP/1.1或FTP服务器字节范围
-s/--silent                                    静音模式。不输出任何东西
-T/--upload-file <file>                  上传文件
-u/--user <user[:password]>      设置服务器的用户和密码
-w/--write-out [format]                什么输出完成后
-x/--proxy <host[:port]>              在给定的端口上使用HTTP代理
-#/--progress-bar                        进度条显示当前的传送状态
#其它参数
-a/--append                        上传文件时，附加到目标文件
--anyauth                            可以使用“任何”身份验证方法
--basic                                使用HTTP基本验证
-B/--use-ascii                      使用ASCII文本传输
-d/--data <data>                  HTTP POST方式传送数据
--data-ascii <data>            以ascii的方式post数据
--data-binary <data>          以二进制的方式post数据
--negotiate                          使用HTTP身份验证
--digest                        使用数字身份验证
--disable-eprt                  禁止使用EPRT或LPRT
--disable-epsv                  禁止使用EPSV
--egd-file <file>              为随机数据(SSL)设置EGD socket路径
--tcp-nodelay                  使用TCP_NODELAY选项
-E/--cert <cert[:passwd]>      客户端证书文件和密码 (SSL)
--cert-type <type>              证书文件类型 (DER/PEM/ENG) (SSL)
--key <key>                    私钥文件名 (SSL)
--key-type <type>              私钥文件类型 (DER/PEM/ENG) (SSL)
--pass  <pass>                  私钥密码 (SSL)
--engine <eng>                  加密引擎使用 (SSL). "--engine list" for list
--cacert <file>                CA证书 (SSL)
--capath <directory>            CA目   (made using c_rehash) to verify peer against (SSL)
--ciphers <list>                SSL密码
--compressed                    要求返回是压缩的形势 (using deflate or gzip)
--connect-timeout <seconds>    设置最大请求时间
--create-dirs                  建立本地目录的目录层次结构
--crlf                          上传是把LF转变成CRLF
--ftp-create-dirs              如果远程目录不存在，创建远程目录
--ftp-method [multicwd/nocwd/singlecwd]    控制CWD的使用
--ftp-pasv                      使用 PASV/EPSV 代替端口
--ftp-skip-pasv-ip              使用PASV的时候,忽略该IP地址
--ftp-ssl                      尝试用 SSL/TLS 来进行ftp数据传输
--ftp-ssl-reqd                  要求用 SSL/TLS 来进行ftp数据传输
-F/--form <name=content>        模拟http表单提交数据
-form-string <name=string>      模拟http表单提交数据
-g/--globoff                    禁用网址序列和范围使用{}和[]
-G/--get                        以get的方式来发送数据
-h/--help                      帮助
-H/--header <line>              自定义头信息传递给服务器
--ignore-content-length        忽略的HTTP头信息的长度
-i/--include                    输出时包括protocol头信息
-I/--head                      只显示文档信息
-j/--junk-session-cookies      读取文件时忽略session cookie
--interface <interface>        使用指定网络接口/地址
--krb4 <level>                  使用指定安全级别的krb4
-k/--insecure                  允许不使用证书到SSL站点
-K/--config                    指定的配置文件读取
-l/--list-only                  列出ftp目录下的文件名称
--limit-rate <rate>            设置传输速度
--local-port<NUM>              强制使用本地端口号
-m/--max-time <seconds>        设置最大传输时间
--max-redirs <num>              设置最大读取的目录数
--max-filesize <bytes>          设置最大下载的文件总量
-M/--manual                    显示全手动
-n/--netrc                      从netrc文件中读取用户名和密码
--netrc-optional                使用 .netrc 或者 URL来覆盖-n
--ntlm                          使用 HTTP NTLM 身份验证
-N/--no-buffer                  禁用缓冲输出
-p/--proxytunnel                使用HTTP代理
--proxy-anyauth                选择任一代理身份验证方法
--proxy-basic                  在代理上使用基本身份验证
--proxy-digest                  在代理上使用数字身份验证
--proxy-ntlm                    在代理上使用ntlm身份验证
-P/--ftp-port <address>        使用端口地址，而不是使用PASV
-Q/--quote <cmd>                文件传输前，发送命令到服务器
--range-file                    读取（SSL）的随机文件
-R/--remote-time                在本地生成文件时，保留远程文件时间
--retry <num>                  传输出现问题时，重试的次数
--retry-delay <seconds>        传输出现问题时，设置重试间隔时间
--retry-max-time <seconds>      传输出现问题时，设置最大重试时间
-S/--show-error                显示错误
--socks4 <host[:port]>          用socks4代理给定主机和端口
--socks5 <host[:port]>          用socks5代理给定主机和端口
-t/--telnet-option <OPT=val>    Telnet选项设置
--trace <file>                  对指定文件进行debug
--trace-ascii <file>            Like --跟踪但没有hex输出
--trace-time                    跟踪/详细输出时，添加时间戳
--url <URL>                    Spet URL to work with
-U/--proxy-user <user[:password]>  设置代理用户名和密码
-V/--version                    显示版本信息
-X/--request <command>          指定什么命令
-y/--speed-time                放弃限速所要的时间。默认为30
-Y/--speed-limit                停止传输速度的限制，速度时间'秒
-z/--time-cond                  传送时间设置
-0/--http1.0                    使用HTTP 1.0
-1/--tlsv1                      使用TLSv1（SSL）
-2/--sslv2                      使用SSLv2的（SSL）
-3/--sslv3                      使用的SSLv3（SSL）
--3p-quote                      like -Q for the source URL for 3rd party transfer
--3p-url                        使用url，进行第三方传送
--3p-user                      使用用户名和密码，进行第三方传送
-4/--ipv4                      使用IP4
-6/--ipv6                      使用IP6

```



### 2、查看进程的线程命令

```shell
#查看进程的线程命令
ps p PID -L -o pcpu,pmem,pid,tid,time,tname,cmd
#涉及一些调优问题
#将PID为916的堆栈信息打印到jstack.log中，命令：
jstack -l 916 > jstack.log
#
vim jstack.log
#在进行搜索TID为2603的相关信息

   
```

### 3、查看文件的md5值

```js
#linux
md5sum 文件名
#windows
certutil -hashfile 文件路径/文件名称 MD5
```

### 4、ssh传输文件

```shell
1、从服务器上下载文件
scp username@servername:/path/filename /var/www/local_dir（本地目录）

 例如scp root@192.168.0.101:/var/www/test.txt  把192.168.0.101上的/var/www/test.txt 的文件下载到/var/www/local_dir（本地目录）

2、上传本地文件到服务器
scp /path/filename username@servername:/path   

例如scp /var/www/test.php  root@192.168.0.101:/var/www/  把本机/var/www/目录下的test.php文件上传到192.168.0.101这台服务器上的/var/www/目录中

3、从服务器下载整个目录
scp -r username@servername:/var/www/remote_dir/（远程目录） /var/www/local_dir（本地目录）

例如:scp -r root@192.168.0.101:/var/www/test  /var/www/  

4、上传目录到服务器
scp  -r local_dir username@servername:remote_dir
例如：scp -r test  root@192.168.0.101:/var/www/   把当前目录下的test目录上传到服务器的/var/www/ 目录

 
注：目标服务器要开启写入权限。
```

### 5、查看最近的登录ip

```shell
last|head -n 10  #最近10条登录的ip信息
who #命令用于查看当前登入主机的用户情况，格式为：who [参数]

date "+%Y-%m-%d %H:%M:%S"  #按照 年-月-日 小时：分钟：秒 的格式显示当前时间
```

### 6、logexpect的命令

```shell
https://www.cnblogs.com/lixigang/articles/4849527.html

#1
使用“-c”选项，从命令行执行expect脚本
expect可以让你使用“-c”选项，直接在命令行中执行它，如下所示：
$ expect -c 'expect "\n" {send "pressed enter\n"}  
  
pressed enter  
$  
如果你执行了上面的脚本，它会等待输入换行符（\n）。按“enter”键以后，它会打印出“pressed enter”这个消息，然后退出。

#2
使用“-i”选项交互地执行expect脚本
使用“-i”选项，可以通过来自于标准输入的读命令来交互地执行expect脚本。如下所示：
$ expect -i arg1 arg2 arg3  
expect1.1>set argv  
arg1 arg2 arg3  
expect1.2>  
正常情况下，当你执行上面的expect命令的时候（没有“-i”选项），它会把arg1当成脚本的文件名，所以“-i”选项可以让脚本把多个参数当成一个连续的列表。

当你执行带有“-c”选项的expect脚本的时候，这个选项是十分有用的。因为默认情况下，expect是交互地执行的。
```



**例子**

ssh实现自动登录,并停在登录服务器上

```
 #!/usr/bin/expect -f 
  set ip [lindex $argv 0 ]   //接收第一个参数,并设置IP 
  set password [lindex $argv 1 ]  //接收第二个参数,并设置密码 
  set timeout 10          //设置超时时间 
  spawn ssh root@$ip    //发送ssh请滶 
  expect {         //返回信息匹配 
   "*yes/no" { send "yes\r"; exp_continue} //第一次ssh连接会提示yes/no,继续 
   "*password:" { send "$password\r" }   //出现密码提示,发送密码 
   } 
  interact     //交互模式,用户会停留在远程服务器上面. 

运行结果如下:

 root@ubuntu:/home/zhangy# ./test.exp 192.168.1.130 admin 
 spawn ssh root@192.168.1.130 
 Last login: Fri Sep 7 10:47:43 2012 from 192.168.1.142 
 [root@linux ~]# 
```



### 7、脚本引入文件参数例子

```shell
#xx.sh
cd /sdyunlei/apps/webAgent
. /sdyunlei/apps/webAgent/cloudagent.cfg
echo "Starting cloudAgent......"
nohup /sdyunlei/apps/jdk/bin/java -Xms128M -Xmx1G -jar cloudAgent.jar --server.port=9160 --sd.vip=$local_ip --sd.name=$appid --sd.manager-host=$manager_ip/manager --sd.passport-host=$passport_ip/passport  >> /dev/null 2>&1 &


#cloudagent.cfg文件
# appid
appid=djdfFH2JK
# local addr
local_ip="192.168.72.83"
# manager addr
manager_ip="192.168.89.246"
# passport addr
passport_ip="192.168.89.246"
```

### 8、ssh传输文件命令

```shell
#上传
scp cloudAgent.jar 192.168.72.83:/sdyunlei/apps/webAgent/

输入密码： Lmm7xyxWjsx@qs
#下载
scp -p 22 root@ip:/usr/local/src/lnmp.gz /home/lnmp.gz
```

### 9、rsync命令备注

```shell
export RSYNC_PASSWORD="n:P57N.,\"\`4bYSHMO-#I*2cXai|:q@X^"  && rsync -rlptD -vih -a  --port 22873  --delete mybk@192.168.88.45::cpatch//centos /home/data/patch_library;

-v：显示rsync过程中详细信息。可以使用"-vvvv"获取更详细信息。
-P：显示文件传输的进度信息。(实际上"-P"="--partial --progress"，其中的"--progress"才是显示进度信息的)。
-n --dry-run  ：仅测试传输，而不实际传输。常和"-vvvv"配合使用来查看rsync是如何工作的。
-a --archive  ：归档模式，表示递归传输并保持文件属性。等同于"-rtopgDl"。
-r --recursive：递归到目录中去。
-t --times：保持mtime属性。强烈建议任何时候都加上"-t"，否则目标文件mtime会设置为系统时间，导致下次更新
          ：检查出mtime不同从而导致增量传输无效。
-o --owner：保持owner属性(属主)。
-g --group：保持group属性(属组)。
-p --perms：保持perms属性(权限，不包括特殊权限)。
-D        ：是"--device --specials"选项的组合，即也拷贝设备文件和特殊文件。
-l --links：如果文件是软链接文件，则拷贝软链接本身而非软链接所指向的对象。
-z        ：传输时进行压缩提高效率。
-R --relative：使用相对路径。意味着将命令行中指定的全路径而非路径最尾部的文件名发送给服务端，包括它们的属性。用法见下文示例。
--size-only ：默认算法是检查文件大小和mtime不同的文件，使用此选项将只检查文件大小。
-u --update ：仅在源mtime比目标已存在文件的mtime新时才拷贝。注意，该选项是接收端判断的，不会影响删除行为。
-d --dirs   ：以不递归的方式拷贝目录本身。默认递归时，如果源为"dir1/file1"，则不会拷贝dir1目录，使用该选项将拷贝dir1但不拷贝file1。
--max-size  ：限制rsync传输的最大文件大小。可以使用单位后缀，还可以是一个小数值(例如："--max-size=1.5m")
--min-size  ：限制rsync传输的最小文件大小。这可以用于禁止传输小文件或那些垃圾文件。
--exclude   ：指定排除规则来排除不需要传输的文件。
--delete    ：以SRC为主，对DEST进行同步。多则删之，少则补之。注意"--delete"是在接收端执行的，所以它是在
            ：exclude/include规则生效之后才执行的。
-b --backup ：对目标上已存在的文件做一个备份，备份的文件名后默认使用"~"做后缀。
--backup-dir：指定备份文件的保存路径。不指定时默认和待备份文件保存在同一目录下。
-e          ：指定所要使用的远程shell程序，默认为ssh。
--port      ：连接daemon时使用的端口号，默认为873端口。
--password-file：daemon模式时的密码文件，可以从中读取密码实现非交互式。注意，这不是远程shell认证的密码，而是rsync模块认证的密码。
-W --whole-file：rsync将不再使用增量传输，而是全量传输。在网络带宽高于磁盘带宽时，该选项比增量传输更高效。
--existing  ：要求只更新目标端已存在的文件，目标端还不存在的文件不传输。注意，使用相对路径时如果上层目录不存在也不会传输。
--ignore-existing：要求只更新目标端不存在的文件。和"--existing"结合使用有特殊功能，见下文示例。
--remove-source-files：要求删除源端已经成功传输的文件。
```

### 10、java代码执行命令注意点

```java
//linux平台 java执行command需要带上命令的全部路径 

public static String run(String command) throws IOException {
        Scanner input = null;
        String result = "";
        Process process = null;
        try {
            process = Runtime.getRuntime().exec(command);
            try {
                //等待命令执行完成
                process.waitFor(10, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            InputStream is = process.getInputStream();
            input = new Scanner(is);
            while (input.hasNextLine()) {
                result += input.nextLine() + "\n";
            }
            result = command + "\n" + result; //加上命令本身，打印出来
        } finally {
            if (input != null) {
                input.close();
            }
            if (process != null) {
                process.destroy();
            }
        }
        return result;
    }
```



启动shell进程后，发现进程长时间运行无法结束，同时失去响应。这个问题的原因是shell脚本或者命令在运行的过程中会向标准输出或者标准错误输出写出数据，但JVM又没有去读，导致缓冲区满，进而导致进程阻塞。这个问题的解决的方法比较简单，既然问题是缓冲区满之后没有及时清理，那么只要在Java代码里去读一下数据，保证缓冲区不会满即可.

```java
public static void executeCMD(final String cmdStrArr) {
		Runtime rt = Runtime.getRuntime();
		System.out.println("开始执行脚本");
		System.out.println("脚本内容为:" + cmdStrArr);

		try {
			Process p = rt.exec(cmdStrArr);
			// 防止缓冲区满, 导致卡住
			new Thread() {
				@Override
				public void run() {
					super.run();
					String line;
					try {
						BufferedReader stderr = new BufferedReader(new InputStreamReader(p.getErrorStream()));
						while ((line = stderr.readLine()) != null) {
							System.out.println("stderr:" + line);
						}
					}
					catch (Exception e) {

					}

				}
			}.start();


			new Thread() {
				@Override
				public void run() {
					super.run();
					String line;
					try {
						BufferedReader stdout = new BufferedReader(new InputStreamReader(p.getInputStream()));
						while ((line = stdout.readLine()) != null) {
							System.out.println("stdout:" + line);
						}
					}
					catch (Exception e) {

					}
				}
			}.start();


			int exitVal = p.waitFor();
			if (0 != exitVal) {
				System.out.println("执行脚本失败");
			}
			System.out.println("执行脚本成功");

		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

```



### 11、rsync脚本例子

```shell
#!/bin/bash
set -o nounset
set -o errexit
# -o 参数将特殊特性打开.在某些选项之后使用
# +o 参数将关闭某些特性,不带任何参数的set命令将显示shell的全部变量.除非遇到非法的选项,否则set总是返回true
# 上面个两句set可以简写成 set -ue
# 参数定义
r_pass=$1
r_port=$2
r_user=$3
r_ip=$4
r_module=$5
r_pathc=$6

# 执行命令
export RSYNC_PASSWORD="$r_pass"  && rsync -rlptD -vih -a  --port $r_port  --delete $r_user@$r_ip::$r_module $r_pathc
if [[ $? -ne 0 ]]; then # $?表示上一条命zhidao令返回值，$0表示第一个参数，-ne表示不等于  如果上一条命令成功执行，返回0，否则返回1
    echo "error"
    exit 1
else
    echo "success"
    exit 0
fi
```

### 12、简单自定义rm实现

```shell
#!/bin/bash
filename=$1
now=`date +%Y%m%d%H%M`

read -p "Are you sure to delete the file or diectory ${filename} ? yes|no: " input 

if [ "$input" == "yes" ] || [ "$input" == "y" ]
then
  if [ ! -d "/data/.${now}"]
  then
     mkdir /data/.${now}
  fi
  rsync -aR ${filename} /data/.${now}
  /bin/rm -rf ${filename}
elif [ "$input" == no ] || [ "$input" == "n" ]
then
  exit 0
else
  echo "Only input yes or no"
  exit
fi
```

### 13、push和popd堆栈切换目录

```shell
dirs -v -l  查看目录


pushd -n /home/dave  #写入堆栈
pushd +3  #通过旋转堆栈更改目录
pushd #没有参数时，交互目录栈
pushd -0 #如果要更改到堆栈底部的目录，可以使用以下命令：


popd 1 #将目录栈移除

```

### 14、docker删除所有none镜像

```shell
docker images  | grep none | awk '{print $3}' | xargs docker rmi

解析
xargs: 管道只是前一个命令的标准输出作为后一个命令的标准输入。
1） 前一个命令的标准输出作为后面命令的标准输入，并处理管道传输过来的标准输入。
2） 将处理后的标准输入内容传递到后面命令的正确位置上

xargs处理的优先级或顺序了：先分割，再分批，然后传递到参数位。
如何分割（xargs、xargs -d、xargs -0）
如何划批（xargs -n、xargs -L）
参数如何传递（xargs -i）
```

### 15、Ansible 

在 多台 Linux 上自动执行重复性任务

```shell
Ansible是当下比较流行的自动化运维工具，可通过SSH协议对远程服务器进行集中化的配置管理、应用部署等，常结合Jenkins来实现自动化部署。
```





# 利用openssl 生成私钥和密钥

```shell
# 私钥
openssl genrsa -out rsa_private_key.pem 2048 
# 根据私钥rsa 生成公钥
openssl rsa -in rsa_private_key.pem -out rsa_public_key.pem -pubout

#注意：此时的私钥还不能直接被使用，需要进行PKCS#8编码
openssl pkcs8 -topk8 -in rsa_private_key.pem -out pkcs8_rsa_private_key.pem -nocrypt

# 这条命令可以对比学习，指定输入输出的文件格式
openssl pkcs8 -topk8 -inform PEM -outform DER -in private_key.pem -out private_key.der -nocrypt
```

```java
// java实现加解密  签名
https://blog.csdn.net/huangjinjin520/article/details/126457939
```

```shell
# 计算签名值
echo -n -e \
"POST\n/api/business/diamond/query\n1623934869\nDC10180A100073E70A48F195DA2AF2E6\n{\"appid\":\"ttxxx\",\"order_id\":\"xxx\"}\n" \
 | openssl dgst -sha256 -sign private_key.pem | openssl base64 -A
 
##加密文件 创建一个hello的文本文件
openssl rsautl -encrypt -in hello -inkey test_pub.key -pubin -out hello.en
-in指定要加密的文件，-inkey指定密钥，-pubin表明是用纯公钥文件加密，-out为加密后的文件。
##解密文件：
openssl rsautl -decrypt -in hello.en -inkey test.key -out hello.de
-in指定被加密的文件，-inkey指定私钥文件，-out为解密后的文件。
```





### openssl生成ssl证书

```shell
#生成CA密钥对
openssl genrsa -out ./ssl1.key 2048
#生成根证书签发申请
openssl req -new -key ./ssl1.key -out ./ssl1.csr
注意： 开始填写城市资料
server's hostname 
这里必须填写你的域名
#生成一个3650 天才过期是ssl证书
openssl x509 -req -days 3650 -in ./ssl1.csr -signkey /root/KCweb/ssl1.key -out ./ssl1.crt
```





# shell语法学习

学习记录

```shell
echo $#
echo $@
$@ 表示所有参数
$# 表示所有参数的个数

chown -R mybk. /home/mybk/files/plugshell #chown将指定文件的拥有者改为指定的用户或组，用户可以是用户名或者用户ID
su - mybk -c "/home/mybk/files/plugshell/upload_vul.sh"  #能切换到一个用户中去执行一个指令或脚本


if [[ $? -eq 0 ]]; then # 该句的命令判断上条命令是否成功
# echo "old_pass:" $old_pass
 export MYSQL_PWD=$old_pass
else
# echo "new_pass:" $new_pass
 export MYSQL_PWD=$new_pass
fi

if [[ $(id -u) == 0 ]]; #判断是否root权限
if [[ $(whoami) == mybk ]] #判断当前用户是否为mybk

> plugmd5.sql  #生成文件
echo ''>> plugmd5.sql  #写入内容进入文件	
```

```shell
locate命令用于查找符合条件的文档
Locate [选择参数] [样式]
-e 将排除在寻找的范围之外。
-1 如果 是 1．则启动安全模式。在安全模式下，使用者不会看到权限无法看到 的档案。这会始速度减慢，因为 locate 必须至实际的档案系统中取得档案的权限资料。
-f 将特定的档案系统排除在外，例如我们没有到理要把 proc 档案系统中的档案 放在资料库中。
-q 安静模式，不会显示任何错误讯息。
-n 至多显示 n个输出。
-r 使用正规运算式 做寻找的条件。
-o 指定资料库存的名称。
-d 指定资料库的路径
-h 显示辅助讯息
-V 显示程式的版本讯息
只需要输入 locate your_file_name 即可查找指定文件。

find命令是一个实时查找工具，通过遍历指定路径而完成对文件的查找；在使用该命令时，如果不选定参数，则在当前目录下查找子目录与文件并显示之
find [OPTION]... [查找路径] [查找条件] [处理动作]
查找路径：指定具体目标路径，默认为当前目录
查找条件：指定的查找标准，可以是文件名、大小、类型、权限等标准进行；默认为找出指定路径下的所有文件
处理动作：对符合条件的文件做操作，默认输出至屏幕

find /etc/ -size +1M -type f  查找/etc目录下大于1M且类型为普通文件的所有文件
```


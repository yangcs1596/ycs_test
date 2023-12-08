* 参考地址 https://www.yiibai.com/mysql/ifnull.html

* 

## 数据设计概念

```

一对一 
将 一 方的主键放入到 另一方 中

一对多
将 一 方的主键 放到 多方 中

多对多
两边都将主键拿出,放入到一个新的表中
```

### 表设计的要满足第三范式（减小数据的冗余性）

```
第一范式数据表的每一列都要保持它的原子特性，也就是列不能再被分割。
第二范式属性必须完全依赖于主键。
第三范式要求非主键字段之间不能有依赖关系
```

```
索引
确保数据的唯一性
优化查询
对索引字段中文本的搜索进行优化
```



## my.ini配置

## mysql日志记录慢查询

my.ini配置

```ini
[mysqld]
# 设置3306端口
port=3306
# 设置mysql的安装目录
basedir=D:\install\mysql-5.6.24-win32
# 设置mysql数据库的数据的存放目录
datadir=D:\install\mysql-5.6.24-win32\Data
# 允许最大连接数
max_connections=200
# 允许连接失败的次数。这是为了防止有人从该主机试图攻击数据库系统
max_connect_errors=10
# 服务端使用的字符集默认为UTF8
character-set-server=utf8mb4
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
# 默认使用“mysql_native_password”插件认证
default_authentication_plugin=mysql_native_password
# 忽略密码
#skip-grant-tables
# 防止group by带来的一系列问题
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8mb4
[client]
# 设置mysql客户端连接服务端时默认使用的端口
port=3306
default-character-set=utf8mb4
```

**数据初始化启动**（cmd右键管理员运行）

1. 数据初始化：mysqld –initialize

   ```cmd
   ## 指定配置文件
   mysqld --defaults-file=D:\1ShanghaiOceanUniversity\mysql13307\my.ini --initialize --console 
   ```

   

2. 注册到注册表添加MySQL服务：mysqld –install

3. MySQL启动：net start mysqld

使用该命令只能查看慢查询次数，但是我们没有办法知道是哪些查询产生了慢查询，如果想要知道是哪些查询导致的慢查询，那么我们必须修改mysql的配置文件。打开mysql的配置文件（windows系统是my.ini,linux系统是my.cnf），在[mysqld]下面加上以下代码：

```mysql
#一、配置的方式是永久开启
log-slow-queries=/data/mysql/mysql-slow.log
long_query_time=1
#所有执行时间超过1秒的sql都将被记录到慢查询文件中（我这里就是 /data/mysql/mysql-slow.log
#其它config..
slow_query_log = 1                                            #开启慢查询日志
slow_query_log_file = /mydata/3306/log/mysql.slow.log     #慢查询日志文件目录
log_queries_not_using_indexes = 1                           #开启记录未使用索引的SQL
log_slow_admin_statements = 1                               #开启记录管理语句
log_slow_slave_statements = 1                               #开启主从复制中从库的慢查询
log_throttle_queries_not_using_indexes = 10  #限制每分钟写入慢日志的未用索引的SQL的数量
long_query_time = 2                                         #定义慢查询的SQL执行时长
min_examined_row_limit = 100                  #该SQL检索的行数小于100则不会记录到慢日志

#二、临时开启的命令
#1、开启
set global slow_query_log = on; 
#2、临界值
set long_query_time = 1;
#3、关闭
set global slow_query_log = off; 
```

* 我们应该使用**explain**命令查看mysql的执行计划，寻找其中的可优化点。 

*   mysql除了提供explain命令用于查看命令执行计划外，还提供了**profiling**工具用于查看语句查询过程中的资源消耗情况。首先我们要使用以下命令开启Profiling功能：

  ```mysql
  `set` `profiling = 1;`
  ```

### 查看是否锁表

```mysql
1、查询是否锁表
show OPEN TABLES where In_use > 0;

In_use列表示有多少线程正在使用某张表，Name_locked表示表名是否被锁
#查询正在执行的sql
SELECT * FROM information_schema.INNODB_TRX
2、查询进程
show processlist
查询到相对应的进程===然后 kill    id
查看正在锁的事务
SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCKS;  

查看等待锁的事务
SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCK_WAITS; 
```

show processlist 检查 MySQL状态
查看 mysql porcesslist，查看当前是否有 `wait lock`（表锁，行锁，meata lock 等）。

查看 mysql processlist，是否有大量 `send data、init、commit、clean up` 状态。

查看 mysql processlist，计算并发，排查是否有并发压力。

查看 innodb buffer pool 命中率，排查 buffer 是否够用。 `show variables like 'innodb_buffer_pool%';`

查看 mysql tmp，是否够用，open tables 是否等于 table_open_cache。

`SHOW GLOBAL STATUS LIKE ’Open%table'`  

`SHOW variables LIKE '%table_open%'`

#### select *的缺点

*  使用*无法利用index类型的单表查询、 不会走二级索引 。 
*  连接查询时，* 无法进入缓冲池 

 **1. 不需要的列会增加数据传输时间和网络开销** 

 **2. 对于无用的大字段，如 varchar、blob、text，会增加 io 操作** 

 **3. 失去MySQL优化器“覆盖索引”策略优化的可能性** 

**联合索引 (a,b,c)**

联合索引 (a,b,c) 实际建立了 (a)、(a,b)、(a,b,c) 三个索引

最左原则：既满足a索引后才会进行b、c索引，若不满足a， 则 联合索引失效

### 函数

#### 1、IFNULL函数

```sql
IFNULL(expression_1,expression_2);
```

如果`expression_1`不为`NULL`，则`IFNULL`函数返回`expression_1`; 否则返回`expression_2`的结果。

例子：

```sql
SELECT IFNULL(NULL,'IFNULL function'); -- returns IFNULL function
SELECT IFNULL('',1); -- returns '' 
```

* ISNULL(expr)  

  如expr 为null，那么isnull() 的返回值为 1，否则返回值为 0

* NULLIF(expr1,expr2) 

  如果expr1 = expr2 成立，那么返回值为NULL，否则返回值为expr1。这和CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END相同

* IF(1>2,2,3)
* Strcmp(str1,str2): 
  如果str1>str2返回1,str1=str2反回0，str1<str2返回-1)

```mysql
limit接受一个或者两个参数，参数必须是整数常量。如果给定两个参数，第一个参数指定偏移量，第二个参数指定返回的最大数目。默认偏移量是0。

select * from table_name limit 5,10; //检索 第 6-15 行
select * from table_name limit 95,-1; // 检索 第 96-last
select * from table_name limit 5; // 检索 前5行
 
```



#### 2、coalesce函数

返回列表中第一个非null表达式的值。如果所有表达式求值为null，则返回null

```mysql
COALESCE()函数有两种用法：
COALESCE ( expression1, expression2 );
COALESCE ( expression1, expression2, ... expression-n );
```

**需注意：vertica中空字符串跟null值不一样**

#### 3、不常用函数

* CHAR_LENGTH(s) 、  CHARACTER_LENGTH(s) 返回字符数
* length() 返回长度，空字符和null返回0 
* trim() 去掉开头结尾的空字符

#### 4、字符截取substring_index

```mysql

【MySQL】字符串截取之substring_index
substring_index(str,delim,count)
      str:要处理的字符串
      delim:分隔符
      count:计数
substring_index(str,'.',1)
结果是：www
substring_index(str,'.',2)
结果是：www.wikidm
 也就是说，如果count是正数，那么就是从左往右数，第N个分隔符的左边的全部内容
```

#### 5、LPAD函数

```mysql
lpad：函数语法：
lpad(str1,length,str2)。
其中str1是第一个字符串，length是结果字符串的长度，str2是一个填充字符串。如果str1的长度没有length那么长，则使用str2填充；如果str1的长度大于length，则截断。
#rpad：同理 
```

#### 6、垂直显示

```mysql
只能命令行sql语句增加 \G
\g 等同于 ;
\G 与 \g、; 差异的地方只是 垂直显示 。
```



#### 自定义函数

```mysql
-- 最简单的仅有一条sql的函数
create function myselect2() returns int return 666;
select myselect2(); -- 调用函数

--
create function myselect3() returns int
begin 
    declare c int;
    select id from class where cname="python" into c;
    return c;
end;
select myselect3();
-- 带传参的函数
create function myselect5(name varchar(15)) returns int
begin 
    declare c int;
    select id from class where cname=name into c;
    return c;
end;
select myselect5("python");

查看函数创建语句：show create function 函数名;
查看所有函数：show function status [like 'pattern'];
修改alter function 函数名 选项；
删除drop function 函数名;
```



###  数据库操作

#### mysql连接命令

```shell
》mysql -h+IP -u+root -p+password 注意不需要空格
例如： mysql -uroot -p123 -h192.168.203.33 -P3306
或者： mysql -ucloudpassport -pCtx1ytxA@3zdj

命令：create user ‘qiangqiang’@’%’ identified by ‘123’;
命令：管理员 mysqladmin -uroot password 123 
命令：root普通用户 set password for ‘root’@’%’=password(“123456”);

备份表命令
》mysqldump -u root -h host -p dbname tbname1, tbname2 > backdb.sql
备份数据库
》mysqldump -u root -h host -p dbname > backdb.sql

```

#### 1、建库

```mysql
#建库
>>CREATE DATABASE sonar CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
》show databases;
》use database;

》show tables;
》describe tableName;


select  User,authentication_string,Host from user;

```



#### 1、建表

```mysql
CREATE TABLE IF NOT EXISTS `tb_message` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '主键id',
  `msg_content` text COMMENT '消息内容',
  `user_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户id',
  `sys_user_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '系统用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_user_read` int(1) DEFAULT NULL COMMENT '用户已读(0:未读;1:已读)',
  `is_sys_user_read` int(1) DEFAULT NULL COMMENT '系统用户已读(0:未读,1:唯独)',
  `order_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单id',
  `is_deleted` int(1) DEFAULT NULL COMMENT '删除状态(0:正常,1:删除)',
  `deleted_time` datetime DEFAULT NULL COMMENT '删除时间',
   `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 默认时间
   `update_create` timestamp DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- 更新时默认时间
    PRIMARY KEY (`id`) USING BTREE,-- 下面对BTREE索引说明，创建索引时使用的索引方式,有btree和hash两种
    KEY `user_id` (`user_id`) USING BTREE  -- 建表时添加索引
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='消息';

/*CHARACTER SET utf8 */这是为了解决中文乱码 
```

* AUTO_INCREMENT 定义列为自增的属性，一般用于主键

- PRIMARY KEY 关键字用于定义列为主键。 您可以使用多列来定义主键，列间以逗号分隔。
- ENGINE 设置存储引擎，CHARSET 设置编码。

备注： 表设计字段，多条记录不要存在一个字段里，如用 ,分隔之类的，直接新建 关联子表

##### 1-1 索引

MYISAM和INNODB引擎默认的索引是BTREE

**MYSQL 索引有四种**

* PRIMARY（**唯一且不能为空**；**一张表只能有一个主键索引**）、

* INDEX（普通索引）、

* UNIQUE（唯一性索引）、

* FULLTEXT （全文索引：用于搜索很长一篇文章的时候，效果最好。用在比较短的文本，如果就一两行字的，普通的 INDEX 也可以）

```mysql
ALTER TABLE t_user ADD INDEX name_city_phone(USERNAME,CITY,PHONE) USING BTREE COMMENT '索引' //普通复合索引
ALTER TABLE t_user ADD UNIQUE name_city_phone(USERNAME,CITY,PHONE) USING BTREE //唯一复合索引

创建索引时使用的索引方式,有btree和hash两种
#drop index name
查看表索引的命令
show index from tableName
```

**BTREE索引最左前缀匹配原则使用注意事项：**

- 最左前缀匹配原则，非常重要的原则，mysql会一直向右匹配直到遇到范围查询(>、<、between、like)就停止匹配，比如a = 1 and b = 2 and c > 3 and d = 4 如果建立(a,b,c,d)顺序的索引，d是用不到索引的，如果建立(a,b,d,c)的索引则都可以用到，a,b,d的顺序可以任意调整。【范围查询的字段，在建立复合索引一定要置后】

  例子 abcd符合索引：如果 a匹配不到，则bcd也用不到索引

- =和in可以乱序，比如a = 1 and b = 2 and c = 3 建立(a,b,c)索引可以任意顺序，mysql的查询优化器会帮你优化成索引可以识别的形式

###### 1- 1-1 建表时 USING B-TREE索引使用场景

<span style="color:red">适用于范围查询</span>

- 全值匹配的查询SQL，如 where act_id= '1111_act'

- **联合索引**汇中匹配到最左前缀查询，如联合索引 

  ```mysql
  KEY idx_actid_name(act_id,act_name) USING BTREE
  #key是伪语法等价于
  index a_b_c(a,b,c) USING BTREE
  ```

  

  只要条件中使用到了联合索引的第一列，就会用到该索引，但如果查询使用到的是联合索引的第二列act_name，该SQL则便无法使用到该联合索引（注：覆盖索引除外）

- 匹配模糊查询的前匹配，如where act_name like '11_act%'

- 匹配范围值的SQL查询，如where act_date > '9865123547215'（not in和<>无法使用索引）

- 覆盖索引的SQL查询，就是说select出来的字段都建立了索引 

###### 1-1-2  建表时 USING HASH索引

<span style="color:red">如果存储的数据重复度很低（也就是说基数很大），对该列数据以等值查询为主，没有范围查询、没有排序的时候，特别适合采用哈希索引</span>

- Hash索引基于Hash表实现，只有查询条件**精确匹配Hash索引中的所有列**才会用到hash索引
- 存储引擎会为Hash索引中的每一列都计算hash码，Hash索引中存储的即hash码，所以每次读取都会进行两次查询
- Hash索引无法用于排序
- Hash不适用于区分度小的列上，如性别字段

###### 1-1-3 清空表数据truncate

```
truncate table 表名
```

###### 1-1-4 重置自增主键索引编号

```mysql
ALTER table tableName auto_increment=2
```



##### 1-2 查询强制索引

force index(index_name)

```mysql
select * from table as a force index(index_name) 
```

如果数据库删除了此索引，没有及时更新程序，会导致报错.

#### 2、添加字段

~~~mysql
alter table  table1 
add (
    id int unsigned not Null auto_increment primary key COMMENT '备注',
 )
~~~

#### 3、修改字段

~~~mysql
alter table 表名称 modify 字段名称 字段类型 [是否允许非空];
alter table 表名称 change column 旧字段  新字段 字段类型 是否非空 default null comment '说明' After 某字段;
~~~

##### 3-1 修改编码格式

```mysql
#查看
show global variables like 'character_set_server'; 
#全局配置
show variables where Variable_name like 'collation%';
#对表
alter table table_name default character set utf8mb4 collate=utf8mb4_general_ci;
#对字段
 ALTER TABLE table_name convert to CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

##### 3-2  show variables命令

```mysql
### show variables
show global variables; # 全局变量
show variables like 'character_set_database'; # 查看数据库编码
show variables like '%char%'; #  查看系统字符集

### 修改
set session variable = value;
set variable = value;
set @@session.variable = value;
set @@variable = value;

//显示到mysql数据库的连接数
show status like  'connections ';
//显示慢查询次数
show status like 'slow_queries'; 

show collation;来查看支持的各种排序呢规则
```



#### 4、删除字段

~~~mysql
ALTER TABLE mytable DROP 字段名;
~~~

#### 5、新建用户并分配权限

utf8和utf8mb4的区别是一个是三字符一个是4字符兼容？

```mysql
1、本地 Mysql 创建数据库
CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

2、本地 Mysql 创建用户并分配权限
CREATE USER 'sonar' IDENTIFIED BY 'sonar';

GRANT ALL PRIVILEGES ON *.* TO 'sonar'@'%' IDENTIFIED BY 'sonar' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

##### 5-1 mysql的账号权限配置

mysql添加用户对指定库有权限, 权限控制信息存储在表mysql.user中

1、创建用户和密码

```mysql
create user 'acc'@'%' IDENTIFIED  by 'acc@password';
-- acc是账号  '@%'是host
```

2、刷新授权

```mysql
flush privileges;　
```

3、设置对某个数据库的权限（增删改查可以设置一个或多个） access_control:数据库， acc：用户

```mysql
grant create , select ,  insert ,  update ,  delete on access_control.*  to acc@'%';

# '%'才是允许远程连接，用户地址可以是localhost，也可以是ip地址、机器名字、域名。也可以用’%'表示从任何地址连接。
#safedogcloud数据库的所有权限
GRANT ALL PRIVILEGES ON `access_control`.* TO 'safedog_cloud'@'%'
#给来自10.163.225.87的用户joe分配可对数据库vtdc所有表进行所有操作的权限，并设定口令为123。
grant all privileges on vtdc.* to joe@10.163.225.87 identified by ‘123′; 
#所有数据库权限
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' 

#收回权限
#收回mysql库下的所有表的插删改查权限
REVOKE SELECT,INSERT,UPDATE,DELETE ON mysql.* FROM acc@'%';
```

4, 刷新授权

```mysql
flush  privileges ;
```

```mysql
-- 查看用户权限
show grants for root@'localhost';
-- 查看现有用户
use mysql;
select user,host, authentication_string from user;
-- 
GRANT USAGE ON *.* TO 'discuz'@'localhost' IDENTIFIED BY PASSWORD '123456'

-- 删除用户
delete from mysql.`user` where user ='';
delete from mysql.`user` where host='192.168.2.2';
```



#### 6、创建随机函数

```mysql
create function rand_num( )
returns int(5)
begin 
 declare i int default 0;
 set i = floor(10+rand()*500);
 return i;
end
#### 创建随机生成字符函数
create function rand_string(n INT)
returns varchar(255)
begin 
 declare chars_str varchar(100) default
   'abcdefghijklmnopqrstuvwxyzABCDEFJHIJKLMNOPQRSTUVWXYZ';
 declare return_str varchar(255) default '';
 declare i int default 0;
 while i < n do 
   set return_str =concat(return_str,substring(chars_str,floor(1+rand()*52),1));
   set i = i + 1;
   end while;
  return return_str;
  end
```

#### 7、创建一个存储过程并执行

```mysql
create procedure insert_emp(in start int(10),in max_num int(10))
begin
declare i int default 0; 
 set autocommit = 0;  
 repeat
 set i = i + 1;
 insert into emp values ((start+i) ,rand_string(6),'SALESMAN',0001,curdate(),2000,400,rand_num());
  until i = max_num
 end repeat;
   commit;
 end
————————————————
### 执行存储过程
call insert_emp(1,500)


##事物回滚
create procedure test(in a int)
    BEGIN
        DECLARE t_error INTEGER DEFAULT 0;
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;-- 异常时设置为1
        START TRANSACTION;
        -- 需要执行的sql
        IF t_error = 1 THEN
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END
```

#### 8、查看表详细信息

```mysql
show tables或show tables from database_name;
-- 显示当前数据库中所有表的名称
show databases;
-- 显示mysql中所有数据库的名称
show columns from table_name from database_name; 或show columns from database_name.table_name;
-- 解释：显示表中列名称
show index from table_name; -- 显示表的索引

desc table_name -- 显示表的字段信息
show create table table_name; -- 显示建表语句

```

#### 9、插入

```mysql
INSERT INTO table_name ( field1, field2,...fieldN )
                       VALUES
                       ( value1, value2,...valueN );
                       
INSERT INTO table_name ( field1, field2,...fieldN )
      select xx from table;
```

#### 10、视图

```mysql
CREATE OR REPLACE VIEW yourViewName AS SELECT *FROM yourTableName;
```

#### 11、WITH AS 短语

```mysql
with t as (
select * from consumer
)
select * from t
1234
```

该语句的作用是在, 大量的报表查询时, 使用 with as 可以提取出大量的子查询, 更加简洁

- 和视图的区别：with as 等同于一次性视图，只会持续到下一个查询。在之后就不能再被引用

#### 12、regexp 是包含关系

```
select A regexp B|C|D  标识判断 A包含B或C或D 
```

mysql 字段内有逗号间隔的，查询该字段是否包含一个或多个字符串

```mysql

SELECT * FROM table WHERE 1=1
AND (字段 REGEXP(REPLACE('参数逗号间隔', ',', '|')));

-- 拼接其他特殊字符比较
SELECT * FROM table WHERE CONCAT(',',字段,',') 
REGEXP(SELECT CONCAT(',',REPLACE('参数逗号间隔', ',', ',|,'),',')); 
```



## mysql命令行执行sql文件时忽略异常继续执行

```mysql
mysql -h主机ip -P数据库端口 -u用户名 -p密码 -D数据库名 -s -N -f < sql文件

命令行解释
Usage: mysql [OPTIONS] [database]   //命令方式
 -?, --help          //显示帮助信息并退出
 -I, --help          //显示帮助信息并退出
 --auto-rehash       //自动补全功能，就像linux里面，按Tab键出提示差不多，下面有例子

 -A, --no-auto-rehash  //默认状态是没有自动补全功能的。-A就是不要自动补全功能
 -B, --batch         //ysql不使用历史文件，禁用交互
 (Enables --silent)
 --character-sets-dir=name   //字体集的安装目录                    
 --default-character-set=name    //设置数据库的默认字符集
 -C, --compress      //在客户端和服务器端传递信息时使用压缩
 -#, --debug[=#]     //bug调用功能
 -D, --database=name //使用哪个数据库
 --delimiter=name    //mysql默认命令结束符是分号，下面有例子
 -e, --execute=name  //执行mysql的sql语句
 -E, --vertical      //垂直打印查询输出
 -f, --force         //如果有错误跳过去，继续执行下面的
 -G, --named-commands
 /*Enable named commands. Named commands mean this program's
 internal commands; see mysql> help . When enabled, the
 named commands can be used from any line of the query,
 otherwise only from the first line, before an enter.
 Disable with --disable-named-commands. This option is
 disabled by default.*/
 -g, --no-named-commands
 /*Named commands are disabled. Use \* form only, or use
 named commands only in the beginning of a line ending
 with a semicolon (;) Since version 10.9 the client now
 starts with this option ENABLED by default! Disable with
 '-G'. Long format commands still work from the first
 line. WARNING: option deprecated; use
 --disable-named-commands instead.*/
 -i, --ignore-spaces //忽视函数名后面的空格.
 --local-infile      //启动/禁用 LOAD DATA LOCAL INFILE.
 -b, --no-beep       //sql错误时，禁止嘟的一声
 -h, --host=name     //设置连接的服务器名或者Ip
 -H, --html          //以html的方式输出
 -X, --xml           //以xml的方式输出
 --line-numbers      //显示错误的行号
 -L, --skip-line-numbers  //忽略错误的行号
 -n, --unbuffered    //每执行一次sql后，刷新缓存
 --column-names      //查寻时显示列信息，默认是加上的
 -N, --skip-column-names  //不显示列信息
 -O, --set-variable=name  //设置变量用法是--set-variable=var_name=var_value
 --sigint-ignore     //忽视SIGINT符号(登录退出时Control-C的结果)
 -o, --one-database  //忽视除了为命令行中命名的默认数据库的语句。可以帮跳过日志中的其它数据库的更新。
 --pager[=name]      //使用分页器来显示查询输出，这个要在linux可以用more,less等。
 --no-pager          //不使用分页器来显示查询输出。
 -p, --password[=name] //输入密码
 -P, --port=#        //设置端口
 --prompt=name       //设置mysql提示符
 --protocol=name     //使用什么协议
 -q, --quick         //不缓存查询的结果，顺序打印每一行。如果输出被挂起，服务器会慢下来，mysql不使用历史文件。
 -r, --raw           //写列的值而不转义转换。通常结合--batch选项使用。
 --reconnect         //如果与服务器之间的连接断开，自动尝试重新连接。禁止重新连接，使用--disable-reconnect。
 -s, --silent        //一行一行输出，中间有tab分隔
 -S, --socket=name   //连接服务器的sockey文件
 --ssl               //激活ssl连接，不激活--skip-ssl
 --ssl-ca=name       //CA证书
 --ssl-capath=name   //CA路径
 --ssl-cert=name     //X509 证书
 --ssl-cipher=name   //SSL cipher to use (implies --ssl).
 --ssl-key=name      //X509 密钥名
 --ssl-verify-server-cert //连接时审核服务器的证书
 -t, --table         //以表格的形势输出
 --tee=name          //将输出拷贝添加到给定的文件中，禁时用--disable-tee
 --no-tee            //根--disable-tee功能一样
 -u, --user=name     //用户名
 -U, --safe-updates  //Only allow UPDATE and DELETE that uses keys.
 -U, --i-am-a-dummy  //Synonym for option --safe-updates, -U.
 -v, --verbose       //输出mysql执行的语句
 -V, --version       //版本信息
 -w, --wait          //服务器down后，等待到重起的时间
 --connect_timeout=# //连接前要等待的时间
 --max_allowed_packet=# //服务器接收／发送包的最大长度
 --net_buffer_length=# //TCP / IP和套接字通信缓冲区大小。
 --select_limit=#    //使用--safe-updates时SELECT语句的自动限制
 --max_join_size=#   //使用--safe-updates时联接中的行的自动限制
 --secure-auth       //拒绝用(pre-4.1.1)的方式连接到数据库
 --server-arg=name   //Send embedded server this as a parameter.
 --show-warnings     //显示警告
```



### INNER JOIN

* 用法： 左右两边有匹配则显示， 没有匹配则不显示

### LEFT JOIN

* 用法：左边有则显示，右边没有则显示 null

（可以替代 **in**的条件语句）

​	**注意点：** 查询时需要判断是否是  根据主表的关联。  

犯的错误：一对一 关联查询

正确的是：一对多 关联查询

多对多查询（left join 可以实现吗？ 只能用普通的where关联成多对多吧）

### HAVING

HAVING语句通常与GROUP BY语句联合使用，用来过滤由GROUP BY语句返回的记录集。

1、where 后不能跟聚合函数，因为where执行顺序大于聚合函数。 
2、where 子句的作用是在对查询结果进行分组前，将不符合where条件的行去掉，即在分组之前过滤数据，条件中不能包含聚组函数，使用where条件显示特定的行。 
3、having 子句的作用是筛选满足条件的组，即在分组之后过滤数据，条件中经常包含聚组函数，使用having 条件显示特定的组，也可以使用多个分组标准进行分组。

### 时间默认值

```mysql
SELECT NOW() -- 2018-10-06 10:57:54

SELECT CURDATE() -- 2018-10-06

SELECT CURRENT_TIME() -- 10:57:31

SELECT CURRENT_DATE() -- 2018-10-06 和 CURDATE() 函数结果一样

SELECT CURRENT_TIMESTAMP() -- 2018-10-06 10:58:25  和now()结果 一样

SELECT CURRENT_USER()   
```

#### DATE_SUB 函数

```mysql
select DATE_SUB(CURDATE(), INTERVAL 1 DAY)  -- 获取昨天的日期
```





#### MYSQL注意设置时间的时区

```mysql
#time_zone说明mysql使用system的时区，system_time_zone说明system使用UTC时区
set global time_zone = '+8:00';
set time_zone = '+8:00';
```

修改配置文件

```
`/``etc``/``my.cnf`
```



```cnf
`[mysqld]``default``-``time_zone ``=` `'+8:00'`
```



#### 数据格式转换命令

```mysql
#与mssql即 server SQL略微不同
CAST(value as type);  
CONVERT(value, type); 

```





### information_schema的表信息 表名和表字段

```mysql
#查询表的字段
select * from information_schema.COLUMNS where table_name='表名' and TAble_schema = '库'

#查询某数据库的所有表
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'test';
```

```mysql
//复制一条数据语法，注意主键唯一性的问题
insert into table select * from table
```

#### update

```mysql
update table
set 
	cloum1 = '',
	colum2 = ''
where 
	condition
```

```mysql
#交叉用法更新
UPDATE T1,T2
INNER JOIN T2 ON T1.C1 = T2.C1
SET T1.C2 = T2.C2,
      T2.C3 = expr
WHERE condition

#mysql用法
UPDATE a
INNER JOIN b ON a.userName = b.userName
SET a.password = b.password
where condition
```

#### delete

```mysql
# 删除20部门中工资最高的员工记录
DELETE FROM t_emp
WHERE deptno=20 
ORDER BY sal+IFNULL(comm,0) DESC;
LIMIT 1;

# 多表删除
DELETE A, B from a_table, B_table 
where ...
```

#### insert

```
insert ignore into ...
表示数据库如果存在主键，则跳过该条
insert into table_a(column...) select ... from table_b
```



#### replace into

```
replace into 跟 insert 功能类似，不同点在于：replace into 首先尝试插入数据到表中， 1. 如果发现表中已经有此行数据（根据主键或者唯一索引判断）则先删除此行数据，然后插入新的数据。 2. 否则，直接插入新数据。

要注意的是：插入数据的表必须有主键或者是唯一索引！否则的话，replace into 会直接插入数据，这将导致表中出现重复的数据
```



#### EXPLAIN的用法解析

* **id**越大 优先级越高，越先被执行

* **select_type**
  * **SIMPLE** 简单的select查询，查询中不包含子查询或者UNION
  * **PRIMARY**查询中若包含任何复杂的子部分，最外层查询则被标记为PRIMARY
  * **SUBQUERY**  在SELECT或WHERE列表中包含了子查询
  * **DERIVED**  在FROM列表中包含的子查询被标记为DERIVED（衍生），MySQL会递归执行这些子查询，把结果放在临时表中
  * **UNION** 若第二个SELECT出现在UNION之后，则被标记为UNION：若UNION包含在FROM子句的子查询中，外层SELECT将被标记为：DERIVED
  * **UNION** **RESULT** 从UNION表获取结果的SELECT

* **type**

从最好到最差依次是：

```
system > const > eq_ref > ref > range > index > all
```

**一般来说，得保证查询至少达到range级别，最好能达到ref。**

* **key_len**

表示索引中使用的字节数，可通过该列计算查询中使用的索引的长度，在不损失精确性的情况下，<u>长度越短越好</u>

* **Extra**

Using filesort（九死一生）

Using temporary（十死无生）

* https://blog.csdn.net/qq_41933709/article/details/94285458

### 特殊查询



#### 1 统计查询

```mysql
#统计查询
explain 
select 
 sum(case when o.`status`='005' then 1 else null end) as finish,
 sum(case when o.`status`='003' then 1 else null end) as accept ,
 sum(case when o.`status`='002' then 1 else null end) as accept3 
from tb_order o
```

#### 2 分页查询百万级别

```sql
#百万级别数据很卡
SELECT * FROM table ORDER BY id LIMIT 1000, 10; 
#优化
SELECT * FROM table WHERE id BETWEEN 1000000 AND 1000010; 
#完美写法？
SELECT * FROM table WHERE id BETWEEN 1000000 AND 1000010; 
#索引同样可以使用在 in 语句中
```

#### 3 查询列重复的个数

```mysql
select colum, count(1) as count from xx group by colum
```

#### 4 分页查询

```mysql
#查询第1条到第10条的数据的sql是： 
select * from table limit 0,10; 对应-》 select * from table limit (1-1)*10,10;
```

#### 5 order by + group 问题

```mysql
### 错误用法； mysql5.8之后 order by 要和limit一起使用才会生效
SELECT
	* 
FROM
	( SELECT * FROM goods_sku ORDER BY selling_price ASC ) AS ns 
	where ns.goods_id=132
GROUP BY
	ns.goods_id 

# 涉及 排序问题 min和max 求最大或者最小的条件

SELECT
b.* 
FROM
	goods_sku b 
WHERE b.goods_id IN ( 132, 110, 109, 100, 99 ) 
AND b.selling_price = (
  SELECT min( a.selling_price ) AS selling_price 
  FROM goods_sku a 
  WHERE a.deleted = 0 
    AND a.STATUS = 0 
    AND a.goods_id = b.goods_id 
    GROUP BY a.goods_id  
 )
```



### 写mysql的事务

```mysql
start transaction;
select balance from bank where name="zhangsan";
// 生成 重做日志 balance=600
update bank set balance = balance - 400; 
// 生成 重做日志 amount=400
update finance set amount = amount + 400;
commit;
```

存储过程

CONTINUE表示遇到错误不处理，继续执行；
 EXIT表示遇到错误时马上退出；
 UNDO表示遇到错误后撤回之前的操作，MySQL暂不支持回滚操作；

```mysql
CREATE PROCEDURE PRO2(
    IN c_name VARCHAR (20),
    IN c_num INTEGER)
BEGIN
    DECLARE t_error INTEGER;
    ##这里跟上面的写的不一样，但是需要在语句中根据t_error的值手动回滚下事务
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;
 
    START TRANSACTION;
        INSERT INTO test_tab VALUES    (1, '2');
        INSERT INTO test_tab VALUES    (1, '3');
        
        IF t_error = 1 THEN
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
END
          
 -- 执行过程
 call num_from_employee(参数)
```





postgrepsql的存储过程写法

```sql
--存储过程
create or replace function P_DWA_ERP_LEDGER_JQ_MONTH_NEW( v_mouth varchar(8),  out v_retcode text,  out v_retinfo text,  out v_row_num integer)
AS 
$BODY$
declare
begin
    insert into table_new(id, name, age) select t.id, t.name, m.age from student t, employees m where t.id=m.id;

    GET DIAGNOSTICS V_ROW_NUM := ROW_COUNT;

    -- 执行成功后的返回信息
    V_RETCODE := 'SUCCESS';
    V_RETINFO := '结束';
  
    --异常处理
    EXCEPTION
    WHEN OTHERS THEN
        V_RETCODE := 'FAIL';
        V_RETINFO := SQLERRM;
   
end;

$BODY$
language plpgsql;

--调用存储过程
select * from P_DWA_ERP_LEDGER_JQ_MONTH_NEW('12');
```



#### 通过游标来实现通过查询结果集循环

https://www.cnblogs.com/Luouy/p/7301344.html

```mysql
/*定义游标*/
declare idCur cursor for select A.HostId from dev_host as A, sys_hostconfig as B where A.HostId != B.HostId;
/*定义监听器 设置循环结束标识done值怎么改变 的逻辑*/
declare continue handler for not FOUND set done = 1; /*done = true;亦可*/

open idCur;  /*打开游标*/
close idCur;  /*关闭游标*/

#实际demo
/*我们有时候会遇到需要对 从A表查询的结果集S_S 的记录 进行遍历并做一些操作（如插入），且这些操作需要的数据或许部分来自S_S集合*/
/*临时存储过程，没办法，不能直接在查询窗口做这些事。*/
drop procedure if exists proc_tmp;
create procedure proc_tmp()
BEGIN
/*这种写法也可以：DECLARE done INT DEFAULT FALSE;*/
declare done int default 0;  /*用于判断是否结束循环*/
declare hostId bigint; /*用于存储结果集S_S的记录（因为我这里S_S的记录只有一列且为bigint类型）*/

/******************************1、定义游标******************************/
declare idCur cursor for select A.HostId from dev_host as A, sys_hostconfig as B where A.HostId != B.HostId;
/******************************2、定义 设置循环结束标识done值怎么改变 的逻辑******************************/
declare continue handler for not FOUND set done = 1; /*done = true;亦可*/
/*这句的含义是：若没有数据返回,程序继续,并将变量done设为1 ，用作if的判断条件
每个游标必须使用不同的declare continue handler for not found set done=1来控制游标的结束。
也可以这么写
declare CONTINUE HANDLER FOR SQLSTATE '02000' SET tmpname = null;
*/

open idCur;  /******************************3、打开游标******************************/

/******* 4、循环开始start *************/
REPEAT
/* 如果要fetch多列应该这样写，fetch cur/*对应下面的idCur*/ into rowId, rowName;但是注意rowId和rowName要先declare，且declare cur时也要select两列，且这两列和rowId、rowName对应 */
  fetch idCur into hostId;  /*这部分可以看看书，还可以fetch多列（假设结果集S_S的记录不是单列的话）*/
  if not done THEN  /*数值为非0，MySQL认为是true*/
     insert into sys_hostconfig(HostId, AElecCap, BElecCap, CElecCap, RemElecCap, ATmpCap, BTmpCap, CTmpCap, BoxTmpCap, CreateTime)
/*注意这里用到了hostId和now()*/
      values(hostId, 80, 80, 80, 500, 80, 80, 80, 80, NOW());
   end if;
until done end repeat;
/********** 循环结束end ******/
close idCur;  /******************************关闭游标******************************/
END


call proc_tmp();
drop procedure proc_tmp;  /*删除临时存储过程*/
```



#### mysqsl几种循环

```mysql
while 循环条件 do 
循环体;
end while;

#--
loop 
循环体;
end loop;

#---
repeat 
循环体;
until 结束循环的条件
end repeat

循环控制语句：
iterate：类似于java中的continue，结束本次循环，继续下一次循环。
leave：类似于java中的break，跳出循环，执行之后的语句。
```



### 函数用法

#### 一、聚合函数

聚合函数是平时比较常用的一类函数，这里列举如下：

- COUNT(col)  统计查询结果的行数
- MIN(col)  查询指定列的最小值
- MAX(col)  查询指定列的最大值
- SUM(col)  求和，返回指定列的总和
- AVG(col)  求平均值，返回指定列数据的平均值

#### 1、concat和group_concat的用法

* **concat**(str1,str2,...)

  ```mysql
  1、功能：将多个字符串连接成一个字符串。
  2、语法：concat(str1, str2,...)
  返回结果为连接参数产生的字符串，如果有任何一个参数为null，则返回值为null。
  ```

* **concat_ws()函数** 指定分割符separator 

  ```mysql
  1、功能：和concat()一样，将多个字符串连接成一个字符串，但是可以一次性指定分隔符～（concat_ws就是concat with separator）
  2、语法：concat_ws(separator, str1, str2, ...)
  例子：
   select group_concat(id order by id separator '_') from t_kenyon;
  ```

* **group_concat()函数**

```mysql
1、功能：将group by产生的同一个分组中的值连接起来，返回一个字符串结果。

2、语法：group_concat( [distinct] 要连接的字段 [order by 排序字段 asc/desc ] [separator '分隔符'] )

说明：通过使用distinct可以排除重复值；如果希望对结果中的值进行排序，可以使用order by子句；separator是一个字符串值，缺省为一个逗号','。
```

* **replace**( '要修改的总体数据' , '被替换的内容' , '要替换的内容' )

  **str_replace()** 

说明：长度存在限制，默认1024

```mysql
SHOW VARIABLES LIKE "group_concat_max_len"; #查询最大值

#修改默认的长度
SET GLOBAL group_concat_max_len=10240000;
SET SESSION group_concat_max_len=10240000;
```



#### 2、FIND_IN_SET查询子节点

查询所有的子节点

```
FIND_IN_SET(str,strlist)
```

str 要查询的字符串 

strlist 字段名 参数以”,”分隔 如 (1,2,6,8,10,22) 

查询字段(strlist)中包含(str)的结果，返回结果为null或记录

```mysql
select id from (
    select t1.id,
    if(find_in_set(parent_id, @pids) > 0, @pids := concat(@pids, ',', id), 0) as ischild
    from (
        select id,parent_id from re_menu t where t.status = 1 order by parent_id, id
    ) t1,
    (select @pids := 要查询的菜单节点 id) t2
) t3 where ischild != 0
```

#### 3、:=和=的区别

- = 
  - 只有在set和update时才是和:=一样，**赋值**的作用，其它都是**等于**的作用。鉴于此，用变量实现行号时，必须用:=
- := 
  - 不只在set和update时时赋值的作用，在select也是赋值的作用

#### 4、三种循环函

* while 循环

```mysql
delimiter //                            #定义标识符为双斜杠
drop procedure if exists test;          #如果存在test存储过程则删除
create procedure test()                 #创建无参存储过程,名称为test
begin
    declare i int;                      #申明变量
    set i = 0;                          #变量赋值
    while i < 10 do                     #结束循环的条件: 当i大于10时跳出while循环
        insert into test values (i);    #往test表添加数据
        set i = i + 1;                  #循环一次,i加一
    end while;                          #结束while循环
    select * from test;                 #查看test表数据
end
//                                      #结束定义语句
call test();                            #调用存储过程 
```

* repeat循环  loop循环  懂一种就差不多了

```mysql
declare i int;                      #申明变量
    set i = 0;                          #变量赋值
    repeat
        insert into test values (i);    #往test表添加数据
        set i = i + 1;                  #循环一次,i加一
    until i > 10 end repeat;            #结束循环的条件: 当i大于10时跳出repeat循环 
#Loop循环
declare i int;                      #申明变量
    set i = 0;                          #变量赋值
    lp : loop                           #lp为循环体名,可随意 loop为关键字
        insert into test values (i);    #往test表添加数据
        set i = i + 1;                  #循环一次,i加一
        if i > 10 then                  #结束循环的条件: 当i大于10时跳出loop循环
            leave lp;
        end if; 
    end loop; 
```

#### 5、FIND_IN_SET(#{type},arr)数组查询

```
FIND_IN_SET(#{type},arr)
#{type}表示将判断的单个值 例如 1
arr表示数组格式的字符串，例如 1,2,3,4
```

6、

### JDBC的配置参数列表

```yaml
spring:
    datasource:
      url: jdbc:mysql://ip/online?characterEncoding=UTF-8
      &zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8
```

| 参数名称              | 参数说明                                                     | 缺省值 | 最低版本要求 |
| --------------------- | ------------------------------------------------------------ | ------ | ------------ |
| user                  | 数据库用户名（用于连接数据库）                               |        | 所有版本     |
| password              | 用户密码（用于连接数据库）                                   |        | 所有版本     |
| useUnicode            | 是否使用Unicode字符集，如果参数characterEncoding设置为gb2312或gbk，本参数值必须设置为true | false  | 1.1g         |
| characterEncoding     | 当useUnicode设置为true时，指定字符编码。比如可设置为gb2312或gbk | false  | 1.1g         |
| autoReconnect         | 当数据库连接异常中断时，是否自动重新连接？                   | false  | 1.1          |
| autoReconnectForPools | 是否使用针对数据库连接池的重连策略                           | false  | 3.1.3        |
| failOverReadOnly      | 自动重连成功后，连接是否设置为只读？                         | true   | 3.0.12       |
| maxReconnects         | autoReconnect设置为true时，重试连接的次数                    | 3      | 1.1          |
| initialTimeout        | autoReconnect设置为true时，两次重连之间的时间间隔，单位：秒  | 2      | 1.1          |
| connectTimeout        | 和数据库服务器建立socket连接时的超时，单位：毫秒。 0表示永不超时，适用于JDK 1.4及更高版本 | 0      | 3.0.1        |
| socketTimeout         | socket操作（读写）超时，单位：毫秒。 0表示永不超时           |        |              |

# MySQL的主从配置

```mysql
主库：
　　1、配置文件里面加入以下两行
　　　　server-id=1
　　　　#启用binlog日志
　　　　log-bin=MySQL-bin
　　2、创建账户
　　　　grant replication client,replication slave on *.* to root@'从库ip' identified by 'root';
　　　　#注意此处的用户和下面从库的用户用户一致
　　查看状态
    show  master  status;
从库：
　　1、配置文件加上以下几行
　　　　server-id=2
　　　　relay-log=relay-bin
　　　　read-only=1

　　　　replicate-ignore-db = mysql                      不复制的库
　　　　replicate-ignore-db = test                         不复制的库
　　　　replicate-ignore-db = information_schema  不复制的库

　　　　replicate-wild-do-table = 数据库名字.表名字 // 所要同步的数据库的单个表，可以加多行就是多个

　   2、从库关联主库
　　　　change master to master_host='主库ip',master_user='root',master_password='root';
    查看状态
    show slave status\G;
```



# mysqldump导出

## 1、命令语法

```mysql
#备注：
--no-autocommit                     ----采用批量提交方式(提高还原性能)
--set-gtid-purged=OFF  时，
在会记录binlog日志，如果不加，不记录binlog日志，所以在我们做主从用了gtid时，用mysqldump备份时就要加--set-gtid-purged=OFF，否则你在主上导入恢复了数据，主没有了binlog日志，同步则不会被同步。

备份数据库 
#mysqldump　数据库名　>数据库备份名 
#mysqldump -uroot　-p　-A　-u用户名　-p密码　数据库名>数据库备份名 
#mysqldump　-uroot　-p -d　-A　--add-drop-table　　>xxx.sql
导出结构 不导出数据 --opt -d  
#mysqldump -uroot　-pxx　--opt -d　数据库名　>　xxx.sql
导出数据和表结构 
#mysqldump　-uroot　-pxx 数据库名　　>　xxx.sql　
导出特定表的结构 
#mysqldump　-uroot　-pxx　-B　数据库名　--table　表名　>　xxx.sql


导入数据：
#use 数据库; 
#source　/tmp/xxx.sql
方式二：
#mysql -uabc_f -pxx abc < abc.sql
```

## 2、mysqldump实际导出例子

```mysql
mysql -ucloudnet -pCtx1ytxA@3zdj
use cloudnet;
drop table if exists risk_type_copy1;
create table risk_type_copy1 like risk_type;
insert into cloudnet.risk_type_copy1 select t.* from cloudnet.risk_type t left join cloudpassport.risk_sys_info r on r.name =t.name where r.ostype = 1;
truncate table cloudnet.risk_type;
truncate table cloudnet.risk_affected_os_info;
insert into cloudnet.risk_type select * from cloudnet.risk_type_copy1;

mysql -ucloudpassport -pCtx1ytxA@3zdj 
use cloudpassport;
drop table if exists risk_sys_info_copy1;
create table risk_sys_info_copy1 like risk_sys_info;
insert into risk_sys_info_copy1 select * from risk_sys_info where osType = 1;
truncate table risk_sys_info;
insert into risk_sys_info select * from risk_sys_info_copy1;


-- 导出的sql
mysqldump -ucloudnet -pCtx1ytxA@3zdj cloudnet risk_affected_os_info risk_type kb_cve_mapping patch_store_version --no-autocommit --set-gtid-purged=off >/home/mybk/mysql.cloudnet.knowledgebase20211019.sql

mysqldump -ucloudpassport -pCtx1ytxA@3zdj cloudpassport risk_sys_info --no-autocommit --set-gtid-purged=off >/home/mybk/mysql.cloudpassport.knowledgebase20211019.sql
```

## 

# 导入sql脚本文件

```mysql
mysql -ucloudpassport -pCtx1ytxA@3zdj 数据库名 < 存放位置
mysql -uroot -p123456 cloud_system<D:\\mysql\\LOL3.sql

执行sql脚本文件
mysql> source sql脚本所在目录
```

# MySQL监控

### Druid Monitor  

不仅可以监控数据源和慢查询，还可以监控Web应用、URI监控、Session监控、Spring监控

```xml
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>druid-spring-boot-starter</artifactId>
    <version>1.2.6</version>
</dependency
```

* 注入两个bean管理

```java
@Bean
public ServletRegistrationBean druidServlet() {
    ServletRegistrationBean reg = new ServletRegistrationBean();
    reg.setServlet(new StatViewServlet());
    //访问的URL的路径
    reg.addUrlMappings("/druid/*");
    //登录的账号密码 可以在配置中心配置
    registrationBean.addInitParameter(StatViewServlet.PARAM_NAME_ALLOW, "127.0.0.1");//白名单
 // registrationBean.addInitParameter(StatViewServlet.PARAM_NAME_DENY, "");//黑名单
    reg.addInitParameter(StatViewServlet.PARAM_NAME_USERNAME, "admin");
    reg.addInitParameter(StatViewServlet.PARAM_NAME_PASSWORD, "123");
    return reg;
}

//注册过滤器
@Bean
public FilterRegistrationBean filterRegistrationBean() {
    FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
    // WebStatFilter statFilter = new WebStatFilter();
    // statFilter.setSessionStatEnable(true);// 对session进行监控，默认为true
    filterRegistrationBean.setFilter(new WebStatFilter());
    filterRegistrationBean.addUrlPatterns("/*"); //监控所有的路径
    filterRegistrationBean.addInitParameter(WebStatFilter.PARAM_NAME_EXCLUSIONS, "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*"); //排除请求路径
    filterRegistrationBean.addInitParameter(WebStatFilter.PARAM_NAME_PROFILE_ENABLE, "true");
    return filterRegistrationBean;
}
```


* 参考地址 https://www.yiibai.com/mysql/ifnull.html

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



###  数据库操作

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
    PRIMARY KEY (`id`) USING BTREE,
    KEY `user_id` (`user_id`) USING BTREE  -- 建表时添加索引
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='消息';

/*CHARACTER SET utf8 */这是为了解决中文乱码 
```

* AUTO_INCREMENT 定义列为自增的属性，一般用于主键

- PRIMARY KEY 关键字用于定义列为主键。 您可以使用多列来定义主键，列间以逗号分隔。
- ENGINE 设置存储引擎，CHARSET 设置编码。

##### 1-1 索引

**MYSQL 索引有四种**

* PRIMARY（**唯一且不能为空**；**一张表只能有一个主键索引**）、

* INDEX（普通索引）、

* UNIQUE（唯一性索引）、

* FULLTEXT （全文索引：用于搜索很长一篇文章的时候，效果最好。用在比较短的文本，如果就一两行字的，普通的 INDEX 也可以）

```mysql
ALTER TABLE t_user ADD INDEX name_city_phone(USERNAME,CITY,PHONE)  //普通复合索引

ALTER TABLE t_user ADD UNIQUE name_city_phone(USERNAME,CITY,PHONE) //唯一复合索引

#drop index name
```

**BTREE索引最左前缀匹配原则使用注意事项：**

- 最左前缀匹配原则，非常重要的原则，mysql会一直向右匹配直到遇到范围查询(>、<、between、like)就停止匹配，比如a = 1 and b = 2 and c > 3 and d = 4 如果建立(a,b,c,d)顺序的索引，d是用不到索引的，如果建立(a,b,d,c)的索引则都可以用到，a,b,d的顺序可以任意调整。【范围查询的字段，在建立复合索引一定要置后】
- =和in可以乱序，比如a = 1 and b = 2 and c = 3 建立(a,b,c)索引可以任意顺序，mysql的查询优化器会帮你优化成索引可以识别的形式

###### 1- 1-1 USING B-TREE索引使用场景

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

###### 1-1-2 HASH索引

- Hash索引基于Hash表实现，只有查询条件精确匹配Hash索引中的所有列才会用到hash索引
- 存储引擎会为Hash索引中的每一列都计算hash码，Hash索引中存储的即hash码，所以每次读取都会进行两次查询
- Hash索引无法用于排序
- Hash不适用于区分度小的列上，如性别字段



#### 2、添加字段

~~~mysql
alter table   table1 add id int unsigned not Null auto_increment primary key
COMMENT '备注',
~~~

#### 3、修改字段

~~~mysql
alter table 表名称 modify 字段名称 字段类型 [是否允许非空];
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

7、创建一个存储过程并执行

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
```



### LEFT JOIN

​	**注意点：** 查询时需要判断是否是  根据主表的关联。  

犯的错误：一对一 关联查询

正确的是：一对多 关联查询

多对多查询（left join 可以实现吗？ 只能用普通的where关联成多对多吧）

### 时间默认值

```mysql
SELECT NOW() -- 2018-10-06 10:57:54

SELECT CURDATE() -- 2018-10-06

SELECT CURRENT_TIME() -- 10:57:31

SELECT CURRENT_DATE() -- 2018-10-06 和 CURDATE() 函数结果一样

SELECT CURRENT_TIMESTAMP() -- 2018-10-06 10:58:25  和now()结果 一样

SELECT CURRENT_USER()   
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





### 查询一张表有几个字段

```mysql
select * from information_schema.COLUMNS where table_name='表名' and TAble_schema = '库'
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



### 函数用法

#### 1、concat和group_concat的用法

* **concat**(str1,str2,...)

  ```mysql
  1、功能：将多个字符串连接成一个字符串。
  2、语法：concat(str1, str2,...)
  返回结果为连接参数产生的字符串，如果有任何一个参数为null，则返回值为null。
  ```

* **concat_ws()函数**

  ```mysql
  1、功能：和concat()一样，将多个字符串连接成一个字符串，但是可以一次性指定分隔符～（concat_ws就是concat with separator）
  2、语法：concat_ws(separator, str1, str2, ...)
  ```

* **group_concat()函数**

```mysql
1、功能：将group by产生的同一个分组中的值连接起来，返回一个字符串结果。

2、语法：group_concat( [distinct] 要连接的字段 [order by 排序字段 asc/desc ] [separator '分隔符'] )

说明：通过使用distinct可以排除重复值；如果希望对结果中的值进行排序，可以使用order by子句；separator是一个字符串值，缺省为一个逗号','。
```

* **replace**( '要修改的总体数据' , '被替换的内容' , '要替换的内容' )

  **str_replace()** 

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
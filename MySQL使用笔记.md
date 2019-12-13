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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='消息';

/*CHARACTER SET utf8 */这是为了解决中文乱码 
```

* AUTO_INCREMENT 定义列为自增的属性，一般用于主键

- PRIMARY KEY 关键字用于定义列为主键。 您可以使用多列来定义主键，列间以逗号分隔。
- ENGINE 设置存储引擎，CHARSET 设置编码。

#### 2、添加字段

~~~mysql
alter table   table1 add id int unsigned not Null auto_increment primary key
COMMENT '备注',
~~~

#### 3、修改字段

~~~mysql
alter table 表名称 modify 字段名称 字段类型 [是否允许非空];
~~~

#### 4、删除字段

~~~mysql
ALTER TABLE mytable DROP 字段名;
~~~

#### 5、新建用户并分配权限

```mysql
1、本地 Mysql 创建数据库
CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

2、本地 Mysql 创建用户并分配权限
CREATE USER 'sonar' IDENTIFIED BY 'sonar';
GRANT ALL PRIVILEGES ON *.* TO 'sonar'@'%' IDENTIFIED BY 'sonar' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 时间默认值

```mysql
SELECT NOW() -- 2018-10-06 10:57:54

SELECT CURDATE() -- 2018-10-06

SELECT CURRENT_TIME() -- 10:57:31

SELECT CURRENT_DATE() -- 2018-10-06 和 CURDATE() 函数结果一样

SELECT CURRENT_TIMESTAMP() -- 2018-10-06 10:58:25  和now()结果 一样

SELECT CURRENT_USER()   
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

说明：通过使用distinct可以排除重复值；如果希望对结果中的值进行排序，可以使用order by子句；separator是一个字符串值，缺省为一个逗号。
```




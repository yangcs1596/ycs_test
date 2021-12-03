## ElasticSearch的基本概念：

两个端口：9100、 9200

`Index` 类似于mysql数据库中的database

`Type` 类似于mysql数据库中的table表，es中可以在Index中建立type（table），通过mapping进行映射(**6.0的版本不允许一个index下面有多个type，并且官方说是在接下来的7.0版本中会删掉type**)  如_doc就是代表type

`Document` 由于es存储的数据是文档型的，一条数据对应一篇文档即相当于mysql数据库中的一行数据row，一个文档中可以有多个字段也就是mysql数据库一行可以有多列

`Field` es 中一个文档中对应的多个列与mysql数据库中每一列对应

`Mapping`  可以理解为mysql或者solr中对应的schema，只不过有些时候es中的mapping增加了动态识别功
 能

`indexed`   就是名义上的建立索引

`Query DSL`  类似于mysql的sql语句，只不过在es中是使用的json格式的查询语句，专业术语就叫：QueryDSL GET/PUT/POST/DELETE

```json
#ES与数据库的对照
DB -> Databases -> Tables -> Rows -> Columns 
ES -> Indices -> Types -> Documents -> Fields
```





## 1、节点



```shell
#查看节点信息
curl -XGET 'http://127.0.0.1:9200/_cat/nodes?v'

#查看所有节点信息
curl -XGET 'http://127.0.0.1:9200/_nodes?pretty=true'

#查看指定节点的信息  
curl -XGET 'http://127.0.0.1:9200/_nodes/nodeName?pretty=true'
```

## 2、索引



```shell
#查看所有索引
curl -XGET 'http://localhost:9200/_cat/indices?v'
#创建索引
curl -XPUT "http://localhost:9200/test_index"
#创建索引，指定分片和副本的数量
curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/test_index?pretty" -d'
{
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas": 1
  }
}'

#创建索引（test_index）、创建类型(product)、指定mapping的数据
curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/test_index?pretty" -d' 
{
  "mappings": {
    "product" : {
      "properties": {
        "id" : {
          "type": "text",
          "index": "false"
        },
        "userName" : {
          "type": "text",
          "index": "true"
        }
      }
    }
  }
}'

#在已创建的索引下添加类型的mapping
curl -H "Content-Type: application/json" -XPUT 'http://localhost:9200/test_index/person/_mapping?pretty' -d '{ 
 "person" : {
    "properties" : {
      "date" : {
        "type" : "long"
      },
      "name" : {
        "type" : "text",
        "index" : "false"
      },
      "status" : {
        "type" : "integer"
      },
      "type" : {
        "type" : "integer"
      }
    }
  }
}'
#获取索引信息
curl -XGET "http://localhost:9200/test_index?pretty"
#查看索引的统计信息
curl -XGET "http://localhost:9200/test_index/_stats?pretty"
#获取索引的mappings
curl -XGET "http://localhost:9200/test_index/_mappings?pretty"
#删除索引
curl -XDELETE "http://localhost:9200/test_index"
```

## 3、文档



```shell
#插入数据
curl -H "Content-Type: application/json"  -XPOST 'http://localhost:9200/test_index/person/?pretty' -d '{"date":11222, "name": "abc", "status": 1,"type":134}'

#查询索引中的全部内容
curl -XGET "http://localhost:9200/test_index/_search?pretty"
#查询某个type的内容
curl -XGET "http://localhost:9200/test_index/person/_search?pretty"

#根据文档的id查询文档，如果需要查询多个字段使用逗号进行隔开，不指定就是显示全部字段
curl -XGET "http://localhost:9200/test_index/person/zbyJjXYB2UzVbYB2ykZa?_source=name,type&pretty"

#根据条件进行简单查询
curl -XGET "http://localhost:9200/test_index/person/_search?q=name:&pretty"

#更新文档内容
curl -H "Content-Type: application/json"  -XPOST 'http://localhost:9200/test_index/person/0LyYjXYB2UzVbYB2qUZi/_update?pretty' -d '{"doc":{ "name": "wxg111", "status": 1,"type":134}}'

#删除文档内容
curl -XDELETE  "http://localhost:9200/test_index/person/zryOjXYB2UzVbYB2AkbI?&pretty"
```

## 4、DSL



```shell
#查询索引下所有文档
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match_all": {} }}'

#查询索引下所有文档,并返回第一个文档
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match_all": {} },"size":1}'

#匹配所有并返回第1到10
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match_all": {} },"from": 0,"size": 10}'

#根据属性降序排序(size未指定默认为10)
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match_all": {} },"sort": {"status": { "order": "desc" }}}'

#返回name和status这2个fields（_source里），相当于sql：SELECT name, status FROM....
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match_all": {} },"_source": ["name", "status"]}'

#返回status为1的，相当于sql的WHERE
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d '{"query": { "match": { "status": 1 } }}'

#返回type=77 && status=1的文档
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d  '{"query": {"bool": {"must": [{ "match": { "type": 77 } },{ "match": { "status": 1 } }]}}}'

#返回type=77 || status=1的文档
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d  '{"query": {"bool": {"should": [{ "match": { "type": 77 } },{ "match": { "status": 1 } }]}}}'

#返回type=77 非 status=1的文档
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d  '{"query": {"bool": {"must_not": [{ "match": { "type": 77 } },{ "match": { "status": 1 } }]}}}'

#返回type是134但status不是2的
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d  '{"query": {"bool": { "must": [{ "match": { "type": 134 } }],"must_not": [{ "match": { "status": 2 } }]}}}'

# 相当于sql: SELECT COUNT() from bank GROUP BY state ORDER BY COUNT() DESC。
#「size=0」是设置不显示search hit
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d   '{"size": 0,"aggs": {"group_by_state": {"terms": {"field": "status"}}}}'

#按state分组并计算(组)平均balance(默认返回前10个按state的COUNT的降序(DESC)排)
curl -H "Content-Type: application/json" -XPOST 'http://localhost:9200/test_index/_search?pretty' -d   '{"size": 0,"aggs": {"group_by_state": {"terms": {"field": "status"},"aggs": {"average_balance": {"avg": {"field": "type"}}}}}}'
```





## 综合场景查询

**must** ——所有的语句都 必须（must） 匹配，与 AND 等价。
**must_not** ——所有的语句都 不能（must not） 匹配，与 NOT 等价。
**should** ——至少有一个语句要匹配，与 OR 等价。
**filter**——必须匹配，运行在非评分&过滤模式。

```json
{
    "query":{
        "bool":{
            "must":[
                {
                    "match_all":{

                    }
                }
            ],
            "must_not":[

            ],
            "should":[

            ]
        }
    },
    "from":0,
    "size":10,
    "sort":[

    ],
    "aggs":{

    }
}
```



```json
# GET /_search
{
    "query":{
        "bool":{
            "must":[
                {
                    "match":{
                        "title":"Search"
                    }
                },
                {
                    "match":{
                        "content":"Elasticsearch"
                    }
                }
            ],
            "filter":[
                {
                    "term":{
                        "status":"published"
                    }
                },
                {
                    "range":{
                        "publish_date":{
                            "gte":"2015-01-01"
                        }
                    }
                }
            ]
        }
    }
}
```

### 精确查询，类似mysql语句

SELECT document FROM products WHERE price = 20;


```json
#GET /my_store/products/_search
{
    "query":{
        "term":{
            "price":20
        }
    }
}
```

### filters

当进行精确值查找时， 我们会使用过滤器（filters）。过滤器很重要，因为它们执行速度非常快，不会计算相关度（直接跳过了整个评分阶段）而且很容易被缓存。如下： 使用 constant_score 查询以非评分模式来执行 term 查询并以一作为统一评分。

```json
#GET /my_store/products/_search
{
    "query":{
        "constant_score":{
            "filter":{
                "term":{
                    "price":20
                }
            }
        }
    }
}
```

### 范围检索（range query）

range 查询可同时提供包含（inclusive）和不包含（exclusive）这两种范围表达式，可供组合的选项如下：

```
gt: > 大于（greater than）
lt: < 小于（less than）
gte: >= 大于或等于（greater than or equal to）
lte: <= 小于或等于（less than or equal to）
```

类似Mysql中的范围查询：

```
SELECT document
FROM products
WHERE price BETWEEN 20 AND 40
```

ES中对应的DSL如下：

```json
#GET /my_store/products/_search
{
    "query":{
        "constant_score":{
            "filter":{
                "range":{
                    "price":{
                        "gte":20,
                        "lt":40
                    }
                }
            }
        }
    }
}
```



### 存在与否检索（exist query）

mysql中，有如下sql：
SELECT tags FROM posts WHERE tags IS NOT NULL;

ES中，exist查询某个字段是否存在：

```json
GET /my_index/posts/_search
{
    "query" : {
        "constant_score" : {
            "filter" : {
                "exists" : { "field" : "tags" }
            }
        }
    }
}
```

若想要exist查询能匹配null类型，需要设置mapping：

```
"user": {
  "type": "keyword",
  "null_value": "_null_"
}
```

### 通配符检索( wildcard query)

匹配具有匹配通配符表达式（ (not analyzed ）的字段的文档。 支持的通配符：
1）*****它匹配任何字符序列（包括空字符序列）；
2）?它匹配任何单个字符。
请注意，此查询可能很慢，因为它需要遍历多个术语。
为了防止非常慢的通配符查询，通配符不能以任何一个通配符*或？开头。
举例：

```
GET /_search
{
"query": {
"wildcard" : { "user" : "ki*y" }
}
}
```

#### sql理解

```
注意： 
collapse关键字

折叠功能ES5.3版本之后才发布的。
聚合&折叠只能针对keyword类型有效

#
match查询
query知道分词器的存在，会对filed进行分词操作，然后再查询 模糊匹配字段查询
match_all:查询所有文档
multi_match:可以指定多个字段 多字段模糊匹配：
match_phrase:短语匹配查询，ElasticSearch引擎首先分析（analyze）查询字符串，从分析后的文本中构建短语查询，这意味着必须匹配短语中的所有分词，并且保证各个分词的相对位置不变 精确匹配字段查询

match和term的区别是,match查询的时候,elasticsearch会根据你给定的字段提供合适的分析器,而term查询不会有分析器分析的过程，match查询相当于模糊匹配,只包含其中一部分关键词就行

#
bool查询
bool查询包含四种操作符，分别是must,should,must_not,query。它们均是一种数组，数组里面是对应的判断条件

1.must：
必须匹配，与and等价。 
2.must_not：
必须不匹配，与not等价，常过滤子句用，但不贡献算分
3.should：
选择性匹配，至少满足一条，与 OR 等价。贡献算分
4.filter：
过滤子句，必须匹配，但不贡献算分

#
filter查询
过滤器，会查询对结果进行缓存，不会计算相关度，避免计算分值，执行速度非常快。

filter也常和range范围查询一起结合使用，range范围可供组合的选项
gt : 大于
lt : 小于
gte : 大于等于
lte :小于等于

```

##### term和terms的区别

```bash
#term 查询某个字段里含有某个关键词的文档
GET /index/type/_search/
{
  "query": {
    "term": {
      "title": "blog"
    }
  }
}
#terms 查询某个字段里含有多个关键词的文档
GET /index/type/_search/
{
  "query": {
    "terms": {
      "title": [ "blog","first"]
    }
  }
}
```

##### 关于分页查询 from 和 size

* from-size"浅"分页, 越往后的分页，执行的效率越低。

```java
System.out.println("from size 模式启动！");
Date begin = new Date();
long count = client.prepareCount(INDEX).setTypes(TYPE).execute().actionGet().getCount();
SearchRequestBuilder requestBuilder = client.prepareSearch(INDEX).setTypes(TYPE).setQuery(QueryBuilders.matchAllQuery());
for(int i=0,sum=0; sum<count; i++){
    SearchResponse response = requestBuilder.setFrom(i).setSize(50000).execute().actionGet();
    sum += response.getHits().hits().length;
    System.out.println("总量"+count+" 已经查到"+sum);
}
Date end = new Date();
System.out.println("耗时: "+(end.getTime()-begin.getTime()));
```



* scroll“深”分页 

```java
下面是scroll分页的执行代码，注意啊！scroll里面的size是相对于每个分片来说的，所以实际返回的数量是：
分片的数量*size


System.out.println("scroll 模式启动！");
begin = new Date();
SearchResponse scrollResponse = client.prepareSearch(INDEX)
    .setSearchType(SearchType.SCAN).setSize(10000).setScroll(TimeValue.timeValueMinutes(1)) 
    .execute().actionGet();  
count = scrollResponse.getHits().getTotalHits();//第一次不返回数据
//分别以每页5000,10000,50000的数据量请求，
for(int i=0,sum=0; sum<count; i++){
    scrollResponse = client.prepareSearchScroll(scrollResponse.getScrollId())  
        .setScroll(TimeValue.timeValueMinutes(8))  
    .execute().actionGet();
    sum += scrollResponse.getHits().hits().length;
    System.out.println("总量"+count+" 已经查到"+sum);
}
end = new Date();
System.out.println("耗时: "+(end.getTime()-begin.getTime()));
```



##### 控制查询返回的数量

```json
{
    "from": 0,
    "size": 10,
    "terms":{"interests":["shufa","youyong"]}
}
#返回版本号
{
  "version":true,
  "query":{
    "term":{"interests": "changge"}
  }
}
```



##### ES查询指定列_source

```json
{
    "_source": {
        "include": [
            "delivery_id", 
            "sender_mobile"
        ],
        "exclude":[]
    }
}
```

##### ES的in语句

```json
{
    "_source": {
        "include": [
            "delivery_id", 
            "sender_mobile"
        ]
    }, 
    "query": {
        "bool": {
            "must": [
                {
                    "terms": {
                        "sender_mobile": [
                            "12122222222", 
                            "13111111111", 
                            "13522222222"
                        ]
                    }
                }
            ]
        }
    }
}
```

##### ES去重后计数

```json
#select distinct(count(1)) from test;
{
  "query": {
    "match_all": {}
  },
  "size": 0,
  "aggs": {
    "uid_aggs": {
      "cardinality": {
        "field": "uid"
      }
    }
  }
}
```

##### ES去重 - distinct

```json
#SELECT DISTINCT(user_id) FROM table WHERE user_id_type = 3;
{
  "query": {
    "term": {
      "user_id_type": 3
    }
  },
  "collapse": {
    "field": "user_id"
  }
}
```

##### ES的cardinality统计去重结果

```json
#SELECT COUNT(DISTINCT(user_id)) FROM table WHERE user_id_type = 3;
{
  "query": {
    "term": {
      "user_id_type": 3
    }
  },
  "aggs": {
    "count": {
      "cardinality": {
        "field": "user_id"
      }
    }
  }
}
```

##### ES的- count + group by

```json
#SELECT COUNT(user_id) FROM table GROUP BY user_id_type;

{
  "aggs": {
    "user_type": { #count(*) as user_type
      "terms": {
        "field": "user_id_type" #group by的字段
      }
    }
  }
}
```



```json
#es根据一个字段分组聚合另一个字段进行排序
{
    "aggs":{
        "custom":{
            "terms":{
                "field":"field1",
                "size":100000,
                "order":{
                    "count":"desc"
                }
            },
            "aggs":{
                "count":{
                    "sum":{
                        "field":"field2"
                    }
                }
            }
        }
    }
}
```



##### ES的-collapse 实现 group by

```json
#主要是用collapse
{
  "query": {
    "term": {
      "user_id_type": 3
    }
  },
  "collapse": {
     "field": "duplicate_id",         //要进行折叠的字段
        "inner_hits": {               //折叠的参数集
            "name": "test",           //折叠的name,目前没有发现哪里有用到的地方,可能在多个折叠情况下有用
            "ignore_unmapped": true,  //默认为false,如果存在一些数据没有折叠字段的会报错,设置为true可以避免类似的报错
            "from": 0,   //from和size用来控制想要返回的折叠列表,这里我的需求是重复id相同仅返回头条,
            "size": 0,  //所以两个参数均设置为0,如果有需求折叠列表的可以通过这里控制
            "version": false,
            "explain": false,
            "track_scores": true,
            "sort": [{  //折叠列表的排序,折叠列表中要把谁显示在第一个的排序,比如这样做是将该折叠列表的数据按字段level倒序排列.
                "level": {
                    "order": "desc"
                }
            }]
        }
  }
}

#java代码实现
CollapseBuilder collapseBuilder = new CollapseBuilder("duplicate_id");
InnerHitBuilder innerHitBuilder = new InnerHitBuilder();
innerHitBuilder.setName("test");
innerHitBuilder.setSize(0);
innerHitBuilder.setTrackScores(true);
innerHitBuilder.setIgnoreUnmapped(true);
innerHitBuilder.addSort(SortBuilders.fieldSort("level").order(SortOrder.DESC));
collapseBuilder.setInnerHits(innerHitBuilder);

......

srb = client.prepareSearch(indexName)
            .setTypes(typeName)
            .setQuery(bqb)
            .setFrom(params.getFrom())
            .setSize(params.getSize())
            .setCollapse(collapseBuilder)
            .setPreference("_primary_first");
```

##### 范围查询

```json
#include_lower:是否包含范围的左边界，默认是true
#include_upper:是否包含范围的右边界，默认是true
{
    "query": {
        "range": {
            "birthday": {
                "from": "1990-10-10",
                "to": "2000-05-01",
                 "include_lower": true,
                "include_upper": false
            }
        }
    }
}
```

##### Es的wildcard通配查询

允许使用通配符* 和 ?来进行查询
*代表0个或多个字符
？代表任意一个字符

```json

{
    "query": {
        "wildcard": {
             "name": "wang*"
        }
    }
}
```

##### 模糊查询

```json
#match query实现模糊搜索，该方式会对匹配文本进行分词然后匹配分词后的每个词项，匹配操作有OR和AND，默认为OR
{
  "query": {
    "match": {
      "text": {
        "query":  "hello world",
        "fuzziness": "AUTO",
        "operator":  "and"
      }
    }
  }
}

#match phase query实现模糊搜索，该方式不会对匹配文本进行分词，能够在text类型的字段上进行数据库like的匹配效果。
{
  "query": {
    "match_phrase": {
      "message": "this is a test"
    }
  }
}


```

## Update操作

#### 脚本script更新

```json
#POST test/_doc/1/_update
#更新counter的值
{
    "script" : {
        "source": "ctx._source.counter += params.count",
        "lang": "painless",
        "params" : {
            "count" : 4
        }
    }
}
#标签列表中添加一个标签（注意，如果标签存在，它仍会添加它，因为它是一个列表）
{
    "script" : {
        "source": "ctx._source.tags.add(params.tag)",
        "lang": "painless",
        "params" : {
            "tag" : "blue"
        }
    }
}
#添加一个字段new_field到文档
{
    "script" : "ctx._source.new_field = 'value_of_new_field'"
}
#移除字段
{
    "script" : "ctx._source.remove('new_field')"
}
#如果tags字段包含green,就删除文档，否则就什么都不做
{
    "script" : {
        "source": "if (ctx._source.tags.contains(params.tag)) { ctx.op = 'delete' } else { ctx.op = 'none' }",
        "lang": "painless",
        "params" : {
            "tag" : "green"
        }
    }
}
```

#### _update_by_query批量局部更新

```json
# http://10.2.122.170:9200/index/type/_update_by_query/    post
{
   "query": {
        "bool": { 
            "filter": {
                "terms": {
                    "_id": ["AVV_u51pGC2iX1EFQSzf","AVV_u51pGC2iX1EFQezh"]
                }
            }
        }
    },
    "script": {
        "inline":"ctx._source.updateTime = 1467907200000;ctx._source.userId=params.userId",
        "params":{
            "userId":"123"
        }
    }
    
}
```

## Delete操作

Delete-by-query 和 Update-by-query 重新回到 core 

#### _delete-by-query

```json
#方式一：http://serverhost:9200/index/type/_delete_by_query   post
#方式二：/索引名/需要清空的type/_query  DELETE
{
   "query": {
      "match": {
         属性字段: 要删除的属性值
      }
   }
}
```

## 新增数据操作

分为指定Id和自动生成Id两种；

1，指定Id使用PUT操作

PUT http://127.0.0.1:9200/people/man/1

```
{
    "name":"stono",
    "country":"China",
    "age":111,
    "date":"1999-11-11"
}
```

2，自动生成Id使用POST操作

POST http://127.0.0.1:9200/people/man/

```
{
    "name":"stono22",
    "country":"China",
    "age":22,
    "date":"1999-11-11"
}
```

#### 新增字段

想要新增full_name_copy字段，类型为keyword，并初始化值为full_name

步骤1 新增字段

```bash
PUT {{di}}/audit_demo/_doc/_mapping
{
    "properties": {
        "full_name_copy": {
            "type": "keyword"
        }
    }
}
```

步骤2 使用painless赋值

```bash
POST {{di}}/audit_demo/_update_by_query
{
    "script": {
        "lang": "painless",
        "inline": "ctx._source.full_name_copy = ctx._source.full_name"
    }
}
```



# 附件说明

```json
#es 实现sql的 group by后如何分页
{
    "query": {
        ...... //搜索条件
    },
    "aggs": {
        "count": {   // COUNT(*)，统计GROUP BY后的总数
            "cardinality": {
                "field": "goods_id"    // 因为我这里GROUP BY的字段是goods_id，所以就用goods_id来计数了
            }
        },
        "goods_id": {
            "terms": {
                "field": "goods_id",    // 选择GROUP BY的字段
                "size": 20    // 取出20条GROUP BY的数据。数量应设置为sql中offset+limit的数量。注：其实es聚合操作不是很支持分页，于是只能先将数据取出，再对其做分页操作，可想而知页数越往后效率越低
            },
            "aggs": {
                "group": {
                    "top_hits": {
                        "sort": [
                            {
                                "stock_num": {
                                    "order": "desc"    // GROUP BY的数据如何排序，这里是根据stock_num 降序排列
                                }
                            }
                        ],
                        "_source": {    // 对应SQL的SELECT 
                            "includes": [
                                "goods_no"    // SELECT的列
                            ]
                        },
                        "size": 1    // es聚合时需要指定返回几条数据（即返回几条同一个goods_id的数据）我们做GROUP BY操作就只要写1就完事了
                    }
                },
                "r_bucket_sort": {    // 分页操作
                    "bucket_sort": {
                        "sort": [],
                        "from": 0,   // 对上面取出的20条数据分页，等价于SQL的OFFSET
                        "size": 10   // SQL的LIMIT
                    }
                }
            }
        }
    },
    "size": 0,   // 因为是做聚合操作，所以直接无视query筛选出的数据
    "from": 0
}
```


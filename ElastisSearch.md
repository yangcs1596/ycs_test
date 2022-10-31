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

常用的字段数据类型 text, keyword, date, long, double, boolean , ip 在建立索引时，可以指定字段的数据类型
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

## 5、aggs聚合概念

```
ES的聚合一共有4种类型，Bucket 、Metric、Pipeline 是经常使用的，掌握了这3种聚合就已经可以满足日常大部分的聚合分析场景了。
demo：
GET /cars/_search
{
  "size": 0,
  "aggs": {
    "first_agg_name": {
      "terms": {
        "field": "color"
      },
      "aggs": {
        "sub_agg_name1": {
          "avg": {
            "field": "price"
          }
        },
        "sub_agg_name2": {
          "terms": {
            "field": "make"
          }
        }
      }
    }
  }
} 
```

掌握Aggregations需要理解两个概念：

- 桶(Buckets)：符合条件的文档的集合，相当于SQL中的group by。比如，在users表中，按“地区”聚合，一个人将被分到北京桶或上海桶或其他桶里；按“性别”聚合，一个人将被分到男桶或女桶

- 指标(Metrics)：基于Buckets的基础上进行统计分析，相当于SQL中的count,avg,sum等。比如，按“地区”聚合，计算每个地区的人数，平均年龄等

![img](.\image\aggs_bukets.png)

```json
https://www.cnblogs.com/duanxz/p/6528161.html
##Metrics度量聚合##
AVG、min 、max、sum 一般作用于number类型字段上
Stats 统计
value_count:  计数
cardinality: 去重计数
percentiles: 百分比
top_hits： 简单来说就是聚合分组后从每一个组取部分数据作为结果返回

#order排序
order指定了最后返回结果的排序方式，默认是按照doc_count排序。
{
    "aggs" : {
        "genders" : {
            "terms" : {
                "field" : "gender",
                "order" : { "_count" : "asc" }
            }
        }
    }
}
#桶聚合也支持脚本的使用：
{
    "aggs" : {
        "genders" : {
            "terms" : {
                "script" : "doc['gender'].value"
            }
        }
    }
}
#缺省值Missing value
{
    "aggs" : {
        "tags" : {
             "terms" : {
                 "field" : "tags",
                 "missing": "N/A" 
             }
         }
    }
}

例子Date Range
GET /product/_search
{
  "aggs": {
    "range": {
      "date_range": {
        "field": "date",
        "format": "yyyy-MM",
        "ranges": [
          {
            "to": "now-10M/M"
          },
          {
            "from": "now-10M/M"
          }
        ]
      }
    }
  }
}
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

### query-term精确查询，类似mysql语句




```json
SELECT document FROM products WHERE price = 20;
#GET /my_store/products/_search
{
    "query":{
        "term":{
            "price":20
        }
    }
}
```

### filters 过滤器

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

##### Query 和 match 和 bool

```
match Query即全文检索，它的搜索方式是先将搜索字符串分词，再使用各各词条从索引中搜索。

match query与Term query区别是match query在搜索前先将搜索关键字分词，再拿各各词语去索引中搜索。

布尔查询对应于Lucene的BooleanQuery查询，实现将多个查询组合起来。
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

##### ES去重后计数 aggs类似与 group by

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
#简单聚合
语法：
"aggs": {
    "名称": {
      "聚合类型": {
        "field": "聚合字段",
        "order": { "排序字段": "desc" } 
      }
    }
  }

常用聚合类型查询：
terms:分组查询，并返回数量
avg：平均值查询
sum：总和查询
max：最大值查询
min：最小值查询
stats：返回以上所有信息，求统计
cardinality 统计数据类似 count
#多聚合
语法：
"aggs": {
    "名称": {
      "聚合类型": {
        "field": "聚合字段"
      }
    }，
    "名称": {
      "聚合类型": {
        "field": "聚合字段"
      }
    }
  }
#聚合嵌套
语法：
  "aggs": {
    "名称": {
      "聚合类型": {
        "field": "聚合字段"
      },
      "aggs": {
        "名称": {
          "聚合类型": {
            "field": "聚合字段"
          }
        }
      }
    }
  }
```

- 子聚合查询 - 即按照已分好的桶再按照子聚合查询往下聚合查询

> 比如查询各游戏付费用户总付费金额

```text
GET /youi_idx/_search
{
  "query":{
    "bool":{
      "filter":[
        {"term":{"ename":"pay"}}
        ]
    }
  }
  , "size": 0
  , "aggs": {
    "app_id": {
      "terms": {
        "field": "app_id",
        "size": 10
      },
      "aggs": {
        "amount": {
          "sum": {
            "field": "amount"
          }
        }
      }

    }
  }
}
```

> 注意：Metrics聚合不能子聚合查询



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

##### aggs的cardinality统计去重结果

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
#数量聚合
eg: 根据村来统计文档的数目，相当于sql中的count(*)

 select aab069, count(*) from xxx group by village
 {
   "query": {
     "match_all": {}
   },
   "size": 0,
   "aggs": {
     "villages" : {
       "terms" : {
         "field" : "village.keyword"
       }
     }
   }
 }
#统计结果为
 {
   "aggregations": {
     "villages": {
       "doc_count_error_upper_bound": 7109,
       "sum_other_doc_count": 11029748,
       "buckets": [
         {
           "key": "大庄村",
           "doc_count": 30304
         },
         {
           "key": "新庄村",
           "doc_count": 20846
         },
         {
           "key": "中庄村",
           "doc_count": 9466
         }
       ]
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
                "level": { "order": "desc" }
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

##### 多个字段的聚合查询

* 两种方式

1、大桶套小桶，通过terms一层层聚合
这个方法适用于需要统计每一项的数据，比如a中有多少种b

2、函数扩展（script）聚合
这个方法适用于直接统计有多少种组合

* 下面是方法2的具体实现：

统计：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```json
GET ****_20190926/_search
{
  "size": 0,
  "aggs": {
    "pre": {
      "terms": {
          // group by inChannel, resCode
        "script": "doc['inChannel'].values +'####'+doc['resCode'].values",
        "size": 5
      } 
    }
  }
}
#结果
{
  "took": 2,
  "timed_out": false,
  "_shards": {
    "total": 5,
    "successful": 5,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": 18,
    "max_score": 0,
    "hits": []
  },
  "aggregations": {
    "pre": {
      "doc_count_error_upper_bound": 0,
      "sum_other_doc_count": 0,
      "buckets": [
        {
          "key": "[7220101]####[0]",
          "doc_count": 13
        },
        {
          "key": "[]####[]",
          "doc_count": 2
        },
        {
          "key": "[1020201]####[]",
          "doc_count": 1
        },
        {
          "key": "[10202]####[]",
          "doc_count": 1
        },
        {
          "key": "[7220101]####[]",
          "doc_count": 1
        }
      ]
    }
  }
}
#java代码参考
Script script = new Script("doc['inChannel'].values +'####'+ doc['resCode'].values");
//用于统计每一项详细数据
TermsAggregationBuilder app = AggregationBuilders.terms("app").script(script).size(10000);
//用于统计有多少项
CardinalityAggregationBuilder app = AggregationBuilders.cardinality("app").script(script).precisionThreshold(10000);
```



##### aggs的例子

```json
#一个aggs里可以有很多个聚合，每个聚合彼此间都是独立的
{
  "query": {
    "match": {
      "hobby": "网吧"
    }
  },
  "aggs": {
    "max_age": {
      "max": {
        "field": "age"
      }
    },
    "min_age": {
      "min": {
        "field": "age"
      }
    },
    "avg_age": {
      "avg": {
        "field": "age"
      }
    }
  }
}
执行结果：
{
  "took" : 2,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : 3,
    "max_score" : 0.0,
    "hits" : [ ]
  },
  "aggregations" : {
    "max_age" : {
      "value" : 30.0
    },
    "avg_age" : {
      "value" : 18.333333333333332
    },
    "min_age" : {
      "value" : 12.0
    }
  }
}


```

##### sort排序

```json
select * from user_info order by field(gender, 'Male', 'Female'), id desc; 

{
    "from":0,
    "size":10,
    "query":{
        "match_all": {}
    },
    "sort":[
        {
            "_script":{
                "script":{
                    "source":"params.sortMap[doc['gender'].value]",
                    "lang":"painless",
                    "params":{
                        "sortMap":{
                            "Male":1,
                            "Female":2
                        }
                    }
                },
                "type":"number",
                "order":"asc"
            }
        },
        {
            "_id":{
                "order":"desc"
            }
        }
    ]
}

 #文档字段的排序
{
  "query":{ 
    "match_all": { 
    }
  },
  "sort": [ 
    {"create_time": { "order": "asc" }},
    {"age": { "order": "desc" }}
  ]
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

## 删除es索引脚本

```shell
#/bin/bash

# 清理几天前的索引
dayn=2
# ES IP & port
esip=127.0.0.1
esport=9200
# 匹配日期正则表达式,日期格式为：YYYY.mm.dd
regular="[0-9]{4}(.[0-9]{2}){2}"

#指定日期
date1=`date -d "$dayn day ago" +%Y-%m-%d`
#当前日期
time=`date "+%Y-%m-%d %H:%M:%S"`
echo "${time}:开始清理  $date1(${dayn}天)之前ES索引"


res=`curl -XGET "http://${esip}:${esport}/_cat/indices/?v"|grep -E $regular|awk '{print $3}'`

t1=`date -d "$date1" +%s`
for var in $res; 
do
    # 如果索引中的日期格式已经是YYYY-mm-dd格式，就不用使用sed替换了，本例索引中日期格式为：YYYY.mm.dd
    date2=`echo $var| tr -cd $regular|sed 's/\./-/g'`
    t2=`date -d "$date2" +%s`
    if [ $t1 -gt $t2 ]; then
        #echo "$date1 > $date2"
        echo "${time}: 清理 $var 索引"
        #curl --user account:pwd -XDELETE "http://${esip}:${esport}/$var"
        curl -XDELETE "http://${esip}:${esport}/$var"
    fi
done
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

以上都是es的命令操作之类

# springboot使用ElasticSearch搜索引擎

* https://www.cnblogs.com/yijialong/p/9729988.html

```shell
执行logstash的命令
# logstash -e 'input { stdin { } } output { stdout {} }'
注:
  -e          执行操作
  input       标准输入
  { input }   插件
  output      标准输出
  { stdout }  插件
```



## Logstash详解之——input模块

实例

```shell
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

```shell
logstash -f /etc/logstash.d/
#logstash 会自动读取 /etc/logstash.d/ 目录下所有 *.conf的文本文件，然后在自己内存里拼接成一个完整的大配置文件，再去执行。
#./logstash -f stdin.conf &  #后台启动 执行单个文本文件
```



```shell
#日志文件的搭建
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
#数据库表的同步缓存
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
#数据接口api
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



## SpringBoot整合es

```xml
<!--es客户端-->
<dependency>
    <groupId>io.searchbox</groupId>
    <artifactId>jest</artifactId>
    <version>6.3.1</version>
</dependency>
<dependency>
    <groupId>io.searchbox</groupId>
    <artifactId>jest-common</artifactId>
    <version>6.3.1</version>
</dependency>
<dependency>
    <groupId>org.elasticsearch</groupId>
    <artifactId>elasticsearch</artifactId>
    <version>6.2.3</version>
</dependency>
```



## 分词器IK

```
ik_max_word: 会将文本做最细粒度的拆分,比如会将 "中华人民共和国国歌"拆分为
   例："中华人民共和国,中华人民,中华,华人,人民共和国,人民,人,民,共和国,共和,和,国国,国歌"，会穷尽各种可能的组合
ik_smart: 会做最粗粒度的拆分, 比如会将 "中华人民共和国国歌"拆分为 "中华人民共和国,国歌" .
```



```
下载地址：https://github.com/medcl/elasticsearch-analysis-ik/releases
ik中文分词器的版本需要和你的elasticsearch的版本一致

#命令下载
./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.3/elasticsearch-analysis-ik-6.2.3.zip
# sudo /usr/share/elasticsearch/bin/elasticsearch-plugin install http://localhost:8000/elasticsearch-analysis-ik-6.2.3.zip -v

插件安装在 /usr/share/elasticsearch/plugins/
插件的配置文件在 /etc/elasticsearch/analysis-ik
测试下 sudo ./bin/elasticsearch-plugin list 

重启 elasticsearch
service elasticsearch restart

设置中文索引
curl -X PUT http://localhost:9200/weibo #新建一个index

curl -XPUT http://localhost:9200/weibo/_mapping/news -H 'Content-Type: application/json' -d'
{
  "properties": {
    "summary": {
      "type": "text",
      "analyzer": "ik_smart"
    },
    "title": {
      "type": "text",
      "analyzer": "ik_smart"
    }
  }
}'
```

2.安装ik分词器插件

2.1将我们下载好的ik分词器的zip进行解压，

2.2在elasticsearch的plugins目录下创建analysis-ik文件夹

2.3将解压后的文件放到elasticsearch的铺放到analysis中

### 忽略大小写查询

```json
{
    "settings": {
        "analysis": {
            "analyzer": {
                "caseSensitive": {
                    "filter": "lowercase",
                    "type": "custom",
                    "tokenizer": "keyword"
                }
            }
        }
    },
    "mappings": {
        "personInfo": {
            "properties": {
                "userName": {
                    "type": "string",
                    "analyzer": "caseSensitive",
                    "search_analyzer": "caseSensitive"
                }
            }
        }
    }
}
几种例子
https://yuanwenjian.github.io/2018/03/09/Elasticsearch%E5%86%85%E7%BD%AE%E5%88%86%E8%AF%8D%E5%99%A8%E5%8F%8A%E5%AD%97%E7%AC%A6%E8%BF%87%E6%BB%A4%E5%99%A8/

分析器（Analyzer）由三部分构成：

0个或多个字符过滤器（ Character filters）按顺序应用。
有且只有一个分词器（Tokenizer）
0个或多个过滤器（Token filters），按顺序应用。
```



### **手动创建索**

```json
#1.进行创建（我这里借助的是Google的浏览器的插件postman）

#PUT  es地址：9200/indexName
{
	"settings":{
		 "analysis" : {
            "analyzer" : {
                "ik" : {
                    "tokenizer" : "ik_max_word"
                }
            }
        }
	},
	"mappings":{
		"content":{
			"_all": {
                "enabled": false
            },
		"properties":{
			"id":{
				"type":"keyword"
			},
			"catid":{
				"type":"keyword"
			},
			"classify":{
				"type":"integer"
			},
			"title":{
				"type":"text",
				"analyzer": "ik_max_word"
			},
			"author":{
				"type":"text",
				"analyzer": "ik_max_word"
			},
			"published":{
				"type":"date"
			},
			"article":{
				"type":"text",
				"analyzer": "ik_max_word"
			}
			}
		}
	}
```

java代码里的使用

```java
在Java实体类中的需要分词的字段上添加下面注解

@Field(type = FieldType.Text, analyzer = "ik_max_word",searchAnalyzer="ik_smart")
index：是否对该字段分词，默认true。
analyzer：指定插入时的分词模式，一般为ik_max_words。
type：字段类型。
store：是否存储该字段，默认值为false。
searchAnalyzer：指定查询时的分词模式，一般为ik_smart。
```

```java
@Document(indexName = "lzmh_goods")
@Setting(settingPath = "settings/goods-dispense-settings.json")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodsDispenseDoc {
    @Field(type = FieldType.Text, analyzer = "ik_max_word_py", searchAnalyzer = "ik_smart")
    private String all;

    @Field(type = FieldType.Keyword)
    private String appId;

    @Field(type = FieldType.Object)
    private GoodsDispenseSub dispense;
    
}
```

文件名为项目 resources下的settings/goods-dispense-settings.json
```json
{
  "index": {
    "number_of_shards": "1",
    "number_of_replicas": "0",
    "analysis": {
      "analyzer": {
        "ik_max_word_py": {
          "tokenizer": "ik_max_word",
          "filter": "py"
        },
        "ik_smart_py": {
          "tokenizer": "ik_smart",
          "filter": "py"
        },
        "keyword_py": {
          "tokenizer": "keyword",
          "filter": "py"
        }
      },
      "filter": {
        "py": {
          "type": "pinyin",
          "keep_full_pinyin": true,
          "keep_joined_full_pinyin": true,
          "keep_original": true,
          "limit_first_letter_length": 16,
          "remove_duplicated_term": true,
          "none_chinese_pinyin_tokenize": false
        }
      }
    }
  }
}

```



# 备份例子

```
{
    "query": { 
    	"term":{
    		"riskName.keyword":"CVE-2007-2379"
    	}
    },
    "from": 0,
    "size": 10,

    "aggs": {
	   "riskName.keyword": {
	      "terms": {"field": "riskName.keyword" },
	     "aggs": {
		   "containerInfoId": {
		      "cardinality": {"field": "containerInfoId" }
		    }
	     }
      }
   },
    "_source": {
        "includes": [
            "assetName",
            "assetVersion"
        ]
    }
}
```


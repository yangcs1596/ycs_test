# 爬虫框架pyspider

https://www.jianshu.com/p/39c7371dd6c2

pyspider是支持WebUI的，支持任务监控，项目管理，以及多种数据库的一个强大的爬虫框架，这个真的很好用！！

#### 一、为什么要使用pyspider？

我们很好奇，我们明明有了[Scrapy框架](https://www.jianshu.com/p/cecb29c04cd2)，为什么还要使用pyspider框架呢？我们说两点

- pyspider的优点，它有这么几个优点
   1.提供WebUI界面，调试爬虫很方便
   2.可以很方便的进行爬取的流程监控和爬虫项目管理
   3.支持常见的数据库
   4.支持使用PhantomJS，可以抓取JavaScript页面
   5.支持优先级定制和定时爬取等功能
- 和Scrapy的比较
   1.pyspider 提供 WebUI,Scrapy它采用的是代码和命令行操作，但可以通过对接 Portia 现可视化配置
   2.pyspider 支持 PhantomJS来进行 JavaScript 谊染页面的采集 Scrapy 可以对接 Sc rapy-Splash组件，这需要额外配置
   3.pyspider 中内置pyquery 作为选择器而Scrapy 接了XPath 对接css选择器和正则匹配
   4.pyspider的可扩展程度不高，Scrapy可以通过对接其他的模块实现强大的功能，模块之间的耦合度低
- 总结
   所以如果要快速实现一个页面的抓取，推荐使用 pyspider,开发更加便捷,如果要应对反爬程度很强、超大规模的抓取，推荐使用 Scrapy 

#### 二、pyspider的安装

pyspider的安装相对简单，不需要安装一些列的依赖库直接使用

> pip install pyspider

然后等待安装成功就行，也可以使用源码安装   [pyspider源码](https://github.com/binux/pyspider)

#### 三、pyspider的简单使用

1.安装之后先验证是否安装成功，在CMD下输入

> pyspider

或者

> pyspider all

两者是一样的，新的pyspider框架已经整合了，所以使用pyspider就好


#### 1、基本语法 

格式要求 
k:(空格)v：表示一对键值对（空格必须有）；

以空格的缩进来控制层级关系；只要是左对齐的一列数据，都是同一个层级的

```yaml
server:
    port: 8081
    path: /hello
```

**属性和值也是大小写敏感；**

```yaml
${server.port}  #引用的方式
```



#### 2、值的写法

字面量：普通的值（数字，字符串，布尔）
 k: v：字面直接来写；

 字符串默认不用加上单引号或者双引号；

 “”：双引号；不会转义字符串里面的特殊字符；特殊字符会作为本身想表示的意思

 name: “zhangsan \n lisi”：输出；zhangsan 换行 lisi

 ”：单引号；会转义特殊字符，特殊字符最终只是一个普通的字符串数据

 name: ‘zhangsan \n lisi’：输出；zhangsan \n lisi

对象、Map（属性和值）（键值对）：
 k: v：在下一行来写对象的属性和值的关系；注意缩进

 对象还是k: v的方式

```yaml
friends:
        lastName: zhangsan
        age: 20
```


行内写法：

```yaml
friends: {lastName: zhangsan,age: 18}
```

数组（List、Set）：
用- 值表示数组中的一个元素

```yaml
pets:
 - cat
 - dog
 - pig
```

行内写法

```yaml
pets: [cat,dog,pig]
```

1、@controller 控制器（注入服务） 
2、@service 服务（注入dao） 
3、@repository （实现dao访问） 
4、@component （把普通pojo实例化到spring容器中，相当于配置文件中的

(<bean id="" class=""/>）

@ConfigurationProperties：告诉SpringBoot将本类中的所有属性和配置文件中相关的配置进行绑定； 

prefix = “person”：配置文件中哪个下面的所有属性进行一一映射

------

###  javax.servlet

* https://www.cnblogs.com/haimishasha/p/5609261.html

* javax.servlet.Filter

  文档 ：https://www.cnblogs.com/zlbx/p/4888312.html
  
  

### SVN的命令

```shell
###检出
svn checkout http://路径(目录或文件的全路径)　[本地目录全路径] --username　用户名
svn checkout svn://路径(目录或文件的全路径)　[本地目录全路径] --username=用户名 --password=密码
#注：如果不带--password 参数传输密码的话，会提示输入密码，建议不要用明文的--password 选项。
#　　 其中 username 与 password前是两个短线，不是一个。
#　　 不指定本地目录全路径，则检出到当前目录下。
###导出(导出一个干净的不带.svn文件夹的目录树)
svn export [-r 版本号] http://路径(目录或文件的全路径) [本地目录全路径]　--username　用户名
svn export [-r 版本号] svn://路径(目录或文件的全路径) [本地目录全路径]　--username　用户名
svn export 本地检出的(即带有.svn文件夹的)目录全路径 要导出的本地目录全路径
###添加新文件例子
svn add test.php ＜－ 添加test.php 
svn commit -m “添加我的测试用test.php“ test.php
svn add *.php ＜－ 添加当前目录下所有的php文件
svn commit -m “添加我的测试用全部php文件“ *.php

### update操作
svn update -r m path
例如：
svn update如果后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本。
svn update -r 200 test.php(将版本库中的文件test.php还原到版本200)
svn update test.php(更新，于版本库同步。如果在提交的时候提示过期的话，是因为冲突，需要先update，修改文件，然后清除svn resolved，最后再提交commit)

简写：svn up
svn up -username=用户 --password=密码

##svn status    -- 查看本地修改代码情况：修改的或本地独有的文件详细信息
svn merge   -- 合并svn和本地代码
svn revert   -- 撤销本地修改代码


###回退到某个版本的命令
svn merge -r rHEAD:109 http://example.com/repository/trunk/src/
说明：
rHEAD:109 从哪个版本回复到哪个版本，例子中的意思就是从当前最新版本回退到109
```

#### svn工具增量打包

公司同事地址 https://github.com/zhongyueming1121/svnpatch

包工具在资料私群里

![img](./image/svnpatch.png)

![img](./image/目录说明.jpg)

#### SVN分支合并代码

https://jingyan.baidu.com/article/60ccbceb433c0364cab19738.html

```
##这个是ingegrate整合代码
1、在IDEA的上方菜单中，依次选择VCS --> Integrate Project...如图所示。也可以在项目上点右键，在弹出的菜单中选择Subversion -> Integrate Directory...
2、在Source 1中选择主干的SVN地址，并选择当时分支分支时的版本号，本例是4909；在Source2中选择分支的地址，并在版本号处选择HEAD，表示把分支最新代码合并。然后在Try merge, but make no changes选项中打勾，在Depth中选择working copy。这样的配置是将分支最新代码与主干分出分支时的代码进行尝试比较。最后点“OK”，开始尝试合并
3、当确认尝试合并无问题后，再次重复上述合并步骤的界面，但在Try merge, but make no changes选项中取消打勾，然后点击“OK”
4、当合并代码过程中出现文件冲突时，会弹出一个冲突列表。此时需要对冲突的文件进行一个个合并。选择一个冲突的文件，单击“Merge...”，在弹出的合并窗口中，会展示三个文件，左边是本地代码，中间是合并后的代码，右边是分支上的代码。IDEA已经将冲突的代码块标志出来，你只需要将左边和右边的代码往中间合并，然后查看中间的代码是否正确，若不正确，直接修改正确，最后点击下方的“Apply”，完成该文件的合并。
5、在确认修改的文件无误后，在“Version Control”--> Local Changes 标签页，在文件根文件夹“Default"上，单击右键，在弹出的菜单中，选择"Commit Changes"提交代码，在弹出的确认窗口中，会再次显示所有要提交的文件，会在文件复选项上打勾，在下方的Commit Message中填写上本次提交内容的描述信息。最后点击”Commit“，提交代码到SVN

##分支合并到另一个分支的方法
1、CMD的Subversion Working Copies Information 设置好 Trunk location 合并的target 即为trunk
2、设置Branch locations 即为 待合并的分支代码地址
3、Merge from 选择Quick Manual Select 快速手动选择 需要合并的提交记录代码 
```

#### IDEA里SVN配置

- https://blog.csdn.net/hello__word__/article/details/81773815

checkout depth的几个含义

```
1、Fully recursive							——全递归：检出完整的目录树，包含所有的文件或子目录。
2、Immediate children,including folders		——直接子节点，包含文件夹：检出目录，包含其中的文件或子目录，但是不递归展开子目录。
3、Only file chlidren						——仅文件子节点：检出指定目录，包含所有文件，但是不检出任何子目录。
4、Only this item							——仅此项：只检出目录。不包含其中的文件或子目录
```

#### SVN版本回退

```
1、svn reset 指定版本号，  在 svn push -f
这种方法会把后面的提交记录都删除掉 ，不鼓励这种方式

2、svn revert还原指定版本(range
git revert OLDER_COMMIT^..NEWER_COMMIT

例子： 提交记录a,b,c,d 
需要还原到a  则：git revert b^..d;
#如果其中有需要特殊还原的，使用 cherry-pick 选择还原
#测试了上诉方法不行，测试下面的
直接svn自带的工具 show log 右键-->revert to this revision更改SVN服务器端的源码，只需右键test提交到SVN服务器端即可

revert和changes的代码区别
如果我们在7这里选择revert to this version那么7之后的8,9,10的操作都会被消除
如果在7选择revert changes from this version那么7版本的修改将会被消除

#注意：如果要想服务器的代码改变，记得commit代码
```



### GitHub的命令

* https://www.cnblogs.com/mlw1814011067/p/9908856.html

1. **创建项目根目录**

```
mkdir 文件夹名
```

　　2. **初始化文件夹**

```shell
git init

#和远端仓库绑定
git remote add origin git@github.com:jinzhaogit/git.git  
#添加开源库upstream, 什么是upstream? 
#个人理解：需要用一个大型开源项目作为项目起点，和之后自己开发的部分提交到另一个私有库，但同时需要和开源项目保持更新同步。
#upstream远端项目结构和本地项目结构是一致的
git remote add upstream git@github.com:cskefu/cskefu.git
#upstream例子 https://docs.cskefu.com/docs/osc/engineering/ 
```



　　3. **配置用户名和邮箱（第一次配置后，不需要再登录）**

```
git config user.name 名字
git config user.email 邮箱

--------------------------------
git config --global user.name 名字
git config --global user.email 邮箱
这个是针对当前电脑下的所有本地参数（项目根目录文件夹）
```

　　4. **随时查看文件状态**

```
git status 
-------------有三种状态
changes to be commited :     这样的文件以及位于暂存区
Untracked files:             这样的文件是新创建的，第一次进入
```

　　5. **将工作区的文件，放到暂存区**

```
git add 文件名/文件夹名
git add . 这种方式运用较多，将当前文件夹中的所有文件都放到暂存区去
```

　　6. **将暂存区的文件，放到主仓库去**

```
git commit 会进入vi编辑器界面，按i/a进入编辑状态，esc退出编辑状态，：wq保存退出。必须要写内容，要不然就没办法放到主仓库去
git commit -m 日志内容,就会跳过vi编辑界面(git push 才会上传到服务器仓库)
```

　　7. **成功后，查看暂存区是否还有内容**

```
git status
得到 nothing to commit，working directory clean 就表示文件都已经上传到主仓库中
```

　　8. **查看日志**

```
git log
commit：********    版本号
 Author：ouyang <oy1990425@163.com>
 Date:时间
```

　　9. **将本地仓库的内容上传到服务器仓库上**

```
git push  git仓库地址  master
```

　　10. **第一次从服务器上跟新文件数据到另一台电脑上时**

```
git clone git仓库地址 master（也可以写另外的名字）
 电脑会在当前目录下，新建一个master的本地仓库
```

#### 常用命令：

git init 新建一个空的仓库
git status 查看状态
git add . 添加文件
git commit -m '注释' 提交添加的文件并备注说明
git remote add origin git@github.com:jinzhaogit/git.git 连接远程仓库
git push -u origin master 将本地仓库文件推送到远程仓库
git log 查看变更日志
git reset --hard 版本号前六位 回归到指定版本
git branch 查看分支
git branch newname 创建一个叫newname的分支
git checkout newname 切换到叫newname的分支上
git merge newname 把newname分支合并到当前分支上
git pull origin master 将master分支上的内容拉到本地上

git fetch 将某个远程主机的更新，全部取回本地

```
git fetch <远程主机名> <分支名>
```

git rebase的使用

* Git 操作
  假设Git目前只有一个分支master。开发人员的工作流程是

  git clone master branch
  **在自己本地checkout -b local创建一个本地开发分支**
  在本地的开发分支上开发和测试
  阶段性开发完成后（包含功能代码和单元测试），可以准备提交代码
  首先切换到master分支，git pull拉取最新的分支状态
  然后切回local分支
  通过git rebase -i 将本地的多次提交合并为一个，以简化提交历史。本地有多个提交时,如果不进行这一步,在git rebase master时会多次解决冲突(最坏情况下,每一个提交都会相应解决一个冲突)
  git rebase master 将master最新的分支同步到本地，这个过程可能需要手动解决冲突(如果进行了上一步的话,只用解决一次冲突)
  然后切换到master分支，git merge将本地的local分支内容合并到master分支
  git push将master分支的提交上传

  ```
  本地开发分支可以灵活管理
  git checkout master
  git pull
  git checkout local
  git rebase -i HEAD~2  //合并提交 --- 2表示合并两个
  git rebase master---->解决冲突--->git rebase --continue
  git checkout master
  git merge local
  git push
  ```


#### git分支操作命令

```cmd
########新建test分支###########
列出所有分支：
# git branch -a
创建test分支：
# git branch test
切换到test分支：
# git checkout test
添加commit注释：
git commit -m "第一次提交代码"
提交到服务器：
# git push origin test

##########删除test分支############
# git branch -d test
```




#### github下载部分文件方法

```
将https中的路径/tree/master换成/trunk/即可

若要换成某个分支的 则将 /tree/master 换成 /branches/分支名/ 即可
```

#### git的subModel语句记录

https://blog.csdn.net/caz28/article/details/107547745

```shell
//添加子项目链接到main里的主项目了
git submodule add https://xxxxx/sub_mod.git sub_mod
//子项目若为空，则执行如下
git submodule init &&　git submodule update
//更新update
git submodule update --recursive --remote
```

1. 假设当前工作目录是 /home/caz/main/，当前项目远程仓库是 https://xxxxx/main.git。
2. 在main目录里，

```bash
git submodule add https://xxxxx/sub_mod.git sub_mod
```

​	这样就把sub_mod这个子项目链接到main里的主项目了。
​	在main目录里，会多出一个**.gitmodules**文件，和一个**sub_mod**目录。

3. 然后，git add 这些文件目录，git commit，git push，就提交到远程git仓库了。
4. 其他用户clone了这个main项目后，git submodule，会看到相关sub_mod信息，也有sub_mod目录和.gitmodules文件，但sub_mod没有checkout，sub_mod目录里是空的。
5. 这时候，

```bash
git submodule init &&　git submodule update
```

就可以checkout出sub_mod来了。
也可以：

```bash
git clone --recursive https://xxxxx/main.git
```

这一步相当于git clone xxx && git submodule init &&　git submodule update
使用submodule的好处是，不用先检出sub_mod，再copy到main里来，sub_mod也可以随时更新，main里也不会有烦人的untrack文件信息。

如果主项目里有多个submodel，用下面命令更新。

```bash
git submodule foreach git pull
```

1. 如果要删除submodel，比较麻烦：

```bash
git rm -r --cached sub_mod
//删除目录。
rm .gitmodules
//删除文件
vim .git/config
```

删除config中的submodel配置。
4.git add
5.git commit



#### git的cherry pick功能

合并分支有两种操作:

一种情况是你需要将你分支的所有代码变动,此时可以采用分支合并
merge
另一种情况,只需要提交几个改动,不需要全部合并(有些情况下整个分支合并冲突太多处理起来过于麻烦)

#### git打tag命令

// 查看本地的所有Tag

```
git tag 可带上可选的 -l 选项 --list
```

创建tag命令

```
#轻量标签
git tag v1.4-lw
#带标注
git tag -a v1.0 -m "对Tag的描述信息"
```

 提交tag命令

```
git push origin v3.6.0
#这个是推送所有标签
git push origin --tags
```

删除tag命令

```
删除本地tag
git tag -d v3.7.0
要删除远程服务器上的tag，可以使用如下的命令：
git push origin --delete tag v3.7.0
```

##### git 根据tag创建分支

在项目中我们需要根据tag创建分支.现将创建步骤总结一下.在你的dev分支上有一个tag为v1.0

1.执行:git origin fetch 获得最新.

2.通过:git branch <new-branch-name> <tag-name> 会根据tag创建新的分支。

例如:git branch newbranch v1.0 . 会以tag v1.0创建新的分支newbranch。

3.可以通过git checkout newbranch 切换到新的分支。

4.通过 git push origin newbranch 把本地创建的分支提交到远程仓库。

现在远程仓库也会有新创建的分支了。

```shell
#删除本地分支
git branch -d  branch-name
#强制删除
git branch -D branch-name
#删除远程分支(慎用)：
git push origin --delete dev20181018
```

##### 强制git push命令慎用

```shell
#慎用
git push -f origin development 
#注释： origin远程仓库名，master分支名，-f为force，意为：强行、强制
```

#### Git commit回退

```shell
git reset --soft HEAD^
这样就成功的撤销了你的commit。注意，仅仅是撤回commit操作，您写的代码仍然保留。

HEAD^的意思是上一个版本，也可以写成HEAD~1，如果你进行了2次commit，想都撤回，可以使用HEAD~2
--mixed 不删除工作空间改动代码，撤销commit，并且撤销git add . 操作，这个为默认参数,git reset --mixed HEAD^ 和 git reset HEAD^ 效果是一样的。
--soft  不删除工作空间改动代码，撤销commit，不撤销git add .
--hard 删除工作空间改动代码，撤销commit，撤销git add .
————————————————
版权声明：本文为CSDN博主「panjiayue」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/panjiayue/article/details/121983178
```





### GitLab安装教程

Gitlab环境部署

环境要求：内存不低于2G

```shell
$ mkdir /opt/gitlab

```

在gitlab目录下写一个 shell脚本

```shell
vim ins.sh

#给 ins.sh 执行权限
chmod u+x ins.sh
```

4、把下面的代码复制到 ins.sh （注意包名 和 目录名的一致 ）

```shell
sudo rpm -ivh /opt/gitlab/gitlab-ce-13.10.2-ce.0.el7.x86_64.rpm    
sudo yum install -y curl policycoreutils-python openssh-server cronie
sudo lokkit -s http -s ssh
sudo yum install -y postfix
sudo service postfix start
sudo chkconfig postfix on
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" yum -y install gitlab-ce 
```

#### 初始化gitlab

1、执行 （ 时间较长 打印很多日志 等待一会 ）

```shell
$ gitlab-ctl reconfigure
```

最后一句出现 gitlab Reconfigured！ 则初始化成功

### RestFul风格

* 在Restful之前的操作：
  http://127.0.0.1/user/query/1 GET  根据用户id查询用户数据
  http://127.0.0.1/user/save POST 新增用户
  http://127.0.0.1/user/update POST 修改用户信息
  http://127.0.0.1/user/delete GET/POST 删除用户信息

  RESTful用法：
  http://127.0.0.1/user/1 GET  根据用户id查询用户数据
  http://127.0.0.1/user  POST 新增用户
  http://127.0.0.1/user  PUT 修改用户信息
  http://127.0.0.1/user  DELETE 删除用户信息

  之前的操作是没有问题的,大神认为是有问题的,有什么问题呢?你每次请求的接口或者地址,都在做描述,例如查询的时候用了query,新增的时候用了save,其实完全没有这个必要,我使用了get请求,就是查询.使用post请求,就是新增的请求,我的意图很明显,完全没有必要做描述,这就是为什么有了restful. 

  例如spirngMVC的实现restful服务

```java
@RequestMapping(value = "{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<User> queryUserById(@PathVariable("id") Long id) {
    }
 
    /**
     * 新增用户
     * 
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> saveUser(User user) {
    }
 
    /**
     * 更新用户资源
     * 
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<Void> updateUser(User user) {
    } 
```





## Dubbo 

* 文档： http://dubbo.apache.org/zh-cn/docs/user/quick-start.html
* 

| 节点        | 角色说明                               |
| ----------- | -------------------------------------- |
| `Provider`  | 暴露服务的服务提供方                   |
| `Consumer`  | 调用远程服务的服务消费方               |
| `Registry`  | 服务注册与发现的注册中心               |
| `Monitor`   | 统计服务的调用次数和调用时间的监控中心 |
| `Container` | 服务运行容器                           |

* 调用关系说明

1. 服务容器负责启动，加载，运行服务提供者。
2. 服务提供者在启动时，向注册中心注册自己提供的服务。
3. 服务消费者在启动时，向注册中心订阅自己所需的服务。
4. 注册中心返回服务提供者地址列表给消费者，如果有变更，注册中心将基于长连接推送变更数据给消费者。
5. 服务消费者，从提供者地址列表中，基于软负载均衡算法，选一台提供者进行调用，如果调用失败，再选另一台调用。
6. 服务消费者和提供者，在内存中累计调用次数和调用时间，定时每分钟发送一次统计数据到监控中心。

### 使用步骤

```xml
<!--Springboot 集成 Dubbo依赖-->
<dependency>
    <groupId>com.alibaba.boot< /groupId>
    <artifactId>dubbo-spring-boot-starter< /artifactId>
    <version>0.2.0< /version>
</dependency>       
    <!--dubbo框架 一般与上者二选一看环境-->
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>dubbo</artifactId>
    <version>2.6.4</version>
</dependency>
<!-- 引入Zookeeper服务注册中心依赖（可选，取决于用什么注册中心，如果是Redis，就换成Jedis依赖） -->
<dependency>
    <groupId>org.apache.dubbo</groupId>
    <artifactId>dubbo-dependencies-zookeeper</artifactId>
    <version>${dubbo.version}</version>
    <type>pom</type>
    <exclusions>
        <exclusion>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-log4j12</artifactId>
        </exclusion>
    </exclusions>
</dependency>
<!--zk依赖 与上面二选一？-->
        <dependency>
            <groupId>org.apache.zookeeper</groupId>
            <artifactId>zookeeper</artifactId>
            <version>3.4.13</version>
        </dependency>
        <dependency>
            <groupId>com.github.sgroschupf</groupId>
            <artifactId>zkclient</artifactId>
            <version>0.1</version>
        </dependency>
```

```yaml
#application.yml配置 服务提供方
dubbo:
  application:
    name: demo-provider
    qos-enable: false #用于运维的监控服务， 默认是开启状态，并且端口是22222。开发环境为了避免端口冲突，建议直接关掉
  registry:
    address: zookeeper://10.10.14.120:2181?client=curator
  protocol:
    name: dubbo
    port: 20883
    host: 10.10.14.236
#服务消费方的配置    
dubbo:
  application:
    name: demo-consumer
    qos-enable: false
  registry:
    address: zookeeper://10.10.14.120:2181?client=curator

java种提供者
@EnableDubbo(scanBasePackages = "com.lanou3g.dubbo.service.impl")
@Service(version = "1.0.0")  // @Service为dubbo提供的Service注解，非Spring提供的

java种消费者注入
@Reference(version = "1.0.0")
```



###  dubbo-admin的使用

**2.1、下载dubbo-admin**

```ruby
git clone https://github.com/apache/dubbo-admin/tree/master
```

**2.2、修改dubbo-admin配置**

修改 src\main\resources\application.properties 指定zookeeper地址

```properties
dubbo.registry.address=zookeeper://127.0.0.1:2181
dubbo.admin.root.password=root
dubbo.admin.guest.password=guest
```

**2.3、打包dubbo-admin**

```kotlin
mvn clean package -Dmaven.test.skip=true
```

**2.4、运行dubbo-admin**

```undefined
java -jar dubbo-admin-0.0.1-SNAPSHOT.jar
```

## BeetlSQL

* 文档 ： http://ibeetl.com/guide/#beetlsql

```java
@Bean
public SqlManagerFactoryBean sqlManagerFactoryBean(DataSource dataSource) throws Exception {
    SqlManagerFactoryBean sqlManagerFactoryBean = new SqlManagerFactoryBean();
    BeetlSqlDataSource connectionSource = new BeetlSqlDataSource();
    connectionSource.setMasterSource(dataSource);
    sqlManagerFactoryBean.setCs(connectionSource);
    sqlManagerFactoryBean.setNc(new UnderlinedNameConversion());
    sqlManagerFactoryBean.setDbStyle(new MySqlStyle());
    sqlManagerFactoryBean.getObject().addIdAutonGen(ID_AUTO_GEN, new IDAutoGen() {
        @Override
        public Object nextID(String params) {
            return BaseUUID.random();
        }
    });
    if (show) {
        sqlManagerFactoryBean.getObject().setInters(new Interceptor[]{new DebugInterceptor()});
    }
    return sqlManagerFactoryBean;
}
```



## Redis

```yaml
spring:
  redis:
	#database: name
    database: 0
	#server: host
    host: 192.168.88.94
    port: 6379
    password: 123456a
    #连接超时时间（毫秒）
    timeout: 60000
    jedis:
      pool:
        max-active: 8
        max-wait: 1
        max-idle: 8
        min-idle: 0
```

### 集群模式

#### Redis主从复制

Redis 主从复制支持 **主从同步** 和 **从从同步** （后续版本新增的功能，以减轻主节点的同步负担）两种

```shell
# 设置master服务器IP和端口
slaveof 127.0.0.1 6379 
# slave是否只读，从服务器负责读操作，主服务器负责写操作，从而实现读写分离
slave-read-only yes
```

分别按照顺序启动mater(redis-[server](https://so.csdn.net/so/search?q=server&spm=1001.2101.3001.7020) redis.conf)和slave(redis-server redis2.conf)

该模式一旦Master服务器发生宕机，会导致无法向redis中读取或者写入数据，高可用性极差。

主要配置如下:

```bash
#redis-master.conf    master配置
port 6379
daemonize yes
logfile "6379.log"
dbfilename "dump-6379.rdb"
 
#redis-slave1.conf   slave1配置
port 6380
daemonize yes
logfile "6380.log"
dbfilename "dump-6380.rdb"
slaveof 127.0.0.1 6379
 
#redis-slave2.conf    slave2配置
port 6381
daemonize yes
logfile "6381.log"
dbfilename "dump-6381.rdb"
slaveof 127.0.0.1 6379  #指定为master的ip从属关系
```

然后启动三个redis实例:

```undefined
redis-server redis-master.conf
redis-server redis-slave1.conf
redis-server redis-slave2.conf
```



#### 哨兵模式

按照上面同样的方法，我们给哨兵节点也创建三个配置文件。*(哨兵节点本质上是特殊的 Redis 节点，所以配置几乎没什么差别，只是在端口上做区分就好)*

```bash
# redis-sentinel-1.conf
port 26379
daemonize yes
logfile "26379.log"
sentinel monitor mymaster 127.0.0.1 6379 2

# redis-sentinel-2.conf
port 26380
daemonize yes
logfile "26380.log"
sentinel monitor mymaster 127.0.0.1 6379 2

# redis-sentinel-3.conf
port 26381
daemonize yes
logfile "26381.log"
sentinel monitor mymaster 127.0.0.1 6379 2
```

其中，`sentinel monitor mymaster 127.0.0.1 6379 2` 配置的含义是：该哨兵节点监控 `127.0.0.1:6379` 这个主节点，该主节点的名称是 `mymaster`，最后的 `2` 的含义与主节点的故障判定有关：至少需要 `2` 个哨兵节点同意，才能判定主节点故障并进行故障转移。

执行下方命令将哨兵节点启动起来：

```css
redis-server redis-sentinel-1.conf --sentinel
redis-server redis-sentinel-2.conf --sentinel
redis-server redis-sentinel-3.conf --sentinel
```

使用 `redis-cil` 工具连接哨兵节点，并执行 `info Sentinel` 命令来查看是否已经在监视主节点了

#### 集群方式

哨兵方式虽然实现了故障自动切换, 但是实际为客户端提供读写服务的Redis仍然只有主节点一个,所以受限于单机的内存容量。

* 搭建Redis集群

要让集群正常工作至少需要3个主节点，在这里我们要创建6个redis节点，其中三个为主节点，三个为从节点。为了方便演示,这6个redis部署在同一台机器, 采用不同的端口号(7000 ~ 7005)。

* 准备配置文件

6个Redis节点的配置文件分别命名为node_7000.conf, node_7001.conf , ......, node_7005.conf,

除了端口号不同外,其余配置相同, 配置如下:

```yaml
# 后台执行
daemonize yes
# 端口号
port 7000
# 为每一个集群节点指定一个 pid_file
pidfile ~/Desktop/redis-cluster/redis_7000.pid
# 启动集群模式
cluster-enabled yes
# 每一个集群节点都有一个配置文件，这个文件是不能手动编辑的。确保每一个集群节点的配置文件不通
cluster-config-file nodes-7000.conf
# 集群节点的超时时间，单位：ms，超时后集群会认为该节点失败
cluster-node-timeout 5000
# 最后将 appendonly 改成 yes(AOF 持久化)
appendonly yes
```

启动6个Redis实例

```undefined
redis-server redis_7000.conf
redis-server redis_7001.conf
redis-server redis_7002.conf
redis-server redis_7003.conf
redis-server redis_7004.conf
redis-server redis_7005.conf
```

建立集群 执行命令:

```bash
redis-cli --cluster create --cluster-replicas 1 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005

--replicas 1 的意思是：我们希望为集群中的每个主节点创建一个从节点。

```

使用 `redic-cli` 任意连接一个节点：

```css
redis-cli -c -h 127.0.0.1 -p 7000
127.0.0.1:7000>
```

- `-c`表示集群模式；`-h` 指定 ip 地址；`-p` 指定端口。
- 任意节点使用`cluster nodes` 查看节点列表

#### springboot的配置

~~~yaml
#单机模式
spring:
  redis:
    host: 192.168.40.201
    port: 6379
    password: passw0rd
    database: 0 # 数据库索引，默认0
    timeout: 5000  # 连接超时，单位ms
    jedis:  # 或lettuce, 连接池配置，springboot2.0中使用jedis或者lettuce配置连接池，默认为lettuce连接池
      pool:
        max-active: 8 # 连接池最大连接数（使用负值表示没有限制）
        max-wait: -1 # 连接池分配连接最大阻塞等待时间（阻塞时间到，抛出异常。使用负值表示无限期阻塞）
        max-idle: 8 # 连接池中的最大空闲连接数
        min-idle: 0 # 连接池中的最小空闲连接数

#哨兵模式
```yaml
spring:
  redis:
 	host: 192.168.40.201
    port: 6379
    password: passw0rd
    timeout: 5000
    sentinel:
      master: mymaster
      nodes: 192.168.40.201:26379,192.168.40.201:36379,192.168.40.201:46379 # 哨兵的IP:Port列表
    jedis: # 或lettuce
      pool:
        max-active: 8
        max-wait: -1
        max-idle: 8
        min-idle: 0
```
# 主从
```yaml
spring:
  redis:
 	host: 192.168.40.201
    port: 6379
    password: passw0rd
    timeout: 5000
    database: 0
    cluster:
      nodes: 192.168.40.201:7100,192.168.40.201:7200,192.168.40.201:7300,192.168.40.201:7400,192.168.40.201:7500,192.168.40.201:7600
      max-redirects: 3  # 重定向的最大次数
    jedis:
      pool:
        max-active: 8
        max-wait: -1
        max-idle: 8
        min-idle: 0
```
~~~

### 使用redis集群注意点

* 1、不支持的方法：
  KEYS、MIGRATE、SCAN等

* 2、支持但需特殊处理的方法：
  MSET、SINTERSTORE、SUNIONSTORE、ZINTERSTORE、ZUNIONSTORE等

#### Redis中Key中为什么要使用{}

```
分片，就是一个hash的过程：对key做md5，sha1等hash算法，根据hash值分配到不同的机器上。为了实现将key分到相同机器，就需要相同的hash值，即相同的key（改变hash算法也行，但不简单）。但key相同是不现实的，因为key都有不同的用途。例如`user:user1:ids`保存用户的tweets ID，`user:user1:tweets`保存tweet的具体内容，两个key不可能同名。



就是Hash Tag，允许用key的部分字符串来计算hash。当一个key包含`{}` 的时候，就不对整个key做hash，而仅对`{}` 包括的字符串做hash。假设hash算法为sha1。对`user:{user1}:ids`和`user:{user1}:tweets`，其hash值都等同于sha1(user1)。

HashTag可能会使过多的key分配到同一个slot中，造成数据倾斜影响系统的吞吐量，务必谨慎使用。
```

#### Redis新数据结构 统计数据

* Bitmap  统计用户是否访问过网站

  常用语法 setbit  getbit   bitcount

* **HyperLogLog**   是用来做**基数统计**的算法 如 网站页统计UV 

  语法主要有**pfadd**和**pfcount**

  场景

  统计注册 IP 数

  统计每日访问 IP 数

  统计页面实时 UV 数

  统计在线用户数

  统计用户每天搜索不同词条的个数

* **BloomFilter ** 主要作用是：判断一个元素是否在某个集合中；应用场景： 数据库防止穿库

* **GEO**  用于存储地理信息以及对地理信息作操作的场景；应用：查看附近的人 ；微信位置共享；地图上直线距离的展示

  常用语法：geoadd   geopos    geodist

### **启动**

```json
后端模式启动

修改redis.conf配置文件， daemonize yes 以后端模式启动。推荐！

打开redis.conf,使用命令 :/ daemonize 快速查找到daemonize然后修改。

vi /etc/redis/redis.conf
仅修改： daemonize yes （no-->yes）

#启动
/usr/local/bin/redis-server /etc/redis/redis.conf
#查看启动
ps -ef | grep redis 
#使用客户端
redis-cli
#关闭客户端
redis-cli shutdown
#开机启动配置
echo "/usr/local/bin/redis-server /etc/redis/redis.conf &" >> /etc/rc.local
#设置密码
修改redis.conf文件配置 
使用命令 :/ requirepass 快速查找到 # requirepass foobared 然后去掉注释，这个foobared改为自己的密码。然后wq保存。
```

### 淘汰过期策略了解

Redis 提供 6 种数据淘汰策略：

- **volatile-lru（least recently used）**：从已设置过期时间的数据集（server.db[i].expires）中挑选最近最少使用的数据淘汰
- **volatile-ttl**：从已设置过期时间的数据集（server.db[i].expires）中挑选将要过期的数据淘汰
- **volatile-random**：从已设置过期时间的数据集（server.db[i].expires）中任意选择数据淘汰

* **allkeys-lru（least recently used）**：当内存不足以容纳新写入数据时，在键空间中，移除最近最少使用的 key（这个是最常用的）

* **allkeys-random**：从数据集（server.db[i].dict）中任意选择数据淘汰
* **no-eviction**：禁止驱逐数据，也就是说当内存不足以容纳新写入数据时，新写入操作会报错。这个应该没人使用吧！

### 持久化

**快照（snapshotting）持久化（RDB）**

Redis 可以通过创建快照来获得存储在内存里面的数据在某个时间点上的副本。Redis 创建快照之后，可以对快照进行备份，可以将快照复制到其他服务器从而创建具有相同数据的服务器副本（Redis 主从结构，主要用来提高 Redis 性能），还可以将快照留在原地以便重启服务器的时候使用。

快照持久化是 Redis 默认采用的持久化方式，在 Redis.conf 配置文件中默认有此下配置：

```conf
save 900 1           #在900秒(15分钟)之后，如果至少有1个key发生变化，Redis就会自动触发BGSAVE命令创建快照。

save 300 10          #在300秒(5分钟)之后，如果至少有10个key发生变化，Redis就会自动触发BGSAVE命令创建快照。

save 60 10000        #在60秒(1分钟)之后，如果至少有10000个key发生变化，Redis就会自动触发BGSAVE命令创建快照。
```

### redis.conf的启动

```shell
# 启动redis，显示加载配置redis.conf
# ./redis-server /path/to/redis.conf

# 停止redis
# redis-cli -h IP -p PORT shutdown

# 可以包含一个或多个其他配置文件，如果多个redis服务器存在标准配置模板，但是每隔redis服务器可能有个性化的配置
# include /path/to/local.conf
# include /path/to/other.conf

# 这个地方网上存在许多误解，bind的是网络接口。对于一个redis服务器来说可以有一个或者多个网卡。比如服务器上有两个网卡：bind 192.168.1.100 192.168.1.101，如果bind bind 192.168.1.100，则只有该网卡地址接受外部请求，如果不绑定，则两个网卡都接受请求
# bind 192.168.1.100 192.168.1.101
# bind 127.0.0.1 ::1

# 监听端口号，默认为6379，如果为0监听任连接
port 6379

# TCP连接中已完成队列的长度
tcp-backlog 511

#客户端和Redis服务端的连接超时时间，默认为0表示永不超时
timeout 0

# 服务端周期性时间（单位秒）验证客户端是否处在健康状态，避免服务端一直阻塞
tcp-keepalive 300

# Redis以后台守护进程形式启动
daemonize yes

# 配置PID文件路径，当redis以守护进程启动时，它会把PID默认写到 /var/redis/run/redis_6379.pid文件里面
pidfile "/var/run/redis_6379.pid"

#Redis日志级别：debug，verbose，notice，warning，级别一次递增
loglevel notice

#日志文件路径及名称
logfile ""
```



### **控制台语法**

```cmd
连接redis命令 /bin/redis-cli
>> redis-cli -h 127.0.0.1 -p 6379 -a 密码 -u 用户名
#密码修改
打开redis.conf<如果没有此文件，需自己下载，放置到redis目录下>,找到requirepass值修改密码， 端口为port
如果需要搭建redis集群，千万别忘了修改端口号。
注意如果是集群的话 要有-c >> redis-cli -h 192.168.25.153 -p 7002 –c
创建集群。redis的三种集群，主从复制，哨兵模式，cluster模式
基于上边分割线内的介绍：cd /usr/local/redis-cluster
在redis-cluster目录下执行以下命令：
./redis-trib.rb  create --replicas  1  127.0.0.1:7001  127.0.0.1:7002  127.0.0.1:7003  127.0.0.1:7004  127.0.0.1:7005   127.0.0.1:7006
或者后续输入密码
>>auth <password>

》get key 查询返回对应的值，否则返回null
》set key value 增加键值对 set key value ex 300 设置过期时间或者单独 expire key 300
》ttl key 查看过期时间
》exists key 判断对应的key是否存在 存在返回1，否则返回0
》type key 查看key的类型
》del key 删除对应的key

# 批量删除匹配通配符的key用到了Linux中的管道和xargs参数：
redis-cli keys "s*" | xargs redis-cli del
./redis-cli -p 39087 -a Ctx1ytxA@3zdj  keys 'cloudnet:patch:doing*' | xargs  ./redis-cli -p 39087 -a Ctx1ytxA@3zdj del

KEYS runoob* 查找所有符合给定模式 pattern 的 key
hset key field value   单个设置  
 hget key field   获取map中指定key的值 
HMSET key field value [field value ...]   多个设置 
HMGET key field [field ...]  获取map中多个key的值 
HGETALL key   获取map中所有的数据 
hdel key field [field ...]  删除map中指定key的数据 
HINCRBY key field increment   对map中 指定key值进行加法计算 
 hlen key     获取map的大小 
hkeys key    获取map中所有的key值 
 HVALS key   获取map中所有的value值 
HEXISTS key field  判断map中指定key是否存在
```

* java的opsForValue().的方法说明

```java
#String
//设置value
set(K key, V value)
get(Object key)
append(K key, String value)  
set(K key, V value, long timeout, TimeUnit unit)
long size = template.opsForValue().size("key"));

#HaspMap
Long delete(H key, Object… hashKeys);
//从键中获取指定的哈希
get(H key, Object hashKey) //获取hashMap指定的键value
Set keys(H key); //获取所有的key值
void putAll(H key, Map<? extends HK, ? extends HV> m);
void put(H key, HK hashKey, HV value); //设置散列hashKey的值
List values(H key);
Map<HK, HV> entries(H key); //获取整个哈希存储根据密钥

#List
Long leftPush(K key, V value);//将所有指定的值插入存储在键的列表的头部。如果键不存在，则在执行推送操作之前将其创建为空列表。 rightPush
Long leftPushAll(K key, V… values); //批量把一个数组插入到列表中 rightPushAll
void set(K key, long index, V value);//在列表中index的位置设置value值
V index(K key, long index);//根据下表获取列表中的值，下标是从0开始的
V leftPop(K key);//弹出最左边的元素，弹出之后该值在列表中将不复存在 rightPop

#Set
Long add(K key, V… values);//无序集合中添加元素，返回添加个数
Long remove(K key, Object… values);//移除集合中一个或多个成员
V pop(K key);//移除并返回集合中的一个随机元素
Cursor scan(K key, ScanOptions options);//遍历set
```

### 例子

#### 分布式锁

https://www.jianshu.com/p/eac5480921e7

```java
/**用法**/
private final ExecutableLockRegistry lockRegistry;
lockRegistry.obtainExecutableLock("notarycloud:file-preview:" + fileId)
            .execute(() -> this.getExistsPreviewFileOrConvertIt(file));

public class ExecutableLockRegistry implements LockRegistry {

    private LockRegistry lockRegistry;

    public ExecutableLockRegistry(LockRegistry lockRegistry) {
        this.lockRegistry = lockRegistry;
    }

    @Override
    public Lock obtain(Object o) {
        return lockRegistry.obtain(o);
    }

    public ExecutableLock obtainExecutableLock(Object o) {
        return new ExecutableLock(obtain(o));
    }

}
```

```java
@Slf4j
public class ExecutableLock implements Lock {

    private final Lock delegate;

    public ExecutableLock(Lock lock) {
        this.delegate = lock;
    }

    public <R> R execute(Supplier<R> bizFun) {
        return execute(bizFun, false);
    }

    public void execute(Runnable runnable) {
        execute(runnable, false);
    }

    public void execute(Runnable runnable, boolean ignoreReleaseLockError) {
        Supplier<Void> supplier = () -> {
            runnable.run();
            return null;
        };
        execute(supplier, ignoreReleaseLockError);
    }

    public <R> R execute(Supplier<R> bizFun, boolean ignoreReleaseLockError) {
        Throwable error = null;
        try {
            delegate.lock();
            return bizFun.get();
        } catch (Throwable e) {
            log.warn("execute with lock has some exception.", e);
            error = e;
            throw e;
        } finally {
            try {
                delegate.unlock();
            } catch (Exception releaseLockError) {
                if (ignoreReleaseLockError) {
                    log.debug("release lock failed", releaseLockError);
                } else {
                    rethrowReleaseLockException(releaseLockError, error);
                }
            }
        }
    }

    @Override
    public void lock() {
        delegate.lock();
    }

    @Override
    public void lockInterruptibly() throws InterruptedException {
        delegate.lockInterruptibly();
    }

    @Override
    public boolean tryLock() {
        return delegate.tryLock();
    }

    @Override
    public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
        return delegate.tryLock(time, unit);
    }

    @Override
    public void unlock() {
        delegate.unlock();
    }

    @Override
    public Condition newCondition() {
        return delegate.newCondition();
    }

    private void rethrowReleaseLockException(Throwable releaseLockError, Throwable lockError) {
        ReflectionUtils.rethrowRuntimeException(new ReleaseLockException(releaseLockError, lockError));
    }

    private static class ReleaseLockException extends Exception {

        protected ReleaseLockException(Throwable releaseLockError, Throwable lockError) {
            super(releaseLockError.getMessage(), lockError == null ? releaseLockError : lockError);
        }

    }

}

```



### Redis限流

目的： 控制用户行为，避免垃圾请求（避免短时间多次操作）。比如一段时间内用户只能操作一个接口1次，或者一段时间内用户只能操作某个行为N次？

![](E:\开发笔记\ycs_test\image\redis的限流漏斗.png)



```java
public enum CellCommand implements ProtocolCommand {
    CLTHROTTLE("CL.THROTTLE");

    private final byte[] raw;
    CellCommand(String alt) {
        raw = SafeEncoder.encode(alt);
    }
    public byte[] getRaw() {
        return raw;
    }
}

/**
 * 测试
 */
public class ThrottleTest {
    public static void main(String[] args) throws InterruptedException {
        Jedis jedis = new Jedis("localhost", 6379);
        jedis.auth("123456");
        for (int i = 0; i < 50; i++) {
            Connection client = jedis.getClient();
            client.sendCommand(CellCommand.CLTHROTTLE, "user123", "15", "30", "60", "2");
            List<Long> replay = client.getIntegerMultiBulkReply();
            if (replay.get(0) == 0) {
                System.out.println("系统可用，" + i + "号用户可以通过");
                Thread.sleep(1000);
            } else {
                System.out.println("系统繁忙，" + i + "号用户限制通过，请稍候重试！");
            }
            client.close();
        }
    }
}
```

### 分布式环境下限流器springboot实现，令牌桶

令牌桶算法：
生产逻辑：程序以恒定的速率产生令牌，然后把令牌放到令牌桶中，令牌桶有一个容量，当令牌桶满了的时候，无法再向桶中放置令牌；

消费逻辑：当想要处理一个请求的时候，则从令牌桶中取出一个令牌，如果此时令牌桶中没有令牌，那么则拒绝处理请求。

优点：既能限制数据的平均传输速率，又能允许某种程度的突发传输；

例子结合gateway

```xml
<!--redis-->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis-reactive</artifactId>
    <version>2.1.3.RELEASE</version>
</dependency>
```

在`GatewayApplicatioin`引导类中添加如下代码，`KeyResolver`用于计算某一个类型的限流的KEY也就是说，可以通过`KeyResolver`来指定限流的Key。

```
//定义一个KeyResolver
@Bean
public KeyResolver ipKeyResolver() {
    return new KeyResolver() {
        @Override
        public Mono<String> resolve(ServerWebExchange exchange) {
            return Mono.just(exchange.getRequest().getRemoteAddress().getHostName());
        }
    };
}
```

```yaml
网关配置
    routes:
      - id: goods
        uri: lb://goods
        predicates:
        - Path=/goods/**
        filters:
        - StripPrefix= 1
        - name: RequestRateLimiter #请求数限流 名字不能随便写 
          args:
            key-resolver: "#{@ipKeyResolver}"
            redis-rate-limiter.replenishRate: 1
            redis-rate-limiter.burstCapacity: 1
解释：
burstCapacity：令牌桶总容量。
replenishRate：令牌桶每秒填充平均速率。
key-resolver：用于限流的键的解析器的 Bean 对象的名字。它使用 SpEL 表达式根据#{@beanName}从 Spring 容器中获取 Bean 对象。
```



```xml
<dependency>
    <groupId>org.redisson</groupId>
    <artifactId>redisson</artifactId>
    <version>3.14.1</version>
</dependency>
```

### redis实现发布订阅功能

```java
// 增加监听器配置
/**
 * 功能描述：Redis 配置
 */
@Configuration
public class RedisConfiguration {
    
    @Async
    @Order
    @EventListener({WebServerInitializedEvent.class})
    public void initPayConfig() {
    
    }

    @Bean
    public RedisMessageListenerContainer redisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory) {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(redisConnectionFactory);
        container.addMessageListener((message, bytes) -> {
            log.warn("接收到Redis 事件 重新加载支付参数事件");
            initPayConfig();
        }, new ChannelTopic(channel_id));
        return container;
    }
}

//发布消息
redisTemplate.convertAndSend(channel_id, body);
```



### LUA脚本使用

Redis 中使用EVAL命令来直接执行指定的 Lua 脚本。

```
EVAL luascript numkeys key [key ...] arg [arg ...]
说明：
EVAL 命令的关键字。
luascript Lua 脚本文件。
numkeys 指定的 Lua 脚本需要处理键的数量，其实就是 key数组的长度。
key 传递给 Lua 脚本零到多个键，空格隔开，在 Lua 脚本中通过 KEYS[INDEX]来获取对应的值，其中1 <= INDEX <= numkeys。
arg是传递给脚本的零到多个附加参数，空格隔开，在 Lua 脚本中通过ARGV[INDEX]来获取对应的值，其中1 <= INDEX <= numkeys。

```

java中的使用

```java
/**
  * 库存扣减脚本
  */
@Bean
public DefaultRedisScript<Boolean> quantityScript() {
    DefaultRedisScript<Boolean> redisScript = new DefaultRedisScript<>();
    redisScript.setScriptSource(new ResourceScriptSource(new ClassPathResource("script/quantity.lua")));
    redisScript.setResultType(Boolean.class);
    return redisScript;
}

// 使用
//库存扣除结果
private final StringRedisTemplate stringRedisTemplate;

@Autowired
private DefaultRedisScript<Boolean> quantityScript;
 	
Boolean skuResult = stringRedisTemplate.execute(quantityScript, keys, values.toArray());
```

quantity.lua文件

```LUA
-- 可能回滚的列表，一个记录要回滚的skuid一个记录库存
local id_list= {}
local quantity_list= {}

-- 调用放传递的keys 和 values  execute(RedisScript<T> script, List<K> keys, Object... args)
local keys = KEYS
local values = ARGV;

local function deduction(key,num)
    keys[1] = key;
    local value = redis.call("get",keys[1])
    if not value then
        value = 0;
    end
    value = value + num
    -- 变更后库存数量小于
    if(value<0)
    then
        -- 发生超卖
        return false;
    end
    redis.call("set",keys[1],value)

    return true
end

local function rollback()
    for i,k in ipairs (id_list) do
        -- 还原库存
        keys[1] = k;
        redis.call("incrby",keys[1],0-quantity_list[i])
    end
end

local function execute()
    -- i 类java for循环 for(int i=0;i<?;i++) 下标
    -- k 为遍历的值 具体值，非下标
    for i, k in ipairs (values)
    do
        -- num 变更数量
        -- key 为缓存key
        local num = tonumber(k)
        local key=  keys[i]
        -- 进行库存扣减，为false 代表扣减失败，要进行回滚
        local result = deduction(key,num)

        -- 回滚
        if (result == false)
        then
            rollback()
            return false
        else
            -- 记录可能要回滚的数据
            table.insert(id_list,key)
            table.insert(quantity_list,num)
        end

    end
    return true;
end

return execute()
```

### Springboot获取redis信息

```java
@GetMapping("/get-monitor-info")
@Operation(summary = "获得 Redis 监控信息")
@PreAuthorize("@ss.hasPermission('infra:redis:get-monitor-info')")
public CommonResult<RedisMonitorRespVO> getRedisMonitorInfo() {
    // 获得 Redis 统计信息
    Properties info = stringRedisTemplate.execute((RedisCallback<Properties>) RedisServerCommands::info);
    Long dbSize = stringRedisTemplate.execute(RedisServerCommands::dbSize);
    Properties commandStats = stringRedisTemplate.execute((
        RedisCallback<Properties>) connection -> connection.info("commandstats"));
    assert commandStats != null; // 断言，避免警告
    // 拼接结果返回
    return success(RedisConvert.INSTANCE.build(info, dbSize, commandStats));
}
```





## Springboot session使用

在单应用中我们的session来保存用户信息，通常会保存在服务器中（如tomcat），但是我们把应用搭建成分布式的集群，然后利用LVS或Nginx做负载均衡，那么来自同一用户的Http请求将有可能被分发到两个不同的应用中。

实际上，我们不使用Tomcat的HttpSession，而是将session Id值持久化到Redis中。Spring Session将使用由Redis支持的实现替换HttpSession。

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-core</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-data-redis</artifactId>
</dependency>
```

```properties
#application.properties配置
#session存储类型
spring.session.store-type=redis
#设置session超时时间
server.session.timeout=2000
spring.redis.host=127.0.0.1
spring.redis.port=6379
```

```java
@EnableRedisHttpSession
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 800)  //800秒过期时间


session 常用命令

1.获取session对象：request.getSession();
2.给session设置值：session.setAttribute("变量名",值对象);
3.获取session中的值:session.getAttribute("变量名");
4.删除session中的值：session.removeAttribute("变量名");session.invalidate();//删除所有session中保存的键
```



### 三种压缩数据

#### redis配置

```java
@Configuration
public class RedisConfig {
    @Bean
    public RedisTemplate redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(factory); 
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class); 
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL); 
        jackson2JsonRedisSerializer.setObjectMapper(om); 
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();        
        // key采用String的序列化方式
        template.setKeySerializer(stringRedisSerializer); 
        // hash的key也采用String的序列化方式
        template.setHashKeySerializer(stringRedisSerializer); 
        // value序列化方式采用jackson
        template.setValueSerializer(jackson2JsonRedisSerializer); 
        // hash的value序列化方式采用jackson
        template.setHashValueSerializer(jackson2JsonRedisSerializer); 
        template.afterPropertiesSet();
        return template;
    }
}
```

#### jackson方式

// value序列化方式采用jackson
template.setValueSerializer(jackson2JsonRedisSerializer);

#### Gzip方式或者Snappy方式

```xml
<dependency>
    <groupId>org.xerial.snappy</groupId>
    <artifactId>snappy-java</artifactId>
    <version>1.1.73</version>
</dependency>
```

```java
@Bean
    public RedisTemplate<Object, Object> redisTemplate(LettuceConnectionFactory connectionFactory) {
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(connectionFactory);
 
        //Gzip Set a custom serializer that will compress/decompress data to/from redis
        RedisSerializerGzip serializerGzip = new RedisSerializerGzip();
        template.setValueSerializer(serializerGzip);
        template.setHashValueSerializer(serializerGzip);
 
 
        //Snappy RedisSerializerSnappy serializerSnappy = new RedisSerializerSnappy(null);
        //redisTemplate.setValueSerializer(serializerSnappy);
        //redisTemplate.setHashValueSerializer(serializerSnappy);
 
        return template;
    }
```



## Zip4j介绍

```xml
<dependency>
    <groupId>net.lingala.zip4j</groupId>
    <artifactId>zip4j</artifactId>
    <version>1.3.2</version>
</dependency>
```

```java
private static void zipFile() throws ZipException {
    // 生成的压缩文件
    ZipFile zipFile = new ZipFile("D:\\test.zip");
    ZipParameters parameters = new ZipParameters();
    // 压缩方式
    parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
    // 压缩级别
    parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
    // 要打包的文件夹
    File currentFile = new File("D:\\test");
    File[] fs = currentFile.listFiles();
    // 遍历test文件夹下所有的文件、文件夹
    for (File f : fs) {
        if (f.isDirectory()) {
            zipFile.addFolder(f.getPath(), parameters);
        } else {
            zipFile.addFile(f, parameters);
        }
    }
}

/**
    注释：

    压缩方式
    COMP_STORE = 0;（仅打包，不压缩）
    COMP_DEFLATE = 8;（默认）
    COMP_AES_ENC = 99; 加密压缩
    压缩级别
    DEFLATE_LEVEL_FASTEST = 1; (速度最快，压缩比最小)
    DEFLATE_LEVEL_FAST = 3; (速度快，压缩比小)
    DEFLATE_LEVEL_NORMAL = 5; (一般)
    DEFLATE_LEVEL_MAXIMUM = 7;
    DEFLATE_LEVEL_ULTRA = 9;
*/
```

## Zstd-jni

```xml
<dependency>
    <groupId>com.github.luben</groupId>
    <artifactId>zstd-jni</artifactId>
    <version>1.4.0-1</version>
</dependency>
```

## commons-fileupload

```xml
<dependency>
    <groupId>commons-io</groupId>
    <artifactId>commons-io</artifactId>
    <version>2.4</version>
</dependency>
<dependency>
    <groupId>commons-fileupload</groupId>
    <artifactId>commons-fileupload</artifactId>
    <version>1.3.1</version>
</dependency>

form编码格式必须为multipart/form-data
```

```java
判断是否为文件上传请求
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 // 创建产生item的工厂
DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
// 设置存放临时文件的目录（大文件）
File repository = (File) getServletContext().getAttribute("javax.servlet.context.tempdir");
// 设置阈值，区分大文件还是小文件
diskFileItemFactory.setSizeThreshold(1024 * 1024 * 1024 * 1024);
// 设置临时文件仓库
diskFileItemFactory.setRepository(repository);
// 创建文件上传句柄
ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
// 解析请求，生成items列表，待后续处理
List<FileItem> fileItems = servletFileUpload.parseRequest(req);

为了节省服务器资源，对于存放在临时目录下的大文件（超过我们设置的阈值的），我们可以设置处理器定时去清楚他们。QQ群里面的大文件，一段时间后就会被自动清除就是这个道理。
简单配置即可：
<web-app>
  ...
  <listener>
    <listener-class>
      org.apache.commons.fileupload.servlet.FileCleanerCleanup
    </listener-class>
  </listener>
  ...
</web-app>
```





## 谷歌浏览器常用插件

* **postman**  网页调试与发送网页HTTP请求  接口测试
* **Json Viewer** 格式化请求接口，返回Json数据格式

### 注解解析

```
@controller 控制器（注入服务）
@ResponseBody 返回的为json数据
@RequestMapping  仅作用在处理器方法上
@service 服务（注入dao）
@repository（实现dao访问）
@component （把普通pojo实例化到spring容器中，相当于配置文件中的<bean id="" class=""/> 

@RestController 相当于@Controller+@ResponseBody两个注解的结合，返回json数据不需要在方法前面加@ResponseBody注解了，但使用@RestController这个注解，就不能返回jsp,html页面，视图解析器无法解析jsp,html页面

获取配置信息常用注解
@Value("${}") ("#{}")区别微#{}对应的是对象实体 
@Value不能直接用在含statice关键字静态标识的上面,否则会变成Null？ 用在set()方法

@ConfigurationProperties（“acme”），
@PropertySource

一、用 @Configuration用于定义配置类，可替换xml配置文件，被注解的类内部包含有一个或多个被@Bean注解的方法，这些方法将会被AnnotationConfigApplicationContext或AnnotationConfigWebApplicationContext类进行扫描，并用于构建bean定义，初始化Spring容器。
1.1、@Configuration配置spring并启动spring容器
1.2、@Configuration启动容器+@Bean注册Bean
1.3、@Configuration启动容器+@Component注册Bean
1.4、使用 AnnotationConfigApplicationContext 注册 AppContext 类的两种方法
1.5、配置Web应用程序(web.xml中配置AnnotationConfigApplicationContext)
```

```java
@Configuration
public  class WebConfig implements WebMvcConfigurer{

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("test").setViewName("emp/test");
        
    }
    
}
#等价于
@Controller
public class EmpContrller {
    
    @RequestMapping("test")
    public String test() {
        
        return "emp/test";
    }
}
```

#### @NonNUll和@NULLable区别

```java
@Reference(version = "${online-service.version-2-0}", url = "${online-service.url}")注解

之前我常用的是@Autowired，我的理解就是从本地的spring容器内引入一个对象。
了解到@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按 byName自动注入。

@Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 通过 @Autowired的使用来消除 set ，get方法。

@Reference是dubbo的注解，@Resource是spring的

@Reference也是注入，他一般注入的是分布式的远程服务的对象，需要dubbo配置使用

总的来说他们的区别：@Reference注入的是分布式中的远程服务对象，@Resource和@Autowired注入的是本地spring容器中的对象。 

如果可以传入NULL值，则标记为@Nullable，如果不可以，则标注为@Nonnull。
例子：
public FileSystemXmlApplicationContext(boolean refresh, @Nullable ApplicationContext parent) throws BeansExcep  //有null则会有警告
```



##### @ControllerAdvice 全局异常处理器

```java
@ControllerAdvice
public class MyGlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public ModelAndView customException(Exception e) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", e.getMessage());
        mv.setViewName("myerror");
        return mv;
    }
}
```



```java
@ControllerAdvice，是Spring3.2提供的新注解，从名字上可以看出大体意思是控制器增强
```

- `@ControllerAdvice`是一个`@Component`，

  用于定义`@ExceptionHandler`，`@InitBinder`和`@ModelAttribute`方法，适用于所有使用`@RequestMapping`方法。

- Spring4之前，`@ControllerAdvice`在同一调度的Servlet中协助所有控制器。Spring4已经改变：`@ControllerAdvice`支持配置控制器的子集，而默认的行为仍然可以利用。

- 在Spring4中， `@ControllerAdvice`通过`annotations()`, `basePackageClasses()`, `basePackages()`方法定制用于选择控制器子集。

* 向前端返回数据时，自动忽略返回内容为null的属性

  ```java
  //该注解可以将实体类中的null的属性自动忽略，该注解可以对实现进行注解,注解后该类中出现null的属性时,传递回页面的json中自动忽略
  @JsonInclude(JsonInclude.Include.NON_NULL)
  ```

  ```yaml
  jackson:
    default-property-inclusion: NON_NULL
  ```

##### @import

> 1、<span style="color:red">**@Import只能用在类上**</span> ，@Import通过快速导入的方式实现把实例加入spring的IOC容器中
>
> 2、加入IOC容器的方式有很多种，@Import注解就相对很牛皮了，<span style="color:red">**@Import注解可以用于导入第三方包**</span> ，当然@Bean注解也可以，但是@Import注解快速导入的方式更加便捷
>
> 3、@Import注解导入配置的三种类型
> @Import支持 三种方式
> 1.带有@Configuration的配置类(4.2 版本之前只可以导入配置类，4.2版本之后 也可以导入 普通类)
> 2.ImportSelector 的实现
> 3.ImportBeanDefinitionRegistrar 的实现

* #### 第一种用法：直接填class数组

  **直接填对应的class数组，class数组可以有0到多个。**

  语法如下：

  ```javascript
  @Import({ 类名.class , 类名.class... })
  public class TestDemo {
  
  }
  ```

  对应的import的bean都将加入到spring容器中，这些在容器中bean名称是该类的**全类名** ，比如com.yc.类名

  

* #### 第二种用法：ImportSelector方式【重点】

这种方式的前提就是一个类要实现ImportSelector接口，假如我要用这种方法，目标对象是Myclass这个类，分析具体如下：

创建Myclass类并实现ImportSelector接口

```java
public class Myclass implements ImportSelector {
//既然是接口肯定要实现这个接口的方法
    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[0];
    }
}
```

分析实现接口的selectImports方法中的：

- 1、返回值： 就是我们实际上要导入到容器中的组件全类名【**重点** 】
- 2、参数： AnnotationMetadata表示当前被@Import注解给标注的所有注解信息【不是重点】

> 需要注意的是selectImports方法可以返回空数组但是不能返回null，否则会报空指针异常！

以上分析完毕之后，具体用法步骤如下：

第一步：创建Myclass类并实现ImportSelector接口，这里用于演示就添加一个全类名给其返回值

```java
public class Myclass implements ImportSelector {
    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[]{"com.yc.Test.TestDemo3"};
    }
}
```

第二步：编写TestDemo 类，并标注上使用ImportSelector方式的Myclass类

```java
@Import({TestDemo2.class,Myclass.class})
public class TestDemo {
        @Bean
        public AccountDao2 accountDao2(){
            return new AccountDao2();
        }

}
```



#### @PostConstruct、  @PreDestroy注解

@PostConstruct该注解被用来修饰一个非静态的void（）方法。

​     被@PostConstruct修饰的方法会在服务器**加载Servlet**的时候运行，并且只会被服务器执行一次。

PostConstruct在构造函数之后执行，init（）方法之前执行。

​     通常我们会是在Spring框架中使用到@PostConstruct注解 该注解的方法在整个Bean初始化中的执行顺序：

**Constructor(构造方法) -> @Autowired(依赖注入) -> @PostConstruct(注释的方法)**



```java

@Component
public class MyUtils {
 
    private static MyUtils          staticInstance = new MyUtils();

    @Autowired
    private MyMethorClassService    myService;
   // 必须是servelet，即必须注入spring容器ioc
    @PostConstruct
    public void init(){
        staticInstance.myService = myService;
    }

    public static Integer invokeBean(){
        return staticInstance.myService.add(10,20);
    }
}
```



#### 获取参数

@RequestParam用于将请求参数区数据映射到功能处理方法的参数上。

```java
1、直接把表单的参数写在Controller相应的方法的形参中，适用于get方式提交，不适用于post方式提交
 @RequestParam(value = "page", defaultValue = "1")
2、通过HttpServletRequest接收，post方式和get方式都可以。
	request.getParameter("username");
3、通过一个bean来接收,post方式和get方式都可以。
4、get请求通过@PathVariable获取路径中的参数
@RequestMapping(value="/dubbo/say/{name}")
public String sayHello(@PathVariable("name") String name){
    //调用服务提供者的服务
    String result=remoteUserService.sayHello(name);
    return result;
}
5、使用@ModelAttribute注解获取POST请求的FORM表单数据
@RequestMapping(value="/addUser5",method=RequestMethod.POST)
public String addUser5(@ModelAttribute("user") UserModel user) {
    System.out.println("username is:"+user.getUsername());
    System.out.println("password is:"+user.getPassword());
    return "demo/index";
}
6、当请求参数username不存在时会有异常发生,可以通过设置属性required=false解决,例如: @RequestParam(value="username", required=false)
public String queryUserName(@RequestParam String userName)
7、@RequestBody
    @RequestBody，它只会全部绑定在第一个参数中，切记
以前，一直以为在SpringMVC环境中，@RequestBody接收的是一个Json对象，一直在调试代码都没有成功，后来发现，其实 @RequestBody接收的是一个Json对象的字符串，而不是一个Json对象。然而在ajax请求往往传的都是Json对象，后来发现用 JSON.stringify(data)的方式就能将对象变成字符串。同时ajax请求的时候也要指定dataType: "json",contentType:"application/json" 这样就可以轻易的将一个对象或者List传到Java端，使用@RequestBody即可绑定对象或者List.  
@RequestMapping(value = "saveUser", method = {RequestMethod.POST }})   
public void saveUser(@RequestBody List<User> users) { 
    userService.batchSave(users); 
} 
```

```java
1、application/x-www-form-urlencoded （浏览器的默认方式）
请求参数在Form Data中，只能上传键值对，并且键值对都是间隔分开的。
参数形式:  name1=value1&name2=value2
3、application/json  注意ajax的content-type
1）注解@RequestBody 
@RequestBody，它只会全部绑定在第一个参数中，切记
2）流HttpServletRequest.getInputStream()或者HttpServletRequest.getReader()
```



若：**@RequestMapping(value="/dubbo/say/**")**

#### 获取 /**  的所有内容

```java
/**
     * 获取文件路径
     * 杨春生
     * @param request
     * @return
     */
private String extractPathFromPattern(final HttpServletRequest request) {
    String path = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
    String bestMatchPattern = (String) request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE);
    return new AntPathMatcher().extractPathWithinPattern(bestMatchPattern, path);
}
```

#### AOP 切面@Around注解

##### aop-切面说明

```java
AspectJ的Execution表达式
#######    1)通过方法签名定义切点
execution(public * *(..))
匹配所有目标类的public方法，但不匹配SmartSeller和protected void showGoods()方法。第一个*代表返回类型，第二个*代表方法名，而..代表任意入参的方法；
   
execution(* *To(..))
匹配目标类所有以To为后缀的方法。它匹配NaiveWaiter和NaughtyWaiter的greetTo()和serveTo()方法。第一个*代表返回类型，而*To代表任意以To为后缀的
 ########   2)通过类定义切点
execution(* com.baobaotao.Waiter.*(..))
匹配Waiter接口的所有方法
execution(* com.baobaotao.Waiter+.*(..))
匹配Waiter接口及其所有实现类的方法
 ########   3)通过类包定义切点
execution(* com.baobaotao.*(..))
匹配com.baobaotao包下所有类的所有方法
execution(* com.baobaotao..*(..))
匹配com.baobaotao包、子孙包下所有类的所有方法
execution(* com..*.*Dao.find*(..))
匹配包名前缀为com的任何包下类名后缀为Dao的方法，方法名必须以find为前缀
########   4)通过方法入参定义切点
execution(* joke(String,int)))
匹配joke(String,int)方法，且joke()方法的第一个入参是String，第二个入参是int
execution(* joke(String,..)))
匹配目标类中的joke()方法，该方法第 一个入参为String，后面可以有任意个入参且入参类型不限
```



Spring AOP常用于拦截器、事务、日志、权限验证等方面。

```java
@Around("execution(* com.company.controller.*.*(..))")
public Object around(ProceedingJoinPoint Point) throws Throwable {
     //获取方法参数类型数组
    String methodName = point.getSignature().getName();
        Object[] args = point.getArgs();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String params = formatArgs(args);
        Map<String, String> osAndBrowserInfo = OsAndBrowserInfoUtil.getOsAndBrowserInfo(request);
        AllianceUserDTO loginUser = getSysUserDTOCheckAuth(request);
        String requestURI = request.getRequestURI();
        String ip = IpAddressUtil.getIp(request);
        if (params.length() > SysLogConstants.MAX_WORD_NUM) {
            params = SysLogConstants.BEYOND_MAX_WORD_NUM;
        }
        save(ip, request.getSession().getId(), params, osAndBrowserInfo.get("os"), osAndBrowserInfo.get("browser"), methodName, null, requestURI, loginUser);
    //如果这里不返回响应结果result，则目标对象实际返回值会被置为null
        Object result = point.proceed();
        return result;
}

private String formatArgs(Object[] args) {
    StringBuffer argsStr = new StringBuffer();
    for (Object arg : args) {
        if (arg != null) {
            if (HttpServletRequest.class.isAssignableFrom(arg.getClass()) || HttpServletResponse.class.isAssignableFrom(arg.getClass())) {
                continue;
            } else {
                argsStr.append(JSON.toJSONString(arg)).append(",");
            }
        } else {
            argsStr.append("null,");
        }
    }
    if (argsStr.length() > 0) {
        argsStr.setLength(argsStr.length() - 1);
    }
    return argsStr.toString();
}
```

```java
#例子2  自定义注解的切面
@Aspect
@Component
public class TokenCheckInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(TokenCheckInterceptor.class);

    @Autowired
    private MerchantService merchantService;

    public TokenCheckInterceptor() {
        System.out.println("===>check start");
    }
//@Pointcut("execution( * com.zyxx.*.controller.*.*(..))")
    @Pointcut("@annotation(com.xf.harbor.config.TokenCheck)")
    private void anyMethod() {
    }

    @Around("anyMethod()") //环绕通知 @Around  ， 当然也可以使用 @Before (前置通知)  @After (后置通知)
    public Object checkRequestHead(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.debug("===>check access token start:{}", joinPoint.getArgs());
        long begin = System.nanoTime();

        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.setCharacterEncoding("UTF-8");
        HttpServletResponse response =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        String token = request.getHeader("X-XfAuth-Token");
        logger.debug("===> request token is {}", token);
        String[] listAterTokenSplit = token.split("-");
        String ak = listAterTokenSplit[1];
        String ipAddr = request.getHeader("X-Real-IP");
        if (ipAddr == null || ipAddr.equals("")) {
            ipAddr = request.getRemoteAddr();
        }
        logger.info("request X-Real-IP ipAddr={}", ipAddr);
        int expireTime = Integer.parseInt(listAterTokenSplit[2]);
        if (expireTime < MyUtil.getCurrentTimestamp()) { //token 超时
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.token_timeout.getStatus(), ResponseCodeEnums.token_timeout.getMessage()));
            return null;
        }

        Object[] args = joinPoint.getArgs();
        String requestBody = new Gson().toJson(args[0]);

        String sk = "";
        String allowIps = "";
        try {
            Merchant merchant = merchantService.getMerchant(ak);
            if (merchant != null) {
                sk = merchant.getSecretKey();
                allowIps = merchant.getAllowIps();
            }
            logger.info("===> access key is: {}", ak);
            //check ipAddr
            if (!StringUtils.equals(allowIps, "*")) {
                String[] ips = allowIps.split(",");
                if (!Arrays.asList(ips).contains(ipAddr)) {
                    writeResponse(response,
                            new ApiResponse(ResponseCodeEnums.limited_ip.getStatus(), ResponseCodeEnums.limited_ip.getMessage()));
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.system_exception.getStatus(), ResponseCodeEnums.system_exception.getMessage()));
            return null;
        }

        String requestUri = request.getRequestURI();
        String requestMethod = request.getMethod();
        String queryParam = getParamString(request.getParameterMap());

        logger.info(
                "===>get the equest url:{}; and request method:{}; "
                        + "request param is {};request body is {}",
                requestUri, requestMethod, queryParam, requestBody);

        AuthTokenHelper helper = new AuthTokenHelper();
        helper.setAccessKey(ak);
        helper.setSecretKey(sk);

        if (helper.verifyToken(token, requestUri, requestMethod, queryParam, requestBody)) {
            Object o = joinPoint.proceed();
            long end = System.nanoTime();
            logger.info("API deal time log {}:{}",
                    joinPoint.getTarget().getClass() + "." + joinPoint.getSignature().getName(),
                    (end - begin) / 1000000);
            return o;
        } else {
            writeResponse(response,
                    new ApiResponse(ResponseCodeEnums.token_mismatch.getStatus(), ResponseCodeEnums.token_mismatch.getMessage()));
            return null;
        }
    }

    private String getParamString(Map<String, String[]> parameterMap) {
        String queryParam = null;
        if (parameterMap.size() > 0) {
            ArrayList<String> parameterKey = new ArrayList<>(parameterMap.keySet());
            Collections.sort(parameterKey);
            ArrayList<String> keyQuotValues = new ArrayList<>();
            for (String key : parameterKey) {
                keyQuotValues.add(String.format("%s=%s", key, parameterMap.get(key)[0]));
            }
            queryParam = StringUtils.join(keyQuotValues, "&");
        }
        return queryParam;
    }

    private void writeResponse(HttpServletResponse response, ApiResponse apiResponse) throws IOException {
        logger.info("===>token check failed.return response={}", new Gson().toJson(apiResponse));
        String responseMap = new Gson().toJson(apiResponse);
        response.setContentType("application/json;charset=utf-8");
        response.getOutputStream().write(responseMap.getBytes());
        response.flushBuffer();
    }

}
```



如果不想每次都写private  final Logger logger = LoggerFactory.getLogger(XXX.class); 可以用注解**@Slf4j**

如果注解@Slf4j注入后找不到变量log，那就给IDE安装lombok插件，



接下来我们看一下@RequestParam注解主要有哪些参数：

* value：参数名字，即入参的请求参数名字，如username表示请求的参数区中的名字为username的参数的值将传入；
* required：是否必须，默认是true，表示请求中一定要有相应的参数，否则将报404错误码；
* defaultValue：默认值，表示如果请求中没有同名参数时的默认值，默认值可以是SpEL表达式，如“#{systemProperties['java.vm.version']}”。



### @Transactional 事务回滚问题



```java
@Transactional(rollbackFor=Exception.class)
如果类加了这个注解，那么这个类里面的方法抛出异常，就会回滚，数据库里面的数据也会回滚。

在@Transactional注解中如果不配置rollbackFor属性,那么事物只会在遇到RuntimeException的时候才会回滚,加上rollbackFor=Exception.class,可以让事物在遇到非运行时异常时也回滚
```
Propagation是一个枚举，定义了七大行为类型
@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
* REQUIRED 支持当前事务;如果不存在，就创建一个新的;如果此事内部出现异常回滚会使外事务方法也回滚
* SUPPORTS 支持当前事务;如果不存在，则执行非事务.
* NOT_SUPPORTED 执行非事务处理，如果存在的话，暂停当前事务。
* NEVER 不支持当前的事务;如果当前事务存在，则抛出异常。
* MANDATORY 支持当前事务;如果不存在当前事务，则抛出异常。
* NESTED 如果当前事务存在，在嵌套事务中执行，就像需要的传播一样;内部事务方法异常回滚并不会影响外部方法。
* REQUIRES_NEW 无论如何都创建一个新的事务来执行被标识的方法。一般局部数据操作一致性都用此方法

#### 事务提交后执行 如mq消息发送

```java
@Transactional
public void finishOrder(Order order){
	// 修改订单成功
	updateOrderSuccess(order);
 
	// 发送消息到 MQ
    TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter(){
       @Override
       public void afterCommit() {
           mqService.send(order);
       }
    });
}

// 实现方式二  @TransactionalEventListener 示例
@Service
public class UserService {
    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Transactional
    public void createUser(User user) {
        // 创建用户的逻辑
        eventPublisher.publishEvent(new UserCreatedEvent(user));
    }

    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT, classes = UserCreatedEvent.class)
    public void handleUserCreatedEvent(UserCreatedEvent event) {
        // 处理用户创建事件的逻辑
    }
}

// 对方式一方法进行封装
@Component
public class CallBackService {
    public void execute(final CallBackAction action) {
        // 判断是否在事务方法里
        boolean synchronizationActive = TransactionSynchronizationManager.isSynchronizationActive();
        // boolean synchronizationActive = TransactionSynchronizationManager.isActualTransactionActive()
        if (synchronizationActive) {
            TransactionSynchronizationManager
                    .registerSynchronization(new TransactionSynchronizationAdapter() {
                        @Override
                        public void afterCommit() {
                            // 事务提交后执行回调
                            action.callback();
                        }
                    });
        } else {
            // 事务提交后执行回调
            action.callback();
        }
    }
}

// 函数式接口只能由一个抽象方法
public interface CallBackAction {
    /**
     * 普通事务回调
     */
    void callback();
}

//调用
// 在事务提交后执行
callBackService.execute(() -> {
    // ...
});
```

#### 事务失效场景

```java
// 使用代理执行解决 自身调用失效
原来在springAOP的用法中，只有代理的类才会被切入，我们在controller层调用service的方法的时候，是可以被切入的，但是如果我们在service层 A方法中，调用B方法，切点切的是B方法，那么这时候是不会切入的，解决办法就是如上所示，在A方法中使用
 
//使用事务代理 
service A = AopContext.currentProxy();
```



#### JackSon中@JsonInclude注解详解

​		比如说我有个场景，返回前端的实体类中如果某个字段为空的话那么就不返回这个字段了，如果我们平时遇到这个问题，那么真的该脑壳疼了。幸亏有我们今天的主角，这个注解就是用来在实体类序列化成json的时候在某些策略下，加了该注解的字段不去序列化该字段

```yaml
## 全局配置
spring:
  jackson:
    default-property-inclusion: non_nul
```
```java
//Include.Include.ALWAYS 默认全部属性起作用 
//Include.NON_DEFAULT 属性为默认值不序列化 
//Include.NON_EMPTY 属性为 空（“”） 或者为 NULL 都不序列化 
//Include.NON_NULL 属性为NULL 不序列化
## 局部设置
public class User {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String username;
    private String password;
    private Integer age;
    }

#2代码上
ObjectMapper mapper = new ObjectMapper();
mapper.setSerializationInclusion(Include.NON_NULL);
```

#### @Cacheable 基本使用

##### springboot @Cacheable 基本使用

加入依赖

```yml
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-cache</artifactId>
</dependency>
```

开启注解缓存

在启动类上加入 `@EnableCaching`

缓存注解

1. `@Cacheable` 一般与`@CacheEvict` 共用进行更新
   
   ```java
   @Cacheable(key="#containerId", value="CONTAINER_INFO", unless="#result == null")
   private V test(String containerId){}
   ```

   ：对方法结果进行缓存（主要用于GET方法）
   
   1. `cacheNames/value`:指定缓存主键（`Cache`）的名字
   2. `key`:缓存数据使用`key`，支持`spEl`语法
   3. `keyGenerator`:`key`的生成器。与`key`属性冲突，自定义 `keyGenerator` 必须实现`org.springframework.cache.interceptor.KeyGenerator`,`default`使用默认的参数值生成器
   4. `cacheManager`:指定缓存管理器，或者`cacheResolver`指定获取解析器
   5. `cacheResolver`: 与`CacheManager`冲突
   6. `condition`：指定条件满足才缓存，与`unless`相反。可以使用`spEL`语法
   7. `unless`：否定缓存，当满足条件时，结果不被缓存。可以获取到结果（`#result`）进行判断。支持`spEL`语法
   8. `sync`：是否异步模式。在该模式下`unless`不被支持。`default=false`
   
2. `@CachePut`:先调用方法，在对结果进行缓存。（主要用于PUT方法），需要注意`key`的设置

3. `@CacheEvict` 
   
   ```java
   @CacheEvict(value = CacheConstants.SYS_APP_DETAILS, allEntries = true)
   ```

   :默认先调用方法，在删除缓存（主要用于DELETE方法）
   
   1. `allEntries`: 删除缓存组件中（`cacheNames/value`指定）所有的值
   2. `beforeInvocation`：在方法执行之前删除值，`default=false`
   
4. `@Caching`：组合注解。针对复杂情况

5. `@CacheConfig`：加载类上，用于设置缓存的共有属性

##### Cacheable 例子

是一个既可以应用于方法级别，也可用于类级别的注解。自spring3.1开始就通过它实现了缓存管理。

1. `@Cacheable`能干什么？
    为了通俗易懂的理解，举个栗子：一个方法,`getBooksByUsernameAndLanguage(String username, int language)`，显然，是一个获取数据库里所有我的英文书对象的方法，返回应该是一个列表。如果这个函数的返回值很大，而且会在页面上被经常调用，那么每一次调用都要重新连接数据库并返回一个数据量庞大的list，可能页面响应和资源占用会比较大。而我们希望的是，第一次调用这个方法时，返回的数据能被放到服务器端的缓存里，以便于后面要调用这个方法时，能直接从缓存里取到，这样就不用再查数据库占用资源了。而`@Cacheable`的作用就是这个。

   ```java
   //value自定义缓存名称，key用双引号,里面#加上方法的参数:获取方法的参数,  ''表示在参数之间添加分隔符
   @Cacheable(value = "PERSON",key = "#tagId+'_'+#zz")
   public List<Person> getPersonByTagid(Long tagId,String zz)
   ```

2. 缓存时间

   ```java
    /**
        * 这个是配合@Cacheable使用的，需要的话，单独配置在项目中
        * @param factory
        * @return
        */
   //    @Bean
       public CacheManager cacheManager(RedisConnectionFactory factory) {
           RedisSerializer<String> redisSerializer = new StringRedisSerializer();
           Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
           //解决查询缓存转换异常的问题
           ObjectMapper om = new ObjectMapper();
           om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
           om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
           jackson2JsonRedisSerializer.setObjectMapper(om);
           // 配置序列化（解决乱码的问题）,过期时间600秒
           RedisCacheConfiguration config = RedisCacheConfiguration
                   .defaultCacheConfig()
                   .entryTtl(Duration.ofSeconds(600))
                   .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(redisSerializer))
                   .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer))
                   .disableCachingNullValues();
   
           RedisCacheManager cacheManager = RedisCacheManager.builder(factory)
                   .cacheDefaults(config)
                   // 可以给每个cacheName不同的RedisCacheConfiguration  设置不同的过期时间
                   //.withCacheConfiguration("Users",config.entryTtl(Duration.ofSeconds(100)))
                   .transactionAware()
                   .build();
           return cacheManager;
       }
   ## #另一种风格方式，封装代码  学习优化代码
       
   @Configuration
   public class RedisCacheConfig {
       @Value("${zihexin.globalSessionTimeout}")
       private long globalSessionTimeout;
       @Autowired
       ResourceLoader resourceLoader;
       
       @Bean
       public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
           return RedisCacheManager.builder(redisConnectionFactory)
                   //默认的缓存配置(没有配置键的key均使用此配置)
                   .cacheDefaults(getDefaultCacheConfiguration())
                   .withInitialCacheConfigurations(getCacheConfigurations())
                   //在spring事务正常提交时才缓存数据
                   .transactionAware()
                   .build();
       }
       
       private Map<String, RedisCacheConfiguration> getCacheConfigurations() {
           Map<String, RedisCacheConfiguration> configurationMap = new HashMap<>();
           //缓存键,且3600*10秒后过期,3600*10秒后再次调用方法时需要重新缓存
           configurationMap.put("AllMenuList", this.getDefaultCacheConfiguration(globalSessionTimeout*10));
           configurationMap.put("Menus", this.getDefaultCacheConfiguration(globalSessionTimeout*10));
           configurationMap.put("NotButtonList", this.getDefaultCacheConfiguration(globalSessionTimeout*10));
           configurationMap.put("UserMenuList", this.getDefaultCacheConfiguration(globalSessionTimeout*10));
           return configurationMap;
       }
       
       /**
        * 获取redis的缓存配置(针对于键)
        *
        * @param seconds 键过期时间
        * @return
        */
       private RedisCacheConfiguration getDefaultCacheConfiguration(long seconds) {
           Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Object.class);
           ObjectMapper om = new ObjectMapper();
           om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
           om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
           jackson2JsonRedisSerializer.setObjectMapper(om);
           RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig();
           redisCacheConfiguration = redisCacheConfiguration.serializeValuesWith(
                   RedisSerializationContext
                           .SerializationPair
                           .fromSerializer(jackson2JsonRedisSerializer)
           ).entryTtl(Duration.ofSeconds(seconds));
           return redisCacheConfiguration;
       }
       
       /**
        * 获取Redis缓存配置,此处获取的为默认配置
        * 如对键值序列化方式,是否缓存null值,是否使用前缀等有特殊要求
        * 可另行调用 RedisCacheConfiguration 的构造方法
        *
        * @return
        */
       private RedisCacheConfiguration getDefaultCacheConfiguration() {
           // 注意此构造函数为 spring-data-redis-2.1.9 及以上拥有,经试验 已知spring-data-redis-2.0.9及以下版本没有此构造函数
           // 但观察源码可得核心不过是在值序列化器(valueSerializationPair)的构造中注入 ClassLoader 即可
           return RedisCacheConfiguration.defaultCacheConfig(resourceLoader.getClassLoader());
       }
   }
   ```

   



#### @Modelattribute注解

* 注解在参数上，会将客户端传递过来的参数按名称注入到指定对象中

```java
public String register(@ModelAttribute User user,Model model) {
    System.out.println(user.getBirthday());
    model.addAttribute("user", user);
    return "success";
}
```

* 注解在方法上，如果有返回值，则自动将该返回值加入到ModelMap中

```java
@ModelAttribute
public User getUser(Model model) {
    User user=new User("吕蒙","123",new Address("江苏","南京"));
    model.addAttribute("user", user);
    return user;
}
```



#### Springboot JDK8自定义注解

##### 元注解

```java
元注解的作用就是注解其他注解，一般我们使用自定义注解时，就需要用元注解来标注我们自己的注解，一共有以下四个元注解
1.创建一个 Annotation 类型的类

2.@Target：说明了Annotation被修饰的范围，可被用于 packages、types（类、接口、枚举、Annotation类型）、类型成员（方法、构造方法、成员变量、枚举值）、方法参数和本地变量（如循环变量、catch参数）。在Annotation类型的声明中使用了target可更加明晰其修饰的目标

例：@Target(ElementType.TYPE)
 ElementType.CONSTRUCTOR:   用于描述构造器
 ElementType.FIELD:         用于描述域（类的成员变量）
 ElementType.LOCAL_VARIABLE:用于描述局部变量（方法内部变量）
 ElementType.METHOD:        用于描述方法
 ElementType.PACKAGE:       用于描述包
 ElementType.PARAMETER:     用于描述参数
 ElementType.TYPE:          用于描述类、接口(包括注解类型) 或enum声明

3.@Retention：定义了该Annotation被保留的时间长短，有些只在源码中保留，有时需要编译成的class中保留，有些需要程序运行时候保留。即描述注解的生命周期

例：@Retention(RetentionPolicy.RUNTIME)
1.RetentionPoicy.SOURCE:在源文件中有效（即源文件保留）
2.RetentionPoicy.CLASS:在class文件中有效（即class保留）
3.RetentionPoicy.RUNTIME:在运行时有效（即运行时保留）

4.@Inherited：它也是一个标记注解，它的作用是，被它标注的类型是可被继承的，比如一个class被@Inherited标记，那么一个子类继承该class后，则这个annotation将被用于该class的子类。

```

##### jdk的自带注解

```java

@Override：告诉编译器我重写了接口方法
@Deprecated：告诉编译器这个方法过时了，不建议使用，Ide会在方法上划横线
@SuppressWarnings("deprecation"):关闭方法中出现的警告
下面列出@SuppressWarnings注解参数的几个常见用法

例:@SuppressWarnings(value={ "rawtypes", "unchecked" })
1.deprecation：去除不暂成使用类的警告
2.serial：当在可序列化的类上缺少 serialVersionUID 定义时的警告
3.finally：任何 finally 子句不能正常完成时的警告
4.rawtypes：去除传参数时也要带泛型
5.unchecked：执行了未检查的转换时的警告，例如当使用集合时没有用泛型来指定集合保存的类型
6.unused：去除对未使用代码的警告
7:all:去除所有类型的警告
```

##### 自定义注解格式：

```java
public @interface 注解名 {定义体}
```

使用@interface定义一个注解，自动继承了java.lang.annotation.Annotation接口，其中的每一个方法实际上是声明了一个配置参数。方法的名称就是参数的名称，返回值类型就是参数的类型（返回值类型只能是基本类型、Class、String、enum）。可以通过default来声明参数的默认值。

注解参数的可支持数据类型：

```
1.所有基本数据类型（int,float,boolean,byte,double,char,long,short)
2.String类型
3.Class类型
4.enum类型
5.Annotation类型
6.以上所有类型的数组
```

* 定义注解成员的注意点: 第一,只能用public或默认(default)这两个访问权修饰.例如,String value();这里把方法设为defaul默认类型；　

* 第二,参数成员只能用基本类型byte,short,char,int,long,float,double,boolean八种基本数据类型和 String,Enum,Class,annotations等数据类型，以及这一些类型的数组。

* 第三,如果只有一个参数成员,最好把参数名称设为"value",后加小括号。

注解的默认值
注解元素必须有确定的值，要么指定时给默认值，要么使用时给值。不过有时候我们需要确定表达一个元素不存在值，所以使用空字符串或者负数表示某个元素不存在，在定义注解时，这已经成为一个约定用法。

注解一般与aop联合使用

```java
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface User {
   public int id() default -1;
   public String name() default "";
   public String address() default "";
}
```

##### 获取注解的三个方式,

```java
/**是否存在对应 Annotation 对象*/
public boolean isAnnotationPresent(Class<? extends Annotation> annotationClass) 
{
    return GenericDeclaration.super.isAnnotationPresent(annotationClass);
}
/**获取 Annotation 对象*/
public <A extends Annotation> A getAnnotation(Class<A> annotationClass) 
{
    return (A) annotationData().annotations.get(annotationClass);
}
/**获取所有 Annotation 对象数组*/   
public Annotation[] getAnnotations() 
{
    return AnnotationParser.toArray(annotationData().annotations);
}
```

#### @FunctionalInterface的使用 函数式编程

* 必须注解在接口上

  被注解的接口有且只有一个抽象方法

  被注解的接口可以有默认方法/静态方法，或者重写Object的方法

```java
@FunctionalInterface
public interface FuncInterface {
  //只有一个抽象方法
  public void  method1();
  //default方法不计
  default  void method2(){
  }
  //static方法不计
  static void method3(){
  }
  //从Object继承的方法不计
  public boolean equals(Object obj);
}
内置的函数式接口
​ JDK 也提供了大量的内置函数式接口，使得 Lambda 表达式的运用更加方便、高效。这些内置的函数式接口已经可以解决我们开发过程中绝大部分的问题，只有一小部分比较特殊得情况需要我们自己去定义函数式接口。在这里特别介绍四个函数式接口。

Consumer：消费型接口（void accept(T t)）。有参数，无返回值 （上文forEach的参数类型就是Consumer）
Supplier：供给型接口（T get（））。只有返回值，没有入参
Function<T, R>：函数型接口（R apply（T t））。一个输入参数，一个输出参数，两种类型不可不同、可以一致
Predicate：断言型接口（boolean test（T t））。输入一个参数，输出一个boolean类型得返回值
```



### Spring

#### bean的初始化方式

spring初始化bean有几种方式：

```kotlin
1. 实现InitializingBean接口，重写afterPropertiesSet方法
2. <Bean>元素上添加init-method初始化
3. 使用@PostConstruct注解
```



接口定义如下：

```java
public interface InitializingBean {
        void afterPropertiesSet() throws Exception;
    }
```

执行顺序：Constructor > @PostConstruct > InitializingBean > init-method



## Springboot整合

### springboot实现CORS 跨域请求

* https://blog.csdn.net/pjmike233/article/details/82461911

#### （全部跨域）

```java
#在webconfi中添加配置
@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
/*
* 实现跨域
*/
@Bean
public FilterRegistrationBean corsFilter() {	
     //1. 添加 CORS配置信息
    CorsConfiguration config = new CorsConfiguration();
    //放行哪些原始域
    config.addAllowedOrigin("*");
    //是否发送 Cookie
    config.setAllowCredentials(true);
    //放行哪些原始请求头部信息
    config.addAllowedHeader("*");
    //放行哪些请求方式
    config.addAllowedMethod("*");
    //2. 添加映射路径
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    source.registerCorsConfiguration("/**", config);
    FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));
    bean.setOrder(0);
    return bean;
}
}
```

####  （局部跨域）

1、在控制器上使用注解 @CrossOrigin:

```java
@RestController
@CrossOrigin(origins = "*")
public class HelloController {
    @RequestMapping("/hello")
    public String hello() {
        return "hello world";
    }
}
```

2、使用 HttpServletResponse 对象添加响应头(Access-Control-Allow-Origin)来授权原始域，这里 Origin的值也可以设置为 “*”,表示全部放行。

```java
@RequestMapping("/index")
public String index(HttpServletResponse response) {
    response.addHeader("Access-Allow-Control-Origin","*");
    return "index";
}
```

### EasyExcel使用

```xml
poi消耗更大的内存，可能oom
<!--EasyExcel相关依赖-->
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>easyexcel</artifactId>
    <version>3.0.5</version>
</dependency>
```



### ThreadLocal使用场景

```java
public final class SysSession {
    private static ThreadLocal<AuthenticatedUser> authenticatedUserLocal = new ThreadLocal<AuthenticatedUser>();
//### 所以只有那些一次请求有可能使用到多次的变量才存储到ThreadLocal中
```



### 单点登录的实现

* **jsonwebtoken跨域登录**

由于**多终端跨域**的出现，很多的站点通过 `web api restful` 的形式对外提供服务，采用了前后端分离模式进行开发，因而在身份验证的方式上可能与传统的基于 `cookie` 的 `Session Id` 的做法有所不同，除了面临跨域提交 `cookie` 的问题外，更重要的是，有些终端可能根本不支持 `cookie`。

`JWT（JSON Web Token）` 是一种身份验证及授权方案，简单的说就是调用端调用 `api` 时，附带上一个由 `api` 端颁发的 `token`，以此来验证调用者的授权信息。

```xml
<!-- JWT相关 -->
<dependency>
   <groupId>io.jsonwebtoken</groupId>
   <artifactId>jjwt</artifactId>
   <version>0.7.0</version>
</dependency>
```

```java
https://www.jianshu.com/p/5858b2a9b509
```

* **cas单点登录系统**

  https://www.cnblogs.com/wlwl/p/10056067.html

```xml
<!-- CAS依赖包 -->
<dependency>
    <groupId>net.unicon.cas</groupId>
    <artifactId>cas-client-autoconfig-support</artifactId>
    <version>1.5.0-GA</version>
</dependency>
```



## Node使用

#### 环境搭建

* 安装node.js 即安装了npm

* 配置私库 

  ```cmd
  #命令
  npm config set registry http://registry.npm.taobao.org
  npm config get registry
  
  # 安装 pnpm
  npm install -g pnpm
  #pnpm可以替代npm的命令，下载包之类的效率更高
  ```
  
  

##### nrm的使用

nrm(npm registry manager )是npm的镜像源管理工具，有时候国外资源太慢，使用这个就可以快速地在 npm 源间切换

```shell
npm install -g nrm@1.1.0，#全局安装nrm
nrm ls  #-- 查看所有镜像源 * 为当前使用源
nrm use taobao #如果要切换到taobao源，执行命令
nrm add group http://nexus-nc.fxnotary.com/repository/npmjs-group/   
nrm add <registry> <url>，#其中reigstry为源名，url为源的路径。
nrm del <registry> #删除对应的源。
nrm test npm #测试相应源的响应时间
```

npm切换源

```shell
#查看所有源
方式1. npm config list
方式2. npm get registry

# [临时使用]
npm install --registry=https://registry.npm.taobao.org

# [一般永久使用]通过 config 配置指向国内镜像源
# cnpmjs.org
$ npm config set registry http://registry.cnpmjs.org
# npm.taobao.org
$ npm config set registry http://registry.npm.taobao.org

如果有一天，换的源用不上了，用rm命令删掉它：npm config rm registry


```



#### Node模块引入的加载顺序问题

* ##### vue项目main.js文件下import router from ‘./router‘默认导入router文件夹下index.js的原因

```
1. 首先寻找目录下有没有router.js或者router.node,如果有就导入
2. 如果没有看是否有router目录,如果没有就require失败,抛出异常"Cannot find module ‘./router’"
3. 如果有router目录会在其下寻找package.json文件,如果有则按照package的配置来导入
4. 如果没有package.json,看是否有index.js或者index.node,如果有就导入没有就失败
```



#### 创建一个新项目

```
npm install -g @vue/cli  ## 先安装vue

vue --version   输出 5.0.8
npm -v  输出6.14.14
node -v 输出v14.17.4
```

* **vue init**

```
是vue-cli2.x的初始化方式，可以使用github上面的一些模板来初始化项目

webpack是官方推荐的标准模板名
使用方式：vue init webpack 项目名称

electron-vue的模板(github上的项目)
使用方式：vue init simulatedgreg/electron-vue 项目名称

 #安装element-ui
 cnpm i element-ui -S
```

* vue create

  ```
  - 是vue-cli3.x的初始化方式，模板是固定的，模板选项可自由配置
  使用方式：vue create 项目名称
  ```

  

```cmd
$ cd my-project
$ cnpm install
$ cnpm run dev
 DONE  Compiled successfully in 4388ms
```

Vue十个常用的js工具库

方法可自封装utils

https://zhuanlan.zhihu.com/p/458319047?utm_id=0

### vue解决缓存问题

当程序版本升级时，用户因为缓存访问的还是老的页面

```
location = /index.html {
 add_header Cache-Control "no-cache, no-store";
}
```



------

### Vue的语法

```js
#vue中给定默认值写法 双杠
{{ message || '啊对对对'}}
```



```js
#vue的一些语法用法 模板
<p>{{ message }}</p>
<div v-html="message"></div>
	# v-model 指令来实现双向数据绑定：
<input v-model="message">
	# v-bind 样式绑定
<div v-bind:class="{'class1': true|false}">
    # v-on 监听 DOM 事件
<!-- 完整语法 --><a v-on:click="doSomething"></a>
<!-- 缩写 --><a @click="doSomething"></a>
```

```js
#vue在element-ui里的一些用法
template（模版） 在这里属于一个固定用法： <template slot-scope="scope">
<el-table-column label="日期" width="180">
    <template slot-scope="scope">
        <i class="el-icon-time"></i>
		<span style="margin-left: 10px">{{ scope.row.date }}</span>
	</template>
</el-table-column>
```

* 依懒项升级

```cmd
首先安装依赖
npm install -g npm-check-updates
然后检测依赖版本
ncu
更新dependencies到新版本：
ncu -u
更新全部到最新版本：
npm run install
```

##### $router和$route区别

```vue
//传值
this.$router.push({path:"/menLink",query:{alert:"页面跳转成功"}})
this.$router.push({path:"/menLink",params:{alert:"页面跳转成功"}})

//获取值
<p>提示：{{this.$route.params.alert}}</p>
<p>提示：{{this.$route.query.alert}}</p>
 
```

<div style="color:red">两种方式的区别是query传参的参数会带在url后边展示在地址栏，params传参的参数不会展示到地址栏。<p>需要注意的是接收参数的时候是route而不是router。两种方式一一对应，名字不能混用</p></div>
##### vue中provide和inject 

```js
由于vue有$parent属性可以让子组件访问父组件。但孙组件想要访问祖先组件就比较困难。通过provide/inject可以轻松实现跨级访问祖先组件的数据

父组件
export default {
  name: 'App',
  data () {
    return {
    datas: [
        {
            id: 1,
            label: '产品一'
        },
	]
  },

// 父组件中返回要传给下级的数据
  provide () {
    return {
      datas: this.datas
    }
  }
}
// 后代组件中使用
export default {
	inject: ['datas']
}

```

#### JS高级----可选链

```json
const obj = {
   name:"Peter",
   age:23,
   street:{
     main:"Street main"
     city:"Nan jing"
  }
}
// 正常写法
console.log(obj.street.city) 
//但问题是如果obj或者street和city都有可能为null/undefined呢
// 短路可以简写  用法
console.log(obj?.street?.city)  
```



#### Vue.js的实例

```js
var detail = new Vue({
    el: '#app',
    mixins: [mixin],  // 混入 一些共用的属性方法等
    directives: {},//钩子函数的用法，自定义指令
    components:{}, #组件注册，自定义局部组件
    emits: ['addClick'], #父组件向子组件的方法
    props: {
            itemData: {
				type: Object,
				default: () => {}
			},
			subText: {
				type: String,
				default: '今'
			},
            type: String
          }, #父组件向子组件传递数据
    mounted: function () {
        #初始化
    },
    data: {
        #数据属性
    },
    methods: {
        #函数方法
    },
    computed: {
        #computed中的函数必须用return返回最终的结果；属性的结果会被缓存，除非依赖的响应式属性变化才会重新计算。
        testFunction: function(){
    		return "";
		}
    },
     #render渲染函数
     render(h, context) {
        const { icon, title } = context.props
        const vnodes = []

        if (icon) {
          vnodes.push(<svg-icon icon-class={icon} />)
        }

        if (title) {
          vnodes.push(<span slot="title">{title}</span>)
        }
        return vnodes
      },
    /**使用场景
    computed 　　　　
        当一个属性受多个属性影响的时候就需要用到computed
        最典型的例子： 购物车商品结算的时候
    watch
        当一条数据影响多条数据的时候就需要用watch
        搜索数据**/
    watch:{
        #data里的数据属性监听 监听属性的变化
    }
    filters:{
    	#过滤器
 	}
})
```

##### Vue使用mixins配置公用属性和方法

##### Vue使用draggable实现拖拽

##### Vue使用cloneDeep深拷贝

```vue
单级多级均为深拷贝，使用lodash工具中cloneDeep方法实现深拷贝，需要通过npm引入lodash库
npm i -save lodash //全局安装
```

##### Vue的子级点击事件

```vue
<view @click.stop="method"></view>
<a @click.prevent='notLink' href="http://www.baidu.com">百度</a>
```



##### Vue使用goJs实现绘制流程图

##### Vue使用bpmn绘制流程图

* https://blog.csdn.net/haoyanyu_/article/details/100702315

```cmd
#安装
npm install bpmn-js
npm install bpmn-js-properties-panel //节点信息编辑面板
```



```cmd
#引用
import BpmnModdle from 'bpmn-js'; //默认入口是Viewer.js文件，只有预览流程图的功能；
import BpmnModdle from 'bpmn-js/lib/Modeler'; //如果手动引入bpmn-js/lib/Modeler，则具备左侧工具栏，可以编辑流程图
```



```vue
<template>
	<div style="">
		<div id="js-canvas"></div>
		<div id="js-properties-panel"></div>
		<div>
			<a-button @click="download">保存到本地</a-button>
			<button @click="createNew">新建</button>
		</div>
		<!-- <a-modal></a-modal> -->
	</div>
</template>
<script>
import BpmnModdle from 'bpmn-js/lib/Modeler';
import diagramXml from '../../../assets/diagram.bpmn'; //xml文件
import propertiesProviderModule from 'bpmn-js-properties-panel/lib/provider/camunda';

export default {
	name: 'bpmn',
	data() {
		return {
			viewer: null,
			canvas: null,
			bpmnText: '',
		}
	},
	mounted() {
		this.$nextTick().then(() => {

			this.canvas = document.getElementById('js-canvas')

			this.viewer = new BpmnModdle({
				container: this.canvas,
				keyboard: {
					bindTo: window
				},
				propertiesPanel: {
					parent: '#js-properties-panel'
				},
				additionalModules: [
					propertiesProviderModule
				]
			})
			this.create()
		})
	},
	methods: {
		download() {
			this.viewer.saveXML({ format: true }, (err, xml) => {
				if (xml) {
					this.bpmnText = xml
					var a = document.createElement('a');
					a.href = 'data:application/bpmn20-xml;charset=UTF-8,' + encodeURIComponent(xml)
					a.download = 'diagram.bpmn';
					document.body.appendChild(a);
					a.click();
					document.body.removeChild(a);
					a = null;
				}

			})
		},
		create() {
			this.bpmnText = diagramXml
			this.viewer.importXML(diagramXml, err => {
				if (err) {
					throw (err)
				}
				this.viewer.get('canvas').zoom('fit-viewport')
				var eventBus = this.viewer.get('eventBus');

				var events = [
					'element.click',
					'element.dblclick'
				]
				events.forEach(event => {
					eventBus.on(event, (e) => {
					})
				})
			})

		},
		createNew() {
			this.viewer.createDiagram(err => {
				if (err) {
					throw (err)
				}
				this.viewer.get('canvas').zoom('fit-viewport')
				var eventBus = this.viewer.get('eventBus');

				var events = [
					'element.click',
					'element.dblclick'
				]
				events.forEach(event => {
					eventBus.on(event, (e) => {
						// console.log(event, 'on', e.element.id)
					})
				})
			})
		}
	}
}
</script>
<style>
//引入样式，否则显示不出内容
@import 'bpmn-js/dist/assets/diagram-js.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn-codes.css';
@import 'bpmn-js/dist/assets/bpmn-font/css/bpmn-embedded.css';
@import 'bpmn-js-properties-panel/dist/assets/bpmn-js-properties-panel.css';
</style>
```



#### 路由和组件的懒加载

```vue
路由和组件的常用两种懒加载方式：
1、vue异步组件实现路由懒加载
　　component：resolve=>(['需要加载的路由的地址'，resolve])
2、es提出的import(推荐使用这种方式)
　　const HelloWorld = （）=>import('需要加载的模块地址')
###例子#########
<template>
  <div class="hello">
  <One-com></One-com>
  1111
  </div>
</template>

<script>
export default {
  components:{
    "One-com":resolve=>(['./one'],resolve)
     // "One-com": resolve => require(['../components/study/css'],resolve)
     // "One-com": ()=>import("./one");
  },
  data(){
  }
}
</script>
```

#### 组件传递参数

```vue
#1 子组件主动获取父组件的数据和方法：  
    this.$parent.数据
    this.$parent.方法
#2 父组件传递参数
<child-first :value="form" :father="this"></child-first>//父组件 把当前对象传过去
//接收父组件传过来的对象  
props:{
    value:{},
    father:Object
}
```

##### 子组件修改父组件数据.sync

```js
## .sync 
<child :page.sync="page"></child>

props: {
    page:String
}
在子组件中数据值修改方法
this.$emit("update:page", newVal)

```

##### 父组件调用子组件ref

```js
## ref 如果在普通的DOM元素上，引用指向的就是该DOM元素;
## 如果在子组件上，引用的指向就是子组件实例;
## 父组件可以通过 ref 主动获取子组件的属性或者调用子组件的方法
<child ref="child"></child>
#父组件中
const child = this.$refs.child
console.log(child.name)
child.someMethod("调用了子组件的方法")
```

##### 子组件调用父组件方法$emit

```js
emits: ['addClick'], #父组件向子组件的方法
props: 参数
#使用
this.$emit('addClick', params)
```



##### vue动态组件

```vue
核心代码
<component :is="componentTag"></component>

data() {
    return {
        componentTag: '', //组件名称
    }
},
```



##### 全局自定义组件、指令

```js
export default {
	install(Vue,option){
		组件
		指令
		混入
		挂载vue原型
	}
}
```

* 全局自定义组件

* 全局自定义指令

  ```js
  export default{
  	install(Vue){
  		Vue.directive('pre',{
  			inserted(button,bind){
  				button.addEventListener('click',()=>{
  					if(!button.disabled){
  						button.disabled = true;
  						setTimeout(()=>{
  							button.disabled = false
  						},1000)
  					}
  				})
  			}
  		})
  	}
  }
  ```

  在main.js中引用

```js
import pre from '@/aiqi'
Vue.use(pre)
```

##### 自定义插件开发

* 若依 dicts: ['status']

#### this.$的调用参数或方法

* this.$refs //获取dom元素

```vue
<input ref='aaa' type="text" />

this.$refs.aaa.value='20' //this.$refs['aaa']
```

获取this.$refs.aaa 里面的数据是，只能在mounted里获取，created是获取不到的

* this.emit //子组件通过this.$emit方式向父组件传递参

```vue
//子组件调用  this.$emit('closeMain',flag);
//父组件传递子组件方法如下 v-on可以用@代替
<indexImportOrder ref="indexImportOrder" v-on:closeMain="closeMain"/>
父组件实现方法
closeMain(arguments){
    ....
},


父组件调用子组件的方法
this.$refs.child.method();
this.$refs.child.$emit("childmethod")
this.$refs.child.$on("childmethod")
```

* this.$store //全局 

  https://blog.csdn.net/lemonC77/article/details/95077691 
  
  *  this.$store.dispatch('login', param).then( ()=> {})来调取store里的user.js的login方法，从而要更新。

```js
export default new Vuex.Store({
    state,
    getters,
    actions, //Action 提交的是 mutation，而不是直接变更状态。 Action 可以包含任意异步操作通过通过 store.dispatch 方法触发
    mutations,  //mutations类似于事件注册，必须用 commit()方法调用
    modules,
})

用法： $store.state
```

**注：必须要用commit(‘SET_TOKEN’, tokenV)调用mutations里的方法，才能在store存储成功。**

* this.router //路由

* this.$set //触发对象更新

  **当你发现你给对象加了一个属性，在控制台能打印出来，但是却没有更新到视图上时，也许这个时候就需要用到this.$set（）这个方法了**

  ```vue
  this.$set( target, key, value )
  ```

  

#### this.$nextTick() 

例如：
 1.你改变了dom元素数据，然后你又想输出dom，那你只能等到dom更新完成之后才会实现.
 2.通过事件改变data数据，然后输出dom，在方法里直接打印的话， 由于dom元素还没有更新， 因此打印出来的还是未改变之前的值，而通过this.$nextTick()获取到的值为dom更新之后的值.

```js
this.$nextTick(function(){
    console.log("methods22",this.$refs["hello"].innerText)
})
```

#### 更改数据不刷新几种解决方式

```vue
更改数据不刷新
this.$forceUpdate(); 

对于某个属性的赋值
this.$set(item, 'checked', true)
```



#### axios的使用  和 vue-resource

```js
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

#首选使用axios

<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>

https://www.runoob.com/vue2/vuejs-ajax.html
```

```js
// 基于全局Vue对象使用http
Vue.http.get('/someUrl', [options]).then(successCallback, errorCallback);
Vue.http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);

// 在一个Vue实例内使用$http
this.$http.get('/someUrl', [options]).then(successCallback, errorCallback);
this.$http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);


get和post的携带参数方式不一样
http.get(URL,{  
        params: {  
            "id":id  
        }  
    })  
```

#### mapGetters的用法

```js
export default {
    computed: {
      ...mapGetters([
        'singer'
      ]),
    }
    ....
  }  
最终会转换成

  export default {
    computed: {
      singer() {
        return this.$store.state.singer  
          //这里要注意store的注册用法
      }
    }
    ...
  }  
```

#### 查看依赖版本号

- version 必须确切匹配这个version
- \>version 必须大于这个version
- \>=version 必须大于等于这个version
- < version 必须小于这个version
- <=version 必须小于等于这个version
- ~version 大约相当于version
- ^version 与version兼容
- 1.2.x 可以是1.2.0、1.2.1等，但不能是1.3.0
- http://… URL作为依赖项
- \* 匹配任何版本
- “”(空字符串) 匹配任何版本，和*一样
- version1 - version2 相当于 >=version1 <=version2
- range1 || range2 range1或range2其中一个满足时采用该version
- git… Git URL作为依赖项
- user/repo GitHub URLs
- tag 一个以tag发布的指定版本，参考[npm-tag](https://docs.npmjs.com/cli/tag)
- path/path/path 本地Paths

#### npm install的几种命令形式

我们在使用 npm install 安装模块的模块的时候 ，一般会使用下面这几种命令形式：

```shell
npm install moduleName # 安装模块到项目目录下` 
npm install -g moduleName # -g 的意思是将模块安装到全局，具体安装到磁盘哪个位置，要看 npm config prefix 的位置。
npm install -save moduleName # -save 的意思是将模块安装到项目目录下，并在package文件的dependencies节点写入依赖
npm install -save-dev moduleName # -save-dev 的意思是将模块安装到项目目录下，并在package文件的devDependencies节点写入依赖。`

#安装指定版本
npm install -g moduleName@Version
#卸载
npm uninstall moduleName

```

那么问题来了，在项目中我们应该使用四个命令中的哪个呢？这个就要视情况而定了。下面对这四个命令进行对比，看完后你就不再这么问了。

##### npm install moduleName 命令

```
安装模块到项目node_modules目录下。
不会将模块依赖写入devDependencies或dependencies 节点。
运行 npm install 初始化项目时不会下载模块。
```

##### npm install -g moduleName 命令

```
 安装模块到全局，不会在项目node_modules目录中保存模块包。
 不会将模块依赖写入devDependencies或dependencies 节点。
 运行 npm install 初始化项目时不会下载模块。
```

##### npm install -save moduleName 命令

```
 安装模块到项目node_modules目录下。
 会将模块依赖写入dependencies 节点。
 运行 npm install 初始化项目时，会将模块下载到项目目录下。
 运行npm install --production或者注明NODE_ENV变量值为production时，**会**自动下载模块到node_modules目录中。
```

##### npm install -save-dev moduleName 命令

```
 安装模块到项目node_modules目录下。
 会将模块依赖写入devDependencies 节点。
 运行 npm install 初始化项目时，会将模块下载到项目目录下。
 运行npm install --production或者注明NODE_ENV变量值为production时，**不会**自动下载模块到node_modules目录中。
```

**备注：**

devDependencies 节点下的模块是我们在开发时需要用的，比如项目中使用的 gulp ，压缩css、js的模块。这些模块在我们的项目部署后是不需要的，所以我们可以使用 -save-dev 的形式安装。像 express 这些模块是项目运行必备的，应该安装在 dependencies 节点下，所以我们应该使用 -save 的形式安装。

------

##### vue使用ESLint代码规范和格式规范prettier

在vue-cli在init初始化时会询问是否需要添加ESLint，确认之后在创建的项目中就会出现.eslintignore和.eslintrc.js两个文件。

>  .eslintignore类似Git的.gitignore用来忽略一些文件不使用ESLint检查。
>  .eslintrc.js是ESLint配置文件，用来设置插件、自定义规则、解析器等配置。
>
> 



> 如何在老项目中增加规则https://blog.csdn.net/IT_HLM/article/details/78776630



> #### 需要安装`prettier`
>
> 首先肯定是需要安装`prettier`，并且你的项目中已经使用了ESLint，有`eslintrc.js`配置文件
>
> ```
> npm i -D prettier
> ```
>
> #### 配合ESLint检测代码风格
>
> 安装插件：
>
> ```
> npm i -D eslint-plugin-prettier
> ```
>
> 接下来，我们需要在rules中添加，`"prettier/prettier": "error"`，表示被prettier标记的地方抛出错误信息。
>
> ```
> //.eslintrc.js
> {
>   "plugins": ["prettier"],
>   "rules": {
>     "prettier/prettier": "error"
>   }
> }
> ```
>
> 如果你的eslint是直接通过cli方式启动的，那么只需要在后面加上fix即可，如：`eslint --fix`。
>
> #### 如果与已存在的插件冲突怎么办
>
> ```
> npm i -D eslint-config-prettier
> ```
>
> 通过使用eslint-config-prettier配置，能够关闭一些不必要的或者是与prettier冲突的lint选项。这样我们就不会看到一些error同时出现两次。**使用的时候需要确保，这个配置在extends的最后一项。**
>
> ```js
> //.eslintrc.js
> {
>   extends: [
>     'standard', //使用standard做代码规范
>     "prettier",
>   ],
> }
> 
> //实际例子.eslintrc.js
> module.exports = {
>   root: true,
>   env: {
>     node: true
>   },
>   extends: ['plugin:vue/essential', 'plugin:prettier/recommended', 'eslint:recommended'],
>   rules: {
>     'no-console': ['error', { allow: ['warn', 'error'] }],
>     'no-debugger': 'error',
>     'space-before-function-paren': 0, // 函数（）前面是否必须要空格
>     'no-multiple-empty-lines': [1, { max: 2 }], // 空行最多不能超过2行
>     'no-tabs': 0,
>     'no-multi-spaces': 2,
>     'no-mixed-spaces-and-tabs': 0,
>     'no-irregular-whitespace': 2,
>     // indent: [2, 2],
>     'vue/require-default-prop': 0,
>     'vue/no-use-v-if-with-v-for': [
>       'error',
>       {
>         allowUsingIterationVar: true
>       }
>     ],
>     'vue/no-parsing-error': [
>       'error',
>       {
>         'invalid-first-character-of-tag-name': false
>       }
>     ],
>     'vue/html-self-closing': [
>       'error',
>       {
>         html: {
>           void: 'always',
>           normal: 'always',
>           component: 'always'
>         },
>         svg: 'always',
>         math: 'always'
>       }
>     ],
>     'prettier/prettier': 'error'
>   },
>   parserOptions: {
>     parser: 'babel-eslint'
>   }
> }
> 
> ```
>
> #### 什么？你们项目没有启用ESLint
>
> 不要慌，没有ESLint也不要怕，可以通过[onchange](https://www.npmjs.com/package/onchange)进行代码的监听，然后自动格式化代码。只要在package.json的scripts下添加如下代码，然后使用`npm run format`，我们就能监听src目录下所有的js文件并进行格式化：
>
> ```
> "scripts": {
>   "format": "onchange 'src/**/*.js' -- prettier --write {{changed}}"
> }
> ```
>
> 当你想格式化的文件不止js文件时，也可以添加多个文件列表。
>
> ```
> "scripts": {
>   "format": "onchange 'test/**/*.js' 'src/**/*.js' 'src/**/*.vue' -- prettier --write {{changed}}"
> }
> ```

#### npm编写组件步骤

示例：https://github.com/ZacheryWu/el-table-transfer.git

##### 起步

```js
vue create my-project
#调整目录
原src修改成examples 用作展示使用
新增packages 用于存放编写组件

目录调整后运行项目会报错， webpack无法获取编译, 新建vue.config.js
// vue.config.js
module.exports = {
  // 修改 src 目录 为 examples 目录
  pages: {
    index: {
      // page 的入口
      entry: 'examples/main.js',   // 把src 修改为examples
      // 模板来源
      template: 'public/index.html',
      // 在 dist/index.html 的输出
      filename: 'index.html'
    }
  },
  // 扩展 webpack 配置，使 packages 加入编译
  /* chainWebpack 是一个函数，会接收一个基于 webpack-chain 的 ChainableConfig 实例。允许对内部的 webpack 配置进行更细粒度的修改。 */
  chainWebpack: config => {
    config.module
      .rule('js')
      .include
        .add(__dirname + 'packages')  // 注意这里需要绝对路径，所有要拼接__dirname
        .end()
      .use('babel')
        .loader('babel-loader')
        .tap(options => {
          // 修改它的选项...
          return options
        })
  }
}

```

##### 编写组件

```js
packages目录 新建 组件文件夹 和 index.js
（index.js内容）

import columnSelect from './columnSelect'
// 存储组件列表
const components = [
    columnSelect
] 
/* 
  定义install 方法，接收Vue作为参数，如果使用use注册插件，则所有的组件都将被注册
 */
const install = function (Vue) {
    // 判断是否安装
    if(install.installed){return}
    // 遍历所有组件
    components.map(item => {
        Vue.component(item.name,item)
    })
}
// 判断是否引入文件
if(typeof window !== 'undefined' && window.Vue){
    install(window.Vue)
}
export default{
    install,
    columnSelect
}
组件文件夹 新建 src文件夹（src下面新建组件名xxx.vue）和index.js
（index.js内容） 
import xxx from './src/组件名xxx.vue'  
xxx.install = function(Vue){Vue.component(xxx.name, xxx)}
export default xxx

```

##### 编译

以下我们在 scripts 中新增一条命令 npm run lib
•	--target: 构建目标，默认为应用模式。这里修改为 lib 启用库模式。
•	--dest : 输出目录，默认 dist。这里我们改成 lib
•	[entry]: 最后一个参数为入口文件，默认为 src/App.vue。这里我们指定编译packages/ 组件库目录。

```
"scripts": {
    // ...
    "lib": "vue-cli-service build --target lib --name vcolorpicker --dest lib packages/index.js"
}
```

执行编译库命令

```
npm run lib
```

配置 package.json 文件中发布到 npm 的字段

```
{	name: 包名，该名字是唯一的。可在 npm 官网搜索名字，如果存在则需换个名字。
	version: 版本号，每次发布至 npm 需要修改版本号，不能和历史版本号相同。
	description: 描述。
	main: 入口文件，该字段需指向我们最终编译后的包文件。
	keyword：关键字，以空格分离希望用户最终搜索的词。
	author：作者
	private：是否私有，需要修改为 false 才能发布到 npm
	....
}
```

添加.npmignore文件，设置忽略发布文件

```
#忽略目录
examples/
packages/
public/

#忽略指定文件
vue.config.js
babel.config.js
*.map
```

##### 私服配置

```
npm config set registry 私服地址

登录指定私服
npm login --registry='http://localhost:8085/repository/falcon-npm-group/'
```

##### 发布

```
终端执行 npm publish 
或者 npm publish --registry='私服仓库地址'
```





#### 如何对Prettier进行配置

一共有三种方式支持对Prettier进行配置：

1. 根目录创建`.prettierrc `文件，能够写入YML、JSON的配置格式，并且支持`.yaml/.yml/.json/.js`后缀；
2. 根目录创建`.prettier.config.js `文件，并对外export一个对象；
3. 在`package.json`中新建`prettier`属性。

下面我们使用`prettierrc.js`的方式对prettier进行配置，同时讲解下各个配置的作用。

```js
module.exports = {
  "printWidth": 80, //一行的字符数，如果超过会进行换行，默认为80
  "tabWidth": 2, //一个tab代表几个空格数，默认为80
  "useTabs": false, //是否使用tab进行缩进，默认为false，表示用空格进行缩减
  "singleQuote": false, //字符串是否使用单引号，默认为false，使用双引号
  "semi": true, //行位是否使用分号，默认为true
  "trailingComma": "none", //是否使用尾逗号，有三个可选值"<none|es5|all>"
  "bracketSpacing": true, //对象大括号直接是否有空格，默认为true，效果：{ foo: bar }
  "parser": "babylon" //代码的解析引擎，默认为babylon，与babel相同。
}
```

配置大概列出了这些，还有一些其他配置可以在[官方文档](https://prettier.io/docs/en/options.html)进行查阅。

最后贴一下我们项目中的完整配置，是在vue-cli生成的代码基础上修改的，并且使用standard做代码规范：

```js
module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint'
  },
  env: {
    browser: true,
    es6: true
  },
  extends: [
    // https://github.com/standard/standard/blob/master/docs/RULES-en.md
    'standard',
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    'plugin:vue/essential',
    "plugin:prettier/recommended",
  ],
  // required to lint *.vue files
  plugins: [
    'vue'
  ],
  // add your custom rules here
  rules: {
    "prettier/prettier": "error",
    // allow async-await
    'generator-star-spacing': 'off',
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off'
  }
}
```



### Tomcat

#### 一个tomcat部署多个服务的结构

```shell
#windows例子
bin (运行脚本）
conf (配置文件）
lib (核心库文件）
logs (日志目录)
temp (临时目录)
webapps (自动装载的应用程序的目录）
work (JVM临时文件目录[java.io.tmpdir])
#变量（很重要）
catalina.home 和
catalina.base 这两个属性仅在你需要安装多个Tomcat实例而不想安装多个软件备份的时候使用，这样能节省磁盘空间。

#linux
CATALINA_TMPDIR指向临时目录temp的位置
catalina.home指向公用信息的位置，就是bin和lib的父目录。
catalina.base指向每个Tomcat目录私有信息的位置，就是conf、logs、temp、webapps和work的父目录
#ps: 所以我们要运行多个应用时，就更改catalina.base , 然后启动tomcat就可以 startup.sh了？

sdtomcat的shell例子：
 pushd /usr/local/tomcat${tomcat_version}/$i &> /dev/null
 export CATALINA_BASE=/usr/local/tomcat${tomcat_version}/$i
 > /usr/local/tomcat${tomcat_version}/$i/logs/catalina.out
 chmod +x /usr/local/tomcat${tomcat_version}/bin/startup.sh
 /usr/local/tomcat${tomcat_version}/bin/startup.sh
 logexpect /usr/local/tomcat${tomcat_version}/$i/logs/catalina.out "Server startup"
 popd &> /dev/null
 sleep 2
```

* windows原理：

```
1、复制webapp目录
2、编辑/conf/server.xml, 拷贝<Service>标签下的所有配置
注意端口号和指向复制的webapp目录
```



#### 部署vue项目

* tomcat部署

1. 将vue项目打包，会生成一个dist文件夹

```
npm run build
```

1. 将dist文件夹中的内容复制到Tomcat的webapps/ROOT目录下（Tomcat默认的根目录就是webapps/ROOT目录）
2. 启动Tomcat，浏览器访问 `http://localhost:8080/` 即可

* linux部署

利用nginx转发地址？

**备注：**解决vue去掉#号后刷新页面，会报404

```vue
首先vue的路由Route.js的url去掉 #
在new Router()的下一行添加上：
const router = new Router({
  mode: 'history',  //去掉url中的#
  routes: [...]
});
```



```nginx
server {
    listen 80;
    server_name my.vue.com;
    charset utf-8;
    location / {
        root /Users/libo/Documents/workspace/Vue-me/my-project/dist;
        index index.html index.htm index.php;
        #关键行，这行功能
        try_files $uri $uri/ /index.html;
        #    proxy_pass http://127.0.0.1:8081/;
		#	 proxy_set_header Host $http_host;
        #    proxy_set_header X-Real-IP $remote_addr;
        #    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        #    proxy_set_header X-Forwarded-Proto $scheme;
    }    
}
```

#### 部署jar服务

```shell
#带有context的问题
如果访问不需要有context， 将jar或者war包 命名为ROOT.war, 结合前面的tomcat结构, linux安装一个tomcat 可以有多个webapps, 利用 catalina.base 这个系统变量来控制，重启tomcat即可
export CATALINA_BASE=/usr/local/tomcat${tomcat_version}/$i #服务地址

#项目中文带乱码的问题，注意conf的server.xml配置
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443"  URIEncoding="UTF-8"/>
加上URIEncoding="UTF-8。

```

#### 添加context的方法

```shell
#方法一
1、在/conf/server.xml中增加context配置
...
<Host name="localhost" appBase="webapps" unpackWARs="true" autoDeploy="true">
<Context path= "/test" docBase= "D:\private\tomcat\test.war" />
...
#方法二
2、设置CATALINA_BASE的目录，windows直接在\conf\Catalina\localhost\xxx.xml新建服务对应的配置
<Context path= "/test" docBase= "D:\private\tomcat\test.war" />
```

产生的日志有乱码的情况出现，乱码解决
修改D:\az\Tomcat\Tomcat 8.5\conf目录下的文件logging.properties文件：

```
默认是：java.util.logging.ConsoleHandler.encoding = UTF-8
修改为：java.util.logging.ConsoleHandler.encoding = GBK
```



------



### FreeMarker

例子：http://freemarker.foofun.cn/dgui_quickstart_basics.html

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-freemarker</artifactId>
</dependency>
```



```java
@GetMapping(value = {"/index.do"})
public String index(HttpServletRequest request,String orderId, String orderStatus) throws Exception {
    if (OrderStatusEnum.REVIEWING.getValue().equals(orderStatus)) {
        OrgDTO orgDTO = SessionKeyConstant.getSKeyOrg(request.getSession());
        OrgDurationDTO orgDuration = orgDurationService.getByOrgId(orgDTO.getId());
        request.setAttribute("orgDuration", orgDuration);
    }
    request.setAttribute("orderId", orderId);
    request.setAttribute("orderStatus", orderStatus);
    return "/online/bid/fifth";   //存在一个online/bid/fifth.ftl的模板
}
```

配置的方法

```yml
spring:
  freemarker:
    suffix: .ftl
    enabled: true
    #关闭缓存，及时刷新，上线生产环境需要修改为true
    cache: false
    tempalte-loader-path: classpath:/templates
    settings:
     template_update_delay: 0
  resources:
    chain:
      strategy:
        content:
          enabled: true
```

```yaml

spring:
  freemarker:
    request-context-attribute: req  #req访问request
    suffix: .html  #后缀名
    content-type: text/html
    enabled: true
    cache: false #缓存配置
    template-loader-path: classpath:/templates/ #模板加载路径 按需配置
    charset: UTF-8 #编码格式
    settings:
    number_format: '0.##'   #数字格式化，无小数点
```

```xml
<!-- 整合Freemarker -->
    <!-- 放在InternalResourceViewResolver的前面，优先找freemarker -->  
    <bean id="freemarkerConfig" class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">  
        <property name="templateLoaderPath" value="/WEB-INF/views/templates"/>  
    </bean>  
    <bean id="viewResolver" class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">  
        <property name="prefix" value=""/>  
        <property name="suffix" value=".ftl"/>  
        <property name="contentType" value="text/html; charset=UTF-8"/>
    </bean>
```

#### springboot配置资源映射

Spring Boot 默认配置的`/**`映射到`/static`（或`/public`，`/resources`，`/META-INF/resources`），`/webjars/**`会映射到`classpath:/META-INF/resources/webjars/`。

**注意：**上面的`/static`等目录都是在`classpath:`下面。

如果你想增加如`/mystatic/**`映射到`classpath:/mystatic/`，你可以让你的配置类继承`WebMvcConfigurerAdapter`，然后重写如下方法：

```java
/**
* 静态资源使用md5作为版本号
*/
@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/mystatic/**")
            .addResourceLocations("classpath:/mystatic/")
        //此处若在resource有配置可忽略
            .resourceChain(false)
            .addResolver(new VersionResourceResolver()
            .addContentVersionStrategy("/**"));
}
```

这种方式会在默认的基础上增加`/mystatic/**`映射到`classpath:/mystatic/`，不会影响默认的方式，可以同时使用。

这样配置后，所有`/**`请求的静态资源都会被处理为上面例子的样子。

到这儿还没完，我们在写资源url的时候还要特殊处理。

首先增加如下配置：

```java
@ControllerAdvice
public class ControllerConfig {
    @Autowired
    ResourceUrlProvider resourceUrlProvider;
    @ModelAttribute("urls")
    public ResourceUrlProvider urls() {
        return this.resourceUrlProvider;
    }

}
```

然后在页面写的时候用下面的写法：

```html
<link rel="stylesheet" type="text/css" href="${urls.getForLookupPath('/css/index.css')}">
```



#### FreeMarker常用指令

- 访问map中的key

```bash
${key}
```

- 访问pojo中的属性

```bash
${key.property}
```

- 取集合中的数据

```xml
<#list studentList as student>
 <tr> 
<td>${student.id}</td>
<td>${studnet.name}</td>
</tr>
</#list>
```

- 取循环中的下标

```bash
<#list studentList as student>
    ${student_index}
</#list>
```

- 判断

```csharp
<#if student_index % 2 == 0>
<#else>
</#if>
```

- 日期类型格式化

```xml
<!-- 可以使用?date,?time,?datetime,?string(parten)-->
当前日期：${date?string("yyyy/MM/dd HH:mm:ss")}
```

- null值的处理

```kotlin
${val!"val的值为null"}<br>
    判断val的值是否为null：<br>
    <#if val??>
    val中有内容
    <#else>
    val的值为null
    </#if>
```

- Include标签

```cpp
<#include "hello.ftl">
```



```
分支控制语句
语法格式如下
<#if condition>
	....
<#elseif condition2>
	...
<#elseif condition3>      
	...
<#else>
	...
</#if> 
<#if orgList?? && (orgList?size > 0) >
list不为空

1. 用if判断对象是否为空
<#if obj??>不为空处理</#if>
<#if obj?default("xxx")>
	obj如果为空则给obj复制xxx。
<#if aaa?if_exists>  
<#if (aaa)!>不为空则执行
<#list lists!! as list> list的判断不为空
2、给对象赋默认值，避免空值
使用 ${(obj)!'xxx'} 来避免对象为空的错误。如果obj为空，则obj=xxx

3、list、break指令
    list指令时一个典型的迭代输出指令，用于迭代输出数据模型中的集合。list指令的语法格式如下：
     <#list sequence as item>
       ...
     </#list>
      除此之外，迭代集合对象时，还包括两个特殊的循环变量：
      a、item_index：当前变量的索引值。
      b、item_has_next:是否存在下一个对象
      也可以使用<#break>指令跳出迭代
      <#list ["星期一","星期二","星期三","星期四","星期五"] as x>
          ${x_index +1}.${x} <#if x_has_next>,</#if>
          <#if x = "星期四"><#break></#if>
      </#list>
      
4、include 指令
    include指令的作用类似于JSP的包含指令，用于包含指定页，include指令的语法格式如下
    <#include filename [options]
    在上面的语法格式中，两个参数的解释如下
    a、filename：该参数指定被包含的模板文件
    b、options：该参数可以省略，指定包含时的选项，包含encoding和parse两个选项，encoding指定包含页面时所使用的解码集，而parse指定被
    包含是否作为FTL文件来解析。如果省略了parse选项值，则该选项值默认是true
    
5、assign指令
	它用于为该模板页面创建或替换一个顶层变量
	
6、setting指令
    该指令用于设置FreeMarker的运行环境，该指令的语法格式如下：
    <#setting name = value>
    name 的取值范围包括如下几个
    locale ：该选项指定该模板所用的国家/语言选项
    number_format:该选项指定格式化输出数字的格式
    boolean_format:该选项指定两个布尔值的语法格式，默认值是"true、false"
    date_format,time_format,datetime_format：该选项指定格式化输出日期的格式
    time_zone:  设置格式化输出日期时所使用的时区


```

* 字符串的操作

```
1、substring（start,end）从一个字符串中截取子串 start:截取子串开始的索引，start必须大于等于0，小于等于end end: 截取子串的长度，end必须大于等于0，小于等于字符串长度，如果省略该参数，默认为字符串长度。
2、cap_first 将字符串中的第一个单词的首字母变为大写。
3、uncap_first将字符串中的第一个单词的首字母变为小写。
4、capitalize将字符串中的所有单词的首字母变为大写
5、 date,time，datetime将字符串转换为日期 例如： <#assign date1=”2009-10-12”?date(“yyyy-MM-dd”)>

6、ends_with 判断某个字符串是否由某个子串结尾，返回布尔值。
	${“string”?ends_with(“ing”)?string} 返回结果为true 注意：布尔值必须转换为字符串才能输出
	
7、index_of（substring,start）
8、length返回字符串的长度 ${“string”?length}à结果为6
9、lower_case将字符串转为小写 
10、upper_case将字符串转为大写 ${“string”?upper_case}à结果为STRING
11、contains 判断字符中是否包含某个子串。返回布尔值 ${“string”?contains(“ing”)?string} à结果为true 注意：布尔值必须转换为字符串才能输出
12、number将字符串转换为数字 ${“111.11”?number}à结果为111.11
13、replace用于将字符串中的一部分从左到右替换为另外的字符串。 ${“strabg”?replace(“ab”,”in”)} à结果为string
14、split使用指定的分隔符将一个字符串拆分为一组字符串
<#list “This|is|split”?split(“|”) as s> ${s} </#list> 结果为: This is split

15、trim 删除字符串首尾空格 ${“ String ”?trim} à结果为String
```

```
使用 >= 和 > 的时候有一点小问题。FreeMarker解释 > 的时候可以把它当作FTL标签的结束符。为了避免这种问题，可以使用 lt 代替 <， lte 代替 <=， gt 代替 > 还有 gte 代替 >=， 例如 <#if x gt y>。另外一个技巧是将表达式放到 圆括号 中， 尽管这么写并不优雅，例如 <#if (x > y)>。
```

#### java中利用ftl生成文件

```java
@Test
public void genFile() throws Exception {
    // 第一步：创建一个Configuration对象，直接new一个对象。构造方法的参数就是freemarker对于的版本号。
    Configuration configuration = new Configuration(Configuration.getVersion());
    // 第二步：设置模板文件所在的路径。
    configuration.setDirectoryForTemplateLoading(new File("D:/workspace/e3/e3-item-web/src/main/webapp/WEB-INF/ftl"));
    // 第三步：设置模板文件使用的字符集。一般就是utf-8.
    configuration.setDefaultEncoding("utf-8");
    // 第四步：加载一个模板，创建一个模板对象。
    Template template = configuration.getTemplate("hello.ftl");
    // 第五步：创建一个模板使用的数据集，可以是pojo也可以是map。一般是Map。
    Map dataModel = new HashMap<>();
    //向数据集中添加数据
    dataModel.put("hello", "this is my first freemarker test.");
    // 第六步：创建一个Writer对象，一般创建一FileWriter对象，指定生成的文件名。
    Writer out = new FileWriter(new File("D:/aaa/out/hello.html"));
    // 第七步：调用模板对象的process方法输出文件。
    template.process(dataModel, out);
    // 第八步：关闭流。
    out.close();
}
```



------

### 浏览器客户端使用activeMQ

1、引入js文件，jquery.js类库支持

```html
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/amq_jquery_adapter.js"></script>
<script type="text/javascript" src="js/amq.js"></script>  
```

2、 初始化请求参数

```html
var amq = org.activemq.Amq;
  amq.init({ 
    uri: '/amq', 
    logging: true,
    timeout: 20,
    clientId:"123"
    //clientId:(new Date()).getTime().toString()
  });  
```

* Uri表示浏览器请求服务器端时的地址
* Logging表示浏览器在与服务器端交互时是否打印js日志
* Timeout表示轮询保持的时间
* Clientid表示浏览器的身份，如果用同一个字符串，则只有一个窗口会生效；如果用时间做参数，那么每一个浏览器窗口就相当于不同的消费者。

3、获取消息之后回调函数处理

```html
var myHandler ={
    rcvMessage: function(message){
    	console.log(message.data);
    	console.log(message.nodeValue);
    	console.log(message.wholeText);
    	//var bidData = eval('('+ message.textContent+ ')');
    }
  };  
```

* 这个函数是接收到消息之后的回调函数，至于回调函数的参数是一个js对象，取值的方法根据字符串和xml格式还不一样。最好的方式就是先研究一下amq.js的源代码，下面我直接给出不同的格式不同的取值方法。

4、客户端监听和发送消息

```js
amq.addListener(clientId,'topic://topic_js2',myHandler.rcvMessage); //消费者监听js
//amq.sendMessage(myDestination,myMessage); 这是java后端发送生产者消息
```

* 浏览器向服务器端发送注册监听器和发送消息的请求。
* clientId  表示消费者的一个ID,接受到消息回调时会用到作为标识 (new Date()).getTime().toString()
* topic://topic_js2  表示目的地，也可以为queue
* myHandler.rcvMessage   表示回调函数

```java
/**
     * 发送消息至mq
     *
     * @param topic   主题
     * @param message 消息内容
     */
    public static void sendMessage(String topic, String message) {
        ConnectionFactory connectionFactory;   
        Connection connection = null;	 
        Session session;
        Destination destination;
        MessageProducer producer;
        // 1、创建连接工厂 构造ConnectionFactory实例对象，此处采用ActiveMq的实现jar
        connectionFactory = new ActiveMQConnectionFactory(
                ActiveMQConnection.DEFAULT_USER,
                ActiveMQConnection.DEFAULT_PASSWORD, activemqBrokerUrl);
        //activemqBrokerUrl  连接的地址

        try { // 2、构造从工厂得到连接对象
            connection = connectionFactory.createConnection();
            // 3、启动
            connection.start();
            // 4、获取操作连接(参数1：是否启动事务,参数2：消息确认模式)
            session = connection.createSession(Boolean.TRUE,
                    Session.AUTO_ACKNOWLEDGE);
            destination = session.createTopic(topic);
            // 5、得到消息生成者【发送者】
            producer = session.createProducer(destination);
            // 6、设置不持久化，实际根据项目决定
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            //7、创建消息 
            //TextMessage textMessage = session.createTextMessage(message);
            ObjectMessage objectMessage = session.createObjectMessage();
            objectMessage.setObject(message);
            producer.send(destination, objectMessage);
            session.commit();
        } catch (Exception e) {
            SYS_LOGGER.error("发送消息通知报错"+ ExceptionUtils.getFullStackTrace(e));
        } finally {
            try {
                if (null != connection) {
                    connection.close();
                }
            } catch (Throwable ignore) {
                SYS_LOGGER.error("关闭消息通知连接报错" + ExceptionUtils.getFullStackTrace(ignore));
            }
        }
    }
```

后端服务器配置activemq的消息（注意拦截器是否把 /amq 拦截的问题）

```xml
需要的activemq的jar包
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-client</artifactId>
			<version>5.15.2</version>
		</dependency>

		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-kahadb-store</artifactId>
			<version>5.15.2</version>
		</dependency>
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-spring</artifactId>
			<version>5.15.2</version>
		</dependency>
		<dependency>
			<groupId>org.apache.activemq</groupId>
			<artifactId>activemq-web</artifactId>
			<version>5.15.2</version>
			<exclusions>
				<exclusion>
					<artifactId>activemq-all</artifactId>
					<groupId>org.apache.activemq</groupId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>javax.jms</groupId>
			<artifactId>jms</artifactId>
			<version>1.1</version>
		</dependency>
```

```java
/**
     * 注入activemq的ajax控制器
     */
    @Bean
    public ServletRegistrationBean ajaxServletRegistration() {
        ServletRegistrationBean registration = new ServletRegistrationBean(new AjaxServlet());
        registration.setEnabled(true);
        registration.addUrlMappings("/amq/*");
        return registration;
    }

    //向servletContext中初始化activemq的消息访问url
    @Bean
    public ServletContextInitializer initializer() {
        return new ServletContextInitializer() {
            @Override
            public void onStartup(ServletContext servletContext) throws ServletException {
                servletContext.setInitParameter("org.apache.activemq.brokerURL", activemqBrokerUrl);
            }
        };
    }

```

```yaml
#解决乱码的问题
spring
 http:
    encoding:
      charset: UTF-8
      enabled: true
      force: true
activemq:
  broker-url: tcp://127.0.0.1:61616
```

```java
@Component
public class ActiveMQUtil {
    private static final SysLogger SYS_LOGGER = SysLoggerFactory.getLogger(ActiveMQUtil.class);
    public static String activemqBrokerUrl;
    @Value("${activemq.broker-url}")
    public void setActivemqBrokerUrl(String brokerUrl) {
        ActiveMQUtil.activemqBrokerUrl = brokerUrl;
    }

    /**
     * 发送消息至mq
     *
     * @param topic   主题
     * @param message 消息内容
     */
    public static void sendMessage(String topic, String message) {
        ConnectionFactory connectionFactory;
        Connection connection = null;
        Session session;
        Destination destination;
        MessageProducer producer;
        // 构造ConnectionFactory实例对象，此处采用ActiveMq的实现jar
        connectionFactory = new ActiveMQConnectionFactory(
                ActiveMQConnection.DEFAULT_USER,
                ActiveMQConnection.DEFAULT_PASSWORD, activemqBrokerUrl);

        try { // 构造从工厂得到连接对象
            connection = connectionFactory.createConnection();
            // 启动
            connection.start();
            // 获取操作连接
            session = connection.createSession(Boolean.TRUE,
                    Session.AUTO_ACKNOWLEDGE);
            destination = session.createTopic(topic);
            // 得到消息生成者【发送者】
            producer = session.createProducer(destination);
            // 设置不持久化，实际根据项目决定
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            ObjectMessage objectMessage = session.createObjectMessage();
            objectMessage.setObject(message);
            producer.send(destination, objectMessage);
            session.commit();
        } catch (Exception e) {
            SYS_LOGGER.error("发送消息通知报错"+ ExceptionUtils.getFullStackTrace(e));
        } finally {
            try {
                if (null != connection) {
                    connection.close();
                }
            } catch (Throwable ignore) {
                SYS_LOGGER.error("关闭消息通知连接报错" + ExceptionUtils.getFullStackTrace(ignore));
            }
        }
    }
}

```

### Hikari 号称“史上最快连接池”

```yaml
# 数据库配置
spring:
  datasource:
  type: com.zaxxer.hikari.HikariDataSource
  driverClassName: com.mysql.jdbc.Driver
  url: jdbc:mysql://localhost:3306/ssm?useUnicode=true&characterEncoding=utf-8&useSSL=false
  username: root
  password: root
  # Hikari 连接池配置
  # 最小空闲连接数量
  hikari:
    minimum-idle: 5
    # 空闲连接存活最大时间，默认600000（10分钟）
    idle-timeout: 180000
    # 连接池最大连接数，默认是10
    maximum-pool-size: 10
    # 此属性控制从池返回的连接的默认自动提交行为,默认值：true
    auto-commit: true
    # 连接池名称
    pool-name: MyHikariCP
    # 此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
    max-lifetime: 1800000
    # 数据库连接超时时间,默认30秒，即30000
    connection-timeout: 30000
    connection-test-query: SELECT 1
```



* 

## RabbitMQ 的使用

#### 集群模式

```
##单一模式
只启动一个mq
##普通模式
主备模式:主节点提供读写，从节点不提供读写服务，只是负责提供备份服务,备份节点的主要功能是在主节点宕机时，完成自动切换 从-->主
主从模式:主节点提供读写，从节点只读
##
镜像模式：集群模式非常经典的就是Mirror镜像模式，保证100%数据不丢失

```

##### 主从模式集群  

缺点：主节点挂了，从节点也就挂了

假设环境如下：

1、两台Centos7的机器，hostname分别为：F , G .

2、IP地址分别为：F—172.18.8.229 ， G—172.18.8.224。

3、修改hosts文件如下，下面是G这台机器的hosts文件内容，F也需要如下配置：

```bash
[root@G bin]# cat /etc/hosts
127.0.0.1 G  localhost localhost.localdomain localhost4 localhost4.localdomain4 
::1       G  localhost localhost.localdomain localhost6 localhost6.localdomain6 

172.18.8.224 G
172.18.8.229 F
```

* 安装

这里安装启动成功之后，来几个常用的操作。

```bash
[root@G bin]# ./rabbitmq-server -deched  --后台启动服务
[root@G bin]# ./rabbitmqctl start_app  --启动服务
[root@G bin]# ./rabbitmqctl stop_app  --关闭服务
[root@G bin]# ./rabbitmq-plugins enable rabbitmq_management --启动web管理插件
[root@G bin]# ./rabbitmqctl add_user zlh zlh  --添加用户，密码
[root@G bin]# ./rabbitmqctl set_user_tags zlh administrator --设置zlh为administrator权限
```

1、必须使集群中也就是F，G这两台机器的.erlang.cookie文件中cookie值一致，且权限为owner只读。

cat .erlang.cookie  查看

```bash
[root@F ~]# chmod 600 .erlang.cookie
```

2、查看集群状态，我的是已经做好的。

```bash
[root@F bin]# ./rabbitmqctl cluster_status
Cluster status of node rabbit@F ...
[{nodes,[{disc,[rabbit@G]},{ram,[rabbit@F]}]},
```

3.把G中的rabbitmq加入到集群中来

```bash
[root@F bin]# ./rabbitmqctl join_cluster --ram rabbit@G
```

##### 镜像模式

 https://www.jianshu.com/p/5b2879fba25b

node1：192.168.174.10
 node2：192.168.174.11
 node3：192.168.174.12
 node4：192.168.174.13
 node5：192.168.174.14
 其中，node1、node2、node3三台服务器安装RabbitMQ服务，node4和node5安装HA-proxy和Keepalived。

**Haproxy 的特点是：高可用，负载均衡。**

**KeepAlived 的特点：通过VRRP协议（虚拟ip）实现高可用功能（主备切换）**

```bash
./rabbitmqctl set_policy ha-all "^" '{"ha-mode":"all"}'
```

参数意思为：

ha-all：为策略名称。

^：为匹配符，只有一个^代表匹配所有，^zlh为匹配名称为zlh的exchanges或者queue。

ha-mode：为匹配类型，他分为3种模式：

* all-所有（所有的queue），

* exctly-部分（需配置ha-params参数，此参数为int类型比如3，众多集群中的随机3台机器），

* nodes-指定（需配置ha-params参数，此参数为数组类型比如["3rabbit@F","rabbit@G"]这样指定为F与G这2台机器。）

- RabbitMQ集群配置
   我们这里以node1为master节点，node2和node3为slave节点。
   1、停止MQ服务

> rabbimqctl stop

2、复制node1节点的/root/.erlang.cookie文件到其他节点，并覆盖

> scp /root/.erlang.cookie root@node2:~
>  scp /root/.erlang.cookie root@node3:~

3、启动集群

> rabbitmq-server -datached

4、slave 加入集群，对node2和node3分别执行下面操作

> rabbitmqctl stop_app
>  rabbitmqctl join_cluster rabbit@node1
>  rabbitmqctl start_app



#### 集成

```
#导入依赖
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-amqp</artifactId>
	<version>2.0.2.RELEASE</version>
</dependency> 

#对于rabbitMQ的支持
spring.rabbitmq.host=127.0.0.1
spring.rabbitmq.port=5672
spring.rabbitmq.username=guest
spring.rabbitmq.password=guest
```



#### SpringBoot配置说明

```yaml
 rabbitmq:
    addresses: 127.0.0.1:6605,127.0.0.1:6606,127.0.0.1:6705 #指定client连接到的server的地址，多个以逗号分隔(优先取addresses，然后再取host)
#    port:
    ##集群配置 addresses之间用逗号隔开
    # addresses: ip:port,ip:port
    password: admin
    username: 123456
    virtual-host: / # 连接到rabbitMQ的vhost
    requested-heartbeat: #指定心跳超时，单位秒，0为不指定；默认60s
    publisher-confirms: #是否启用 发布确认
    publisher-reurns: # 是否启用发布返回
    connection-timeout: #连接超时，单位毫秒，0表示无穷大，不超时
    cache:
      channel.size: # 缓存中保持的channel数量
      channel.checkout-timeout: # 当缓存数量被设置时，从缓存中获取一个channel的超时时间，单位毫秒；如果为0，则总是创建一个新channel
      connection.size: # 缓存的连接数，只有是CONNECTION模式时生效
      connection.mode: # 连接工厂缓存模式：CHANNEL 和 CONNECTION
    listener:
      simple.auto-startup: # 是否启动时自动启动容器
      simple.acknowledge-mode: # 表示消息确认方式，其有三种配置方式，分别是none、manual和auto；默认auto
      simple.concurrency: # 最小的消费者数量
      simple.max-concurrency: # 最大的消费者数量
      simple.prefetch: # 指定一个请求能处理多少个消息，如果有事务的话，必须大于等于transaction数量.
      simple.transaction-size: # 指定一个事务处理的消息数量，最好是小于等于prefetch的数量.
      simple.default-requeue-rejected: # 决定被拒绝的消息是否重新入队；默认是true（与参数acknowledge-mode有关系）
      simple.idle-event-interval: # 多少长时间发布空闲容器时间，单位毫秒
      simple.retry.enabled: # 监听重试是否可用
      simple.retry.max-attempts: # 最大重试次数
      simple.retry.initial-interval: # 第一次和第二次尝试发布或传递消息之间的间隔
      simple.retry.multiplier: # 应用于上一重试间隔的乘数
      simple.retry.max-interval: # 最大重试时间间隔
      simple.retry.stateless: # 重试是有状态or无状态
    template:
      mandatory: # 启用强制信息；默认false
      receive-timeout: # receive() 操作的超时时间
      reply-timeout: # sendAndReceive() 操作的超时时间
      retry.enabled: # 发送重试是否可用
      retry.max-attempts: # 最大重试次数
      retry.initial-interval: # 第一次和第二次尝试发布或传递消息之间的间隔
      retry.multiplier: # 应用于上一重试间隔的乘数
      retry.max-interval: #最大重试时间间隔
```



 https://www.jianshu.com/p/188453d4b79c 浏览器端的使用

对于 @RabbitListener 这个注解要注意

https://blog.csdn.net/qq_41969879/article/details/81015262   队列Queue模式

https://blog.csdn.net/zhaodj5660/article/details/79895562     主题Topic模式

* 1.在启动类上添加@EnableRabbit注解

* 2.在Spring容器中托管一个RabbitListenerContainerFactory，默认实现类SimpleRabbitListenerContainerFactory

* 3.编写一个消息处理器类托管到Spring容器中，并使用**@RabbitListener**注解标注该类为RabbitMQ的消息处理类

* 4.使用**@RabbitHandler**注解标注在方法上，表示当有收到消息的时候，就交给带有@RabbitHandler的方法处理，具体找哪个方法需要根据MessageConverter转换后的对象类型决定

* host文件所在目录 ：C:\Windows\System32\drivers\etc 

```
# 开启RabbitMQ节点
rabbitmqctl start_app
# 开启RabbitMQ管理模块的插件，并配置到RabbitMQ节点上
rabbitmq-plugins enable rabbitmq_management rabbitmq_web_stomp rabbitmq_stomp rabbitmq_web_stomp_examples
# 关闭RabbitMQ节点
rabbitmqctl stop
```

```
#启动服务  E:\RabbitMQ\rabbitmq_server-3.7.17\sbin>目录下
rabbitmq-server.bat
rabbitmq-server -detached 后台启动
#查看状态
rabbitmq-server status

```



#### 配置信息

~~~
#linux修改默认端口号  安装路径/etc/rabbitmq.config文件

[
	{rabbit, [
		{tcp_listeners, [{"192.168.88.94", 5673}]}，
		{rabbitmq_web_stomp,[{"192.168.88.94", 15675}]}
  		]
   	}
].

//----------------
[
	{rabbit, [
			{tcp_listeners, [{"192.168.88.94", 5673}]}			
  		]
   	},
   	{rabbitmq_web_stomp,[
   		{tcp_listen_options, [{"192.168.88.94", 15675}] }
   		]
   	}
].
//------------------
[
  {rabbitmq_web_stomp，
      [{tcp_config，[{port，12345 }]}]}}
]
~~~



```
#启动服务报错时
rabbitmq-service remove
rabbitmq-service install
net start rabbitmq

```



```yaml
#springboot的配置
spring:
  rabbitmq:
    host: 127.0.0.1
    username: guest
    password: guest
    port: 5672
```



```js
var ws = new WebSocket('ws://127.0.0.1:15674/ws');
// 获得Stomp client对象
var client = Stomp.over(ws);
// SockJS does not support heart-beat: disable heart-beats
//heart-beating也就是频率，incoming是接收频率，outgoing是发送频率
client.heartbeat.outgoing = 0; //发送频率
client.heartbeat.incoming = 0; //接收频率
//关闭控制台调试数据：client.debug = null
client.debug =function(str) {
    // append the debug log to a #debug div somewhere in the page using JQuery:
    $("#debug").append(str + "<br/>");
};;

// 定义连接成功回调函数
var on_connect = function(x) {
    //data.body是接收到的数据
    client.subscribe("/queue/user2", function(data) {
        var msg = data.body;
        console.log("收到数据：");
        console.log(data);
        $("#message").append(msg + "<br/>");
        data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
    },{ack:'client'});
};

// 定义错误时回调函数
var on_error =  function() {
    console.log('error');
};

// 连接RabbitMQ
client.connect('guest', 'guest', on_connect, on_error, '/');
```

```js
//订阅模式 这里的url为  交换机 / exchangeName / routekey 
client.subscribe("/exchange/topicExchange/topic.sendLeaveMsgQueue", function(data) {
     var msg = data.body;
     console.log("收到数据：");
     $("#message").append(msg + "<br/>");
     data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
 },{ack:'client'});
//队列的点对点模式  
 client.subscribe("/queue/sendLeaveMsgQueue", function(data) {
     data.ack(); //如果后面带了参数 ack  就是指定要手动确认消息，没带就是自动确认
 },{ack:'client'});
```

后台的部分代码示例（是否用了初始化）

```java
    /**
     * a.留言的Topic模式
     */
    @Bean(name="sendLeaveMsgQueue")
    public Queue sendLeaveMsgQueue() {
        return new Queue(sendLeaveMsgQueue,true);
    }
    /**
     * b.创建交换机TopicExchange
     */
    @Bean
    public TopicExchange exchange(){
        return new TopicExchange(topicExchange);
    }
    /**
     * c.根据绑定规则将队列绑定到相应的交换机上（bindingKey）--Exchange Queues
     */
    @Bean
    public Binding bindingExchangeMessage(@Qualifier("sendLeaveMsgQueue") Queue queueMessage, TopicExchange exchange) {
        return BindingBuilder.bind(queueMessage).to(exchange).with(MsgRoute);
    }
```

//监听和发送

```java
// 自动创建，queue 和 exchange 绑定监听
   @RabbitListener(bindings = @QueueBinding(
            exchange = @Exchange("myOrder"),
            key = "computer",
            value = @Queue("computerOrder")
    )) 

// 参数：交换机，路由key, 消息
amqpTemplate.convertAndSend("myOrder","computer", msg);
```

这里是动态的创建消息模式 交换机exchange和 queue的绑定之类

```java
ConnectionFactory factory = new ConnectionFactory();  
         factory.setHost("localhost");
         factory.setPort(5672);
         factory.setUsername("guest");
         factory.setPassword("guest"); 
         Connection connection = factory.newConnection();  
         Channel channel = connection.createChannel();    
        String message = "Hello World!";          
         // 声明队列
         channel.queueDeclare(QUEUE_NAME, true, false, false, null);        
        // 绑定队列到交换机
        channel.queueBind(QUEUE_NAME, "TOPICExchange", "RouteKey");
		// 指定exchange和routing key，并发送消息到exchange
         channel.basicPublish("TOPICExchange", "RouteKey", null, message.getBytes());  
//不用交换机的方式
//Queue.DeclareOk queueDeclare (String queue , boolean durable , boolean exclusive , boolean autoDelete , Map arguments) throws IOException
// 指定一个队列
channel.queueDeclare(queue, false, false, false, null);
// 往队列中发出一条消息，由于是一个byte[]，所以意味着你可以发送任何数据
channel.basicPublish("", queue, null, message.toString().getBytes());

```

交换机属性

```tsx
name: 交换机名称
type: 交换机类型 direct，topic，fanout，headers
durability: 是否需要持久化，true 为持久化
auto delete: 当最后一个绑定到 exchange 上的队列被删除后，exchange 没有绑定的队列了，自动删除该 exchange
internal: 当前 exchange 是否用于 rabbitMQ 内部使用，默认为 false
arguments: 扩展参数，用于扩展 AMQP 协议自制定化使用
```

#### 避免mq丢失

在`rabbitMq`中 我们可以通持久化数据解决`rabbitMQ`服务器异常 数据丢失的问题。
 问题: 生成者将消息发送出去，有没有到达`rabbitMq`默认是不知道的
 两种方式:   `事务机制`（性能消耗大）和`confirm模式`（消耗小） 

-  `AMQP` 实现了事务机制
-  `Confirm` 模式

### 事务机制

RabbitMQ提供了`txSelect()`、`txCommit()`和`txRollback()`三个方法对消息发送进行事务管理。

-  `txSelect`: 用于将通道`channel`开启事务模式
-  `txCommit`: 用于提交事务
-  `txRollback`: 用户进行事务回滚操作。

```java
public class TxProducer {
    /** 队列名称 */
    private static final String QUEUE_NAME = "test_queue_tx";

    public static void main(String[] args) throws IOException, TimeoutException {
        /** 1.获取连接 */
        Connection newConnection = ConnectionUtil.getConnection();
        /** 2.创建通道 */
        Channel channel = newConnection.createChannel();
        /** 3.创建队列声明 */
        channel.queueDeclare(QUEUE_NAME, true, false, false, null);
        try{
            /** 4.开启事务 */
            channel.txSelect();
            /**4.发送消息 */
            String msg = "Hello TX Message";
            channel.basicPublish("", QUEUE_NAME, null, msg.getBytes());
            int error = 1 / 0; // 生产者异常 未发送到rabbitMQ服务器
            System.out.println("Send Message :"+ msg);
            /** 5.提交事务 */
            channel.txCommit();
        }catch (Exception e){
            /** 6.若发生异常 回滚事务 */
            channel.txRollback();
            System.out.println("Send Message RollBack");
        }
        channel.close();
        newConnection.close();
    }
}
```



#### basicPublish方法

```java
 void basicPublish(String exchange, String routingKey, BasicProperties props, byte[] body) throws IOException;

void basicPublish(String exchange, String routingKey, boolean mandatory, BasicProperties props, byte[] body) throws IOException;

void basicPublish(String exchange, String routingKey, boolean mandatory, boolean immediate, BasicProperties props, byte[] body) throws IOException;

```

- exchange 交换器名称
- routingKey 路由键
- props 有14个成员

```tsx
 public static class BasicProperties extends com.rabbitmq.client.impl.AMQBasicProperties {
        private String contentType;   //消息类型如(text/plain)
        private String contentEncoding; //编码
        private Map<String,Object> headers; //header
        private Integer deliveryMode; //消息的投递模式
        private Integer priority; //优先级
        private String correlationId;
        private String replyTo;
        private String expiration; //过期时间
        private String messageId;
        private Date timestamp;
        private String type;
        private String userId;
        private String appId;
        private String clusterId;
```

#### RabbitMQ的和前端消息交互

```
gzy@5185188
ps -ef |grep rabbit  linux查看  /home/env

退出编辑模式 
　　按ESC键，然后 ：注意这里是要加冒号
　　　　退出vi
    :q!  不保存文件，强制退出vi命令
    :w   保存文件，不退出vi命令
    :wq  保存文件，退出vi命令

#添加stomp相关的插件
rabbitmq-plugins enable rabbitmq_web_stomp rabbitmq_stomp rabbitmq_web_stomp_examples
;
#重启服务
rabbitmqctl stop_app
rabbitmqctl start_app
#查看集群状态，有使用集群的话集群中的所有服务器都要添加插件
rabbitmqctl cluster_status
```

#### Linux开放防火墙端口号

```shell
firewall-cmd --zone=public --add-port=2181/tcp --permanent #网页端口
firewall-cmd --zone=public --add-port=5672/tcp --permanent  #AMQP端口,java使用
firewall-cmd --reload # 重新加载
//关闭某个端口
"sudo iptables -A INPUT -p tcp --dport $PORT -J DROP"
"sudo iptables -A OUTPUT -p tcp --dport $PORT -j DROP" 
//linux或者
/sbin/iptables -I INPUT -p tcp --dport 9092 -j ACCEPT  
/sbin/iptables -I INPUT -p tcp --dport 15672 -j ACCEPT
备注一下
/sbin/iptables -I INPUT -p tcp --dport 8011 -j ACCEPT #开启8011端口 
/etc/rc.d/init.d/iptables save #保存配置 
/etc/rc.d/init.d/iptables restart #重启服务 

查看端口号
1、lsof -i:端口号
2、netstat -tunlp|grep 端口号
可以通过"netstat -anp" 来查看哪些端口被打开


service iptables status
启动指令:service iptables start   
重启指令:service iptables restart   
关闭指令:service iptables stop 

iptables -A OUTPUT -s 192.168.88.94 -p tcp -m tcp --sport 15674 -j ACCEPT 


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

## nginx笔记

#### 安装

**nginx官网** http://nginx.org/en/download.html

```
进入用户组目录
# cd usr/local/src
下载组件
安装顺序 openssl安装  pcre安装 zlib安装 nginx安装

1.安装gcc、g++，用来编译源码；
$ yum install -y gcc gcc-c++
2.PCRE，Perl正则表达式；
$ yum install pcre pcre-devel
3.zlib，gzip压缩；
$ yum install zlib zlib-devel
4.OpenSSL，SSL协议。
$ yum install openssl openssl-devel
安装nginx
# 下载源码
$ wget http://nginx.org/download/nginx-1.13.0.tar.gz
# 解压源码
$ tar xvf nginx-1.13.0.tar.gz
# 进入源码目录
$ cd nginx-1.13.0
# 配置、编译、安装
$ ./configure
$ make
$ make install

找一下nginx安装到什么位置上了
# whereis nginx
# cd user/local/nginx

vim /usr/local/nginx/conf/nginx.conf 
启动
# user/local/nginx/sbin/nginx
```

报错了，error while loading shared libraries: libpcre.so.1: cannot open shared object file: No such file or directory，按照下面方式解决

```shell
1.用whereis libpcre.so.1命令找到libpcre.so.1在哪里
2.用ln -s /usr/local/lib/libpcre.so.1 /lib64命令做个 软连接就可以了
3.用sbin/nginx启动Nginx
4.用ps -aux | grep nginx查看状态
# whereis libpcre.so.1
# ln -s /usr/local/lib/libpcre.so.1 /lib64
# sbin/nginx[root@localhost nginx]# ps -aux | grep nginx 


```

#### 常用命令

```
启动
[root@localhost ~]# /usr/local/nginx/sbin/nginx
停止/重启
[root@localhost ~]# /usr/local/nginx/sbin/nginx -s stop(quit、reload)
命令帮助
[root@localhost ~]# /usr/local/nginx/sbin/nginx -h
验证配置文件
[root@localhost ~]# /usr/local/nginx/sbin/nginx -t
配置文件
[root@localhost ~]# vim /usr/local/nginx/conf/nginx.conf
```

#### NGINX主从备份

 NGINX实现主从备份目前主流方案是Keepalived+Nginx实现双机热备。

[　　Keepalived](http://www.keepalived.org/)是一个免费开源的，用C编写的类似于layer3, 4 & 7交换机制软件, 而高可用是通过VRRP协议实现多台机器之间的故障转移服务。



* Keepalived的配置

　　配置NGINX的主备自动重启

　　1、对配置文件进行修改：vim /etc/keepalived/keepalived.conf

　　　　1）修改master NGINX配置

```bash
! Configuration File for keepalived

global_defs {
router_id bhz005 ##标识节点的字符串，通常为hostname
}
## keepalived会定时执行脚本并且对脚本的执行结果进行分析，动态调整vrrp_instance的优先级。这里的权重weight 是与下面的优先级priority有关，如果执行了一次检查脚本成功，则权重会-20，也就是由100 - 20 变成了80，Master 的优先级为80 就低于了Backup的优先级90，那么会进行自动的主备切换。
如果脚本执行结果为0并且weight配置的值大于0，则优先级会相应增加。
如果脚本执行结果不为0 并且weight配置的值小于0，则优先级会相应减少。
vrrp_scriptchk_nginx {
    script "/etc/keepalived/nginx_check.sh" ##执行脚本位置
    interval 2 ##检测时间间隔
    weight -20 ## 如果条件成立则权重减20（-20）
}
## 定义虚拟路由 VI_1为自定义标识。
vrrp_instance VI_1 {
state MASTER   ## 主节点为MASTER，备份节点为BACKUP
## 绑定虚拟IP的网络接口（网卡），与本机IP地址所在的网络接口相同（我这里是eth6）
interface eth6  
virtual_router_id 172  ## 虚拟路由ID号
mcast_src_ip 192.168.1.172  ## 本机ip地址
priority 100  ##优先级配置（0-254的值）
Nopreempt  ## 
advert_int 1 ## 组播信息发送间隔，俩个节点必须配置一致，默认1s
authentication {  
auth_type PASS
auth_passbhz ## 真实生产环境下对密码进行匹配
    }

track_script {
chk_nginx
    }

virtual_ipaddress {
        192.168.1.170 ## 虚拟ip(vip)，可以指定多个
    }
}
```

2）修改Backup NGINX配置

```bash
! Configuration File for keepalived

global_defs {
router_id bhz006
}

vrrp_scriptchk_nginx {
script "/etc/keepalived/nginx_check.sh"
interval 2
weight -20
}

vrrp_instance VI_1 {
state BACKUP
interface eth7
virtual_router_id 173
mcast_src_ip 192.168.1.173
priority 90 ##优先级配置
advert_int 1
authentication {
auth_type PASS
auth_passbhz
    }

track_script {
chk_nginx
    }

virtual_ipaddress {
        192.168.1.170
    }
}
```

3）nginx_check.sh 脚本

```bash
#!/bin/bash
A=`ps -C nginx–no-header |wc -l`
if [ $A -eq 0 ];then
    /usr/local/nginx/sbin/nginx
sleep 2
if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then
killallkeepalived
fi
fi
```

再把master的keepalived配置文件 copy到master机器（172）的/etc/keepalived/ 文件夹下，在把backup的keepalived配置文件copy到backup机器（173）的 /etc/keepalived/ 文件夹下，最后把nginx_check.sh脚本分别copy到两台机器的 /etc/keepalived/文件夹下。

eepalived常用命令

```bash
servicekeepalived start
servicekeepalived stop
```





#### 配置

Nginx 是一款自由的、开源的、高性能的 HTTP **服务器和反向代理服务器**；同时也是一个 IMAP、POP3、SMTP 代理服务器。

Nginx 可以作为一个 HTTP 服务器进行网站的发布处理，另外 Nginx 可以作为**反向代理进行负载均衡**的实现。

```shell
cd /etc/nginx/
vim nginx.conf
cd /usr/sbin/
./nginx -s reload
```

##### 几种分配方式

1、轮询（默认）
 每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器down掉，能自动剔除。
 2、weight
 指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的情况。
 2、ip_hash
 每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。
 3、fair（第三方）
 按后端服务器的响应时间来分配请求，响应时间短的优先分配。
 4、url_hash（第三方）
 按访问url的hash结果来分配请求，使每个url定向到同一个后端服务器，后端服务器为缓存时比较有效。

```nginx
#例子
http {
    upstream  www.test1.com {
          ip_hash;
          server   172.16.125.76:8066 weight=10;
          server   172.16.125.76:8077 down;
          server   172.16.0.18:8066 max_fails=3 fail_timeout=30s;
          server   172.16.0.18:8077 backup;
     }
}
```

##### 配置说明

```nginx
#配置说明
########### 每个指令必须有分号结束。#################
#user administrator administrators;  #配置用户或者组，默认为nobody nobody。
#worker_processes 2;  #允许生成的进程数，默认为1
#pid /nginx/pid/nginx.pid;   #指定nginx进程运行文件存放地址
error_log log/error.log debug;  #制定日志路径，级别。这个设置可以放入全局块，http块，server块，级别以此为：debug|info|notice|warn|error|crit|alert|emerg
events {
    accept_mutex on;   #设置网路连接序列化，防止惊群现象发生，默认为on
    multi_accept on;  #设置一个进程是否同时接受多个网络连接，默认为off
    #use epoll;      #事件驱动模型，select|poll|kqueue|epoll|resig|/dev/poll|eventport
    worker_connections  1024;    #最大连接数，默认为512
}
http {
    include       mime.types;   #文件扩展名与文件类型映射表
    default_type  application/octet-stream; #默认文件类型，默认为text/plain
    #access_log off; #取消服务日志    
    log_format myFormat '$remote_addr–$remote_user [$time_local] $request $status $body_bytes_sent $http_referer $http_user_agent $http_x_forwarded_for'; #自定义格式
    access_log log/access.log myFormat;  #combined为日志格式的默认值
    sendfile on;   #允许sendfile方式传输文件，默认为off，可以在http块，server块，location块。
    sendfile_max_chunk 100k;  #每个进程每次调用传输数量不能大于设定的值，默认为0，即不设上限。
    keepalive_timeout 65;  #连接超时时间，默认为75s，可以在http，server，location块。

    http {
    include         mime.types;
    default_type    application/octet-stream;
    sendfile        on;
    tcp_nopush      on;
    keepalive_timeout 75;
    client_header_buffer_size 32k;
    large_client_header_buffers 4 32k;
    open_file_cache max=102400 inactive=20s;
    open_file_cache_valid 30s;
    open_file_cache_min_uses 1;
    server_tokens off;
    gzip on;
    gzip_min_length 1024;
    gzip_buffers    4 16k;
    gzip_http_version 1.1;
    gzip_types      image/gif  text/plain application/x-javascript text/css application/xml;
    gzip_vary on;
    client_max_body_size 100M;
    #limit_conn_zone $binary_remote_addr zone=addr:5m;

    upstream mysvr {   
      server 127.0.0.1:7878;
      server 192.168.10.121:3333 backup;  #热备
    }
    error_page 404 https://www.baidu.com; #错误页
    server {
        keepalive_requests 120; #单连接请求上限次数。
        listen       4545;   #监听端口
        server_name  127.0.0.1;   #监听地址       
        location  ~*^.+$ {       #请求的url过滤，正则匹配，~为区分大小写，~*为不区分大小写。
           #root path;  #根目录
           #index vv.txt;  #设置默认页
           proxy_pass  http://mysvr;  #请求转向mysvr 定义的服务器列表
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
           proxy_read_timeout 3600;
           deny 127.0.0.1;  #拒绝的ip
           allow 172.18.5.54; #允许的ip 
            #上传的限制    
           client_max_body_size     50m; //文件大小限制，默认1m
           client_header_timeout    1m;
           client_body_timeout      1m;
           #请求时间
           proxy_connect_timeout     60s;
           proxy_read_timeout      1m;
           proxy_send_timeout      1m;
        } 
    }
}

```

##### Nginx配置https模块

*https默认端口号是443*

```
1、 nginx要安装依赖   --with-http_ssl_module 步骤百度下
查看nginx是否安装http_ssl_module模块
./nginx -V
```

##### 将 http 重定向 https

```bash
server {
    listen 80;
    server_name somnus.test.com;
    #将http请求转成https
    rewrite ^(.*)$ https://$host$1 permanent;
    #rewrite ^(.*)$ https://${server_name}$1 permanent;
    
    absolute_redirect off; # 默认为开启 on
}
```

```nginx
### nginx配置https请求
server {
        listen       443  ssl;
        server_name  xxxxx.com;
        ssl_certificate     /opt/nginx/certificate/XXX.crt;
        ssl_certificate_key /opt/nginx/certificate/XXX.key;
        
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;
        
        location / {
            proxy_pass https://内网IP:项目端口;
            root   html;
            index  index.html index.htm;
        }
}
server{
          listen 80;
          server_name ~^(?:www\.)?(.+)$;
          return 301 https://$1$request_uri;
    }

```



#### Nginx的一些导出超时问题

```nginx
 #请求时间
 keepalive_timeout         60s;
 proxy_connect_timeout     60s;
 proxy_read_timeout        1m;
 proxy_send_timeout        1m;
```



#### 其它说明配置

#### 1、nginx作为静态资源服务器配置

```
location ^~/ceng/ {  
    alias F:/html/html2/; 
    try_files $uri $uri/ /h5/index.html;
    index  index.html index.htm;
    #add_header Cache-Control no-store;   
    #add_header expire -1;
}
location ^~/hehe/ {
    alias F:/html/;
    try_files $uri $uri/ /h5/index.html;
    index  index.html index.htm;
    #add_header Cache-Control no-store;
    #add_header expire -1;
}
```

 **强调** location 后的 "^~" 顺序不能反了

 

#### 2、nginx作为反向代理服务器配置

```nginx
#反向代理示例
upstream test {
   server 192.168.10.20;
}

server {
   listen   80;
   server_name  192.168.10.20;
   index  index.html index.htm;
   location ^~/home/ {
         proxy_pass http://test;    
    	#access_log logs/xxx.log;
        #error_log  logs/xxx.log;
        #proxy_set_header  Host $host
        #proxy_set_header  X-Real_Ip $remote_addr
        #proxy_set_header  X-Forwarder-For $proxy_add_x_forwarder_for;        
	}
}
#正向代理实例
server {

    resolver 114.114.114.114;       #指定DNS服务器IP地址 
    listen 80;
    location / {
        proxy_pass http://$host$request_uri;     #设定代理服务器的协议和地址 
        proxy_set_header HOST $host;
        proxy_buffers 256 4k;
        proxy_max_temp_file_size 0k;
        proxy_connect_timeout 30;
        proxy_send_timeout 60;
        proxy_read_timeout 60;
        proxy_next_upstream error timeout invalid_header http_502;
    }
    location /xxx {
        root   D:\Tomcat\apache-tomcat-8.5.69\webapps\guide;
        index  index.html index.htm;
        #解决vue的去掉# 刷新报404
        try_files $uri $uri/ /index.html;
    }
}
```

proxy_redirect参数说明：

   这个参数只在发生重定向时生效，

 前提：proxy_redirect http://hello http://127.0.0.1:8001; 其中 http://hello 为param1，http://127.0.0.1:8001为param2， host为http/https+IP+端口号

#### host攻击防御

```nginx
server {
    listen 80;
    server_name 127.0.0.1 192.168.1.32;
    if ($http_Host !~* ^192.168.1.32|127.0.0.1$)
    {
    	return 403;
    }             
    rewrite ^(.*) https://$server_name$1 permanent;     
}


~ 为区分大小写匹配(可用正则表达式)
!~为区分大小写不匹配
~* 为不区分大小写匹配(可用正则表达式)
!~*为不区分大小写不匹配
^~ 如果把这个前缀用于一个常规字符串,那么告诉nginx 如果路径匹配那么不测试正则表达式。
```

#### 打开目录浏览功能

```nginx
添加上autoindex on;来启用目录流量
#整个虚拟主机开启目录流量,或者可以放在server下
location / {
    autoindex on;
    autoindex_localtime on; #之类的参数写这里 默认为 off，显示的文件时间为 GMT 时间。改为 on 后，显示的文件时间为文件的服务器时间。
    autoindex_exact_size off; #默认为 on，显示出文件的确切大小，单位是 bytes。改为 off 后，显示出文件的大概大小，单位是 kB 或者 MB 或者 GB。
    charset utf-8,gbk; #展示中文文件名，这个可以不要？解决中文问题
}
目录美化之类
location / {
    #跨域设置
    add_header Access-Control-Allow-Origin "*";
    add_header Access-Control-Allow-Methods "GET,POST,PUT,DELETE,OPTIONS";
    add_header Access-Control-Allow-Headers "*";
    add_header Access-Control-Allow-Credentials true;
    #以上几行设置跨域与目录美化无关
    add_after_body /.Nginx/footer.html; #.Nginx这个路径自定义的
}

#单独目录开启目录流量
2.1：直接二级目录开启目录流量
location /down/ {
autoindex on;
}

2.2：虚拟目录开启目录流量
location /down/ {
alias /home/wwwroot/lnmp/test/;
autoindex on;
}
```



#### vue静态代理例子

```nginx
#user  nobody;
worker_processes  1;
#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;
#pid        logs/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;
    sendfile        on;
    #tcp_nopush     on;
    #keepalive_timeout  0;
    keepalive_timeout  65;
    #gzip  on;
    server {
        listen       80;
        server_name  activate.navicat.com;
		#if ($http_Host !~* ^192.168.1.32$)
	    #{   
		#	return 403;
		#}
		#location / {
        #    proxy_pass http://127.0.0.1:8081/;
		#	proxy_set_header Host $http_host;
        #    proxy_set_header X-Real-IP $remote_addr;
        #    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        #    proxy_set_header X-Forwarded-Proto $scheme;
        #}
        location / {
            root   E:\开发笔记\System_Template\dist;
            index  index.html index.htm;
			#解决vue的去掉# 刷新报404
			try_files $uri $uri/ /index.html;
        }        
    }	
	server {
        listen 443 ssl;
        server_name activate.navicat.com;
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload";
        add_header X-Frame-Options SAMEORIGIN;
        ssl_certificate     sdyunlei.crt;
        ssl_certificate_key sdyunlei.key;
        ssl_session_timeout 5m;
        ssl_protocols SSLv2 SSLv3 TLSv1.2;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        location / {
        #    proxy_pass http://127.0.0.1:8081/;
		#	 proxy_set_header Host $http_host;
        #    proxy_set_header X-Real-IP $remote_addr;
        #    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        #    proxy_set_header X-Forwarded-Proto $scheme;
			root   E:\开发笔记\System_Template\dist;
            index  index.html index.htm;
        }
	}	
	#include 文件路径  可导入其它配置
}

```

#### 

#### websocket的负载均衡配置

已知：

1. 预计部署两个ws服务器，一个在192.168.0.10:8054，192.168.0.11:8054
2. 对外使用[wss://www.test.com](https://links.jianshu.com/go?to=wss%3A%2F%2Fwww.test.com)访问ws
3. 使用Nginx做负载均衡，用轮询模式

nginx的配置方式：



```php
http { 
    
## websocket的重要配置map指令的作用：
## 该作用主要是根据客户端请求中$http_upgrade 的值，来构造改变$connection_upgrade的值，即根据变量$http_upgrade的值创建新的变量$connection_upgrade，
##  创建的规则就是{}里面的东西。其中的规则没有做匹配，因此使用默认的，即 $connection_upgrade 的值会一直是 upgrade。然后如果 $http_upgrade为空字符串的话， 那值会是 close
    map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
    }
    # upstream
     upstream test_com {
         server   192.168.0.10:8054;
         server   192.168.0.11:8054; 
         keepalive 1000;
     }
    # server
     server { # 443端口为https请求
        listen       443;
        server_name  www.test.com;   # host增加了127.0.0.1的映射    
         
        location /websocket{
            # 解决方向代理跨域问题
            add_header 'Access-Control-Allow-Origin' '*';
            proxy_set_header 'Access-Control-Allow-Origin' '*'; 
            
            proxy_set_header   Host    $host;
            proxy_set_header   X-Real-IP   $remote_addr;
            proxy_set_header   REMOTE-HOST $remote_addr;
            proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
            keepalive_timeout 120s;        #客户端链接超时时间。为0的时候禁用长连接。
            #在一个长连接上可以服务的最大请求数目。
            keepalive_requests 10000;    #当达到最大请求数目且所有已有请求结束后，连接被关闭。默认值为100
            
            proxy_pass http://test_com/websocket;
            proxy_set_header Upgrade $http_upgrade;  #websocket的重要配置
            proxy_set_header Connection "upgrade";   #websocket的重要配置

                                            
     }
}
```

## 分布式部署，websocket共享问题

我们不妨设想一下，如果我们后端部署了多台服务器，其中某一个用户发布了消息，需要实时通知到其他在线的用户，以上示例是无法实现的。
因为WebSocket Session是不支持序列化的，无法存储也就没有办法将所有后端服务器中连接的用户会话放到一起。
既然无法把会话存放到一起统一管理，那么就定义一个公共的频道，每个服务器都向该频道发布消息，所有订阅该频道的服务器都接收消息，用来判断当前所连接的用户是否需要接收到该消息，需要则推送不需要则不推送，则刚好符合发布订阅模式。

每个应用节点都订阅该topic的频道，这样新消息一注册，每个节点服务器都能接收到Object，然后从各自的节点中寻找正在连接的webSocket会话，进行消息推送。

就这样通过Redis的发布/订阅功能实现session共享。 

```
https://blog.csdn.net/qq_42922707/article/details/113918644
```



##### 

#### 访问静态文件txt

```nginx
location /EJyhBr8IAO.txt{
        alias /opt/verify/EJyhBr8IAO.txt;
}
如果访问403可能没有权限，需要给文件目录读取权限
```







## RocketMQ的使用

### 1、集成

```xml
<!--springcloud alibaba集成rocketmq 引入依赖-->
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-stream-rocketmq</artifactId>
</dependency>

其它一些配置详解
#https://github.com/alibaba/spring-cloud-alibaba/wiki/RocketMQ
<dependency>
  <groupId>com.alibaba.cloud</groupId>
  <artifactId>spring-cloud-stream-binder-rocketmq</artifactId>
</dependency>
或者可以使用 Spring Cloud Stream RocketMQ Starter：
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-stream-rocketmq</artifactId>
</dependency>

```

```java
messageDelayLevel=1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h

Message msg=new Message();
msg.setTopic("TopicA");
msg.setTags("Tag");
msg.setBody("this is a delay message".getBytes());
//设置延迟level为5，对应延迟1分钟
msg.setDelayTimeLevel(5);
producer.send(msg);
```

## Spark 

spark通用数据处理引擎， 通用内存并行计算框架

Hadoop 已经成了大数据技术的事实标,  I/O 成本很高

学习地址： https://github.com/vector4wang/quick-spark-process

```java
//例子地址  
//https://github.com/ZhuXS/Spring-Shiro-Spark/blob/master/Server/src/main/java/com/zhuxs/result/service/impl/WordCountServiceImpl.java
@Bean
public SparkSession sparkSession(){
        return SparkSession
                .builder()
                .sparkContext(javaSparkContext().sc())
                .appName("Java Spark SQL basic example")
                .getOrCreate();
}

-----------------------------------------------
#调用
@Autowired
private SparkSession sparkSession;

// WordCount示例
List<Word> wordList = Arrays.stream(tempWords).map(Word::new).collect(Collectors.toList());
dataFrame = sparkSession.createDataFrame(wordList, Word.class);
dataFrame.show();
```

```java
创建DataFrame

RelationalGroupedDataset groupedDataset = dataFrame.groupBy(col("word"));
List<Row> rows = groupedDataset.count().collectAsList();
return rows.stream().map(new Function<Row, Count>() {
                @Override
                public Count apply(Row row) {
                    return new Count(row.getString(0),row.getLong(1));
                }
            }).sorted(new CountComparator()).collect(Collectors.toList());
```

### Hadoop

```
ip:50070/explorer.html#/
实现界面可视化
```



hadoop能干什么

* 大数据存储：分布式存储 利用的hdfs

* 日志处理：擅长日志分析
* ETL:数据抽取到oracle、mysql、DB2、mongdb及主流数据库
* 机器学习: 比如Apache Mahout项目
* 搜索引擎:Hadoop + lucene实现
* 数据挖掘：目前比较流行的广告推荐，个性化广告推荐
* Hadoop是专为离线和大规模数据分析而设计的，并不适合那种对几个记录随机读写的在线事务处理模式。

总结一句话：Hadoop就是存储海量数据和分析海量数据的工具。



```
hadoop配置完成，hdfs负责分布式存储，mapreduce负责分布式计算,yarn负责资源调度，基本的（伪）分布式环境
```



* **关键技术**

**HDFS（Hadoop Distributed File System）：**

既可以是Hadoop 集群的一部分，也可以是一个独立的分布式文件系统，是开源免费的大数据处理文件存储系统。

* **能干什么**

大数据存储：分布式存储

日志处理：擅长日志分析

ETL:数据抽取到oracle、mysql、DB2、mongdb及主流数据库

机器学习: 比如Apache Mahout项目

搜索引擎:Hadoop + lucene实现

数据挖掘：目前比较流行的广告推荐，个性化广告推荐

Hadoop是专为离线和大规模数据分析而设计的，并不适合那种对几个记录随机读写的在线事务处理模式。

### hdfs命令

```shell
########hadoop fs与hdfs dfs等价################
########hadoop fs与hdfs dfs等价################
hadoop fs -rm -f /tmp/luan/    删除文件文件,不能删除目录 
hadoop fs -ls  查看hdfs文件系统中已经存在的文件
#命令
hdfs dfs -ls /
hadoop fs -ls /
#查看所有文件结构
hdfs dfs -ls -R /
hdfs dfs -lsr /

#下载
hdfs dfs  -get   /install.log  /export/servers

hdfs dfs  -get /sfdcloud/hbase/data/default/SmallFile/36c28567c58221b30c0c0f8a4238f48d /home/file

#在hdfs文件系统中创建文件
hdfs dfs -touch /czz.txt
#从本地路径上传文件到hdfs
hdfs dfs -put /本地路径 /hdfs路径
```



### Hbase

```
HBase和Redis的区别有哪些？
HBase和Redis的功能上比较相似。都是nosql类型的数据库。但是在适用场景上，两者还是有比较明显的区别的。

1）读写性能
HBase写快读慢，HBase的读取时长通常是几毫秒，而Redis的读取时长通常是几十微秒。性能相差非常大。
2）数据类型
HBase和Redis都支持KV类型。但是Redis支持List、Set等更丰富的类型。
3）数据量
Redis支持的数据量通常受内存限制，而HBase没有这个限制，可以存储远超内存大小的数据
4）部署难易
HBase部署需要依赖hadoop、zookeeper等服务，而Redis的部署非常简单。
5）数据可靠性
HBase采用WAL，先记录日志再写入数据，理论上不会丢失数据。而Redis采用的是异步复制数据，在failover时可能会丢失数据。
6）应用场景
HBase适合做大数据的持久存储，而Redis比较适合做缓存。如果数据丢失是不能容忍的，那就用只能用HBase；如果需要一个高性能的环境，而且能够容忍一定的数据丢失，那完全可以考虑使用Redis。

HBase可以用来做数据的固化，也就是数据存储，做这个他非常合适。Redis适合做cache。可以用HBase+Redis实现数据仓库加缓存数据库，速度和扩展性都兼顾。
```

#### 安装

**用法：** springboot集成phoenix操作HBASE

* 1、需要将原有 HBase 中的表做映射才能后使用 Phoenix 操作。
  2、Phoenix 区分大小写，切默认情况下会将小写转成大写，所以表名、列簇、列名需要用双引号。
  3、Phoenix 4.10 版本之后，在创建表映射时需要将 COLUMN_ENCODED_BYTES 置为 0。
  4、删除映射表，会同时删除原有 HBase 表。所以如果只做查询炒作，建议做视图映射。
* 访问： http://ip:50070/explorer.html#/


#### phoenix命令

https://www.jianshu.com/p/b7ec14a67a06?from=groupmessage@

注意点

```js
#
在phoenix中，默认情况下，库名，表名，字段名等会自动转换为大写，若要小写，使用双引号，如"ns1"。
注意:特别注意引号，总之很变态
#
注意 以下所有操作，前提都是Hbase中不存在库，表，然后能过phoenix以sql的方式来创建hbase中的库，表，记录等，至于 Hbase中已经存在的表，phoenix如何映射，有专门的章节来讲解

```



```mysql
#登录./sqlline.py
./sqlline.py localhost:2181:/hbase-unsecure
#退出
!quit
!exit
#查看当前存在的表
!tables
select * from SYSTEM.CATALOG;
!desc SYSTEM.CATALOG
#建库语句
//创建schema(就是hbase中的namespace),就是数据库
create schema IF NOT EXISTS "ns1";
*************使用schema，执行后再创建表，增加记录等，否则都建在default数据库中了****************
USE "ns1";
删除schema
drop schema "ns1";
#建表语句
通过Phoenix创建的表,必须指定primary key(对应Hbase的rowkey)
//设置联合主键
drop table if exist <tableName>
create table xx
 ....
 这里 定义的主键，就是hbase中的rowkey
CONSTRAINT PK PRIMARY KEY (EMAIL,id,name));

表字段的一些类型 
UNSIGNED_INT, UNSIGNED_LONG, VARCHAR

#添加字段
ALTER TABLE <tableNmae> ADD <column>  <columnType>;

#更新upsert  (实际含义为 update + insert)
在upsert语句中制定存在的idcardnum即可实现更新
Phoenix中不存在update的语法关键字，而是upsert
upsert into table (column1...) values(value1....)
#查询更新
upsert into table (colunm1...) select value1... from table where condition
注意：
1）upsert：表中的主键不存在就是插入，存在就是更新
2）where的字段值要加单引号 ' ', 字段名的小写是加双引号，别弄混了

#删除表
drop table ljc.student;

#分页 offset + limit
SELECT * FROM TEST LIMIT pageSize OFFSET (pageNum - 1)*pageSize;

#视图
cteate table ***
```



#### HBase命令操作

分区概念： https://www.cnblogs.com/frankdeng/p/9310356.html

```bash
#列举命名空间
list_namespace
#获取命名空间描述 describe_namespace ‘空间名’
#查看命名空间下的所有表 list_namespace_tables '空间'
#创建命名空间create_namespace ‘空间’
#删除命名空间drop_namespace ‘空间’

#建表
create '表名', '列名1', '列名2', '列名3'
create '表名', {NAME=>'列名', VERSIONs=>版本号, TTL=>过期时间, BLOCKACHE=true}
#创建region预分区存储数据
create 'table3','f1', { NUMREGIONS => 10, SPLITALGO => 'HexStringSplit' } 
#指定命名空间
create 'ns_school:tbl_student','info'
#删除表drop '表名'
#删除满足正则表达式 drop_all 'ns:t.*'

#添加列
alter '表名','列名'
#删除列
delete '表名',  {NAME=>'列名', METHOD=>'delete'}
#异步修改
alter_async ....
alter_status '表名' #查看异步执行状态
#获取表描述
describe '表名'

#全表扫描scan '表名'
 get 't1','rowkey001', 'f1:col1'
scan '表名', {COLUMN=> 列名}
分页
 scan  'stu2',{COLUMNS => 'cf1:age', LIMMIT 10, STARTROW => 'xx'}
#清空整个表的数据truncate,先disable表，然后再drop表，最后重新create表
truncate '表名'
#查询表中有多少行count
count '表名'

#linux列举所有表
base>> list
#是否存在表明
exists '表名'
#启用表和禁用表
enable '表名' ;  disable '表名'
is_disabled '表名' #查看状态
#禁用和启用满足正则表达式
enable_all  disable_all 't.8'

#进入hbase shell
#退出exit
```

## zookeeper

### 集群搭建

由于zookeeper集群的运行需要Java运行环境，所以需要首先安装 JDK

在 /usr/local 目录下新建 software 目录，然后将 zookeeper 压缩文件上传到该目录中，然后通过如下命令解压。

```
tar -zxvf zookeeper-3.3.6.tar.gz
```

将 zoo_sample.cfg 文件复制并重命名为 zoo.cfg 文件。

```
cp zoo_sample.cfg zoo.cfg
```

编辑zoo.cfg的配置

```bash
tickTime=2000
initLimit=10
syncLimit=5
dataDir=data
clientPort=2181

server.1=hdfs1.safedog.cn:2888:3888
server.2=hdfs2.safedog.cn:2888:3888
server.3=hdfs3.safedog.cn:2888:3888


配置解释
#tickTime：
这个时间是作为 Zookeeper 服务器之间或客户端与服务器之间维持心跳的时间间隔，也就是每个 tickTime 时间就会发送一个心跳。
#initLimit：
这个配置项是用来配置 Zookeeper 接受客户端（这里所说的客户端不是用户连接 Zookeeper 服务器的客户端，而是 Zookeeper 服务器集群中连接到 Leader 的 Follower 服务器）初始化连接时最长能忍受多少个心跳时间间隔数。当已经超过 5个心跳的时间（也就是 tickTime）长度后 Zookeeper 服务器还没有收到客户端的返回信息，那么表明这个客户端连接失败。总的时间长度就是 5*2000=10 秒
#syncLimit：
这个配置项标识 Leader 与Follower 之间发送消息，请求和应答时间长度，最长不能超过多少个 tickTime 的时间长度，总的时间长度就是5*2000=10秒
#dataDir：
快照日志的存储路径
除非另有说明，否则指向数据库更新的事务日志。注意：应该谨慎的选择日志存放的位置，使用专用的日志存储设备能够大大提高系统的性能，如果将日志存储在比较繁忙的存储设备上，那么将会很大程度上影像系统性能。
#dataLogDir：
事物日志的存储路径，如果不配置这个那么事物日志会默认存储到dataDir制定的目录，这样会严重影响zk的性能，当zk吞吐量较大的时候，产生的事物日志、快照日志太多
#clientPort：
这个端口就是客户端连接 Zookeeper 服务器的端口，Zookeeper 会监听这个端口，接受客户端的访问请求。修改他的端口改大点
#
server.A=B:C:D 配置，其中 A 对应下面我们即将介绍的myid 文件。B是集群的各个IP地址，C:D 是端口配置。
```

#### 创建myid文件

例子 ： server.0=192.168.146.200:2888:3888

那么就必须在 192.168.146.200 机器的的 /usr/local/software/zookeeper-3.3.6/data 目录下创建 myid 文件，然后在该文件中写上 0 即可。

后面的机器依次在相应目录创建myid文件，写上相应配置数字即可。

```
#myid文件
0
```

命令

```
echo "0" > /opt/zookeeper/zkdata/myid
```

* 全局配置zk命令，非必要

  首先进入到 /etc/profile 目录，添加相应的配置信息：

  ```bash
  #set zookeeper environment
  export ZK_HOME=/usr/local/software/zookeeper-3.3.6
  export PATH=$PATH:$ZK_HOME/bin
  ```

  　　然后通过如下命令使得环境变量生效：

  ```bash
  source /etc/profle
  ```

启动命令：

```
zkServer.sh start
```

　　停止命令：

```
zkServer.sh stop
```

　　重启命令：

```
zkServer.sh restart
```

　　查看集群节点状态：

```
zkServer.sh status
```



## Kafka 

### 概念

1、主题（Topic）：一个主题类似新闻中的体育、娱乐、教育等分类概念，在实际工程中通常一个业务一个主题。

2、分区（Partition）：一个Topic中的消息数据按照多个分区组织，分区是kafka消息队列组织的最小单位，一个分区可以看作是一个FIFO（ First Input First Output的缩写，先入先出队列）的队列。

### 集群搭建

重要点

旧版本依赖zookeeper， 新版本kafka v2.8之后不再依赖zookeeper， 查看server.properties的连接配置

```
#集群连接
zookeeper.connect=hdfs1.safedog.cn:2181,hdfs2.safedog.cn:2181,hdfs3.safedog.cn:2181/kafka
# Timeout in ms for connecting to zookeeper
# 客户端等待与 ZooKeeper 建立连接的最长时间
zookeeper.connection.timeout.ms=30000
# ZooKeeper 会话超时时间
zookeeper.session.timeout.ms=20000
```



Kafka集群是把状态保存在Zookeeper中的，首先要搭建Zookeeper集群。

* zookeeper的conf文件配置

```
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/opt/zookeeper/zkdata
dataLogDir=/opt/zookeeper/zkdatalog
clientPort=12181
server.1=192.168.7.100:12888:13888
server.2=192.168.7.101:12888:13888
server.3=192.168.7.107:12888:13888
#server.1 这个1是服务器的标识也可以是其他的数字， 表示这个是第几号服务器，用来标识服务器，这个标识要写到快照目录下面myid文件里
#192.168.7.107为集群里的IP地址，第一个端口是master和slave之间的通信端口，默认是2888，第二个端口是leader选举的端口，集群刚启动的时候选举或者leader挂掉之后进行新的选举的端口默认是3888
```

* 创建myid文件

```

#server1
echo "1" > /opt/zookeeper/zkdata/myid
#server2
echo "2" > /opt/zookeeper/zkdata/myid
#server3
echo "3" > /opt/zookeeper/zkdata/myid

 4、重要配置说明
1、myid文件和server.myid  在快照目录下存放的标识本台服务器的文件，他是整个zk集群用来发现彼此的一个重要标识。
2、zoo.cfg 文件是zookeeper配置文件 在conf目录里。
3、log4j.properties文件是zk的日志输出文件 在conf目录里用java写的程序基本上有个共同点日志都用log4j，来进行管理。
```

* zkEnv.sh和zkServer.sh文件

zkServer.sh 主的管理程序文件

zkEnv.sh 是主要配置，zookeeper集群启动时配置环境变量的文件

* 还有一个需要注意

ZooKeeper server **will not remove old snapshots and log files** when using the default configuration (see autopurge below), this is the responsibility of the operator

zookeeper不会主动的清除旧的快照和日志文件，这个是操作者的责任。

但是可以通过命令去定期的清理。

```
#!/bin/bash 
#snapshot file dir 
dataDir=/opt/zookeeper/zkdata/version-2
#tran log dir 
dataLogDir=/opt/zookeeper/zkdatalog/version-2
#Leave 66 files 
count=66 
count=$[$count+1] 
ls -t $dataLogDir/log.* | tail -n +$count | xargs rm -f 
ls -t $dataDir/snapshot.* | tail -n +$count | xargs rm -f 

#以上这个脚本定义了删除对应两个目录中的文件，保留最新的66个文件，可以将他写到crontab中，设置为每天凌晨2点执行一次就可以了。
#zk log dir   del the zookeeper log
#logDir=
#ls -t $logDir/zookeeper.log.* | tail -n +$count | xargs rm -f

其他方法：
第二种：使用ZK的工具类PurgeTxnLog，它的实现了一种简单的历史文件清理策略，可以在这里看一下他的使用方法 http://zookeeper.apache.org/doc/r3.4.6/zookeeperAdmin.html 
第三种：对于上面这个执行，ZK自己已经写好了脚本，在bin/zkCleanup.sh中，所以直接使用这个脚本也是可以执行清理工作的。
第四种：从3.4.0开始，zookeeper提供了自动清理snapshot和事务日志的功能，通过配置 autopurge.snapRetainCount 和 autopurge.purgeInterval 这两个参数能够实现定时清理了。这两个参数都是在zoo.cfg中配置的：
autopurge.purgeInterval  这个参数指定了清理频率，单位是小时，需要填写一个1或更大的整数，默认是0，表示不开启自己清理功能。
autopurge.snapRetainCount 这个参数和上面的参数搭配使用，这个参数指定了需要保留的文件数目。默认是保留3个。


```

**5、启动服务并查看**

1、启动服务

```bash
#进入到Zookeeper的bin目录下
cd /opt/zookeeper/zookeeper-3.4.6/bin
#启动服务（3台都需要操作）
./zkServer.sh start
```

2、检查服务状态

```bash
#检查服务器状态
./zkServer.sh status
```

通过status就能看到状态：

```
./zkServer.sh status
JMX enabled by default
Using config: /opt/zookeeper/zookeeper-3.4.6/bin/../conf/zoo.cfg  #配置文件
Mode: follower  #他是否为领导
```

### springboot集成

```xml
<!--引入kafak和spring整合的jar-->
<dependency>
    <groupId>org.springframework.kafka</groupId>
    <artifactId>spring-kafka</artifactId>
    <version>2.2.7.RELEASE</version>
</dependency>
```

```yaml
#application.yaml 集群连接配置
spring:
    kafka:
      bootstrap-servers: http://master:9092,http://worker1:9092,http://worker2:9092
      producer:
        retries: 0
        batch-size: 16384
        buffer-memory: 33554432
        key-serializer: org.apache.kafka.common.serialization.StringSerializer
        value-serializer: org.apache.kafka.common.serialization.StringSerializer
```



```java
//生产者
@Component
public class Product {
      @Autowired
      private KafkaTemplate kafkaTemplate;

      public void send(String name){
            User u=new User();
            u.setName(name);
            u.setAge(11);
            kafkaTemplate.send("user", JSON.toJSONString(u));
      }
}

//消费者
@Component
public class Consumer {
    @KafkaListener(topics = "user")
    public void consumer(ConsumerRecord consumerRecord){
        Optional<Object> kafkaMassage = Optional.ofNullable(consumerRecord.value());
        if(kafkaMassage.isPresent()){
            Object o = kafkaMassage.get();
            System.out.println(o);
        }

    }
}
```

### 客户端命令



注意点：

```
#bootstrap-servers vs zookeeper
都是指的是目标集群的服务器地址
zookeeper - 旧版Kafka的参数
bootstrap.server - 新版Kafka的参数
Kafka开发团队重写了ZooKeeper的Quorum控制器代码并嵌入到Kafka中。所以从v2.8版本开始，Kafka不再依赖ZooKeeper
```

1、启动kafka服务

```shell
bin/kafka-server-start.sh config/server.properties &


#查看版本
进到kafka的安装目录
 执行下列语句
复制
find ./libs/ -name \*kafka_\* | head -1 | grep -o '\kafka[^\n]*'
kafka_2.10-0.8.2.2.jar
就可以看到kafka的具体版本
其中，2.10为scala版本，0.8.2.2为kafka版本。

#查看配置
/config/server.properties 中的zookeeper.connect=
```

2、停止kafka服务

```
./kafka-server-stop.sh 
```

3、查看所有的话题

```shell
./kafka-topics.sh --list --zookeeper localhost:2181

./kafka-topics.sh --zookeeper localhost:2181 --list
```

4、查看所有话题的详细信息

```
./kafka-topics.sh --zookeeper localhost:2181 --describe
```

5、列出指定话题的详细信息

```
./kafka-topics.sh --zookeeper localhost:2181 --describe  --topic demo
#根据组查询
./kafka-consumer-groups.sh --bootstrap-server kafka.safedog.cn:9092 --describe  --group cloudnet_serverBaseInfo_mysql_heartbeat
```

6、删除一个话题

```bash
./kafka-topics.sh --zookeeper localhost:2181 --delete  --topic test

```

7、创建一个叫test的话题，有两个分区，每个分区3个副本

```bash
./kafka-topics.sh --zookeeper localhost:2181 --create --topic test --replication-factor 3 --partitions 2
./kafka-topics.sh --bootstrap-servers localhost:2181 --create --topic test --replication-factor 3 --partitions 2
```

 8、测试kafka发送和接收消息（启动两个终端）

```shell
#发送消息（注意端口号为配置文件里面的端口号）
./kafka-console-producer.sh --broker-list localhost:9092 --topic test
#消费消息（可能端口号与配置文件保持一致，或与发送端口保持一致）
#查看消息内容
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning   #加了--from-beginning 重头消费所有的消息./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test         #不加--from-beginning 从最新的一条消息开始消费
```

9、查看某个topic对应的消息数量

```
./kafka-run-class.sh cloudbis.cluster.component.risk.mysql --broker-list localhost:9092 --topic test --time -1

Current-offset与log-end-offset 相等表示kafka topic 消息已全部消费完

#创建topic
./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions ...
```

10、显示所有消费者

```
./kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
```

11、获取正在消费的topic（console-consumer-63307）的group的offset

```
./kafka-consumer-groups.sh --describe --group console-consumer-63307 --bootstrap-server localhost:9092
```

11、显示消费者

```
./kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list 
#用 |grep  关键字查询
```

12、查看topic最新数据

```shell
 kafka-avro-console-consumer 查看全部消息
 
 ./bin/kafka-avro-console-consumer --bootstrap-server localhost:9092 --topic testGetN \
  --property schema.registry.url="http://localhost:50002" \
  --property print.key=true --from-beginning
  
#获取topic的最大offset和最小offset
  
#查看各个分区的最小offset(这个意思就是，这个offset之前的消息已经被清除了，现在consumer是从这个offset之后开始消费):
./bin/kafka-run-class kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic testGetN --time -2
#查看各个分区的最大offset(这个意思就是，producer下一次写入信息时的offset):
./bin/kafka-run-class kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic serverBaseInfo.mysql --time -1


#比如想要获取最近N=8条数据，offset=12-N=4，所以就从offset为4开始消费
./bin/kafka-avro-console-consumer --bootstrap-server localhost:9092 --topic testGetN \
	--property schema.registry.url="http://localhost:50002" \
	--property print.key=true --partition 0 --offset 4
	
kafka-avro-console-consumer --bootstrap-server localhost:9092 --topic cloudnet.baseline.scan.stat.mysql --property print.key=true --partition 0 --offset 4


```

### springboot优雅创建kafka

```java
代码量变的庞大；
/**
  * 通过注入一个 NewTopic 类型的 Bean 来创建 topic，如果 topic 已存在，则会忽略。
  */
@Bean
public NewTopic myTopic() {
    return new NewTopic(myTopic, 2, (short) 1);
}

kafka:
  topics:
    - name: topic1
      num-partitions: 3
      replication-factor: 1
    - name: topic2
      num-partitions: 1
      replication-factor: 1
          
@ConfigurationProperties(prefix = "kafka")
class TopicConfigurations {
    private List<Topic> topics;
}

// 现在yaml做好配置， 然后@Configure注入
@Configure
private final TopicConfigurations configurations;

    private final GenericWebApplicationContext context;

    public TopicAdministrator(TopicConfigurations configurations, GenericWebApplicationContext genericContext) {

        this.configurations = configurations;

        this.context = genericContext;

    }
     @PostConstruct
    public void init() {
        initializeBeans(configurations.getTopics());
    }

    private void initializeBeans(List<TopicConfigurations.Topic> topics) {
        topics.forEach(t -> context.registerBean(t.name, NewTopic.class, t::toNewTopic));
    }
}
```



### kafka可视化工具

```
#Offset exploer
http://www.kafkatool.com/download.html

```





------

## LINUX

### 文件操作

```shell
#新增文件
touch fileName
#查看当前路径
pwd
#创建目录
mkdir /tmp/test
#删除文件
rm -rf '文件夹'  //千万注意不能使用【 rm -rf /* 】会导致系统瘫痪
#复制文件
cp /root/a.txt  /tmp/
#移动文件或者修改文件名
mv source target
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



### 全局环境变量设置

```shell
#一种全局默认的路径为/etc/profile在profile中，它默认会再加载/etc/bash.bashrc。
#另一种用户自己的就是$HOME目录下的.profile它默认会载加载.bashrc文件。
#
view /etc/profile
export PATH="变量路径"

#修改.bashrc
 vim /root/.bashrc
export PATH="变量路径"

#关键字
nohup 表示不关闭，后台运行进程
kill -9  进程号

#直接在shell下用export命令修改
#export PATH="$var_PATH"
#export 可查看当前系统下的所有环境变量.
```



### 一些linux命令

```shell
# 查看文件，实时显示最后一页
tail  -f  filename        
# 实时查看日志文件 后一百行
tail - 100f  

# sz命令发送文件到本地：
sz filename
# rz命令本地上传文件到服务器：
rz  弹出回话框，选择文件上传
rz -y 文件名 上传并覆盖
 

ps -ef | grep 'name'
查看当前所处的路径：    pdw
netstat -lnp|grep 端口号
 
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

#切换用户命令
su - username #切换后则完全切换到了目标用户的环境
su username   #切换后的环境变量大部分还是切换前用户的环境
.tar
打包语法：tar cvf newFileName.tar fileName || dirName 
解包语法：tar xvf newFileName.tar fileName（-C dirName）

打包成tar.gz格式压缩包
# tar -zcvf renwolesshel.tar.gz /renwolesshel
解压tar.gz格式压缩包
# tar zxvf renwolesshel.tar.gz
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
#更改权限
chgrp  用户名  文件名  -R
切换所在组
chown 用户名  文件名  
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

#### linux定时任务

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

#### Linux的host配置

```linux
vim /etc/hosts
#生效
sudo /etc/init.d/networking restart
```



------

### OpenOffice服务的启动命令

KKFileView预览项目 https://kkfileview.keking.cn/zh-cn/docs/production.html

* 在解压路径bin文件，运行startup脚本(Windows下以管理员身份运行`startup.bat`，Linux以root用户运行`startup.sh`）

* 浏览器访问本机8012端口（[http://127.0.0.1:8012](http://127.0.0.1:8012/) ）即可看到项目演示用首页

  

```js
#2、用以下命令启动OpenOffice服务 
cd D:\Program Files (x86)\OpenOffice 4\program
soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard 
# 远程调用
soffice -headless -accept="socket,host=192.168.88.65,port=8100;urp;" -nofirststartwizard &
```

* 自动启动

  ```
  修改配置文件
  vi /etc/rc.local
  
  添加如下命令
  soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &
  ```

  

```linux
#linux启动服务  好像和windows一样
1 /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard  临时启动
2 nohup /opt/openoffice4/program/soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &  后台启动
```

```java
# 关键转换代码
connection = new SocketOpenOfficeConnection("192.168.88.65", 8100);
connection.connect();
DocumentConverter converter = new StreamOpenOfficeDocumentConverter(connection); DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
DocumentFormat txt = formatReg.getFormatByFileExtension("odt");
DocumentFormat pdf = formatReg.getFormatByFileExtension("pdf");
converter.convert(inputFile, txt, outputFile, pdf);
connection.disconnect();

```



* CMD端口的问题



------

### springboot的邮件发送

#### 1.引入依赖

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-mail</artifactId>
</dependency>
<dependency>
    <groupId>com.sun.mail</groupId>
    <artifactId>javax.mail</artifactId>
    <version>1.6.2</version>
</dependency>
```

#### 2.发件人账号信息写入配置文件

```yml
spring:
    mail:
        default-encoding: utf-8  #设置编码格式
        host: smtp.qq.com        #这里用的是QQ邮箱，所以是qq.com
        password: *************  #注意此密码不是邮箱登陆密码，而是邮箱的授权码
        username: *******@qq.com #邮箱账号
```

#### 3.例子

```java
	@Value("${spring.mail.username}")
    private String from;
 
    @Autowired
    private JavaMailSender javaMailSender;
 
   /**
     * 功能描述：发送html邮件
     *
     * @param to      发送目标邮箱
     * @param subject 邮件标题
     * @param content 邮件内容
     */
    public void sendHtmlMail(String to, String subject, String content) throws MessagingException {
        //创建message
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        //发件人
        helper.setFrom(from);
        //收件人
        helper.setTo(to);
        //邮件标题
        helper.setSubject(subject);
        //true指的是html邮件
        helper.setText(content, true);
        //发送邮件
        javaMailSender.send(message);
    }
```

#### 4.调用示例

```java
 mailService.sendHtmlMail("5***17@qq.com", "helloWorld", "<h1 style='color:red'>helloWorld</h1>");
```

------

### RestTemplate详解HTTP请求

Springboot — 用更优雅的方式发HTTP请求(RestTemplate详解)

* https://www.cnblogs.com/javazhiyin/p/9851775.html

```java
/**
 * 不带参的get请求
 */
@Test
public void restTemplateGetTest(){
    RestTemplate restTemplate = new RestTemplate();
    Notice notice = restTemplate.getForObject("http://xxx.top/notice/list/1/5"
                                              , Notice.class);
    System.out.println(notice);
}
/**
 * 带参的get请求
 */
Notice notice = restTemplate.getForObject("http://fantj.top/notice/list/{1}/{2}"
                , Notice.class,1,5);
//方式二：
Map<String,String> map = new HashMap();
        map.put("start","1");
        map.put("page","5");
        Notice notice = restTemplate.getForObject("http://fantj.top/notice/list/"
                , Notice.class,map);
/** getForEntity()方法
 * 与getForObject()方法不同的是返回的是ResponseEntity对象，如果需要转换成pojo，还需要json工具类   * 的引入，这个按个人喜好用。不会解析json的可以百度FastJson或者Jackson等工具类。
 */
/**
 * POST请求
 */
@Test
public void rtPostObject(){
    RestTemplate restTemplate = new RestTemplate();
    String url = "http://47.xxx.xxx.96/register/checkEmail";
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    MultiValueMap<String, String> map= new LinkedMultiValueMap<>();
    map.add("email", "844072586@qq.com");
 
    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
    ResponseEntity<String> response = restTemplate.postForEntity( url, request , String.class );
    System.out.println(response.getBody());
}
/**
 * exchange 指定调用方式
 */
@Test
public void rtExchangeTest() throws JSONException {
    RestTemplate restTemplate = new RestTemplate();
    String url = "http://xxx.top/notice/list";
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("start",1);
    jsonObj.put("page",5);

    HttpEntity<String> entity = new HttpEntity<>(jsonObj.toString(), headers);
    ResponseEntity<JSONObject> exchange = restTemplate.exchange(url,
                                                                HttpMethod.GET, entity, JSONObject.class);
    System.out.println(exchange.getBody());
}
/**
 * excute 指定调用方式
 * excute()的用法与exchange()大同小异了，它同样可以指定不同的HttpMethod，不同的是它返回的对象是响应体所映射成的对象，而不是ResponseEntity。
 */
@Override
@Nullable
public <T> T postForObject(String url, @Nullable Object request, Class<T> responseType, Map<String, ?> uriVariables)
    throws RestClientException {

    RequestCallback requestCallback = httpEntityCallback(request, responseType);
    HttpMessageConverterExtractor<T> responseExtractor =
        new HttpMessageConverterExtractor<>(responseType, getMessageConverters(), logger);
    return execute(url, HttpMethod.POST, requestCallback, responseExtractor, uriVariables);
}
```

## ant构建

### 命令build.xml

```shell
build.xml的相关配置，参考  https://www.jianshu.com/p/89dc3485c7c7?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation


#执行
该参数在运行默认 build.xml 以外的构建文件时使用。
$ ant -build otherbuild.xml  [指定target]
-find
它将搜索生成文件，首先搜索当前目录，然后搜索父目录，直到找到该文件。
ant -find build.xml
-Dproperty
它有助于使用命令行设置属性值。属性是属性的名称，值是与属性关联的值。
ant -Dname = rahul  -build build.xml
```



### property详解

```xml
<project name="sfdcloud-env" basedir=".">
    读取环境变量
    <property environment="env"/>  
    <property name="maven.home" value="${env.MAVEN_HOME}/bin/mvn" />
    导入配置文件，后续可直接使用
    <property file="./omad/build.properties"/>   
    import 引入别的xml文件，提高复用性：
    <import file="./env-judge.xml"/>
	<import file="./tasks.xml"/>
    <!-- 初始化任务 --> 
    <target name="init"> 
    	<echo message=" init ${init} ..."/> 
    </target>
    <target name="compile" depends="init"> 
        <delete dir="${classes.dir}" /> 
        <mkdir dir="${classes.dir}" /> 
        <javac srcdir="${src.dir}" destdir="${classes.dir}"> 
        	<classpath refid="master-classpath" /> 
        </javac> 
    </target> 
    if：当属性设置时才执行该任务。
    <target name="sync_module_k12_teach" if="${is_k12_teach}">
        执行某个定义的任务。
        <antcall target="sync_module_item">
            <param name="html.dir" value="org"/>
        </antcall>
    </target>
</project>
project
每个构建文件都有一个project标签，有以下属性：
- default：表示默认的运行目标  deploy 
- basedir：表示项目的基准目录。
- name：表示项目名。
- description：表示项目的描述。

delete
删除文件或文件目录，有如下属性
- file：删除文件
- dir：删除目录
- includeEmptyDirs：值得是否删除空目录，默认是true
- failonerror：报错是否停止，默认是true
- verbose：是否列出删除的文件，默认是false

mkdir
创建一个目录
<mkdir dir=”＄{class.root}”/>

copy
拷贝文件或文件目录，属性如下：
- file:表示源文件。
- tofile:表示目标文件。
- todir:表示目标目录。
- overwrite:是否覆盖目标文件，默认为false。
- includeEmptyDirs:是否拷贝空目录，默认为true。
- failonerror:如目标没有发现是否自动停止，默认值true。
- verbose:是否显示详细信息，默认值false。
<copy todir="${compress.dir}" overwrite="true">
   
fileset
文件集标签，通常与任务结合来使用，例如上面的copy的demo中，通过将fileset定义的文件路径下的文件，拷贝到todir指定的路径中。
也可以用于批量删除：
<delete includeemptydirs="true">
<fileset dir="${basedir}/src/html" >
    <include name="**/module-*/**"/>
</fileset>
    antcall
执行某个定义的任务。
    parallel
并行执行多个子任务
<parallel failonany="true">
	<antcall target="sync_module_corp"/>
</parallel>
    
equils：指定属性是否相等：
<condition property="scondition">
<!--如果arg1的值与arg2的值相等返回true，否则为false-->
<equals arg1="${name}" arg2="this is name"/>
</condition>
    
    
exec
用来执行系统命令，或者指定环境的命令。
比如：
<exec executable="${maven.home}">
    <arg value="clean"/>
    <arg value="package"/>
    <arg value="-DSkipTests"/>
    <arg value="-P${model}"/>
</exec>

```







------

## MAVEN

### 部署maven

```shell
# 配置java环境变量
export JAVA_HOME=/usr/local/jdk
export PATH=$PATH:$JAVA_HOME/bin

# 配置maven环境变量
export MAVEN_HOME=/usr/local/maven
export PATH=$PATH:$MAVEN_HOME/bin
```



### POM配置私服maven地址

### Nexus搭建私有仓库

Nexus的type说明

| type    | 具体说明                                                     |
| :------ | :----------------------------------------------------------- |
| hosted  | 宿主仓库：主要用于部署无法从公共仓库获取的构件（如 oracle 的 JDBC 驱动）以及自己或第三方的项目构件 |
| proxy   | 代理仓库：代理公共的远程仓库                                 |
| virtual | 虚拟仓库：用于适配 Maven 1                                   |
| group   | 组类型，能够组合多个仓库为一个地址提供服务                   |

注意只有类型为hosted才可以上传jar包，其它都不行

pom的仓库配置

```xml
<repositories>
    <repository>
        <id>nexus</id>
        <url>http://nexus.company.com/repository/maven-public/</url>
        <releases>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
            <checksumPolicy>warn</checksumPolicy>
        </releases>
        <snapshots>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
            <checksumPolicy>warn</checksumPolicy>
        </snapshots>
    </repository>
</repositories>
<distributionManagement>
    <repository>
        <!--id的名字可以任意取，但是在setting文件中的属性<server>的ID与这里一致-->
        <id>releases</id>
        <!--指向仓库类型为host(宿主仓库）的储存类型为Release的仓库-->
        <url>http://47.96.4.110:8081/repository/java-release/</url>
    </repository>
    <snapshotRepository>
        <id>snapshots</id>
        <!--指向仓库类型为host(宿主仓库）的储存类型为Snapshot的仓库-->
        <url>http://47.96.4.110:8081/repository/java-snapshot/</url>
    </snapshotRepository>
</distributionManagement>

```

#maven的conf的setting.xml文件设置

```xml
<!--此处设置的用户名和密码都是nexus的登陆配置-->
 <servers>
     <server>
         <id>releases</id>  <!--对应pom.xml的id=releases的仓库-->
         <username>xuxiaoxiao</username>
         <password>xuxiaoxiao123</password>
     </server>
     <server>
         <id>snapshots</id> <!--对应pom.xml中id=snapshots的仓库-->
         <username>xuxiaoxiao</username>
         <password>xuxiaoxiao123</password>
     </server>
</servers>
```

##### 在项目所在文件夹根目录使用maven命令打包时：

```
<!--安装到本地仓库 不执行单元测试，也不编译测试类 -->
mvn install -Dmaven.test.skip=true

```

或

```xml
<!--不执行单元测试，但会编译测试类，并在target/test-classes目录下生成相应的class -->
mvn install -DskipTests=true
<!--不执行测试用例，但编译测试用例类生成相应的class文件至target/test-classes下。 -->
mvn clean package -DskipTests -U  //删除再打包，跳过测试 --常用
<!--指定环境 增加 -P test 例：mvn clean package -DskipTests -U -P prod -->

mvn package   // 生成target目录，编译、测试代码，生成测试报告，生成jar/war文件
<!-- -U 强制刷新本地仓库不存在release版和所有的snapshots版本。-->
<!--清空本地仓库的命令-->
mvn dependency:purge-local-repository
<!--查看jar包之间的依赖-->
mvn dependency:tree -U
mvn dependency:tree -U -f notary-cloud-provider-order/pom.xml
```

##### Maven父pom和子pom的版本号一并批量修改

```xml
Maven Release Plugin插件
1 设置新的版本号
mvn versions:set -DnewVersion=1.0.3-SNAPSHOT
2 撤销设置
mvn versions:revert
3 提交设置
mvn versions:commit

Versions Maven Plugin插件
mvn release:update-versions -DdevelopmentVersion=3.7.2-SNAPSHOT


//发布版本，添加tag
- mvn -DdevelopmentVersion=3.2.0-SNAPSHOT -DreleaseVersion=3.1.0 -Dresume=false -DignoreSnapshots=true -B release:prepare

//mvn release:prepare 发版本
//mvn release:rollback 回滚命令
//mvn release:clean 清除宏文件
//mvn release:perform 执行发布
```

#### Maven打包指定模块

```cmd
mvn clean package -pl lzmh-modules/lzmh-app -am -DskipTests
## 参数说明
-pl  选项后可跟随{groupId}:{artifactId}或者所选模块的相对路径(多个模块以逗号分隔)
-am  表示同时处理选定模块所依赖的模块
-amd  表示同时处理依赖选定模块的模块
-N   表示不递归子模块
-rf  表示从指定模块开始继续处理

##mvn 命令自定义 setting 配置文件
mvn -s "D:\program\maven-3.6.3\maven3\conf\settings.xml" clean install
```



#### Maven的脚本

```
<!-- 发布到私服 -->
mvn clean deploy -X -Dmaven.test.skip=true

如果想发布到snapshot仓库中，则需要在版本号后加上-SNAPSHOT(注意这里必须是大写)
snapshot快照库和release发布库
我们在开发阶段，可以将公用库的版本设置为快照版本，而被依赖组件则引用快照版本进行开发，在公用库的快照版本更新后，我们也不需要修改pom文件提示版本号来下载新的版本，直接mvn执行相关编译、打包命令即可重新下载最新的快照库了，从而也方便了我们进行开发。
```



```xml
发布到指定仓库
mvn deploy:deploy-file -DgroupId=com.xy.oracle -DartifactId=ojdbc14 -Dversion=10.2.0.4.0 -Dpackaging=jar -Dfile=E:\ojdbc14.jar -Durl=http://127.0.0.1:8081/nexus/content/repositories/thirdparty/ -DrepositoryId=thirdparty
```

#### Maven的packaging打包类型

```xml
当其项目属于父级项目时，要将其设置<packaging>pom</packaging>

<packaging>pom</packaging>
packing默认是jar类型，
pom ---------> 父类型都为pom类型
jar ---------> 内部调用或者是作服务使用（一般只有class编译后文件）
war ---------> 需要部署的项目（war是一个web模块，其中需要包括WEB-INF）
```

#### Maven引入lib下的外部jar包

```xml
<!--引入 lib下面的外部jar包 -->
<dependency>
    <groupId>djnativeswing</groupId>
    <artifactId>djnativeswing</artifactId>
    <version>1.0.2</version> <!--版本号随便写 -->
    <scope>system</scope>
    <systemPath>${pom.basedir}/src/lib/djnativeswing.jar</systemPath>
</dependency>
```

##### Maven打包找不到lib目录 

```xml
<plugin>
	 <groupId>org.apache.maven.plugins</groupId>
	  <artifactId>maven-compiler-plugin</artifactId>
	  <version>${maven.compiler.version}</version>
	  <configuration>
	      <!--设置编译时使用的 JDK 版本-->
	      <source>${java.version}</source>
	      <!--设置运行时使用的 JDK 版本-->
	      <target>${java.version}</target>
          <encoding>UTF-8</encoding>
	      <!--设置为 true 则跳过测试-->
	      <skip>true</skip>
	      <!--增加内容,需要打包的jar路径-->
	      <compilerArguments>
	          <extdirs>${pom.basedir}/src/lib</extdirs>
	      </compilerArguments>
	  </configuration>
</plugin> 

##第二种
<build>
 	<!-- 增加内容 -->
	 <resources>
	       <resource>
	            <!--需要打包的jar路径-->
	            <directory>src/lib</directory>
	              <!--复制到的路径-->
	            <targetPath>BOOT-INF/lib/</targetPath>
	            <includes>
	                <include>**/*.jar</include>
	            </includes>
	        </resource>
	  </resources>
  </build> 
```



#### Maven的scm配置git

* https://my.oschina.net/u/3744526/blog/4673956

```xml
<scm>#git项目地址可以用SSH  也可以用 HTTPS的          <connection>scm:git:http://10.69.205.31:8886/mazhenbang/maven_scm.git</connection>    #git项目地址可以用SSH  也可以用 HTTPS的    <developerConnection>scm:git:http://10.69.205.31:8886/mazhenbang/maven_scm.git</developerConnection>
    #git项目浏览器里的地址  <url>http://10.69.205.31:8886/mazhenbang/maven_scm/tree/master</url>
</scm>
#不要忘记加distributionManagement 否则发布不上去
```

#### maven中依赖scope运行

```
compile:默认值，表示当前依赖包，要参与当前项目的编译，后续测试，运行时，打包
provided:代表在编译和测试的时候用，运行，打包的时候不会打包进去
test：表示当前依赖包只参与测试时的工作：比如Junit,只在test目录生效
runtime：表示当前依赖包只参与运行周期，其他跳过了
system：从参与度和provided一致，不过被依赖项不会从maven远程仓库下载，而是从本地的系统拿。需要systemPath属性来定义路径
#特殊
import 只能用在dependencyManagement块中，它将spring-boot-dependencies 中dependencyManagement下的dependencies插入到当前工程的dependencyManagement中，所以不存在依赖传递。 
当没有<scope>import</scope>时，意思是将spring-boot-dependencies 的dependencies全部插入到当前工程的dependencies中，并且会依赖传递。
```

#### maven依赖option的传递性ABC

```xml
3.传递性依赖
直接依赖和间接依赖
A依赖B，B依赖C。当前项目为A，只当B在A项目中的scope，那么c在A中的scope是如何得知呢？

当C是test或者provided时，C直接被丢弃，A不依赖C；（排除传递依赖）

否则A依赖C，C的scope继承与B的scope。maven会解析各个依赖的pom，将那些必要的间接依赖，一传递性依赖的形式引入到当前的项目中。


<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <optional>true</optional>
</dependency>

当C有<optional>true</optional>  A不依赖C ,需要A再单独引入


依赖原则
依赖原则目的：防止jar包的冲突
为了避免造成依赖重复，需要选择一个依赖路径

2.2.1、路径最短优先原则
即优先选择传递路径最短的依赖包

2.2.2、路径长度相同
路径长度相同的情况下，又可以分为是否有在同一个pom.xml两种情况

覆盖
如果在同一pom.xml文件中有2个相同的依赖；后面声明的会覆盖前面的依赖
但这里要说严禁使用本情况，严禁在同一个pom中声明两个不同的依赖
优先
如果是在不同pom.xml中有2个相同的依赖；则先声明的依赖，会覆盖后面声明的依赖
```



#### maven的project内置属性

```xml
Maven的六类属性，${project.basedir}，${project.build.directory}

${project.build.sourceDirectory}：项目的主源码目录，默认为 src/main/java

${project.build.testSourceDirectory}：项目的测试源码目录，默认为 src/test/java

${project.build.directory}：项目构件输出目录，默认为 target/

${project.outputDirectory}：项目主代码编译输出目录，默认为 target/classes/

${project.testOutputDirectory}：项目测试代码编译输出目录，默认为 target/test-classes/

${project.groupId}：项目的 groupId

${project.artifactId}：项目的 artifactId

p r o j e c t . v e r s i o n ： 项 目 的 v e r s i o n ， 与 {project.version}：项目的 version，与project.version：项目的version，与{version}等价

p r o j e c t . b u i l d . f i a n l N a m e ： 项 目 打 包 输 出 文 件 的 名 称 。 默 认 为 {project.build.fianlName}：项目打包输出文件的名称。默认为project.build.fianlName：项目打包输出文件的名称。默认为{project.artifactId}-${project.version}
```

* 设置编码格式

 ```xml
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <!-- 打包跳过自动运行junit test -->
    <skipTests>true</skipTests>
</properties>
 ```

 * 设置打包可读的源码
 ```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-source-plugin</artifactId>
  <executions>
    <execution>
      <id>attach-sources</id>
      <goals>
        <goal>jar</goal>
      </goals>
    </execution>
  </executions>
</plugin>
 ```

* mvn

```xml
maven 默认的打包类型为 jar，
在项目聚合的时候，需要显式的将 父项目的 packing 指定为 pom，
然后再指定所属的子模块，如下所示
<packing>pom</packing>
<modules>
       <module>kern-base</module>
       <module>kern-dao</module>
       <module>kern-service</module>
       <module>kern-control</module>
</modules>
如果没有将packing 指定为pom ，那么子模块之间将无法正常的进行依赖传递。
我们执行的maven命令的时候将首先对父项目执行，而后当 父项目 的packing 类型为 pom 时，将对所有的子模块执行同样的命令，否则将无法执行同样的命令，那么依赖的传递将无法由maven 编译或者打包命令 得以执行。
```

#### mvn的build 仓库配置

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.6.1</version>
            <configuration>
                <source>1.8</source>
                <target>1.8</target>
                <encoding>UTF-8</encoding>
                <optimize>true</optimize>
                <showDeprecation>true</showDeprecation>
                <showWarnings>true</showWarnings>
                <compilerArgument>-Xlint:all,-serial,-path,-rawtypes,-unchecked</compilerArgument>
                <!-- 跳过test测试目录-->
                <skip>true</skip>
            </configuration>
        </plugin>
    </plugins>
   #打包名
    <finalName>${project.name}</finalName>
   #静态文件的打包
    <resources>
        <resource>
            <directory>src/main/resources</directory>
            <includes>
                <!-- 此处设置打成jar包后保留的静态资源文件 .txt .xml等-->
                <include>**/*.md</include>
            </includes>
        </resource>
    </resources>
</build>
#需要package打包发到私服时，配置私服仓库
然后在本地maven的settings.xml中加入配置server id要一致
<!-- 使用分发管理将本项目打成jar包，直接上传到指定服务器 -->
<distributionManagement>
    <!--正式版本-->
    <repository>
        <!-- nexus服务器中用户名：在settings.xml中<server>的id-->
        <id>yang</id>
        <!-- 这个名称自己定义 -->
        <name>Release repository</name>
        <url>http://192.168.1.105:8081/repository/yang/</url>
    </repository>
	<!--快照
	<snapshotRepository>
		<id>nexus-snapshots</id>
		<name>Snapshots repository</name>
		<url>http://192.168.1.105/repository/yang/</url>
	</snapshotRepository>-->
</distributionManagement>
```

#### mvn deploy命令jar或者pom文件发到私服

```shell
#实际执行的时候都在同一行，也不要多空格，在pom的根目录下执行
mvn deploy:deploy-file 
-Dfile=jar包 
-Dmaven.test.skip=true  
-DgroupId=groupID 
-DartifactId=artifacid 
-Dversion=版本号 
-Dpackaging=jar 此处可以是pom或者jar
-Durl=http://ip:port/nexus/content/repositories/thirdparty/ 
-DrepositoryId=nexus 指定仓库
这个是为了避免打包多时间戳
-DuseUniqueVersions=false

说明：DrepositoryId : 身份信息。可能是maven的setting.xml里，注意<server>的配置
```

**备注： 注意不要换行和多余空格**

```shell
mvn install:install-file 
-Dfile=D:\\asciidoctorj-pdf-1.5.0-alpha-zh.16.jar 
-DgroupId=org.asciidoctor 
-DartifactId=asciidoctorj-pdf 
-Dversion=1.5.0-alpha-zh.16 
-Dpackaging=jar
--------
然后再执行 mvn install

```

**用Maven属性渲染application.yml**

在pom文件build中配置

```xml
<build>
    <resources>
      <resource>
        <directory>src/main/resources</directory>
        <includes>
          <include>**/*</include>
        </includes>
        <filtering>true</filtering>
      </resource>
    </resources>
</build>

```

```xml
deploy去掉时间戳
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-war-plugin</artifactId>
    <version>3.1.0</version>
    <configuration>
        <archive>
            <manifest>
                <useUniqueVersions>false</useUniqueVersions>
            </manifest>
        </archive>
    </configuration>
</plugin>
```

#### mvn构建的配置

```xml
<build>

    <!-- 产生的构件的文件名，默认值是${artifactId}-${version}。 --> 
    <finalName>myPorjectName</finalName> 

    <!-- 构建产生的所有文件存放的目录,默认为${basedir}/target，即项目根目录下的target --> 
    <directory>${basedir}/target</directory> 
    
    <!-- 当项目没有规定目标（Maven2 叫做阶段（phase））时的默认值，
        必须跟命令行上的参数相同例如jar:jar，或者与某个阶段（phase）相同例如install、compile等 --> 
    <defaultGoal>install</defaultGoal>
        
    <!-- 当filtering开关打开时，使用到的过滤器属性文件列表。
        项目配置信息中诸如${spring.version}之类的占位符会被属性文件中的实际值替换掉 --> 
    <filters>
            <filter>../filter.properties</filter>
    </filters> 
    
    <!-- 项目相关的所有资源路径列表，例如和项目相关的配置文件、属性文件，这些资源被包含在最终的打包文件里。 --> 
    <resources> 
        <resource> 
        
            <!-- 描述了资源的目标路径。该路径相对target/classes目录（例如${project.build.outputDirectory}）。
            举个例子，如果你想资源在特定的包里(org.apache.maven.messages)，你就必须该元素设置为org/apache/maven/messages。
            然而，如果你只是想把资源放到源码目录结构里，就不需要该配置。 --> 
            <targetPath>resources</targetPath> 
            
            <!-- 是否使用参数值代替参数名。参数值取自properties元素或者文件里配置的属性，文件在filters元素里列出。 --> 
            <filtering>true</filtering> 
            
            <!-- 描述存放资源的目录，该路径相对POM路径 --> 
            <directory>src/main/resources</directory> 
            
            <!-- 包含的模式列表 --> 
            <includes>  
                <include>**/*.properties</include>  
                <include>**/*.xml</include>  
            </includes>  
            
            <!-- 排除的模式列表
                如果<include>与<exclude>划定的范围存在冲突，以<exclude>为准 --> 
            <excludes>  
                <exclude>jdbc.properties</exclude>  
                </excludes> 
        
        </resource> 
    </resources> 
    
    <!-- 单元测试相关的所有资源路径，配制方法与resources类似--> 
    <testResources> 
        <testResource> 
            <targetPath /><filtering /><directory /><includes /><excludes /> 
        </testResource> 
    </testResources> 
    
    <!-- 项目源码目录，当构建项目的时候，构建系统会编译目录里的源码。该路径是相对于pom.xml的相对路径。 --> 
    <sourceDirectory>${basedir}\src\main\java</sourceDirectory> 
    
    <!-- 项目脚本源码目录，该目录和源码目录不同，
        绝大多数情况下，该目录下的内容会被拷贝到输出目录(因为脚本是被解释的，而不是被编译的)。 --> 
    <scriptSourceDirectory>${basedir}\src\main\scripts</scriptSourceDirectory>
    
    <!-- 项目单元测试使用的源码目录，当测试项目的时候，构建系统会编译目录里的源码。该路径是相对于pom.xml的相对路径。 --> 
    <testSourceDirectory>${basedir}\src\test\java</testSourceDirectory>
    
    <!-- 被编译过的应用程序class文件存放的目录。 --> 
    <outputDirectory>${basedir}\target\classes</outputDirectory>
    
    <!-- 被编译过的测试class文件存放的目录。 --> 
    <testOutputDirectory>${basedir}\target\test-classes</testOutputDirectory> 
    
    <!-- 项目的一系列构建扩展,它们是一系列build过程中要使用的产品，会包含在running bulid‘s classpath里面。
        他们可以开启extensions，也可以通过提供条件来激活plugins。
        简单来讲，extensions是在build过程被激活的产品--> 
    <extensions> 
    
        <!-- 例如，通常情况下，程序开发完成后部署到线上Linux服务器，可能需要经历打包、
            将包文件传到服务器、SSH连上服务器、敲命令启动程序等一系列繁琐的步骤。
            实际上这些步骤都可以通过Maven的一个插件 wagon-maven-plugin 来自动完成
            下面的扩展插件wagon-ssh用于通过SSH的方式连接远程服务器，
            类似的还有支持ftp方式的wagon-ftp插件 --> 
        <extension> 
            <groupId>org.apache.maven.wagon</groupId>
            <artifactId>wagon-ssh</artifactId>
            <version>2.8</version>
        </extension> 
    
    </extensions> 

    <!-- 使用的插件列表 。 --> 
    <plugins> 
        <plugin> 
            <groupId></groupId>
            <artifactId>maven-assembly-plugin</artifactId>
            <version>2.5.5</version>
            
            <!-- 在构建生命周期中执行一组目标的配置。每个目标可能有不同的配置。 --> 
            <executions>
                <execution>
                
                        <!-- 执行目标的标识符，用于标识构建过程中的目标，或者匹配继承过程中需要合并的执行目标 --> 
                    <id>assembly</id>
                    
                    <!-- 绑定了目标的构建生命周期阶段，如果省略，目标会被绑定到源数据里配置的默认阶段 --> 
                    <phase>package</phase>
                    
                    <!-- 配置的执行目标 --> 
                    <goals>
                        <goal>single</goal>
                    </goals>
                    
                    <!-- 配置是否被传播到子POM --> 
                    <inherited>false</inherited> 
                    
                </execution>
            </executions>
            
            <!-- 作为DOM对象的配置,配置项因插件而异 -->
            <configuration>
                <finalName>${finalName}</finalName>
                <appendAssemblyId>false</appendAssemblyId>
                <descriptor>assembly.xml</descriptor>
            </configuration>
        
            <!-- 是否从该插件下载Maven扩展（例如打包和类型处理器），
                由于性能原因，只有在真需要下载时，该元素才被设置成true。 --> 
            <extensions>false</extensions> 
            
            <!-- 项目引入插件所需要的额外依赖 --> 
            <dependencies> 
                <dependency>...</dependency> 
            </dependencies> 
            
            <!-- 任何配置是否被传播到子项目 --> 
            <inherited>true</inherited>
        
        </plugin> 
    </plugins> 
 
    <!-- 主要定义插件的共同元素、扩展元素集合，类似于dependencyManagement，
        所有继承于此项目的子项目都能使用。该插件配置项直到被引用时才会被解析或绑定到生命周期。
        给定插件的任何本地配置都会覆盖这里的配置 --> 
    <pluginManagement> 
        <plugins>...</plugins>
    </pluginManagement>
    
</build>
```

#### springboot-web项目打包必须

```xml
## springboot打包必须要有spring-boot-maven-plugin 、 其它依赖包则不需要
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <executions>
                <execution>
                    <goals>
                        <goal>repackage</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```



#### java打包项目的配置

src/main/java下的默认只打包java文件，如果想打包xml文件，则加如下配置

```xml
#pom.xml
<build>
    <!-- 资源目录 -->    
    <resources>    
        <resource>    
            <!-- 设定主资源目录  -->    
            <directory>src/main/java</directory>    
            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，只处理如下配置中包含的资源类型 -->     
            <includes>
                <include>**/*.xml</include>
            </includes>  
            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，不处理如下配置中包含的资源类型（剔除下如下配置中包含的资源类型）-->      
            <excludes>  
                <exclude>**/*.yaml</exclude>  
            </excludes>  
<!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，指定处理后的资源文件输出目录，默认是${build.outputDirectory}指定的目录-->      
            <!--<targetPath>${build.outputDirectory}</targetPath> -->      
            <!-- maven default生命周期，process-resources阶段执行maven-resources-plugin插件的resources目标处理主资源目下的资源文件时，是否对主资源目录开启资源过滤 -->    
            <filtering>true</filtering>     
        </resource>  			
    </resources> 	
</build>
```

##### springboot的demo例子

```xml
 <build>
     <finalName>${project.name}</finalName>
     <resources>
         <resource>
             <directory>src/main/resources</directory>
             <filtering>true</filtering>
         </resource>
     </resources>

     <pluginManagement>
         <plugins>
             <plugin>
                 <groupId>org.springframework.boot</groupId>
                 <artifactId>spring-boot-maven-plugin</artifactId>
                 <version>2.5.4</version>
             </plugin>
         </plugins>
     </pluginManagement>

     <plugins>
         <plugin>
             <groupId>org.apache.maven.plugins</groupId>
             <artifactId>maven-compiler-plugin</artifactId>
             <version>${maven-compiler.version:##3.8.1}</version>
             <configuration>
                 <source>${java.version}</source>
                 <target>${java.version}</target>
                 <encoding>${project.build.sourceEncoding}</encoding>
                 <skip>true</skip>
             </configuration>
         </plugin>
     </plugins>
</build>
```



##### 默认resources目录下的文件都会被打包

如果想resources目录下的xml文件不被打包，可通过如下配置:

```html
<!--过滤resource下的文件-->
	<resources>  
        <resource>  
            <directory>src/main/resources</directory>  
            <includes>  
                <include>*.properties</include>  <!--打包properties文件-->
            </includes>  
            <excludes>  
                <exclude>*.xml</exclude>  <!--过滤xml与yaml文件-->
                <exclude>*.yaml</exclude>  
            </excludes>  
        </resource>  
```

插件完成

```xml
<build>
    <plugin>  
        <artifactId>maven-resources-plugin</artifactId>  
        <executions>  
            <execution>  
                <id>copy-resources</id>  
                <phase>validate</phase>  
                <goals>  
                    <goal>copy-resources</goal>  
                </goals>  
                <configuration>  
<!-- 并把文件复制到target/conf目录下-->
                    <outputDirectory>${project.build.directory}/conf</outputDirectory>  
                    <resources>  
                        <resource>  
                            <directory>src/main/resources</directory>  
<!-- 指定不需要处理的资源 <excludes> <exclude>WEB-INF/*.*</exclude> </excludes> -->  
							<excludes> <exclude>**/*.xml</exclude> </excludes>
                            <filtering>true</filtering>  
                        </resource>  
                    </resources>  
                </configuration>  
            </execution>  
        </executions> 
    </plugin> 
</build>build>
```



##### pluginManagement说明

假如存在两个项目，项目A为项目B的父项目，其关系通过pom文件的关系确定。项目A的父pom文件片段如下：

```xml
<build>
<pluginManagement>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-source-plugin</artifactId>
            <version>3.2.1</version>
            <configuration>
                <attach>true</attach>
            </configuration>
            <executions>
                <execution>
                    <phase>compile</phase>
                    <goals>
                        <goal>jar</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</pluginManagement>
</build>
```

如果项目B也想使用该plugin配置，则在项目B的子pom文件中只需要如下配置：

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-source-plugin</artifactId>
    </plugin>
</plugins>
```

##### jar解压

```shell
打包成tar.gz格式压缩包
# tar -zcvf renwolesshel.tar.gz /renwolesshel
解压tar.gz格式压缩包
# tar zxvf renwolesshel.tar.gz
.war
解压
#jar -xvf file.war
重新打包
#jar -cvfM0 file2.war <目标目录>
参数说明
-c  创建war包
-v  显示过程信息
-f  指定 JAR 文件名，通常这个参数是必须的
-M  不产生所有项的清单（MANIFEST〕文件，此参数会忽略 -m 参数
-0  这个是阿拉伯数字，只打包不压缩的意思

jar命令格式：jar {c t x u f }[ v m e 0 M i ][-C 目录]文件名...
其中{ctxu}这四个参数必须选其一。[v f m e 0 M i ]是可选参数，文件名也是必须的。
-c  创建一个jar包
-t 显示jar中的内容列表
-x 解压jar包
-u 添加文件到jar包中
-f 指定jar包的文件名
-v  生成详细的报造，并输出至标准设备
-m 指定manifest.mf文件.(manifest.mf文件中可以对jar包及其中的内容作一些一设置)
-0 产生jar包时不对其中的内容进行压缩处理
-M 不产生所有文件的清单文件(Manifest.mf)。这个参数与忽略掉-m参数的设置
-i    为指定的jar文件创建索引文件
-C 表示转到相应的目录下执行jar命令,相当于cd到那个目录，然后不带-C执行jar命令

 
————————————————
版权声明：本文为CSDN博主「Angy__」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_39896810/article/details/81316879

#解压到指定目录
unzip pay.war -d /home/zookeeper1/test/pay
```

##### 后台运行启动jar

```shell
#nohup 指后台运行  > /dev/null 2>&1 & 表示不打印日志
# 指定输出文件可以用 > out.log > 2>&1 &  
nohup $JRE_HOME/bin/java -Xms512m -Xmx1024m -jar $JAR_NAME --spring.profiles.active=common-pro,pro --dubbo.protocol.port=20666 --server.port=7671 --dubbo.service.shutdown.wait=180000 --dubbo.registry.file=/home/zxsl/online_dubbox/operation-online-service/20666/dubbo-registry.properties >/dev/null 2>&1 &  

nohup java -jar cloud-upgrade.jar --spring.profiles.active=prod -Dcatalina.base=/usr/local/tomcat8/tomcatcloudplatform &>> /dev/null &


#简单启动
nohup java -jar xxx.jar > msg.log  2>&1 &
```

##### java启动命令中-D和--的区别

```shell
#在 SpringBoot 项目中，启动时，通过 -D 或 -- 添加参数，都可以直接覆盖 yml 或 properties 配置文件中的同名配置，如果不存在则相当于添加了一个配置
java -Dserver.port=1234 这种方式添加的参数是 jvm 的一些属性。
java --server.port=1234 这种方式添加的参数是操作系统的 环境变量

System.getPorperties("server.port"); //java -D 添加的参数方式获取
System.getEnv("server.port");  // java -- 添加的参数方式获取
#参数
注意： -D 要放到 -jar 前面，否则参数无效。 -- 要放到 jar 包后面，否则报错。
```



### archetype脚手架生成

```xml
##样例根目录配置自定义archetype
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-archetype-plugin</artifactId>
    <version>xxx</version>
    <configuration>
    	<addDefaultExcludes>false</addDefaultExcludes>
    </configuration>
</plugin>

```

默认会有的一些变量

| ${rootArtifactId}      | 它保存用户输入的值作为项目名（maven在用户运行原型时在提示符中询问为artifactid:的值） |
| ---------------------- | ------------------------------------------------------------ |
| ${artifactId}          | 如果您的项目由一个模块组成，则此变量的值将与${rootArtifactId}相同，但如果项目包含多个模块，则此变量将由每个模块文件夹中的模块名替换 |
| ${package}             | 用户为项目提供的包，也在用户运行原型时由maven提示            |
| ${packageInPathFormat} | 与${package}变量的值相同，但将“.”替换为字符“/”，例如：，对于包com.foo.bar，此变量为com/foo/bar |
| ${groupId}             | 用户为项目提供的groupid，在用户运行原型时由maven提示         |
| ${version}             | 版本号                                                       |

```cmd
mvn archetype:create-from-project  //生成脚手架，在target/目录下
```

* 生成文件后主要编写  archetype-metadata.xml 文件

  自定义变量（需要在test/resources/projects/archetype.properties里配置自定义参数）

  ```xml
  <requiredProperties>
      <requiredProperty key="groupId">
          <defaultValue>com.thebeastshop</defaultValue>
      </requiredProperty>
      <requiredProperty key="artifactId">
          <defaultValue>test</defaultValue>
      </requiredProperty>
      <requiredProperty key="package">
          <defaultValue>com.thebeastshop.test</defaultValue>
      </requiredProperty>
  </requiredProperties>
  ```

  去替换文件中的内容，路径中的参数是双下划线_*参数名*_，文件内部的参数是${参数名}

  ```xml
  一般xml文件、java文件模板会自动替换占位符，另外有一些自定义文件，模板不会识别，比如sh脚本、md文件等，我们以Dockerfile为例(随便自己定义个文件也行)，在archetype-metadata.xml写<fileSets>
  <fileSets>
      <!-- 写进模板，但不替换占位符的，不设置 filtered="true"即可-->
      <!-- 写进模板，要替换的占位符的，filtered="true"-->
      <fileSet encoding="UTF-8" filtered="true">
          <directory></directory>
          <includes>
              <include>Dockerfile</include>
              <include>README.md</include>
          </includes>
      </fileSet>
  </fileSets>
  
  ```

* 通过`mvn clean install `命令把该jar包安装到本地仓库

  然后会在 maven 仓库（repository）中生成脚手架的配置文件： archetype_catelog.xml

* 生成一个项目看看效果，使用以下命令：

```cmd
mvn archetype:generate
-DgroupId=com.example         #新建项目的工程名
-DartifactId=projectname           #要创建的项目名称
-Dversion=1.0-SNAPSHOT              #要创建的项目的版本号
-Dpackage=com.tianjingle.wang         #要创建的项目的基础包名

-DarchetypeGroupId=com.example         #./m2下的xml里的
-DarchetypeArtifactId=fccdemo1-archetype   #./m2下的xml里的
-DarchetypeVersion=1.0-SNAPSHOT     #./m2下的xml里的
-B
-DarchetypeCatalog=local               #从本地仓库选取模板
-DinteractiveMode=false

使用-B参数：该参数表示让Maven使用批处理模式构建项目，能够避免一些需要人工参与交互而造成的挂起状态。
使用-X参数：开启DEBUG模式
```



### maven的插件记录

```xml
####https://github.com:apache/rocketmq-dashboard.git的插件记录

https://blog.csdn.net/who7708/article/details/113115238

maven-compiler-plugin  maven项目的打包插件
frontend-maven-plugin  前后端一键打包
maven-checkstyle-plugin  检测代码风格规范
maven-jxr-plugin   生成java代码交叉引用和源代码的html格式
findbugs-maven-plugin  FindBugs是一个分析工具，查找不容易发现的bug
docker-maven-plugin   打包docker镜像推送仓库
spring-boot-maven-plugin  springboot的maven打包插件
jacoco-maven-plugin    生成单元测试覆盖率报告  可以查看seata的开源示例
coveralls-maven-plugin 提交代码覆盖率报告到 Coveralls web服务 
apache-rat-plugin    对授权文件的校验审核工具。
maven-antrun-plugin  可以在Maven执行时,额外执行Ant脚本
maven-compiler-plugin 编译Java源码的插件。
maven-javadoc-plugin  javadoc 生成
maven-source-plugin  源码打包
maven-surefire-plugin 执行测试用例的插件

```

#### 源码打包

```xml
<!-- 开源的意义 打包生成源码和doc -->
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-source-plugin</artifactId>
            <version>3.2.1</version>
            <executions>
                <execution>
                    <id>attach-sources</id>
                    <phase>verify</phase>
                    <goals>
                        <goal>jar-no-fork</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
        <!-- Javadoc -->
      <!--<plugin>-->
        <!--<groupId>org.apache.maven.plugins</groupId>-->
        <!--<artifactId>maven-javadoc-plugin</artifactId>-->
        <!--<version>3.2.1</version>-->
        <!--<executions>-->
          <!--<execution>-->
            <!--<phase>package</phase>-->
            <!--<goals>-->
              <!--<goal>jar</goal>-->
            <!--</goals>-->
          <!--</execution>-->
        <!--</executions>-->
      <!--</plugin>-->
    </plugins>
</build>
```



------

## JenKins项目管理工具

* 安装BlueOcean插件的界面更美观 https://blog.csdn.net/fly910905/article/details/80331830

#### SHELL语法参数化脚本构建

1、dubbo的shell脚本

```shell
rm -f /root/.m2/repository/com/online/notary/online-service-api/1.0.0/online-service-api-1.0.0.jar
rm -f /root/.m2/repository/com/online/notary/online-common/1.0.0/online-common-1.0.0.jar
cp /root/.jenkins/workspace/测试环境-在线受理-项目/online-common/target/online-common-1.0.0.jar /root/.m2/repository/com/online/notary/online-common/1.0.0/
cp /root/.jenkins/workspace/测试环境-在线受理-项目/online-service-api/target/online-service-api-1.0.0.jar /root/.m2/repository/com/online/notary/online-service-api/1.0.0/

```

```shell
docker服务器
如有参数脚本执行命令： startup.sh conumer-order 18022
#! /bin/sh 文件名startup.sh
serviceName=$1
port=$2
containerId=`docker ps -a|grep $serviceName|awk '{print $1}'`
echo $containerId
if [ $containerId ]; then
     docker stop $containerId
	 docker rm $containerId
fi

docker run  -it -v  /usr/share/fonts:/usr/share/fonts  -d -p  $port:8080 --name $serviceName -m 1280M --env SKYWALKING_COLLECTOR_ARRE="192.168.88.116:11800" --env PROFILES_ACTIVE="test" --env SERVER_HOST="192.168.88.115" --env SERVER_PORT="$port" `docker images |grep $serviceName |awk '{print $2,$3}' |grep latest|awk '{print $2}'`
/*********这条是vue的脚本构建***********/
docker run  -d -p $port:8080 --name $serviceName  `docker images |grep $serviceName |awk '{print $2,$3}' |grep latest|awk '{print $2}'`  

```

###### docker启动的命令详解

```sh
-v 本地目录:容器目录。挂载主机的本地目录 /usr/ToolsAPIDir 目录到容器的/ToolsAPIDir1 目录，本地目录的路径必须是绝对路径
-a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项；
-d: 后台运行容器，并返回容器ID；
-i: 以交互模式运行容器，通常与 -t 同时使用；
-P: 随机端口映射，容器内部端口随机映射到主机的端口
-p: 指定端口映射，格式为：主机(宿主)端口:容器端口
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
-m :设置容器使用内存最大值；

-–name=“容器新名字”: 为容器指定一个名称；
--dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致；
--dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致；
-h "mars": 指定容器的hostname；
-e username="ritchie": 设置环境变量；
--env-file=[]: 从指定文件读入环境变量；
--cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行；
--net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型；
--link=[]: 添加链接到另一个容器；
--expose=[]: 开放一个端口或一组端口；
--volume , -v: 绑定一个卷
volumes：Docker管理宿主机文件系统的一部分，默认位于 /var/lib/docker/volumes 目录中；（最常用的方式）
```

```shell
# docker volume create edc-nginx-vol // 创建一个自定义容器卷
# docker volume ls // 查看所有容器卷
# docker volume inspect edc-nginx-vol // 查看指定容器卷详情信息
```

###### docker的例子

1、pom.xml添加docker打包插件

```
 <plugin>
	 <groupId>com.spotify</groupId>
	 <artifactId>dockerfile-maven-plugin</artifactId>
	 <version>1.3.6</version>
	 <configuration>
		 <repository>${project.artifactId}</repository>
		 <buildArgs>
	 		<JAR_FILE>target/${project.build.finalName}.jar</JAR_FILE>
		 </buildArgs>
	 </configuration>
 </plugin>
```

2、在src同级目录下创建Dockerfile

```dockerfile
FROM openjdk:8-jdk-alpine
或者FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-prometheus-java8
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

如服务的配置
FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-prometheus-openjdk
ADD target/${project.artifactId}-${project.version}.${project.packaging} ${project.artifactId}.${project.packaging}
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8080

EXPOSE 1234
ENTRYPOINT java -javaagent:/prometheus/${jmx_prometheus_javaagent.name}=1234:/prometheus/jmx_exporter.yaml -jar  -Xmx1024m -Dspring.profiles.active=${PROFILES_ACTIVE} -Dserver.port=8080 ${project.artifactId}.${project.packaging}
```

3、构建步骤

```
3.1 编译打包成jar包 mvn package -Dmaven.test.skip=true
3.2 将jar包打包成docker镜像：mvn dockerfile:build
```

4、运行命令：

```shell
docker run -d \
    -p 8001:8001 \
    -e "SPRING_PROFILES_ACTIVE=dev" \
    --name auth \
    -v /tmp/cloud-ac-service/auth/:/var/log/cloud-ac-service/auth \
    auth:latest
4.1 命令说明
使用 -e "SPRING_PROFILES_ACTIVE=dev"  指定spring profile
使用 -v /tmp/cloud-ac-service/auth/:/var/log/cloud-ac-service/auth  挂载日志目录

#sonarqube例子
docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest
```



##### springboot启动包选择环境

```shell
#文件名如startup.sh
sudo cp /home/gzy/online-service/online-service-1.0.0.jar /home/online_dubbox/online-service/20659/online-service-20659.jar
#####################
sudo /home/online_dubbox/online-service/20659/online-service-sit-20659.sh restart

#文件名 online-service-sit-20659.sh
#!/bin/sh/执行的脚本.sh
## java env
export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64
export JRE_HOME=$JAVA_HOME/jre

API_NAME=operation-online-back-api-20566
JAR_NAME=$API_NAME\.jar
SERVICE_DIR=/home/zxsl/online_dubbox/operation-online-back-api/20566
#PID  代表是PID文件
PID=$API_NAME\.pid

cd $SERVICE_DIR

#使用说明，用来提示输入参数
usage() {
    echo "Usage: sh 执行脚本.sh [start|stop|restart|status]"
    exit 1
}

#检查程序是否在运行
is_exist(){
  pid=`ps -ef|grep $JAR_NAME|grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}

#启动方法
start(){
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is already running PID=${pid} <<<"
#nohup 指后台运行
  else
    nohup $JRE_HOME/bin/java -Xms512m -Xmx1024m -jar $JAR_NAME --spring.profiles.active=common-pro,pro --dubbo.protocol.port=20666 --server.port=7671 --dubbo.service.shutdown.wait=180000 --dubbo.registry.file=/home/zxsl/online_dubbox/operation-online-service/20666/dubbo-registry.properties >/dev/null 2>&1 &
    echo $! > $SERVICE_DIR/$PID
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") start $JAR_NAME successed PID=$! <<<"
   fi
  }

#停止方法 3分钟停止不了，则强制停止
stop(){
  #is_exist
  pidf=$(cat $SERVICE_DIR/$PID)
  kill $pidf
  rm -rf $SERVICE_DIR/$PID
  sleep 2
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} PID = $pid begin kill -15 $pid  <<<"
    kill -15 $pid
    sleep 2
  fi
  i=0
  while true
  do
    is_exist
    if [ $? -eq "0" ]; then
	  if [[ $i -eq 181 ]]; then
	   echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} PID = $pid begin kill -9 $pid  <<<"
	   kill -9  $pid
	   sleep 2
	  else
        echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is working on the unfinished service. Please wait later....  <<<"
        sleep 1
		i=$(($i+1))
	  fi
    else
      echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} process stopped <<<"
      break;
    fi
  done

}

#输出运行状态
status(){
  is_exist
  if [ $? -eq "0" ]; then
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is running PID is ${pid} <<<"
  else
    echo ">>> $(date "+%Y-%m-%d %H:%M:%S") ${JAR_NAME} is not running <<<"
  fi
}

#重启
restart(){
  stop
  start
}

#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "restart")
    restart
    ;;
  *)
    usage
    ;;
esac
exit 0
```

##### springboot运行jar包选择环境

```sh
java -jar  spring-boot-demo-0.0.1-SNAPSHOT.jar --SOME_ENV=always --spring.profiles.active=prod
```

#### windowns启动jar命令

```
java -jar *.jar（*替换为需启动的jar包名称)
```

命令详解

```shell
SpringBoot 启动参数设置环境变量、JVM参数、tomcat远程调试
java命令的模版：java [-options] -jar jarfile [args...]

先贴一下我的简单的启动命令：

java -Xms128m -Xmx256m -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8081,suspend=n -jar /data/app/test.jar --spring.profiles.active=dev &

其中：

-Xms128m 设置的是JVM堆最小内存为128m
-Xmx256m 设置的是JVM堆最大内存为256m
这里有个问题是-Xmx指定的内存不包括jvm运行中使用的本地内存，所以如果有NIO等涉及到本地内存的情况时，该java进程占用的总内存会超过-Xmx设定的数值
-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8081,suspend=n
设置debug模式，允许tomcat远程连接服务器调试，调试端口可指定，此处为8081
/data/app/test.jar 指定需要执行的jar包的路径
--spring.profiles.active=dev 设定SpringBoot运行环境为dev环境

& 后台模式执行
```







#### K8S的命令服务构建

```shell
#查看已经建的命名空间namespace
kubectl get ns
#查看集群信息
kubectl cluster-info

#跑java服务很简单，只需要写一个deloyment的yaml来制作pod，再写一个制作service的yaml来制作service，就ok了。 运行
kubectl apply -f xxx.yaml
#查看
docker images
#查看部分docker images|grep order

#order-consumer
#查看
kubectl -n notarycloud get po -owide
#115上执行的命令
#1
docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044
#2
docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044
#uat环境上执行的命令
#3 kubectl是k8s命令
kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:202007301044

#解释
#docker tag 是在115把最新的latest 打一个新的tag比如2020071711
#docker push 是把这个景象推送到镜像仓库
#kubectl -n notarycloud set image deployment 这句是在227执行，用新的镜像替换旧的镜像
#
#order-provider
kubectl -n notarycloud get po -owide 
docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511
#
docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511
#
kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:20200717511


#创建私有仓库的认证secret
kubectl create secret docker-registry docker-regsitry-auth --docker-username=admin --docker-password=Harbor1
345 --docker-server=192.168.31.70
```

 kubectl -n notarycloud get po -owide 的命令展示列的信息

| NAME    | READY | STATUS  | RESTARTS | AGE  | IP       | NODE   | NOMINATED NODE | READINESS GATES |
| ------- | ----- | ------- | -------- | ---- | -------- | ------ | -------------- | --------------- |
| nacos-0 | 1/1   | running | 0        | 27m  | 192.168. | k8s229 | <none>         | <none>          |



```shell
#k8s的其它命令
# 降为一个副本,确保配置有reload  测试环境目前只有一个副本，此命令不用执行
kubectl -n notarycloud scale deploy/mycat --replicas=1
# 恢复副本数量 测试环境目前只有一个副本，此命令不用执行
kubectl -n notarycloud scale deploy/mycat --replicas=2
```

##### 删除所有被驱逐的容器Evicted 

```cmd
#删除所有的
kubectl get pods --all-namespaces -o json | jq '.items[] | select(.status.reason!=null) | select(.status.reason | contains("Evicted")) | "kubectl delete pods \(.metadata.name) -n \(.metadata.namespace)"' | xargs -n 1 bash -c

#在命名空间中删除处于失败状态的Pod 
kubectl -n default delete pods --field-selector=status.phase=Failed

#
kubectl delete pod {podName}
#删除命名空间下的无效容器
kubectl -n notarycloud delete po/mycat- -hmkm7

```

```cmd
#更多详细信息
kubectl -n notarycloud describe  pod/postgresql-etcd-k8s229
# 伸缩 pod 副本
# 可用于将Deployment及其Pod缩小为零个副本，实际上杀死了所有副本。当您将其缩放回1/1时，将创建一个新的Pod，重新启动您的应用程序。
kubectl scale deploy/nginx-1 --replicas=0
kubectl scale deploy/nginx-1 --replicas=1

# 查看前一个 pod 的日志，logs -p 选项 
kubectl logs --tail 100 -p user-klvchen-v1.0-6f67dcc46b-5b4qb > pre.log
```



##### 用k8s的构建

```go
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'maven', image: 'maven:3-jdk-8-slim', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'docker', image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.12', ttyEnabled: true, command: 'cat')
	],
	volumes: [
		hostPathVolume(mountPath: '/home/jenkins/agent', hostPath: '/mnt/storage/docker/data/jenkins'),
		hostPathVolume(mountPath: '/root/.m2', hostPath: '/mnt/storage/docker/data/jenkins/.m2'),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
			stage('代码检出'){
				git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud.git'
			}
			
			stage('Maven构建') {
				container('maven') {
				    parallel (
						"autoconfigure": {
							stage('autoconfigure') {
								sh """
									# note: $PWD=/home/jenkins/agent/notary-cloud.git/
									# mvn -f commons/notary-cloud-common-autoconfigure/pom.xml deploy
									mvn -f pom.xml clean -Dmaven.test.skip=true install deploy
								"""
							}
						}
					)
				}
				container('maven') {
				    parallel (
						"order": {
							stage('order') {
								sh """
									mvn -f consumers/notary-cloud-consumer-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
									mvn -f providers/notary-cloud-provider-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
								"""
							}
						}
					)
				}
			}
			
			
			stage('镜像推送') {
				container('docker') {
					parallel (
						"order": {
							stage('order') {
								sh """
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER;
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER;
								"""
							}
						}
					)
				}
			}
			
			
			stage('K8S部署') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:$BUILD_NUMBER --record;
						kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:$BUILD_NUMBER --record;
					"""
				}
			}

    }
}

```

### PipeLine语法学习

https://www.w3cschool.cn/jenkins/jenkins-jg9528pb.html

https://www.jianshu.com/p/f1167e8850cd

https://testerhome.com/wiki/pipelinedoccn

https://mp.weixin.qq.com/s/QmviWlPR_vVK_8Hy4Vwu6w

```groovy
pipeline{
    agent any  //全局必须带有agent表明此pipeline执行节点
    stages{
        stage('代码检出'){
		   git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-order.git'
			}
        stage("first stage"){
            agent { label 'master' }  //具体执行的步骤节点，非必须
            steps{
                echo "this is first step"
            }
        }
    }
}
```

```go
#!groovy
pipeline {
  agent any
  tools {
    jdk 'java'
    maven 'maven'
  }
  stages {
    stage('git') {
      steps {
        git branch: '3.2.2', credentialsId: 'bbbc7963-0bb7-4b15-95a0-9d8e2c5c2b15', url: 'http://gitlab-sc.fxnotary.com/notary-cloud/notary-cloud-root.git'
      }
    }
    stage('build-deploy') {
      steps {
        sh 'mvn clean deploy -DskipTests'
      }
    }
  }
}

```



#### Jenkis pipeline构建项目实践-编写podTemplate实现和k8s对接

```groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'maven', image: 'maven:3-jdk-8-slim', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'docker', image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.12', ttyEnabled: true, command: 'cat')
	],
	nodeSelector:'ci=jenkins',
	volumes: [
		nfsVolume(mountPath: '/home/jenkins/agent', serverAddress: '192.168.88.225', serverPath: '/mnt/file', readOnly: false),
		nfsVolume(mountPath: '/root/.m2', serverAddress: '192.168.88.225', serverPath: '/mnt/file/.m2', readOnly: false),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
			stage('代码检出'){
				git branch: 'development', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-order.git'
			}
			
			def BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
			
			stage('Maven构建') {
				container('maven') {
				    parallel (
						"autoconfigure": {
							stage('autoconfigure') {
								sh """
									# note: $PWD=/home/jenkins/agent/notary-cloud.git/
									# mvn -f commons/notary-cloud-common-autoconfigure/pom.xml deploy
									mvn -f pom.xml clean -Dmaven.test.skip=true install deploy
								"""
							}
						}
					)
				}
				container('maven') {
				    parallel (
						"order": {
							stage('order') {
								sh """
									mvn -f notary-cloud-consumer-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
									mvn -f notary-cloud-provider-order/pom.xml -T 2 clean -Dmaven.test.skip=true package dockerfile:build;
								"""
							}
						}
					)
				}
			}
			
			
			stage('镜像推送') {
				container('docker') {
					parallel (
						"order": {
							stage('order') {
								sh """
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION};
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION};
									docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION};
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:latest;
									docker push registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION};
								"""
							}
						}
					)
				}
			}
			
			
			stage('K8S部署') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-consumer-order notary-cloud-consumer-order=registry.k8s.ing:5000/notarycloud/notary-cloud-consumer-order:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-consumer-order -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
						kubectl -n notarycloud set image deployment notary-cloud-provider-order notary-cloud-provider-order=registry.k8s.ing:5000/notarycloud/notary-cloud-provider-order:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-provider-order -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
					"""
				}
			}

    }
}

```

### Jenkins持续集成 之 hook自动触发构建

### 例子2

```groovy
#!groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"

properties([
        parameters([
                string(
                        name: "gitRepositoryUrl",
                        description: "库地址",
                        defaultValue: "ssh://git@notarycloud-gitlab-ce/notary-cloud/notary-cloud-settlement.git"
                ),
                string(
                        name: "gitBranchName",
                        description: "分支名称",
                        defaultValue: "release"
                ),
                text(
                        name: "services",
                        description: "需要发布的服务$名称(换行分割)",
                        defaultValue: "consumer-settlement\nprovider-settlement"
                )
        ]),
])

class BuildCli {

    def services = []
    def pom
    def version
    def originVersion

    BuildCli(serviceText, pom) {
        this.services = serviceText.split("\n").collect { it.trim() }
        this.pom = pom
        this.originVersion = pom.getVersion()
        this.version = pom.getVersion().replace("-SNAPSHOT", "")
    }

    def tag() {
        def o = ""
        services.each {
            o += """
            docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:latest registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version};
            docker push registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:latest;
            docker push registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version};
        """
        }
        return o
    }

    def deploy() {
        def o = ""
        services.each {
            o += """
                kubectl -n notarycloud set image deployment notary-cloud-${it} notary-cloud-${it}=registry.k8s.ing:5000/notarycloud/notary-cloud-${it}:${version} --record;
                kubectl -n notarycloud patch deployment notary-cloud-${it} -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
            """
        }
        return o
    }

    @Override
    String toString() {
        return "${pom.getName()}-${originVersion}"
    }

}

podTemplate(
        label: label,
        containers: [
                containerTemplate(
                        name: "maven-docker-kubectl",
                        image: "registry.k8s.ing:5000/jenkins/maven-docker-kubectl:3",
                        ttyEnabled: true,
                        command: "cat"
                )
        ],
        nodeSelector: "ci=jenkins",
        volumes: [
                nfsVolume(mountPath: "/home/jenkins/agent", serverAddress: "192.168.88.225", serverPath: "/mnt/file", readOnly: false),
                nfsVolume(mountPath: "/root/.m2", serverAddress: "192.168.88.225", serverPath: "/mnt/file/.m2", readOnly: false),
                hostPathVolume(mountPath: "/var/run/docker.sock", hostPath: "/var/run/docker.sock")
        ])

{
    node(label) {
        stage("代码检出") {
            git branch: params.gitBranchName,
                credentialsId: "e71846ca-cbc1-4122-9f4f-5ea617666617",
                url: params.gitRepositoryUrl
        }
        def buildCli = new BuildCli(params.services, readMavenPom())
        stage("Build") {
            echo "########## Build ${buildCli.toString()} ##########"
            container("maven-docker-kubectl") {
                stage("Maven构建") {
                    sh "mvn clean -Dmaven.test.skip=true install deploy -f pom.xml -U"
                }
                stage("Image构建") {
                    sh "mvn dockerfile:build -f pom.xml"
                }
                stage("Tag & Push Image") {
                    echo buildCli.tag()
                    sh buildCli.tag()
                }
                stage("K8S Deploy") {
                    echo buildCli.deploy()
                    sh buildCli.deploy()
                }
            }
        }
    }
}

```

例子三

```groovy
def label = "jenkins-jnlp-slave-${UUID.randomUUID().toString()}"
podTemplate(
    label: label, 
    containers: [
		containerTemplate(
            name: 'node', 
            image: 'node:lts-slim', 
            ttyEnabled: true, 
            command: 'cat'),
		containerTemplate(name: 'docker', 
                          image: 'docker:18', ttyEnabled: true, command: 'cat'),
		containerTemplate(name: 'kubectl', 
                          image: 'registry.k8s.ing:5000/jenkins/maven-docker-kubectl:3', ttyEnabled: true, command: 'cat')
	],
	nodeSelector:'ci=jenkins',
	volumes: [
		nfsVolume(mountPath: '/home/jenkins/agent', serverAddress: '192.168.88.225', serverPath: '/mnt/file', readOnly: false),
		hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
	])
{
    node (label) {
		stage('CI') {
			stage('Checkout scm'){
				git branch: '3.5.0', credentialsId: 'e71846ca-cbc1-4122-9f4f-5ea617666617', url: 'ssh://git@notarycloud-gitlab-ce/fxnotary/notary-cloud-admin.git'
			}
			
			def BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
			
			stage('Build artifics') {
				container('node') {
					sh """
					    yarn --registry http://nexus-nc.fxnotary.com/repository/npmjs-group/;
						yarn install;
						yarn build;
					"""
				}
			}
			
			stage('Push Docker image') {
				container('docker') {
					parallel (
						"front image": {
							stage('front image') {
								sh """
								docker build -t registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest .
								docker tag registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION};
								docker push registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:latest;
								docker push registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION};
								"""
							}
						}
					)
				}
			}
			
			stage('Deploy to K8S') {
				container('kubectl') {
					sh """
						kubectl -n notarycloud set image deployment notary-cloud-admin-front notary-cloud-admin-front=registry.k8s.ing:5000/notarycloud/notary-cloud-admin-front:${BUILD_RELEASE_VERSION} --record;
						kubectl -n notarycloud patch deployment notary-cloud-admin-front -p "{\\"spec\\":{\\"template\\":{\\"metadata\\":{\\"labels\\":{\\"date\\":\\"`date +'%s'`\\"}}}}}"
					"""
				}
			}
			
        }
    }
}

```



3、脚本释义
podTemplate节指定创建pod的模板和环境

> Name：为pod的名称前缀
> Cloud：为构建pod的云环境，需要和前面新建的云环境名称一样
> Namespace：创建pod所在的namespace
> Label: 创建pod对应的标签
> serviceAccount：pod使用sa，这里使用default, 所以前文创建jenkins master deployment的时候多创建了一个default-role,这样自动创建出来的的jenkins-slave具有对应的api权限

containerTemplate节

> 指定创建容器的模板，当云环境里面配置pod模板后，容器模板以云环境的配置为准。

Volumes节

> 配置jenkins-slave pod挂载的卷，当云环境里面配置pod模板后，挂载卷以云环境配置为准

stage节为具体的pipeline步骤

> 这里第一步进行svn代码迁出；
> 第二步进行编译，并把包传到共享卷上面；
> 第三步对pod进行删除，因为应用采用deployment方式部署，所以可以实现重新创建pod，达到更新的效果。

# kubectl常用示例

#### kubectl explain ... 命令查看配置文件

```shell
kubectl explain --help
```



k8s用于容器化应用程序的部署、扩展和管理
k8s提供了容器编排、资源调度、弹性伸缩、部署管理、服务发现等一系列功能
k8s的目标是让部署容器化应用简单高效
总结：可以理解成一个容器平台、微服务平台（非常适合微服务架构）、便携式云平台

## K8s部署搭建

### 整体架构

* Master 

k8s集群控制节点，对集群进行调度管理，接受集群外用户去集群操作请求。
Master Node由API Server、Scheduler、ClusterState Store(ETCD数据库) 和Controller ManagerServer组成；

* Nodes 

集群工作节点，运行用户业务应用容器；
Nodes节点也叫WorkerNode,包含kubelet、kube proxy 和Pod(Container Runtime); 

### 开始搭建

```
kubeadm工具
官方地址：https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm/
使用Kubeadm工具可以快速搭建一个k8s集群，主要包括初始化控制平面节点和加入Worker节点，提供的主要功能如下：

kubeadm init：初始化一个Master节点
kubeadm join：将Worker节点加入集群
kubeadm upgrade：升级K8s版本
kubeadm token：管理 kubeadm join 使用的令牌
kubeadm reset：清空 kubeadm init 或者 kubeadm join 对主机所做的任何更改
kubeadm version：打印 kubeadm 版本
kubeadm alpha：预览可用的新功能 
```

```shell
配置环境的相关策略
关闭防火墙
# systemctl stop firewalld.service
# systemctl disable firewalld.service

关闭selinux
# sed -i 's/enforceing/disabled/' /etc/selinux/config#永久
# setenforce 0 #临时

关闭swap(k8s禁止虚拟内存以提高性能)
# swapoff -a  #临时
# sed -ri 's/.*swap.*/#&/' /etc/fstab #永久

在master添加hosts
cat >> /etc/hosts << EOF
192.168.10.30  k8s-master
192.168.10.31  k8s-node1
EOF

设置网桥参数
cat >> /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

时间同步
yum -y install ntpdate
由于操作系统默认安装是英文的，所以时间同步是美国的纽约时间，所以需要修改。
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate ntp1.aliyun.com
```

```shell
搭建kubeadm、kubelet、kubectl
添加k8s的阿里云YUN源

cat > /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
https://mirrors.aliyun.com/kurbernetes/yum/doc/rpm-package-key.gpg
EOF

开始安装 注意版本号自己找下
yum -y install kubelet-1.19.4 kubeadm-1.19.4 kubectl-1.19.4
systemctl enable kubelet

master初始化命令
kubeadm init --apiserver-advertise-address=192.168.10.30 --image-repository registry.aliyuncs.com/google_containers --kubernetes-version  v1.19.4 --service-cidr=10.96.0.0/12 --pod-network-cidr=10.244.0.0/16

```



## k8s搭建一个java-web应用

https://www.jianshu.com/p/9afd73af7e45

k8s的deployment >ReplicationController >pod 关系

#### RC的操作

应用托管在Kubernetes之后，Kubernetes需要保证应用能够持续运行，这是RC的工作内容，它会确保任何时间Kubernetes中都有指定数量的Pod在运行，在此基础上，RC还提供了一些更高级的特性，比如滚动升级、升级回滚等。

```bash
#创建一个Rc
[root@node1 rc]# vim nginx_rc.yml
apiVersion: v1
kind: ReplicationController
metadata:
  name: myweb
spec:
  replicas: 2
  selector:
    app: myweb
  template:
    metadata:
      labels:
        app: myweb
    spec:
      containers:
       - name: myweb
         image: nginx:1.10
         ports:
         - containerPort: 80
#创建RC
kubectl create -f nginx_rc.yml      
#编辑Rc,同service、 deployment
kubectl edit rc rcName
#查看rc和pod
[root@node1 rc]# kubectl get rc
NAME      DESIRED   CURRENT   READY     AGE
myweb     2         2         2         7s
#RC和Pod关联 ------Lable
[root@node1 rc]# kubectl get rc -o wide
#修改Nginx的标签
[root@node1 rc]# kubectl edit pod nginx2
  labels:
    app: myweb
#滚动升级
#从Nginx1.10升级到Nginx1.15
#复制一个nginx.yml
[root@node1 rc]# cp nginx_rc.yml nginx_rc2.yml 
apiVersion: v1
kind: ReplicationController
metadata:
  name: myweb2
spec:
  replicas: 2
  selector:
    app: myweb2
  template:
    metadata:
      labels:
        app: myweb2
    spec:
      containers:
       - name: myweb
         image: nginx:1.15
         ports:
         - containerPort: 80
#升级
[root@node1 rc]# kubectl rolling-update myweb -f nginx_rc2.yml --update-period=30s
#回滚
#原理和滚动升级一样
[root@node1 rc]# kubectl rolling-update myweb2 -f nginx_rc.yml --update-period=1s
#当我们从myweb升级到myweb2的时候发现有问题，立马中断，如何回滚到myweb？
[root@node1 rc]# kubectl rolling-update myweb myweb2 --rollback
```

## K8s部署springcloud的学习

### deploy.yml配置

```yaml
#deploy
apiVersion: apps/v1
kind: Deployment
metadata:
  name: arachni
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: arachni
  template:
    metadata:
      labels:
        app: arachni
    spec:
      containers:
      - image: arachni/arachni
        imagePullPolicy: Always
        name: arachni
        ports:
        - containerPort: 9292
          protocol: TCP
        - containerPort: 7331
          protocol: TCP        


#service
apiVersion: v1
kind: Service
metadata:
  name: arachni
  namespace: default
spec:
  ports:
  - name: web
    nodePort: 30003
    port: 9292
    protocol: TCP
    targetPort: 9292
  - name: api
    nodePort: 30004
    port: 7331
    protocol: TCP
    targetPort: 7331
  selector:
    app: arachni
  sessionAffinity: None
  type: NodePort



```

网上例子资料学习

* 环境准备

```bash
安装jdk和maven环境
[root@k8s-master ~]# yum install java-1.8.0-openjdk maven -y
[root@k8s-master ~]# java -version
openjdk version "1.8.0_242"
OpenJDK Runtime Environment (build 1.8.0_242-b08)
OpenJDK 64-Bit Server VM (build 25.242-b08, mixed mode)
[root@k8s-master ~]# mvn -version
Apache Maven 3.0.5 (Red Hat 3.0.5-17)
Maven home: /usr/share/maven
Java version: 1.8.0_242, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-957.el7.x86_64", arch: "amd64", family: "unix"

设置maven的国内镜像源
/etc/maven/settings.xml

<mirror>
  <id>nexus-aliyun</id>
  <mirrorOf>*</mirrorOf>
  <name>Nexus aliyun</name>
  <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</mirror>
```

### 高级存储pv.yml

```yaml
# cat pv.yaml 
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: tomcat-jcsj-data
spec:
  capacity: #存储能力，目前只支持存储空间的设置
    storage: 5Gi 
  accessModes: #访问模式ReadWrite读写 ReadOnlyMany 只读ReadWriteMany 读写(可以多节点)
  - ReadWriteMany 
  nfs: #存储类型，与底层真正存储戏
    path: /home/tomcat_jcsj
    server: 192.168.115.6
  persistentVolumeReclaimPolicy: Recycle #回收策略Retain（保留）Recycle (回收）Delete (删除）
 
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: tomcat-jcsj-data
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 5Gi
```

```shell
#创建pv
kubectl create -f pv.yml
# 查看pv
kubectl get pv -o wide
```





### Dockerfile例子

```shell
#Dockerfile例子
FROM lizhenliang/java:8-jdk-alpine
LABEL maintainer www.ctnrs.com
ENV JAVA_ARGS="-Dfile.encoding=UTF8 -Duser.timezone=GMT+08"
COPY ./target/gateway-service.jar ./
COPY pinpoint /pinpoint
EXPOSE 9999
CMD java -jar -javaagent:/pinpoint/pinpoint-bootstrap-1.8.3.jar -Dpinpoint.agentId=$(echo $HOSTNAME | awk -F- '{print "gateway-"$NF}') -Dpinpoint.applicationName=ms-gateway $JAVA_ARGS $JAVA_OPTS /gateway-service.jar


#docker.builder.sh
kubectl create ns ms
docker_registry=192.168.73.137
kubectl create ns ms
kubectl create secret docker-registry registry-pull-secret --docker-server=$docker_registry --docker-username=admin --docker-password=Harbor12345 --docker-email=admin@ctnrs.com -n ms
service_list="eureka-service gateway-service order-service product-service stock-service portal-service"
service_list=${1:-${service_list}}
work_dir=$(dirname $PWD)
current_dir=$PWD

cd $work_dir
mvn clean package -Dmaven.test.skip=true

for service in $service_list; do
   cd $work_dir/$service
   if ls |grep biz &>/dev/null; then
      cd ${service}-biz
   fi
   service=${service%-*}
   image_name=$docker_registry/microservice/${service}:$(date +%F-%H-%M-%S)
   docker build -t ${image_name} .
   docker push ${image_name}
done
[root@k8s-master k8s]# ./docker_build.sh


#服务编排
[root@k8s-master k8s]# cat gateway.yaml
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: gateway
  namespace: ms
spec:
  rules:
    - host: gateway.ctnrs.com
      http:
        paths:
        - path: /
          backend:
            serviceName: gateway
            servicePort: 9999
---
apiVersion: v1
kind: Service
metadata:
  name: gateway
  namespace: ms
spec:
  ports:
  - port: 9999
    name: gateway
  selector:
    project: ms
    app: gateway
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gateway
  namespace: ms
spec:
  replicas: 2
  selector:
    matchLabels:
      project: ms
      app: gateway
  template:
    metadata:
      labels:
        project: ms
        app: gateway
    spec:
      imagePullSecrets:
      - name: registry-pull-secret
      containers:
      - name: gateway
        image: 192.168.73.137/microservice/gateway:2020-03-08-16-40-54  #注意修改镜像地址
        imagePullPolicy: Always
        ports:
          - protocol: TCP
            containerPort: 9999
        env:
          - name: JAVA_OPTS
            value: "-Xmx1g"
        resources:
          requests:
            cpu: 0.5
            memory: 256Mi
          limits:
            cpu: 1
            memory: 1Gi
        readinessProbe:
          tcpSocket:
            port: 9999
          initialDelaySeconds: 60
          periodSeconds: 10
        livenessProbe:
          tcpSocket:
            port: 9999
          initialDelaySeconds: 60
          periodSeconds: 10
#portal
 [root@k8s-master k8s]# cat product.yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: portal
  namespace: ms
spec:
  rules:
    - host: portal.ctnrs.com
      http:
        paths:
        - path: /
          backend:
            serviceName: portal
            servicePort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: portal
  namespace: ms
spec:
  ports:
  - port: 8080
    name: portal
  selector:
    project: ms
    app: portal
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: portal
  namespace: ms
spec:
  replicas: 1
  selector:
    matchLabels:
      project: ms
      app: portal
  template:
    metadata:
      labels:
        project: ms
        app: portal
    spec:
      imagePullSecrets:
      - name: registry-pull-secret
      containers:
      - name: portal
        image: 192.168.73.137/microservice/portal:2020-03-08-16-41-31  #此处的镜像地址，可配置成lastest？
        imagePullPolicy: Always
        ports:
          - protocol: TCP
            containerPort: 8080
        env:
          - name: JAVA_OPTS
            value: "-Xmx1g"
        resources:
          requests:
            cpu: 0.5
            memory: 256Mi
          limits:
            cpu: 1
            memory: 1Gi
        readinessProbe:
          tcpSocket:
            port: 8080
          initialDelaySeconds: 60
          periodSeconds: 10
        livenessProbe:
          tcpSocket:
            port: 8080
          initialDelaySeconds: 60
          periodSeconds: 10
#部署前端（portal）
"注意修改yaml中的镜像地址"
[root@k8s-master k8s]# kubectl create -f portal.yaml

```

### 制作微服务的镜像

打出springboot可执行jar包，上传至docker环境

```
cd /rousem/temp/rousem-portal 
#将jar文件rousem-portal.jar拷贝到这里``vim Dockerfile
```



Dockerfile内容如下：

```
#基础镜像,openjdk8
FROM adoptopenjdk/openjdk8:latest
#维护者信息
MAINTAINER maocai@rousem.com
#工作目录,后续的指令都基于这个目录
WORKDIR /rousem
#拷贝打包的jar文件
COPY rousem-portal.jar jar/app.jar
#需要对外暴露的端口
EXPOSE 6021
#需要挂载的目录,内嵌 Tomcat 容器默认使用/tmp作为工作目录
VOLUME ["/rousem/logs","/tmp"]
#添加镜像元信息
LABEL version="0.0.1" descripton="测试版本"
#环境变量(jasypt密钥,查看账号配置文档)
ENV JASYPT_ENCRYPTOR_PASSWORD hahawoshimiyue
#容器启动执行的命令,如果定义了多次，则以最后一次为准
#为了缩短 Tomcat 启动时间，添加一个系统属性指向/dev/./urandom
#-XX:+UnlockExperimentalVMOptions 和 -XX:+UseCGroupMemoryLimitForHeap设置jvm根据容器内存上限来自动分配jvm内存
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom"\
,"-server"\
,"-XX:+UnlockExperimentalVMOptions"\
,"-XX:+UseCGroupMemoryLimitForHeap"\
,"-Duser.timezone=GMT+8"\
,"-jar","jar/app.jar"\
,"--spring.profiles.active=prod"\
,"> /dev/null","2>&1"]
```



2、根据Dockerfile构建镜像

```
#构建镜像
docker build -t rousem/portal:0.0.1 -f Dockerfile ./
#查看构建的镜像
docker images
```



3、启动自己构建的镜像,同时设置host配置
**说明：**用openjdk8作为基础镜像，加上启动jvm时设置了自适应容器内存，所以只需限制容器的内存就可以，jvm会根据容器的内存自动设置jvm内存

```
docker run --name rousem-portal --restart=always \
-v /rousem/logs/applications/portal:/rousem/logs \
--add-host=nacos.rousem.com:10.200.0.4 \
--add-host=sentinel.rousem.com:10.200.0.4 \
-d -p 6311:6311 \
-m 128m \
rousem/portal:0.0.1
```



4、查看运行时控制台日志

```
docker logs -f rousem-portal
```





#### 组件

```
组件
#APIServer
APIServer组件负责响应用户的管理请求、进行指挥协调工作

#scheduler
scheduler组件是将待调度的pod按照一定的调度算法绑定到合适的工作节点上

#controller manager
是一组控制器的合集，负责控制控制管理对应的资源，如副本（replication）和工作节点（node）等。

#etcd
etcd 负责保存 Kubernetes Cluster 的配置信息和各种资源的状态信息。当数据发生变化时，etcd 会快速地通知 Kubernetes 相关组件。

#kubelet
管理维护pod运行的agent

#kube-proxy
将service的流量转发到对应endpoint

#flannel网络
维持各个节点上pod之间的通信。
```

![](E:\开发笔记\ycs_test\image\k8s架构图.png)



* http://zhangblog.com/2020/08/09/kubernetes05/ 帮助文档地址

## 几个关系

```
├──构成说明
├──namespace
	├──物理机 master,节点 node
       ├── node 下有 pod
```

![QQ图片20210901145951](E:\开发笔记\ycs_test\image\QQ图片20210901145951.png)

![20190515213137878](E:\开发笔记\ycs_test\image\20190515213137878.png)



## 查看类命令

```shell
#k8s获取登录token
kubectl describe secrets -n safedog $(kubectl -n safedog get secret | awk '/dashboard-admin/{print $1}')
#k8s集群获取ca证书
kubectl get secret $(kubectl get secrets | grep default-token | awk '{print $1}') -o jsonpath="{['data']['ca\.crt']}" | base64 --decode
#查看集群信息
kubectl cluster-info
# 获取节点和服务版本信息
kubectl get namespaces -o wide
kubectl get nodes -o wide
# 获取节点和服务版本信息，并查看附加信息
kubectl get nodes -o wide

# 获取pod信息，默认是default名称空间
kubectl get pod
# 获取pod信息，默认是default名称空间，并查看附加信息【如：pod的IP及在哪个节点运行】
kubectl get pod -o wide
# 获取指定名称空间的pod
kubectl get pod -n kube-system
# 获取指定名称空间中的指定pod
kubectl get pod -n kube-system podName
# 获取所有名称空间的资源pod
kubectl get pod -A 
# 查看pod的详细信息，以yaml格式或json格式显示
kubectl get pods -o yaml
kubectl get pods -o json

# 查看pod的标签信息
kubectl get pod -A --show-labels 
# 根据Selector（label query）来查询pod
kubectl get pod -A --selector="k8s-app=kube-dns"

# 查看运行pod的环境变量
kubectl exec podName env
# 查看指定pod的日志
kubectl logs -f --tail 500 -n kube-system kube-apiserver-k8s-master

# 查看所有名称空间的service信息
kubectl get svc -A
# 查看指定名称空间的service信息
kubectl get svc -n kube-system

# 查看componentstatuses信息
kubectl get cs
# 查看所有configmaps信息
kubectl get cm -A
# 查看所有serviceaccounts信息
kubectl get sa -A
# 查看所有daemonsets信息
kubectl get ds -A
# 查看所有deployments信息
kubectl get deploy -A
kubectl get service -A
kubectl edit service serviceName
# 查看所有replicasets信息
kubectl get rs -A
# 查看所有statefulsets信息
kubectl get sts -A
# 查看所有jobs信息
kubectl get jobs -A
# 查看所有ingresses信息
kubectl get ing -A
# 查看有哪些名称空间
kubectl get ns

# 查看pod的描述信息
kubectl describe pod podName
kubectl describe pod -n kube-system kube-apiserver-k8s-master  
# 查看指定名称空间中指定deploy的描述信息
kubectl describe deploy -n kube-system coredns

# 查看node或pod的资源使用情况
# 需要heapster 或metrics-server支持
kubectl top node
kubectl top pod 
kubectl get nodes

# 查看集群信息
kubectl cluster-info   或  kubectl cluster-info dump
# 查看各组件信息【172.16.1.110为master机器】
kubectl -s https://172.16.1.110:6443 get componentstatuses
```

## 操作类命令

```shell
# 创建资源
kubectl create -f xxx.yaml
# 应用资源
kubectl apply -f xxx.yaml
# 应用资源，该目录下的所有 .yaml, .yml, 或 .json 文件都会被使用
kubectl apply -f <directory>
# 创建test名称空间
kubectl create namespace test

# 删除资源
kubectl delete -f xxx.yaml
kubectl delete -f <directory>
# 删除指定的pod
kubectl delete pod podName
# 删除指定名称空间的指定pod
kubectl delete pod -n test podName
# 删除其他资源
kubectl delete svc svcName
kubectl delete deploy deployName
kubectl delete ns nsName
# 强制删除
kubectl delete pod podName -n nsName --grace-period=0 --force
kubectl delete pod podName -n nsName --grace-period=1
kubectl delete pod podName -n nsName --now
```

## 进阶命令操作

```shell
# kubectl exec：进入pod启动的容器
kubectl exec -it podName -n nsName /bin/sh    #进入容器
kubectl exec -it podName -n nsName /bin/bash  #进入容器

# kubectl label：添加label值
kubectl label nodes k8s-node01 zone=north  #为指定节点添加标签 
kubectl label nodes k8s-node01 zone-       #为指定节点删除标签
kubectl label pod podName -n nsName role-name=test    #为指定pod添加标签
kubectl label pod podName -n nsName role-name=dev --overwrite  #修改lable标签值
kubectl label pod podName -n nsName role-name-        #删除lable标签

# kubectl滚动升级； 通过 kubectl apply -f myapp-deployment-v1.yaml 启动deploy
kubectl apply -f myapp-deployment-v2.yaml     #通过配置文件滚动升级
kubectl set image deploy/myapp-deployment myapp="registry.cn-beijing.aliyuncs.com/google_registry/myapp:v3"   #通过命令滚动升级
kubectl rollout undo deploy/myapp-deployment 或者 kubectl rollout undo deploy myapp-deployment    #pod回滚到前一个版本
kubectl rollout undo deploy/myapp-deployment --to-revision=2  #回滚到指定历史版本

# kubectl scale：动态伸缩
kubectl scale deploy myapp-deployment --replicas=5  # 动态伸缩
kubectl scale --replicas=8 -f myapp-deployment-v2.yaml  #动态伸缩【根据资源类型和名称伸缩，其他配置「如：镜像版本不同」不生效】
```

### 1-1节点的隔离和恢复

```shell
#node节点隔离
#方法一 修改配置文件 创建配置文件unschedule_node.yaml,在spec部分指定unschedulable为true:
apiVersion:  V1
kind:  Node
metadata:
    name:  kube-node1
    lables:
        kubernetes.io/hostname:  kubernetes-minion1
spec:
   unschedulable:  true
#kubectl replace 命令完成对 Node 状态的修改  
kubectl replace -f unschedule_node.yaml nodes kube-node1 replaced

#方法二 命令直接修改
kubectl patch node kube-node1 -p '{"spec":{"unschedulable":true}}'
```

kubectl的子命令cordon和uncordon也用于实现将Node进行隔离和恢复调度的操作。

例如，使用kubectl cordon对某个Node进行隔离调度操作。

```shell
kubectl cordon k8s-node1  
#k8s-node1 节点状态会变成schedule disable 不可调度的状态
```

恢复

```shell
kubectl uncordon k8s-node1  
```

**特殊注意：将某个 Node 脱离调度范围时,在其上运行的pod并不会自动停止，管理员需要手动停止在该 Node 上运行的 Pod。
同样,如果需要将某个 Node 重新纳入集群调度范围,则将 unschedulable 设置为 false，再次执行 kubectl replace 或 kubectl patch 命令就能恢复系统对改 Node 的调度。**

```shell
# 确定要排空的节点的名称
kubectl get nodes 
# 查看获取pod名字
kubectl get po 
先设置node为cordon不可调度状态，然后驱逐Pod
kubectl cordon [node-name]
# 命令node节点开始释放所有pod，并且不接收新的pod进程
kubectl drain [node-name] --force --ignore-daemonsets --delete-local-data 
# 这时候把需要做的事情做一下。比如上面说的更改docker文件daemon.json或者说node节点故障需要进行的处理操作 
# 然后恢复node，恢复接收新的pod进程
kubectl uncordon [node-name]


#查看所有名称空间内资源
kubectl get pods -A
```

### 1-2 pod驱逐出某个节点

```shell
#命令
kubectl drain ip --force --ignore-daemonsets --delete-local-data 

默认情况下，kubectl drain 会忽略那些不能杀死的系统类型的 pod。drain命令中需要添加三个参数：--force、--ignore-daemonsets、--delete-local-data
--force 当一些pod不是经 ReplicationController, ReplicaSet, Job, DaemonSet 或者 StatefulSet 管理的时候就需要用--force来强制执行 (例如:kube-proxy)
--ignore-daemonsets 无视DaemonSet管理下的Pod。即--ignore-daemonsets往往需要指定的,这是因为deamonset会忽略unschedulable标签(使用kubectl drain时会自动给节点打上不可调度标签),因此deamonset控制器控制的pod被删除后可能马上又在此节点上启动起来,这样就会成为死循环.因此这里忽略daemonset。
--delete-local-data 如果有mount local volumn的pod，会强制杀掉该pod。


```



```
节点说明、集群雪崩，pod没有合理的limit, cpu系统资源不足,进程OOM, 节点变成no ready
1.资源预留：为系统进程和 k8s 进程预留资源
2.pod 驱逐：节点资源到达一定使用量，开始驱逐 pod
```



```shell
kubectl get nodes -o wide
kubectl get pod -o wide

```

### 1-3 生成新节点

```shell
#生成token
kubeadm token create --print-join-command
#查看token
kubeadm token list
默认token的有效期为24小时，当过期之后，该token就不可用了
#方式二生成
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
#新增节点
kubeadm join --token  {k8s生成的token}  {k8s-master-ip-port} --discovery-token-ca-cert-hash  {ca证书sha256编码hash值}
#删除节点
kubectl delete node {nodename}
```

### 1-4 证书和token

```shell
#k8s获取登录token
kubectl describe secrets -n safedog $(kubectl -n safedog get secret | awk '/dashboard-admin/{print $1}')
#k8s集群获取ca证书
kubectl get secret $(kubectl get secrets | grep default-token | awk '{print $1}') -o jsonpath="{['data']['ca\.crt']}" | base64 --decode
```



#### 1-4-1创建token

```
#创建一个test账号
kubectl create sa test -n kube-system
#查看test的secret
kubectl get sa test -n kube-system -o yaml
#根据secret获取token
kubectl describe secret [test-token-m9qzv] -n kube-system
```

#### 1-4-2创建config

```yml
#如果需要对客户端做细粒度的权限控制，可以通过以下方式生成 config 文件。
curl -k https://<YOUR_API_SERVER_PUBLIC_IP>:6443
创建 ~/.kube/config 文件，并修改文件内容
apiVersion: v1
clusters:
- cluster:
    # needed if you get error "Unable to connect to the server: x509: certificate signed by unknown authority"
    insecure-skip-tls-verify: true
    server: https://YOUR_API_SERVER_PUBLIC_IP:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTi... (base64 /etc/kubernetes/ssl/node-node1.pem)
    client-key-data: LS0tLS1CRUdJTiBS.. (base64 /etc/kubernetes/ssl/node-node1-key.pem)
其中 client-certificate-data 来源于：
cat /etc/kubernetes/ssl/node-node1.pem | base64 -w 0
client-certificate-data 来源于以下命令的输出
cat /etc/kubernetes/ssl/node-node1-key.pem | base64 -w 0
#路径/root/.kube/config
```

#### 1-4-3 获取实例

```shell
#demo
Token访问apiserver 权限作用于所有的 namespace
创建账号（要指定命名空间在kube-system中 才有一些操作权限）
 Yaml 配置
   apiVersion: v1
kind: ServiceAccount
metadata:
  name: zoubj
  namespace: kube-system
绑定账号（用绑定到clusterrole中 cluster-admin 针对集群所有命名空间都有效）
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: zoubj-clusterrolebinding
subjects:
- kind: ServiceAccount
  name: zoubj
  namespace: kube-system
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io

获取token
获取账号对应的secret 然后提取出secret中的token，并通过base64解密
[root@master-125 yaml]# kubectl get secret -n kube-system |grep zoubj
zoubj-token-chpmx                                kubernetes.io/service-account-token   3      3m22s
[root@master-125 yaml]# kubectl get secret zoubj-token-chpmx -o jsonpath={.data.token} -n kube-system |base64 -d
eyJhbGciOiJSUzI1NiIsImtpZCI6IjNkVXAzdlFJejFyV3FEdXNZYlF0NTA3ZHEwTzFkOEpZc0hNekg4STBLU0UifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJ6b3Viai10b2tlbi1jaHBteCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJ6b3ViaiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjViOTQ3YjYzLWIwYTMtNDQ0NS1hMzFiLTlhZWEzMmI2YTAzYiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTp6b3ViaiJ9.iJQFZMWaNEurNa9HcEfKo4mBn17LIYgQ_Zekulc6_RrETsmgkM1r4B8w8wkSwFh6Aj25Xp6icqG4VyPQqnzyS7lAjkwdQw206BCyIeIVKlTlV3VyKH6o6YJLHBBfHxxK2XHOOVgfVa8_vwGCkmFsLCiKg-I5Tm3ckw1bDQ9s3yTh_Z2dO--kNtRMRKoQnkiY3WjUK0CFvO3umYPfxSqJS2OZ8fOiTaoPcf1CwwNiEICyqVfmIpwpX5HSLNAUJRj-Jy8X-exQufQhN9vYGjTEjs-7nGcVYIAJVDJ_hG83cjPdlFLeshKMRySUP9bwCRKm1UORolhipBkx0tuNcDzhpg
```



### 1-5 pod指定节点方式

```yaml
准备工作
#创建label命令 
 kubectl label nodes <ndoe-name> <label-key>=<label-value>
 #删除label
 kubectl label node k8s-node1 disktype-node/k8s-node1 labeled
 #查看
 kubectl get nodes --show-labels
 
开始新增pod
#强制约束Pod调度到指定Node节点上 pod.yaml
spec:
	nodeName: 192.168.88.25
#通过label指定到node节点
spec:
	nodeSelector:
		key: key
     
```

*  pod的常见操作以及输出

```shell
[root@k8s-master test]# pwd
/root/k8s_practice/test
[root@k8s-master test]# ll
total 4
-rw-r--r-- 1 root root 1317 Jul 29 16:42 nginx_demo.yaml
# 创建pod
[root@k8s-master test]# kubectl apply -f nginx_demo.yaml
pod/nginx-demo created
# 查看pod。根据结果可见被调度到了 k8s-node02 节点
[root@k8s-master test]# kubectl get pod -o wide   # 或者 kubectl get pod -n default -o wide  因为名称空间为default
NAME                READY   STATUS    RESTARTS   AGE   IP            NODE         NOMINATED NODE   READINESS GATES
nginx-demo          1/1     Running   0          10s   10.244.2.16   k8s-node02   <none>           <none>
# 查看pod描述
[root@k8s-master test]# kubectl describe pod -n default nginx-demo   # 由于是默认名称空间，因此可以省略 -n default
…………
# 查看指定pod的基本信息，并显示标签信息
[root@k8s-master test]# kubectl get pod nginx-demo -o wide --show-labels
NAME          READY   STATUS    RESTARTS   AGE   IP            NODE         NOMINATED NODE   READINESS GATES   LABELS
nginx-demo    1/1     Running   0          61s   10.244.2.16   k8s-node02   <none>           <none>            environment=dev,k8s-app=nginx
# 删除pod
[root@k8s-master test]# kubectl delete -f nginx_demo.yaml   # 或者 kubectl delete pod nginx-demo
pod "nginx-demo" deleted
```



yaml示例

* https://www.jianshu.com/p/32042a744d1c 查看pod的配置详解

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: rc-nginx
spec:
  replicas: 2
  selector:
  app: rc-nginx
  template:
    metadata:
      labels:
        app: rc-nginx
    spec:
      containers:
        - name: nginx
        image: nginx
        imagePullPolicy: IfNotPresent ##镜像下拉策略，如果本地有从本地创建
# Always 总是拉取镜像
# IfNotPresent 本地有则使用本地镜像,不拉取
# Never 只使用本地镜像，从不拉取，即使本地没有
# 如果省略imagePullPolicy 镜像tag为 :latest 策略为always ，否则 策略为 IfNotPresent


```

nginx的yaml的demo

```yaml
apiVersion: extensions/v1beta1 #api的版本
kind: Deployment          #资源的类型
metadata:                 #资源的元数据
  name: nginx-deployment  #资源的名称
spec:                     #资源的说明
  replicas: 2             #副本2个，缺省为1
  template:               #pod模板
    metadata:             #pod元数据
      labels:            #标签
        app: web_server    #标签选择器
    spec:
      containers:
      - name: nginx
        image: nginx:1.79
```



两种启动方式

```shell
#方式一
kubectl run nginx-deployment --image=nginx:1.16-alpine --replicas=2
#方式二
 kubectl apply -f nginx.yaml
 #指定删除
 kubectl delete -f  nginx.yaml 

 #删除命令若是用run启动的
 kubectl delete deployment <pod-name> 
 kubectl delete pods <node-name> 
 
  #扩缩容命令
  kubectl scale deploy 控制器名 --replicas=副本数量 -n namespace
  #查看deploy
  kubectl get deploy -o wide
```

#### 1-5-1暴露80端口服务

```shell
kubectl expose deployment nginx-app --port=80 --type=LoadBalancer
```

#### 1-5-1导出pod的yaml模板

```shell
kubectl get pod myweb-5f8b88984c-nhmt9 -o yaml --export ##也可以使用--export将pod的配置导出作为模板。
#
#explain 可查看核心资源类型定义字段
kubectl explain pods
```

#### 1-5-3 k8s几种资源控制器

```yaml
#1 RC 主要的作用就是用来确保容器应用的副本数始终保持在用户定义的副本数 。
# 删除rc:  kubectl delete rs/frontend
apiVersion: extensions/v1beta1
kind: ReplicaSet
metadata:
  name: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: myapp
        image: wangyanglinux/myapp:v2
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 80
#2 deploy
apiVersion: extensions/v1beta1
kind: Deployment
#扩容： kubectl scale deployment nginx-deployment --replicas 10
#更新镜像：kubectl set image  deployment/nginx-deployment nginx=wangyanglinux/myapp:v3
#编辑 kubectl edit deployment/nginx-deployment
#回滚上个版本 kubectl rollout undo deployment/nginx
#回滚指定版本 kubectl rollout undo deployment/nginx --torevesion=2
#查看回滚版本 kubectl describe pod <podname>
#删除项目 kubectl delete deploy/nginx 
#kubectl delete service/nginx-service

#3 DaemonSet 确保全部（或者一些）Node 上运行一个 Pod 的副本。当有 Node 加入集群时，也会为他们新增一个 Pod 。当有 Node 从集群移除时，这些 Pod 也会被回收。删除 DaemonSet 将会删除它创建的所有 Pod

#4 Job 负责批处理任务，即仅执行一次的任务，它保证批处理任务的一个或多个 Pod 成功结束
#删除job的pod kubectl delete pod  pi-w7sr8
```

1-6 k8s创建角色和用户授权命名空间

```
https://blog.csdn.net/weixin_43798031/article/details/114703074
```



## api调用

```shell
#查看暴露的api
kubectl api-versions 
```



#### 自动化构建一些插件

* DingTask 钉钉消息通知机器人
* 这里一定要注意Remote Directory  配置的目录，所有推到这台机器的文件，都只能保存到这个目录下面。最好不要配置 "/"
* `Publish Over SSH`,`Maven Integration plugin`,`Git plugin`



#### sounarQube代码质量监控在jenkins上的配置

```
sonar.projectKey=operation-online
sonar.projectName=operation-online
sonar.projectVersion=1.0

sonar.language=java
sonar.sourceEncoding=UTF-8
sonar.scm.disabled=true

sonar.sources=./
#sonar.java.binaries=./
```

```shell
sonar.projectKey=songer
sonar.projectName=songer
sonar.projectVersion=1.0
sonar.sourceEncoding=UTF-8
sonar.modules=java-module
 
# Java module
java-module.sonar.projectName=Java Module
java-module.sonar.language=java
# .表示projectBaseDir指定的目录
java-module.sonar.sources=./
java-module.sonar.projectBaseDir=./
```

````
C:\Users\Administrator\.jenkins\plugins
````

##### sonarQube配合maven使用

* setting.xml的配置

```xml
<profile>
    <id>sonar</id>
    <activation>
        <activeByDefault>true</activeByDefault>
    </activation>
    <properties>
        <sonar.jdbc.url>jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8</sonar.jdbc.url>
        <sonar.jdbc.driver>com.mysql.jdbc.Driver</sonar.jdbc.driver>
        <sonar.jdbc.username>sonar</sonar.jdbc.username>
        <sonar.jdbc.password>sonar</sonar.jdbc.password>
        <sonar.host.url>http://localhost:9000</sonar.host.url>
    </properties>
</profile>
```

* 执行 **mvn clean install  sonar:sonar**
* 或者**mvn install -Dmaven.test.skip=true sonar:sonar**

#### skywalking

分布式跟踪的应用程序性能监控系统

```dockerfile
FROM registry.k8s.ing:5000/notarycloud/notary-cloud-image-openjdk
ADD target/${project.artifactId}-${project.version}.${project.packaging} ${project.artifactId}.${project.packaging}
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8080
ENTRYPOINT java -jar -javaagent:/agent/skywalking-agent.jar -Dskywalking.agent.service_name=${project.artifactId} -Dskywalking.collector.backend_service=${SKYWALKING_COLLECTOR_ARRE}  -Dskywalking.agent.sample_n_per_3_secs=1500 -Xmx1024m -Dspring.profiles.active=${PROFILES_ACTIVE} -Dserver.port=8080 ${project.artifactId}.${project.packaging}
```

### Spring-boot-admin的非常好用的监控和管理的源软件

* 实现钉钉机器人通知 https://blog.csdn.net/yuancao24/article/details/83576194

## 消息报警-钉钉机器人可接入

* jenkins 构建信息推送
* jira 信息通知推送
* https://www.ilxqx.com/archives/springboot实现日志飞书报警功能

## Swagger

### Swagger2的 实时生成文档api

```xml
#引入依赖
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>2.9.2</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>2.9.2</version>
</dependency>

#界面的优化依赖升级
```

```java
#静态资源时候可能会拦截
/**
     * 静态资源使用
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/**").addResourceLocations(
                    "classpath:/static/");
            registry.addResourceHandler("swagger-ui.html").addResourceLocations(
                    "classpath:/META-INF/resources/");
            registry.addResourceHandler("/webjars/**").addResourceLocations(
                    "classpath:/META-INF/resources/webjars/");
    }
```

```java
Api
ApiModel
ApiModelProperty
ApiOperation
ApiParam
ApiResponse
ApiResponses
ResponseHeader
ApiImplicitParams
#常用注解
@Api(value="用户controller",tags={"用户操作接口"})
@Api(value = "/user", description = "Operations about user")
@ApiOperation(value="获取用户信息",tags={"获取用户信息copy"},response = Order,,notes="注意问题点")
 "用于方法；表示一个http请求的操作"
 @ApiParam() 用于方法，参数，字段说明；表示对参数的添加元数据（说明或是否必填等） 
 public User getUserInfo(@ApiParam(name="id",value="用户id",required=true) Long id,@ApiParam(name="username",value="用户名") String username) {
 
 @ApiModel()用于类 ；表示对类进行说明，用于参数用实体类接收 
 @ApiModel(value="user对象",description="用户对象user")
 @ApiModelProperty()用于方法，字段
  @ApiModelProperty(value="用户名",name="username",example="xingguo")

@ApiResponses({ @ApiResponse(code = 400, message = "Invalid Order") })
     

```

| 作用范围                         API                                            使用位置<br/><br/>对象属性                        @ApiModelProperty             用在参数对象的字段上<br/><br/>协议集描述                    @Api                                           用在Conntroller类上<br/><br/>协议描述                        @ApiOperation                        用在controller方法上<br/><br/>Response集                   @ApiResponses                      用在controller方法上<br/><br/>Response                      @ApiResponse                         用在@ApiResponses里面<br/><br/>非对象参数集                 @ApilmplicitParams                用在controller方法上 |
| ------------------------------------------------------------ |

实例

```java
  @ApiOperation("信息软删除")
  @ApiResponses({ @ApiResponse(code = CommonStatus.OK, message = "操作成功"),
  @ApiResponse(code = CommonStatus.EXCEPTION, message = "服务器内部异常"),
  @ApiResponse(code = CommonStatus.FORBIDDEN, message = "权限不足") })
  @ApiImplicitParams({ @ApiImplicitParam(paramType = "query", dataType = "Long", name = "id", value = "信息id", required = true) })
  @RequestMapping(value = "/remove.json", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public RestfulProtocol remove(Long id) {
```

参考文档：

* https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins
* https://www.jianshu.com/p/b0b19368e4a8

### springboot 整合swagger-sitemesh3

Sitemesh 是一个网页布局和修饰的框架，基于 Servlet 中的 Filter

第一步: 创建`WebSiteMeshFilter` 类

```java
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;
public class WebSiteMeshFilter extends ConfigurableSiteMeshFilter{  
  @Override   
  protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {     
     builder.addDecoratorPath("/strategy/shop/list", "/WEB-INF/views/decorators/decorator.jsp")           
     // Map decorators to path patterns.                  
     .addDecoratorPath("/strategy/**", "/WEB-INF/views/decorators/decorator.jsp")                // Exclude path from decoration.           
     .addExcludedPath("/login/**")            
     .addExcludedPath("/main/**")              
     .addExcludedPath("/popup/**");     
   builder.addTagRuleBundles(new DivExtractingTagRuleBundle());  
  }
}
```

第二部创建`WebConfig`类

```java
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
  

@Bean 
public FilterRegistrationBean filterRegistrationBean(@Qualifier("sitemesh3")WebSiteMeshFilter siteMeshFilter) {   
     FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();             
     filterRegistrationBean.setFilter(siteMeshFilter);        
     filterRegistrationBean.setEnabled(true);        
    filterRegistrationBean.addUrlPatterns("/*");        
    return filterRegistrationBean;   
  }
}
```

#### 1、swagger集成swagger-bootstrap-ui

```xml
 <!-- 引入swagger-bootstrap-ui包 -->
        <dependency>
            <groupId>com.github.xiaoymin</groupId>
            <artifactId>swagger-bootstrap-ui</artifactId>
            <version>1.8.5</version>
        </dependency>
```

#### 2、swagger集成knife4j

```xml

<!-- 2.0.1 包含 springfox-swagger2 包 -->
        <dependency>
            <groupId>com.github.xiaoymin</groupId>
            <artifactId>knife4j-spring-boot-starter</artifactId>
            <version>2.0.1</version>
        </dependency>
```

#### 3、swagger和gateway的聚合多服务swagger

https://zhuanlan.zhihu.com/p/400091887?utm_id=0 仿造的ruoyi系统？





## MYCAT爬坑

总结：  因为mycat中分片表中的分片字段是不能更新的，所以减少left join 的复杂SQL

* mycat 8066查询端口

* mycat 9066管理端口

  ```mssql
  # 动态加载schema.xml配置
  reload @@config;
  # 动态加载所有配置
  reload @@config_all;
  ```

下载地址： https://github.com/MyCATApache/Mycat-download

## Sharding-jdbc



### 数据库中hql(hibernate)与sql的区别

```
1.sql 面向数据库表查询。

2.hql 面向对象查询。

3.hql : from 后面跟的 类名+类对象 where 后 用 对象的属性做条件。

4.sql: from 后面跟的是表名 where 后 用表中字段做条件查询。
```



### 其它

## NACOS

#### nacos生产环境的集群负载

* 复制三份nacos程序

* 在所有 nacos目录的conf的目录下，有个文件 application.properties ，并将修改端口和地址、配置数据库连接。

  ```properties
  server.port=8840
  nacos.inetutils.ip-address=127.0.0.1
  spring.datasource.platform=mysql
  db.num=1
  db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
  db.user.0=root
  db.password.0=123456
  
  #节点2
  server.port=8850
  nacos.inetutils.ip-address=127.0.0.1
  spring.datasource.platform=mysql
  db.num=1
  db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
  db.user.0=root
  db.password.0=123456
  ```

* 配置集群节点

  在所有 nacos目录的conf的目录下，有个文件 **cluster.conf.example** ，将其命名为 cluster.conf，并将每行配置成ip:port。

  ```conf
  #it is ip
  #example
  127.0.0.1:8840
  127.0.0.1:8850
  127.0.0.1:8860
  ```

* 启动

  ```bash
  startup.cmd -m cluster
  ```

* 配置

  ```yml
  spring:
    cloud:
      nacos:
        config:
          server-addr: 127.0.0.1:8840,127.0.0.1:8850,127.0.0.1:8860    #配置中心地址,多个逗号分隔
  ```



## JAVA也可以爬虫

```java
github地址：https://github.com/code4craft/webmagic/blob/master/README-zh.md
gitee地址： https://gitee.com/flashsword20/webmagic?_from=gitee_search
基于webmagic
```

## JAVA获取系统信息

https://gitee.com/mirrors/WGCLOUD.git

oshi-core组件是开源的获取系统信息的工具，通过该工具可以方便的帮助我们获取丰富的系统信息，包括：操作系统信息、服务器信息、jvm信息、磁盘信息等等。

```xml
<dependency>
    <groupId>com.github.oshi</groupId>
    <artifactId>oshi-core</artifactId>
    <version>5.3.6</version>
</dependency>
```



## JenKins

GitLab  ;  GitBook

```cmd
1、是修改了文件，没有任何 git 操作
git checkout -- aaa.html // 指定还原`aaa.html`文件
git checkout -- * 		 // 还原所有文件
2、修改了文件，并提交到暂存区（即：编辑之后，进行git add 但没有 git commit -m "留言xxx"）
git log --oneline         // 可以省略
git reset HEAD            // 回退到当前版本
git checkout -- aaa.html
3、修改了文件，并提交到仓库区（即：编辑之后，进行git add 并且 git commit -m "留言xxx"）
git log --oneline   // 可以省略
git reset HEAD^    // HEAD^ 是回退到上个版本	HEAD~数字 是回退到数字个版本
git checkout -- aaa.html
```



## 日志服务器的搭建

* syslog4j

### Kibana 可视化工具 

* 与 搜索引擎Elasticsearch 合作, logstash
* 日志可视化工具

### logstash收集日志

* https://gitee.com/beijing_hongye_huicheng/lilishop-spring-learning/tree/master/elk

## CodeMirror使用小结

CodeMirror可以在线编辑代码，风格包括js, java, php, c++等等100多种语言。

 https://codemirror.net/index.html 

https://blog.csdn.net/haoyanyu_/article/details/82252583 学习地址

# 如何开发一个桌面应用

## 1、electron

Electron是一个能够让你使用JavaScript 调用丰富的原生 APIs 来创造桌面应用。 **一个 Electron 有且只有一个主进程**

学习例子pdmaner：   https://gitee.com/robergroup/pdmaner

```cmd
npm config set registry https://registry.npm.taobao.org
npm install -g electron  #默认使用 --save,  dev表示仅在开发过程中使用
npm install -g electron-forge --save-dev  #好像也是打包工具

下载比较慢，可以用临时仓库，要现在package.json指定electron的版本
npm install --registry=https://npm.taobao.org/mirrors/electron/

#新建项目
electron-forge init myapp 
#启动
npm start
#打包，执行(下载的包失败，可以下载放在目录下) 
npm run make
桌面应用即完成
```

### 1、打包 

会有一个app.asar文件的，基本是用electron开发

```cmd
#打包2
npm install  electron-builder --save-dev
#打包3
npm install -g electron-packager --save-dev
## 或在package.json中添加代码
"scripts": {
  "package": "electron-packager ./ myapp --all --out=package --electron-version 13.1.5 --overwrite --icon=./build/assets/favicon.ico
}
##electron-packager命令（注意把要下载的zip包放在目录下
electron-packager . MyApp --platform=win32 --arch=x64 --out=./out --icon=./app.ico --app-version=0.01 --overwrite --electron-zip-dir=../
基本代码命令说明：
electron-packager <sourcedir> <appname> --platform=<platform> --arch=<arch> --out=out --icon=assets/app.ico --asar --overwrite --ignore=.git

说明：
sourcedir：项目源文件所在路径（唯一的必须参数）
appname：项目名称（直接使用package.json文件中的name属性更方便）
platform：要构建哪个平台的应用（Windows、Mac 还是 Linux）
arch：构建架构 包含ia32,x64,armv7l,arm64
out：打包后的地址
icon：打包图标
asar：是否生成app.asar, 不然就是自己的源码
overwrite：覆盖上次打包
ignore：不进行打包的文件
设置了比较简单的打包代码（在scipts节点添加下面代码）
"packager": "electron-packager ./ testapp --win --out ./outputs"
./：sourcedir，项目路径
testapp：appname，打包后可执行程序(.exe)的名字
–win：platform，构建win平台的打包
–out：打包后的地址，./outputs 就是打包后的地址
————————————————
https://blog.csdn.net/u013116210/article/details/107809014

```



```json
https://blog.csdn.net/weixin_40629244/article/details/116429201
```

* 通讯 electron 的进程分为 **主进程** 和 **渲染进程**

```cmd
#main.js为主进程
你在入口文件的index.js创建的 BrowserWindow 些为渲染进程

const { remote, shell, ipcRenderer } = require('electron');

ipcRenderer.send('window-close') // 发送命令
ipcRenderer.send('asynchronous-message', '顶你个肺') // 发送消息

#渲染进程之间是不可以直接通讯的！可以通过主进程做桥梁
// 主进程监听渲染进程消息
ipcMain.on('asynchronous-message', (event, arg) => {
  // event.sender.send('asynchronous-reply', arg) // 返回当前进程消息：'顶你个肺'
  // 指定另一个渲染进程接收 ，这里的目标进程 
  mainWindow.webContents.send('asynchronous-reply', arg) // 返回一个'顶你个肺'
})
//渲染线程监听主进程发送消息
ipcRenderer.on('asynchronous-reply',, (event, arg) => {...})
```

* dialog读写文件的操作

```js
//引入需要的包
const { dialog } = require('electron')
const fs = require("fs");

//详细学习node的fs模块方法 

//导出文件
ipcMain.on('file_export',(event,arg)=>{
    //调用dialog的showSaveDialog
    var filePath = dialog.showSaveDialog(mainWindow, {
        title: "保存文件",
        defaultPath: "",
        //这里选择saveFile
        properties: ['saveFile'],
        filters: [
            //根据需要设置文件类型
            { name: '.txt', extensions: ['txt'] }
        ]
    }).then(result => {
        //打开选择的保存文件路径
        var fd = fs.openSync(result.filePath, 'w');
        //将数据写入文件
        fs.writeSync(fd, arg);
        //关闭文件
        fs.closeSync(fd);
        //告诉显示进程，文件写入完成
        mainWindow.webContents.send('log_export_success')
    }).catch(err => {
        console.log(err)
    })
})
//导入文件
ipcMain.on('file_import',(event,arg)=>{
    //调用showOpenDialog
    dialog.showOpenDialog({
        title: "选择导入文件",
        defaultPath: "",
        //选择openFile
        properties: ['openFile'],
        filters: [
            //设置文件类型
            { name: 'txt', extensions: ['txt'] }
        ]
    }).then(result => {
        console.log(result.filePaths[0]);
        //文本方式读取文件
        fs.readFile(result.filePaths[0], 'utf-8', (err, data) => {
            if (err) {
                console.log("An error ocurred reading the file :" + err.message)
                return
            }
            //数据发送到显示进程
            mainWindow.webContents.send('file_import_success',data)
        })
    }).catch(err => {
        console.log(err)
    })
})
```



* pc端微信开发是 C++ 基于 duilib实现的  Win32 API结合DUI库

**NW.js**、 **AppJS**、**Meteor**、**Proton Native**

https://baijiahao.baidu.com/s?id=1680087990414788282&wfr=spider&for=pc

* 桌面开发

https://www.zhihu.com/question/453979660/answer/2397193140

## 2、NW.js

桌面APP打包利器 —— Node-webkit  像微信开发者工具、抖音开发者工具；要下载sdk版本的

https://tool.4xseo.com/article/219685.html

https://www.jianshu.com/p/55e7c1143f2a

https://enigmaprotector.com/en/downloads.html



package.json 配置信息如下

```json
{
    "main": "index.html", // 配置项目起始页
    “name”: "nw-demo", // 应用取个唯一的名称（任意）
    ”description“: "项目描述信息"， // 项目描述信息
    “version”: "0.0.1", // 定义版本号
    "keywords": ["demo", "node-webkit"], // 项目关键字
    "window": {
        "title": "如果 index.html 没有设置 title,则会显示这里的值",
        "icon": "./logo.png", // 图标路径
        "position": "center", // 客户端唤醒窗口所在位置
        ”width“: "680", // 客户端唤醒窗口宽度
        ”height“: "420", // 客户端唤醒窗口高度
        ”toolbar“: true, // 是否显示工具栏（调试阶段）
        ”frame“: true, // 是否显示最外层框架（窗口最小化、最大化、关闭）
        ”resizable“: true, // 是否设置可伸缩
        ”min_width“: "640", // 最小宽度
        ”min_height“: "200", // 最小高度
        "max_width": "1200", // 最大宽度
        ”max_height“: "600", // 最大高度
        "always_on_top": true, // 是否始终显示在最上层
        ”fullscreen“: true, // 是否全屏
    }
} 
### 完整json
{
    "main": "appDemo.html", 
    "name": "nw-demo", 
    "description": "项目描述信息", 
    "version": "0.0.1", 
    "keywords": ["demo", "node-webkit"],
    "window": {
        "title": "如果 index.html 没有设置 title,则会显示这里的值",
        "icon": "./logo.png", 
        "position": "center", 
        "width": "680", 
        "height": "420", 
        "toolbar": true, 
        "frame": true, 
        "resizable": true, 
        "min_width": "640", 
        "min_height": "200", 
        "max_width": "1200", 
        "max_height": "600", 
        "always_on_top": true, 
        "fullscreen": true
    }
}

例子二
{
  "main": "index.html",
  "name": "WeixinMenuEditor",
  "description": "使用nw.js封装的一个微信公众号菜单编辑器App",
  "version": "0.0.1",
  "keywords": [ "微信", "菜单编辑器" ],
  "window": {
    "title": "微信菜单编辑器",
    "icon": "app/logo.png",
    "toolbar": true,
    "frame": true,
    "width": 750,
    "height": 400,
    "position": "center",
    "min_width": 400,
    "min_height": 200
  },
  "webkit": {
    "plugin": true,
    "java": false,
    "page-cache": false
  },
  "chromium-args" :"-allow-file-access-from-files"
}

```

```cmd
copy /B nw.exe+sina.nw sina.exe
```

## 3、wails 和vue

查看go.md文件







# 工具总结

pdman 数据库设计

onlyOffice开源文档编辑器  [kkFileView](https://gitee.com/kekingcn/file-online-preview)-openOffice

**前端：** Vue.js  React.js  微信小程序、 ElementUI 、BootStrap、TOPUI、LayUI

**后端：**Redis、MQ、SringBoot、Dubbo、SringCloud、Nacos、Mycat、Mybatis-PLUS、

**Linux：**Nginx、Docker、Kubernetes、Jenkins、kibana、elasticsearch、fastDFS、Portainer(docker管理工具)

```
Harbor 封装了Docker的registry v2，帮用户提供了许多便捷管理的特性，方便用户操作
```

**代码管理：** SVNtortoise、Git、GitLable、私服Nexus

**图片或视频水印**： FFmpeg

**思维导图软件**：XMind， GitMind



**安全扫描：**

* NESSUS https://zhuanlan.zhihu.com/p/395459622

Typora的破解下载地址： https://dyyidc.jb51.net/202112/tools/typorapj_jb51.rar



 

**内网穿透**

* uTools: https://res.u-tools.cn/version2/uTools-2.6.3.exe
* 花生壳 需要实名验证
* https://natapp.cn/tunnel/edit/06r7nw7qpd   netapp内外穿透



vercel官网 ： https://vercel.com/login 作用是可以部署github上的项目，待研究





## 记录Ip属地解析地址：

https://www.cz88.net/api/cz88/ip/openIPInfo?ip=110.87.98.42  

http://whois.pconline.com.cn/ipJson.jsp?ip=xxx.xxx.xxx.xxx&json=true
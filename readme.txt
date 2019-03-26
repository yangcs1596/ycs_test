
 git add readme.txt //添加文件  
 git status    
 git commit -m 'first commit   //执行git commit -m '‘ 在‘’之间添加更新日志，就是你更新了哪些内容
 git status
 git push origin master  //推送数据到远程仓库

 git remote查看当前的远程库。


----------------------
修改文件后，怎么提交到远程仓库
1.git status 查看git是否有修改内容需要提交
2.git add 指向需要提交的内容文件
3.git commit 提交到本地库
4.git push origin master 提交到远程仓库
---------------------------
更新文件到github其实也差不多的步骤


1.输入指令：git add 文件名称或者 git add.


2.输入指令：git commit -m "这是注释内容"


3.这一步从本地仓库或本地分支获取并集成(整合)，输入指令：git pull origin master


4.如果过程中出现‘please enter a commit message…’,首先按下esc退出键然后输入 ：wq即可


5.输入指令：git push -u origin master
--------------------- 
 
-------------------------------------------

 Git鼓励大量使用分支：

查看分支：git branch

创建分支：git branch <name>

切换分支：git checkout <name>

创建+切换分支：git checkout -b <name>

合并某分支到当前分支：git merge <name>

删除分支：git branch -d <name>



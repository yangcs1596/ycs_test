```cmd
#dir  显示目录中的内容

例：dir   // 显示当前目录中的子文件夹与文件
例：dir /b  // 只显示当前目录中的子文件夹与文件的文件名
例：dir /p  // 分页显示当前目录中的子文件夹与文件
例：dir /ad  // 显示当前目录中的子文件夹
例：dir /a-d  // 显示当前目录中的文件

#pushd  popd  使用栈来维护当前目录

md d:\mp3 // 在C:\建立mp3文件夹
md d:\mp4 // 在D:\建立mp4文件夹
cd /d d:\mp4 // 更改当前目录为d:\mp4
pushd c:\mp3 // 将当前目录d:\mp4入栈，并切换当前目录为c:\mp3
popd  // 将刚才保存的d:\mp4弹栈，并设置为当前目录

#tree 显示目录结构
例：tree d:\myfiles  // 显示d:\myfiles目录结构


copy 拷贝文件

例：copy key.txt c:\doc  // 将当前目录下的key.txt拷贝到c:\doc下（若doc中也存在一个key.txt文件，会询问是否覆盖）
例：copy jobs c:\doc  // 将当前目录下jobs文件夹中文件（不递归子目录）拷贝到c:\doc下（若doc中也存在相应的文件，会询问是否覆盖）
例：copy key.txt c:\doc\key_bak.txt  // 将当前目录下的key.txt拷贝到c:\doc下，并重命名为key_bak.txt（若doc中也存在一个key_bak.txt文件，会询问是否覆盖）
例：copy /Y key.txt c:\doc  // 将当前目录下的key.txt拷贝到c:\doc下（不询问，直接覆盖写）
例：copy key.txt +  // 复制文件到自己，实际上是修改了文件日期
例：copy /Y key1.txt + key2.txt key.txt  // 将当前目录下的key1.txt与key2.txt的内容合并写入key.txt中（不询问，直接覆盖写）
例：copy /B art_2.7z.* art_2.7z    // 将当前目录下的art_2.7z.开头的所有文件（按照名称升序排序）依次合并生成art_2.7z
例：copy /B art_2.7z.001+art_2.7z.002 art_2.7z    // 将当前目录下的art_2.7z.001、art_2.7z.002文件合并生成art_2.7z

xcopy  更强大的复制命令
例：xcopy c:\bat\hai d:\hello\ /y /h /e /f /c    // 将c:\bat\hai中的所有内容拷贝到d:\hello中  注意：需要在hello后加上\  表示hello为一个目录，否则xcopy会询问hello是F，还是D
例：xcopy c:\bat\hai d:\hello\ /d:12-29-2010  // 将c:\bat\hai中的2010年12月29日后更改的文件拷贝到d:\hello中

robocopy  更强大的复制命令

例：robocopy .\Plugins .\PluginsDest /MIR /xd Intermediate Binaries  // 将当前目录下Plugins中所有内容（排除名为Intermediate和Binaries的文件夹）保留目录结构拷贝到当前目录下的PluginsDest中（PluginsDest不存在会自动创建）
例：robocopy c:\test d:\test2 /MIR /xd Intermediate /xf UE4Editor-SGame-Win64-DebugGame.dll *.pdb // 将c:\test中所有内容（排除名为UE4Editor-SGame-Win64-DebugGame.dll和pdb后缀的文件）保留目录结构拷贝到d:\test2中（d:\test2不存在会自动创建）

move 移动文件

例：move *.png test  // 将当前目录下的png图片移动到当前目录下test文件夹中 （若test中也存在同名的png图片，会询问是否覆盖）
例：move /Y *.png test  // 将当前目录下的png图片移动到当前目录下test文件夹中 （不询问，直接覆盖写）
例：move 1.png d:\test\2.png  // 将当前目录下的1.png移动到d盘test文件夹中，并重命名为2.png （若test中也存在同名的png图片，会询问是否覆盖）
例：move test d:\new  // 若d盘中存在new文件夹，将当前目录下的test文件夹移动到d盘new文件夹中；若不存在，将当前目录下的test文件夹移动到d盘，并重命名为new

del 删除文件   注意：目录及子目录都不会删除
例：del test  // 删除当前目录下的test文件夹中的所有非只读文件（子目录下的文件不删除；删除前会进行确认；等价于del test\*）
例：del /f test  // 删除当前目录下的test文件夹中的所有文件（含只读文件；子目录下的文件不删除；删除前会进行确认；等价于del /f test\*）
例：del /f /s /q test d:\test2\*.doc  // 删除当前目录下的test文件夹中所有文件及d:\test2中所有doc文件（含只读文件；递归子目录下的文件；删除前不确认）
```



### windown10桌面问题

#### Host所在目录

```
C:\Windows\System32\drivers\etc 
```



#### 新窗口无法出现在最上面

```
ctrl + shift +esc  任务管理器，有个Windows资源管理器
#当桌面变黑，应用图标都没有了， 新建任务， 输入 Explored
```



#### 复制文件包含目录结构命令例子

```cmd
robocopy d:\work e:\back *.txt *.doc *.bmp *.tif /s
将d:\work文件下的TXT、DOC、BMP、TIF复制到e:\back文件夹，其他文件则不复制。/s是表示包括  
/S :: 复制子目录，但不复制空的子目录。
/E :: 复制子目录，包括空的子目录。
除空文件下的所有子目录，如果没有则仅复制d:\work下的文件而不包括子目录
（2）如果只想复制两个层级内的文件（再下的层级里的文件则不拷贝），输入命令：
robocopy d:\work e:\back /e /lev:2
/lev:2表示复制的层级，比如指定层级后d:\work\soft（二级）下的文件会被复制，而d:\work\soft\office（***）下的文件则不被复制。

robocopy d:\work e:\back /e /xf *.tmp *.bak
[参数讲解]
/xf为指定不执行复制操作的文件类型，后面的文件名支持通配符。如果参数为/xd，则表示排除后面指定的文件夹。

robocopy d:\work e:\back /e /max:6000000
[参数讲解]
　　仅复制不大于6000000bytes的文件，/max:后直接接数值，数值单位为byte。如果是/min:1000，则复制不小于1000bytes的文件。两个参数可以同时使用，界定复制文件大小的范围。
  robocopy d:\work e:\look /s *.txt *.doc *.xls *.ppt /maxage:7
  只要这一周修改的文件
  
 完全克隆
 robcopy d:\work e:\look /mir
[参数讲解]
/mir的作用等同于/purge /e，/purge表示清理目标文件夹有而源文件夹里没有的文件（夹）。通过这个命令，能保证源文件夹和目标文件夹结构与文件完全相同。这在创建镜像备份时，非常有用。



删除空文件夹
　　xxcopy c: emp/rmdir /sz:0 /yy
删除c: emp下所有空文件夹，/sz:0指定大小为0的文件（夹）。
删除0字节文件
　　xxcopy c: emp*.*/sz:0 /s /h /yy /rs
```





### 简单的cmd脚本

```cmd
@echo off
echo "%JAVA_HOME%"
exit 0
cmd /k


#说明
start cmd /k "cd/d D:\AA\service\redis &&redis-server.exe redis.windows.conf &&taskkill /f /t /im cmd.exe"
start 是用来启动一个应用的，使用方式为：start 程序名
cmd /k 表示cmd后面的命令执行完后不关闭窗口
cmd /c 表示执行完cmd命令后关闭命令窗口
```


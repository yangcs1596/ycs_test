# wails和vue开发个桌面应用

前提：

### 模板新建项目

```cmd
wails init -n [你的应用名称] -t https://github.com/misitebao/wails-template-vue
#或者gitee地址 https://gitee.com/wailscn/wails-template-vue/tree/v1.0.0-beta.2
n - 将要创建的应用名称
t - 模板名称，支持内置模板名称以及超链接形式的第三方模板
```



### 安装

适合Go做的比较成熟的软件开发方向主要包括服务器开发，云平台开发，微服务实践和重构，区块链开发

```go
//安装Wails v1.16.9
go get -u github.com/wailsapp/wails/cmd/wails
//最新版本
go install github.com/wailsapp/wails/v2/cmd/wails@latest 

go mod download github.com/wailsapp/wails


//常用命令
wails init
//安装依赖
//启动写好的桌面项目
wails serve
//Final Build and Run
wails build -d
./cpustats
```



* 1、安装walk模块

```go
默认你是个GO语言的老手，已经配置好了golang的开发环
go get github.com/lxn/walk

第二种，从github下载之后，按如下目录放置 %GOPATH%\src\github.com\lxn\walk ，

然后执行 go install github.com\lxn\walk 命令进行安装。
```

下载解压gcc

https://nchc.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-win32/seh/x86_64-8.1.0-release-win32-seh-rt_v6-rev0.7z

配置bin目录在path系统环境变了



* 2、安装rsrc

```go
go get github.com/akavel/rsrc
```

* 3、创建 manifest 文件

```xml
在项目根目录下创建 main.manifest 文件，内容固定：

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0" xmlns:asmv3="urn:schemas-microsoft-com:asm.v3">
    <assemblyIdentity version="1.0.0.0" processorArchitecture="*" name="SomeFunkyNameHere" type="win32"/>
    <dependency>
        <dependentAssembly>
            <assemblyIdentity type="win32" name="Microsoft.Windows.Common-Controls" version="6.0.0.0" processorArchitecture="*" publicKeyToken="6595b64144ccf1df" language="*"/>
        </dependentAssembly>
    </dependency>
    <asmv3:application>
        <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
            <dpiAware>true</dpiAware>
        </asmv3:windowsSettings>
    </asmv3:application>
</assembly>
```

## 基础概念

* main

```go
package main

import (
  _ "embed" 
// _操作其实是引入该包，而不直接使用包里面的函数，而是调用了该包里面的 init 函数。
  "github.com/wailsapp/wails"
)

func basic() string {
  return "Hello World!"
}

//go:embed frontend/dist/app.js
var js string

//go:embed frontend/dist/app.css
var css string

func main() {

  app := wails.CreateApp(&wails.AppConfig{
    Width:  1024,
    Height: 768,
    Title:  "test2",
    JS:     js,
    CSS:    css,
    Colour: "#131313",
  })
  app.Bind(basic)
  app.Run()
}

```

从 `main.go` 文件中可以看到 `//go:embed` 这两句代码，这用到了 `go 1.16` 开始官方提供的 `embed` 新特性，通过这两个指令将 js，css 文件里的代码赋值给 `js`，`css` 两个字符串变量。

> 所以， `wails` 对go最低版本要求是 `1.16` 。
>
> `//go:embed` 指令，可以在编译阶段将静态资源文件打包进编译好的程序中，并提供访问这些文件的能力。

* 绑定

```go
app.Bind(NewShowmess()) //注意这里返回的指针的结构体

window.backend.Showmess.Show("hello").then((resout) => {
        alert(console.log)
      });
```



```go
package main

import {
    "fmt"
    "io/ioutil"
    "os"
    "path"
    
    "github.com/fsontify"
    "github.com/wailsapp/wails"
}

type Todos struct {
   title string
   author string
   subject string
   book_id int
   logger  *wails.CustomLogger
   runtime  *wails.Runtime
   watcher  *fsnotify.Watcher
}

// NewTodos attempts to create a new Todo list
func NewTodos() (*Todos, error) {
	// Create new Todos instance 新建实例
	result := &Todos{}
	// Return it
	return result, nil
}


//注意上图的结构体定义中的runtime和logger，todo项目中出现过以如下方式调用：
t.runtime.Window.SetTitle(t.filename)
t.runtime.Events.Emit("filemodified")
t.logger.Info("I'm here")

// 方法定义
首先，定义了一个首字母大写的结构体，然后按照如下的格式定义方法，注意方法名首字母大写才可被前端访问，类似public，首字母小写的方法只能内部调用。

func (t *Todos) Method(name string, filename string) error {
	...
}


```

## GO中数据传向js

`App.vue` 中 **export default { … methods: {** 处添加方法，下面是两个示例：

```vue
getMessage: function() {
  var self = this;
  window.backend.basic().then(result => {
    self.message = result;
  });
}
 
loadList: function() {
  window.backend.Todos.LoadList()
    .then(list => {
      try {
        let todos = JSON.parse(list);
        this.loading = true;
        this.todos = todos;
      } catch (e) {
        this.setErrorMessage("Unable to load todo list");
      }
    })
    .catch(error => {
      this.setErrorMessage(error.message);
    });
}
```

## JS中数据传给GO

```go
在go中定义的方法增加参数，如：
func (t *Todos) SaveList(todos string) error {
    ...
}
    
JS中调用：  
window.backend.Todos.SaveList(JSON.stringify(todos, null, 2));
   
```



# 常用命令

## 运行

```go
go run 文件名.go //运行
go build -ldflags="-H windowsgui" //编译 -o 文件名

```


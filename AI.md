## AI工具

绘画模型 control net模型

基本基于python写的

gpu服务器

图片的服务

### 素材模型库

```
3DDD
POLIIGON 贴图库
EVERMOTION
```

### 本地跑大模型

```shell
Ollama3   https://ollama.com/
前端Anything LLM
Open-WebUi 
#安装Docker命令
docker run -d -p 3000:8080 
--add-host=host.docker.internal:host-gateway 
-v open-webui:/app/backend/data 
--name open-webui --restart always ghcr.io/open-webui/open-webui:main
http://localhost:3000


#如使用对话数据集，一个问题一个答案
#选择合适的工具训练模型 比较有名的unsloth， torchtune

LM studio
需要什么配置 
大内存和大显卡

PyThoch、 huggingface/transformers

#Ollama 与 Dify：AI 应用开发的强大组合 https://zhuanlan.zhihu.com/p/696216386
Ollama 官方网站： https://ollama.ai/
Dify 官方网站： https://dify.ai/
Mistral 官方网站： https://mistral.ai/
```



```
DeepSpeed等优化工具提升大模型的运行效率
```



https://github.com/Mikubill/sd-webui-controlnet



stable diffusion 收费的软件 

* autopod自动剪辑视频
* midmaster 一句话自动生成思维导图，直接生成ppt
* gui.cn一键真人转动漫domo





## SAI2的学习记录

### 笔刷的作用

* 铅笔：画线稿、饱和

* 喷枪：过渡、模糊边缘

* 画笔：画线稿
* 水彩：过渡、模糊边缘
* 模糊：过渡

### 线条技巧

* CSI画法
* ctrl+T快速选中
* H水平翻转，V垂直翻转

### 蒙版的作用

* 剪贴蒙版（用图层夹，画暗部）:一般应用线稿上色较多，贴花纹，做特效

* 图层蒙版:一般用于画线稿较多

* 滤镜（用于调色）：色调调整:一般可以用于快速调整图层夹颜色（注意拷贝图层夹）

* 纸张--->混合

​       图层正片叠底-滤色-叠加： 一般用来杨色增加特效制造层次感

​		图层发光（模糊画笔）：变亮颜色

​	   叠底：一般用来画光影

* 锁定不透明度（线稿，上色就不会超出边沿）

* 图像-->描边： 实现下描边功能


```
#剪贴蒙版的叠加
1、新建文件夹
```

* 滤镜-高斯模糊： 会将物品放在远处的感觉

### SAI2皮肤上色

```
1、选区， 选择扩展一个选区像素，不会有锯齿； 反选修一修边沿
2、填充一个淡橙色H-24作为肤色，提高纯度S-08 降低明度V-100 得到二分颜色
3、吸取固有色，颜色往红色方向调； 水彩笔将过渡部分涂抹一下，纯度更纯S明度更低V颜色，压一下暗部
4、新建一个发光图层，用喷枪喷亮，记得降低图层的不透明度
5、新建一个叠加图层，选一个冷色，喷枪喷一下暗部；炫一个亮色，画出高光
```

* 添加水彩笔画笔

```
1、纸质效果： 羊皮纸
2、倍率尽量调高 288%
3、水彩边缘 调到2-4
```

#### SAI2上色技巧

```
1、平涂：选择铅笔，质感羊皮纸，效果选水彩边界
2、混色：先画出两块颜色，选择水彩笔
3、渐变：水彩笔，最小色彩浓度0
4、晕染：先平涂颜色， 然后选水彩笔，硬度最软 涂边缘
```



## PhotoShop的学习记录

### 绘画常用快捷键

```
B画笔 
E橡皮擦
R涂抹
ctrl + U 色相饱和度
CTRL + alt + G 创建剪贴蒙版
```



### 去水印方法

```
1、内容识别法，多余的选区用套索工具减选（alt减），
选择-->修改-->拓展-->2像素
编辑-->填充-->内容识别  shift+f5

2、色阶法(适用于文档的水印) ctrl + L， 
   去除彩色水印 ctrl +shift +u 去色后再ctrl +L
3、消失点法（滤镜里面的消失点命令，消失点选择范围，选框工具选中相似内容，拖动覆盖水印
4、反向混合法， 
选中水印复制，ctrl+i反向，混合模式为颜色减淡， 复制图层，遮住所有水印
5、借鉴法，利用【修补工具】选中水印，拖动去除

说明：不是所有的水印都可以去除，不然真的很刑很刑
```

### 批量生成图片线稿

```
设置动作 窗口-->动作
1、复制图层 ctrl+j？
2、去色:图像-->调整-->去色  ctrl+shift+u
3、复制图层：混合模式：颜色减淡
4、反相:图像-->调整-->反相 ctrl+i 
5、最小值:滤镜-->其它-->最小值

批量执行动作
新建动作组，新建动作，录制完成 停止动作后
文件-->自动-->批处理
```

### 光效

```
大致总结：滤镜 + 图层的混合模式
颜色减淡、复制图层线性减淡， ctrl+t选中，ctrl+shift+鼠标调整扁平
创建图层蒙版  图层-->图层蒙版-->显示全部  
右下角的icon -->右键-->曲线
滤镜+模糊+高斯模糊， 调整图层上下顺序

```

#### 阳光特效

```
1、框选工具，背景图层有明暗
2、选择--》模糊---》径向模糊  调整成缩放，数量改成最高，模拟光散射效果
3、图层模式改成【线性减淡】
4、曲线命令、色彩饱和度、加强对比度
5、蒙版， 把多余的光涂抹去掉
```

#### 落日倒影

```
滤镜--》扭曲---》置换   水平垂直比例100
```



### 证件照抠图处理

```
身份证板子大小 86.5cm, 56cm
#更改背景色
1、右下角的icon -->右键-->色相饱和度
自定义、 有个小手icon点击吸取颜色，调整色相
#抠图、 选区shift加选，alt减选
1、头发-通道抠图-->主要是为了选区
ctrl+L调出色阶
X切换上下色
ctrl+i反相
```

* 魔术橡皮擦：删除与取样颜色相近的颜色

```
#通道抠图
通道： 红、绿、蓝 
1、复制其中一个色的通道，
2、ctrl+L 创建色阶 让白色更白黑色更黑
3、反选ctrl+shift+i
```

* 主体抠图

```
1、套索工具
2、选择主体
```

* 选择并遮住

```
1、套索工具、快速选择工具
2、选择并遮住
```



### 拖动时复制选区

1、选择移动工具，ctrl移动工具

2、alt移动要复制的选区

ctrl+c 和ctrl+v会新建复制图层

* 将一个选区粘贴到另一个选区的里面或外面

```
选取编辑 > 选择性粘贴 > 贴入。源选区的内容在目标选区内显示。
选取编辑 > 选择性粘贴 >外部粘贴。源选区的内容在目标选区周围显示。
```

## PS人像精修教程

### 基础工具了解

```
1、污点修复工具： 根据周边环境修复
  修复画笔工具： alt+鼠标左键： 把某一个地方复制到另一个地方（比较少用，鸡肋）
  修补工具   ： J j圈起来坏的，移动到好的地方 （即好的覆盖坏的，自动调整）
  仿制图章工具： 快捷键S  alt选择一个区域，完全的复制过去 （alt+鼠标右键 调整画笔软硬大小）
  红眼工具 ： 把眼睛变黑
2、液化工具： 滤镜-->液化 （alt往左边旋转） （修脸等比较常用）
   滤镜工具： 滤镜-->camera Raw滤镜  曝光&高光&阴影
----分割线------   
3、中性灰： 新建图层ctrl+shift+n-->混合模式柔光， 图层填充灰色（B-50%Gray） 常用 修复皮肤磨皮，修复光影关系
画笔的不透明度调整20%左右

   右下角ico-->渐变映射（用黑白色）
   右小角icon-->曲线  调整亮度
4、双曲线： 建立两个曲线，一个变亮一个压暗，都是用黑色填充。 然后用画笔颜色在各自变亮或者变暗  (比较常用)
思考？ 把阴影部分提亮， 把高亮部分压暗


建一个观察图层
1、右下角icon-->色相饱和度  饱和度降为0
2、右下角icon-->曲线  曲线变成S形 加强对比度观察
或者
1、按下d键
2、右下角icon-->渐变映射
3、增强对比，可以增加个曲线
shift选择图层，ctrl+g可以创建图层组

钢笔工具
ctrl, alt键， 右键长按
ctrl+enter 
```

### 如何模糊背景

```
1、选择-->主体  返现
2、复制背景图层2
3、滤镜-->模糊-->高斯模糊
4、将背景图层2，创建一个剪贴蒙版即完成
```

## PS制作动画

窗口-->时间轴

1、创建视频时间轴

## PS贴图

```
1、复制需要的贴图图层
2、新建空白图层， 目标 滤镜-->消失点， ctrl拉出锚点其他面，  ctrl+v粘贴需要的素材贴图，拉入网格
3、将空白图层混合模式改成正片叠底
```

```
1、选择工具选出目标主体
2、复制出主体新图层
3、打开素材图片，创建剪贴蒙版； ctrl+T自由模板； 右键变形（变形选为凸起）混合模式改成 线性加深
4、双击图层，增强光影细节
```

### ps自然上色

```
#给口唇上色
1、复制图层、套索选区
2、新图层，选区上色、图层为正片叠底
3、双击图层， alt键 增强光影细节
4、滤镜-->模糊--高斯模糊
5、黑色柔边涂抹调整一下阴影
```

* PS头发换颜色

```
1、快速选择工具选择区域 拷贝图层
2、选择-->选择并遮住， 左边第二个画笔涂抹头发边缘
3、属性中，新建带有图层蒙版的图层
4、左下角icon -->新建色彩平衡  就可以随意调整颜色
```

### PS艺术字

```
1、钢笔工具-->上方选择路径--》勾出文字路径
2、涂抹工具-->上方强度85，角度35-->涂抹画笔改成硬边圆压力大小
3、拖入一张素材，新建图层，选择钢笔工具--》右键选择描边路径---》工具选择涂抹
4、关闭素材，完成
```

### PS透明圆球

```
1、ctrl+冒号 出现参考线， 横向纵向卡尺鼠标拉动参考线到中间 视图参考线
2、选款工具， alt+shift键 绘制正圆
3、新建图层， 填充颜色，ctrl+j复制一层原图，放在最顶层
4、复制的图层 滤镜-》扭曲-》球面化， 调整大小，图层改成剪贴蒙版

5、双击图层，修改图层样式，调整光暗部分,  参考 内阴影139像素 渐变叠加 颜色加深 107度
6、其它效果自己调整，如玻璃球面的垂直翻转，其它质感等
阴影法2：复制椭圆图层，右键清楚样式，右键栅格化图层， ctrl+T调整阴影，滤镜模糊-》高斯模糊，修改混合模式--正片叠底，调整不透明度
背景--》模糊-高斯模糊
将背景模糊增加质感
1、复制背景图，转换成智能对象
2、滤镜-->模糊画廊-->移轴模糊  移动焦点 虚实线修改需要模糊的地方，调整模糊值
```

### PS制作阴影的方法

```
#1
1、拷贝目标，放在底部，ctrl+u明度调最低
2、添加图层蒙版，选择黑白渐变
3、滤镜-模糊-高斯模糊，添加不透明度
4、椭圆选框工具画出椭圆，填充黑色，再高斯模糊添加不透明度
```



### PS旋转星轨效果

```
1、CTRL +T 自由变换， w参数改成99.8 角度0.5  变亮 滤色
2、回车确认，  ctrl+shift+alt+T重复执行多次
```



## 简历制作说明

1、页面---》页边距---》窄

2、插入---》形状----》矩形  宽高29.77， 5.39厘米，移到左上角

3、插入----》文本框，复制文本框，进行正文的排版

4、多选文本框模块等， 开始-->排列----》对齐



# Blender4操作

```
1、 添加模型 shift +A
2、界面左侧工具栏 T
  游标  shift +右键  界面中心
  移动 G (可以XYZ单轴移动)
  旋转 R (可以XYZ单轴旋转)
  缩放 S  (X Y Z)
  变换工具
  
  ctrl + shift + -减号 
  shift + Z 调整
3、 模型编辑 tab进入编辑模式   
  shift加 ctrl减少选择 点 边 面
  子元素选择  循环选择 alt
4、合并模型  ctrl + j   分离模型 p
   复制模型  shift + D
   编辑命令组 点 ctrl+v  边 ctrl+e  面 ctrl+F  桥接
   I 内插面 
窗口右上角 四个小球 Z
线框模式
实体模式
材质模式
渲染模式
快速切换线框  shift + Z

https://www.bilibili.com/opus/913830579456180227

```


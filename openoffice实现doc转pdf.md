### 一、启动openoffice启动命令

```
2、用以下命令启动OpenOffice服务 
windows下：
#  cd D:\OpenOffice\OpenOffice4\program
#  soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard 
linux下：
# cd /opt/openoffice4/program 
# ./soffice "-accept=socket,host=localhost,port=8100;urp;StarOffice.ServiceManager" -nologo -headless -nofirststartwizard &
```

#### 方式一 icepdf

```xml
<!--springboot的集成 openoffice 结束-->
        <dependency>
            <groupId>com.artofsolving</groupId>
            <artifactId>jodconverter</artifactId>
            <version>2.2.1</version>
        </dependency>
        <dependency>
            <groupId>org.icepdf.os</groupId>
            <artifactId>icepdf-core</artifactId>
            <version>6.2.2</version>
        </dependency>
<!--libreoffice 是word转pdf的工具？-->
        <dependency>
            <groupId>org.libreoffice</groupId>
            <artifactId>juh</artifactId>
            <version>5.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.libreoffice</groupId>
            <artifactId>jurt</artifactId>
            <version>5.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.libreoffice</groupId>
            <artifactId>ridl</artifactId>
            <version>5.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.libreoffice</groupId>
            <artifactId>unoil</artifactId>
            <version>5.4.2</version>
        </dependency>
        <dependency>
            <groupId>org.libreoffice</groupId>
            <artifactId>unoloader</artifactId>
            <version>5.4.2</version>
        </dependency>
        <!--转换工具结束-->
```

```java
private static OpenOfficeConnection startOpenOffice() {
        //OpenOffice的安装目录，linux环境下需要手动启动openoffice服务
        String OpenOffice_HOME = "D:\\OpenOffice\\OpenOffice4\\";
        // 启动OpenOffice的服务
        String command = OpenOffice_HOME + "program\\soffice.exe -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\"";
        try {
            Process pro = Runtime.getRuntime().exec(command);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //创建连接
        OpenOfficeConnection connection = new SocketOpenOfficeConnection("127.0.0.1", 8100);
        return connection;
    }

    /**
     * 功能描述:  doc转为pdf
     */
    private static void doc2Pdf(String docPath, String pdfPath) {
        File inputFile = new File(docPath);
        File outputFile = new File(pdfPath);
        OpenOfficeConnection connection = startOpenOffice();
        try {
            connection.connect();
            DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
            //converter.convert(inputFile, outputFile);
            DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
            DocumentFormat txt = formatReg.getFormatByFileExtension("odt");
            DocumentFormat pdf = formatReg.getFormatByFileExtension("pdf");
            converter.convert(inputFile, txt, outputFile, pdf);
        } catch (ConnectException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    /**
     * 把ppt word excel等文件生成图片文件
     *
     * @param docPath    文件路径
     * @param imgDirPath 图片保存文件夹
     * @param fileName   文件名称点的前部分
     */
    public static void doc2Imags(String docPath, String imgDirPath, String fileName) {
        String pdfPath = String.format("%s%s.pdf", FilenameUtils.getFullPath(docPath), FilenameUtils.getBaseName(docPath));
        try {
            doc2Pdf(docPath, pdfPath);
            pdf2Imgs(pdfPath, imgDirPath, fileName);
            File pdf = new File(pdfPath);
            /*if(pdf.isFile()){
                pdf.delete();
            }*/
            System.out.println(pdfPath);
        } catch (ConnectException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 将pdf转换成图片
     *
     * @param pdfPath
     * @param imgDirPath
     * @return 返回转换后图片的名字
     * @throws Exception
     */
    private static List<String> pdf2Imgs(String pdfPath, String imgDirPath, String fileName) throws Exception {
        Document document = new Document();
        document.setFile(pdfPath);
        float scale = 2f;//放大倍数
        float rotation = 0f;//旋转角度
        List<String> imgNames = new ArrayList<String>();
        int pageNum = document.getNumberOfPages();
        File imgDir = new File(imgDirPath);
        if (!imgDir.exists()) {
            imgDir.mkdirs();
        }
        for (int i = 0; i < pageNum; i++) {
            BufferedImage image = (BufferedImage) document.getPageImage(i, GraphicsRenderingHints.SCREEN,
                    Page.BOUNDARY_CROPBOX, rotation, scale);
            RenderedImage rendImage = image;
            try {
                String filePath = imgDirPath + File.separator + fileName + i + ".jpg";
                File file = new File(filePath);
                ImageIO.write(rendImage, "jpg", file);
                imgNames.add(FilenameUtils.getName(filePath));
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
            image.flush();
        }
        document.dispose();
        return imgNames;
    }

    public static void main(String[] args) {
        String docPath = "D:\\测试文件夹\\三类技能证书提交要求.docx";
        String pdfPath = "D:\\测试文件夹\\";
        doc2Imags(docPath, pdfPath, "picture");
    }
```

#### 方式二 pdfbox

* 先将doc转成pdf
* pdf再转成Image

```xml
	<!--pdf转换为图片-->
        <dependency>
            <groupId>org.apache.pdfbox</groupId>
            <artifactId>fontbox</artifactId>
            <version>2.0.9</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.apache.pdfbox/pdfbox -->
        <dependency>
            <groupId>org.apache.pdfbox</groupId>
            <artifactId>pdfbox</artifactId>
            <version>2.0.9</version>
        </dependency>
        <!--pdf转换为图片结束-->
```

2-2 

```java
package com.example.demo.util.converter;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @Author: 杨春生
 * @Date: 2019/11/29 17:04
 * @Description:
 */
public class PDF2IMG {
    /**
     * 转换全部的pdf
     *
     * @param fileAddress 文件地址
     * @param filename    PDF文件名
     * @param type        图片类型
     */
    public static void pdf2png(String fileAddress, String filename, String type) {
        // 将pdf装图片 并且自定义图片得格式大小
        File file = new File(fileAddress + "\\" + filename + ".pdf");
        try {
            PDDocument doc = PDDocument.load(file);
            PDFRenderer renderer = new PDFRenderer(doc);
            int pageCount = doc.getNumberOfPages();
            for (int i = 0; i < pageCount; i++) {
                //经过测试,dpi为96,100,105,120,150,200中,105显示效果较为清晰,体积稳定,dpi越高图片体积越大,一般电脑显示分辨率为96
                BufferedImage image = renderer.renderImageWithDPI(i, 96); // Windows native DPI
                // BufferedImage srcImage = resize(image, 240, 240);//产生缩略图
                ImageIO.write(image, type, new File(fileAddress + "\\" + filename + "_" + (i + 1) + "." + type));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 自由确定起始页和终止页
     *
     * @param fileAddress  文件地址
     * @param filename     pdf文件名
     * @param indexOfStart 开始页  开始转换的页码，从0开始
     * @param indexOfEnd   结束页  停止转换的页码，-1为全部
     * @param type         图片类型
     */
    public static void pdf2png(String fileAddress, String filename, int indexOfStart, int indexOfEnd, String type) {
        // 将pdf装图片 并且自定义图片得格式大小
        File file = new File(fileAddress + "\\" + filename + ".pdf");
        try {
            PDDocument doc = PDDocument.load(file);
            PDFRenderer renderer = new PDFRenderer(doc);
            int pageCount = doc.getNumberOfPages();
            for (int i = indexOfStart; i < indexOfEnd; i++) {
                BufferedImage image = renderer.renderImageWithDPI(i, 144); // Windows native DPI
                // BufferedImage srcImage = resize(image, 240, 240);//产生缩略图
                ImageIO.write(image, type, new File(fileAddress + "\\" + filename + "_" + (i + 1) + "." + type));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String fileName = "三类技能证书提交要求";
        String pdfPath = "D:\\测试文件夹\\PDF转换图片测试";
        pdf2png(pdfPath, fileName, "png");
    }
}

```

二、springboot集成openoffice

* 这种转换无法控制输出的文件名？
* 不太好，不建议用集成。

```xml
<dependency>
    <groupId>org.jodconverter</groupId>
    <artifactId>jodconverter-spring-boot-starter</artifactId>
    <version>4.1.0</version>
</dependency>
```

配置

~~~yaml
##################################################
# JodConverter Configuration
# port : 8100, 8101, 8102, 8103, 8104, 8105, 8106, 8107, 8108, 8109
##################################################
jodconverter:
  enabled: true
#  office-home: "E://KnowledgeManual//KManual//openoffice4"
  max-tasks-per-process: 10
  port-numbers: 8100
~~~

引用

```java
@Autowired
private DocumentConverter documentConverter;

####使用
// 源文件 （office）
File source = new File("路径")；
// 输出文件 （pdf）
File target = new File("路径")；
// 转换文件
 if (!target.exists()) {
    documentConverter.convert(source).to(target).execute();
}

```



### 结语
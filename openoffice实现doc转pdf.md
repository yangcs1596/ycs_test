### 一、启动openoffice启动命令

**注意**： openOffice会暴露服务器文件地址，最好不使用这种openOffice的方式！！！

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

#### easypoi对excel进行了各种操作

导入导出的解析等

#### lowagie

https://www.kutu66.com//Java_API_Classes/article_65069#1-yfsys 看不懂的示例

```xml
	<dependency>
        <groupId>com.lowagie</groupId>
        <artifactId>itext</artifactId>
        <version>2.0.8</version>
      </dependency>
```

#### 二维码生成工具zxing

```
<dependency>
<groupId>com.google.zxing</groupId>
<artifactId>core</artifactId>
<version>3.3.0</version>
</dependency>
```



### word转pdf

```
<dependency>
<groupId>com.documents4j</groupId>
<artifactId>documents4j-local</artifactId>
<version>1.0.3</version>
</dependency>
<dependency>
<groupId>com.documents4j</groupId>
<artifactId>documents4j-transformer-msoffice-word</artifactId>
<version>1.0.3</version>
</dependency>

public static void main(String[] args) {

    File inputWord = new File("Tests.docx");
    File outputFile = new File("Test_out.pdf");
    try  {
        InputStream docxInputStream = new FileInputStream(inputWord);
        OutputStream outputStream = new FileOutputStream(outputFile);
        IConverter converter = LocalConverter.builder().build();
        converter.convert(docxInputStream).as(DocumentType.DOCX).to(outputStream).as(DocumentType.PDF).execute();
        outputStream.close();
        System.out.println("success");
    } catch (Exception e) {
        e.printStackTrace();
    }
}
```

#### 1. wkhtmltopdf插件

```java
@Log4j2
public class HtmlToPdf {
    private static String wkhtmltopdfPath = "D:\\wkhtmltopdf\\bin\\wkhtmltopdf";

    /**
     * html转pdf
     *
     * @param htmlStr  html代码
     * @param destPath pdf保存路径
     * @return 转换成功返回true
     */
    public static boolean convert(String htmlStr, String destPath) {
        String srcPath =  string2File(htmlStr);
        File file = new File(destPath);
        File parent = file.getParentFile();
        // 如果pdf保存路径不存在，则创建路径
        if (!parent.exists()) {
            parent.mkdirs();
        }
        StringBuilder cmd = new StringBuilder();
        cmd.append(wkhtmltopdfPath);
        cmd.append(" ");
        cmd.append(srcPath);
        cmd.append(" ");
        cmd.append(destPath);
        boolean result = true;
        Process proc = null;
        try {
            proc = Runtime.getRuntime().exec(cmd.toString());
            HtmlToPdfInterceptor error = new HtmlToPdfInterceptor(proc.getErrorStream());
            HtmlToPdfInterceptor output = new HtmlToPdfInterceptor(proc.getInputStream());
            error.start();
            output.start();
            proc.waitFor();
        } catch (Exception e) {
            result = false;
           log.error(ExceptionUtils.getStackTrace(e));
        } finally {
            new File(srcPath).delete();
            proc.destroy();
        }

        return result;
    }

    /**
     * 将字符串写入指定文件(当指定的父路径中文件夹不存在时，会最大限度去创建，以保证保存成功！)
     *
     * @param res            原字符串
     * @return 成功标记
     */
    public static String string2File(String res) {
        String htmlFilePath = null;
        BufferedReader bufferedReader = null;
        BufferedWriter bufferedWriter = null;
        try {
            String newFileName = SerialGenerator.generateFileName(null, "html");
            String filePath = CommonPath.generalFileRelativePath(newFileName);
            htmlFilePath = CommonPath.fileUploadRootPath + filePath;
            File distFile = new File(htmlFilePath);
            if (!distFile.getParentFile().exists()) {
                distFile.getParentFile().mkdirs();
            }
            bufferedReader = new BufferedReader(new StringReader(res));
            bufferedWriter = new BufferedWriter(new FileWriter(distFile));
            char buf[] = new char[1024];
            int len;
            while ((len = bufferedReader.read(buf)) != -1) {
                bufferedWriter.write(buf, 0, len);
            }
            bufferedWriter.flush();
            bufferedReader.close();
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
            return htmlFilePath;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return htmlFilePath;
    }
    public static void main(String[] args) {
        HtmlToPdf.convert("<html><head></head><body><img src=\"data:image/png;base64,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\"></body></html>", "E:/baidu.pdf");
    }
}

```

#### 2. Aspose

```xml
<!--aspose需要插件？https://products.aspose.com/words/java-->
        <dependency>
            <groupId>Aspose</groupId>
            <artifactId>Aspose-word</artifactId>
            <version>14.11.0</version>
        </dependency>
        <dependency>
            <groupId>Aspose</groupId>
            <artifactId>Aspose-cells</artifactId>
            <version>8.1.1</version>
        </dependency>
        <dependency>
            <groupId>Aspose</groupId>
            <artifactId>Aspose-slides</artifactId>
            <version>19.6</version>
        </dependency>
```

#### 3.onlyOffice

* https://www.jianshu.com/p/2d4f977ffeac

#### 4.wpsOffice收费  pageOffice

#### 5. maven中pom.xml文件统一修改jdk的插件

```mvn
mvn versions:set -DnewVersion=1.2.0-SNAPSHOT
```


由于需要常常更新maven环境，但更新后的问题就是需要重新jdk的环境，如果项目比较多的话就会很麻烦，所以在网上找来了一个插件，只需要将这段话复制在你自己的parent工程中的pom.xml文件里依赖闭合后的下面就可以了

 <build>  
        <plugins>  
            <plugin>  
                <groupId>org.apache.maven.plugins</groupId>  
                <artifactId>maven-compiler-plugin</artifactId>  
                <version>3.5</version>  
                <configuration>  
                    <source>1.7</source>  
                    <target>1.7</target>  
                </configuration>  
            </plugin>  
        </plugins>  
    </build>
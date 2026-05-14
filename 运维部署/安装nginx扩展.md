# 4准备编译环境

### 4.1下载 nginx-http-flv-module 软件源码

方式一：从 GitHub 中，下载 nginx-http-flv-module 文件：https://github.com/winshining/nginx-http-flv-module

### 4.2下载 Nginx 1.24.0 软件源码

方式一：从 Nginx 的官网，下载 1.24.0 版本的源码文件：http://nginx.org/en/download.html。

解压文件

```
[root@localhost src]``# tar -xvf nginx-1.24.0.tar.gz
```

最终目录结构如下：

```
[root@localhost src]# ll
total 4064
drwxr-xr-x 10 1001 1001     198 May 24 17:24 nginx-1.24.0
-rw-r--r--  1 root root 1112471 May  9 15:06 nginx-1.24.0.tar.gz
drwxr-xr-x  8 root root    4096 Mar 19 23:52 nginx-http-flv-module-1.2.11
-rw-r--r--  1 root root 3038417 May 24 14:17 nginx-http-flv-module-1.2.11.zip
```

## 4.3 通过 --add-module 方式添加模块

### 4.3.1 执行编译配置

Nginx 默认编译参数，通过 3.2.2 章节可以得到。我们只需在默认编译参数后面，添加 --add-module=/path/to/nginx-http-flv-module-1.2.11 即可。

进入到 nginx-1.24.0 源码文件夹，并执行以下命令，进行编译配置。注意 **--add-module=/root/nginx/src/nginx-http-flv-module-1.2.11** 配置项，模块路径要按实际情况进行调整。

```
[root@localhost nginx-1.24.0]# ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie' --add-module=/root/nginx/src/nginx-http-flv-module-1.2.11

```

### 4.3.2 编译二进制文件并安装

如果配置命令正常执行，此时只需要执行以下命令即可。

```
[root@localhost nginx-1.24.0]``# make
```

编译命令正常执行之后，可以在 ./objs 目录下看到生成的 nginx 文件

```
[root@localhost nginx-1.24.0]# ./objs/nginx -V
nginx version: nginx/1.24.0
built by gcc 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC)
built with OpenSSL 1.0.2k-fips  26 Jan 2017
TLS SNI support enabled
configure arguments: --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie' --add-module=/root/nginx/src/nginx-http-flv-module-1.2.11
```

### 4.3.3 安装软件

如果编译命令正常执行，只需执行以下命令即可。

```
[root@localhost nginx-1.24.0]``# make install
```

### 4.3.4 功能测试

```
# 回到 nginx-1.24.0 源码目录，复制 ngx_http_flv_live_module.so 文件到 nginx 默认模块目录
[root@localhost nginx-1.24.0]# cp ./objs/ngx_http_flv_live_module.so /usr/lib64/nginx/modules/ngx_http_flv_live_module.so
```

在 nginx.conf 中添加以下配置

```
[root@localhost nginx-1.24.0]# cat /etc/nginx/nginx.conf
user  nginx;
worker_processes  auto;
 
error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

load_module modules/ngx_http_flv_live_module.so;

http {
 
    ... 此处省略默认配置 ...
     
   server {
        listen       80;
         
        ... 此处省略默认配置 ...
 
        location /preview {
            flv_live on; # 打开HTTP播放FLV直播流功能
#            chunked_transfer_encoding on; # default off, 支持chunk方式传输
            add_header 'Access-Control-Allow-Origin' '*'; # 添加额外的HTTP头
            add_header 'Access-Control-Allow-Credentials' 'true'; # 添加额外的HTTP头
        }
        location /playback {
            flv_live on;
            add_header 'Access-Control-Allow-Origin' '*' always;
            add_header 'Access-Control-Allow-Credentials' 'true';
        }
    }
}
```

测试配置是否正确

```
[root@localhost nginx-1.24.0]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```
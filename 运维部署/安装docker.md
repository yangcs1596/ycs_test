参考文档：

1. docker engine 官网文档：https://docs.docker.com/engine/install/binaries/
2. docker compose 官方文档：https://docs.docker.com/compose/install/

# 3.开始安装

## 3.1 查看 cpu 架构

使用 lscpu 命令，查看 cpu 架构信息

```shell
root@city-brain-dev etc]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
  ....
```

从上面查询结果中，可以看到服务器的 cpu 是 Architecture: x86_64

## 3.2 下载 docker 二进制文件

根据官网提示，访问 docker 稳定版仓库：https://download.docker.com/linux/static/stable/，根据 cpu 架构，进入相应的文件夹，选择 docker-27.2.0.tgz 

## 3.3 将文件上传到服务器并解压

tar -xvf $PWD/docker-27.2.0.tgz 

## 3.4 安装 docker

将解压后的文件，复制到 /usr/local/bin 目录中

```
[root@city-brain-dev docker]# ll /usr/local/bin/
-rwxr-xr-x. 1 root root  37814272 Apr 18 11:33 containerd
-rwxr-xr-x. 1 root root  12124160 Apr 18 11:33 containerd-shim-runc-v2
-rwxr-xr-x. 1 root root  18677760 Apr 18 11:33 ctr
-rwxr-xr-x. 1 root root  34646616 Apr 18 11:33 docker
-rwxr-xr-x. 1 root root  68134232 Apr 18 11:33 dockerd
-rwxr-xr-x. 1 root root    601272 Apr 18 11:33 docker-init
-rwxr-xr-x. 1 root root   2044425 Apr 18 11:33 docker-proxy
```

复制后，检查 docker 是否安装成功

```
[root@city-brain-dev docker]# docker -v
Docker version 26.0.1, build d260a54
```

## 3.5 修改 docker 数据目录

默认情况下，docker 的数据目录是：/var/lib/docker

```
fanzhuo@emqx-dev:~/emqx/etc$ sudo docker info | grep Dir
Docker Root Dir: /var/lib/docker
```

**在启动 docker 之前，一定要先检查下磁盘容量，将 docker 的数据目录，修改到大容量磁盘中。查看磁盘空间：**

```shell
[root@city-brain-dev docker]# df -h
Filesystem                                   Size  Used Avail Use% Mounted on
devtmpfs                                     4.0M     0  4.0M   0% /dev
tmpfs                                        7.2G     0  7.2G   0% /dev/shm
tmpfs                                        2.9G  306M  2.6G  11% /run
tmpfs                                        4.0M     0  4.0M   0% /sys/fs/cgroup
/dev/mapper/openeuler_city--brain--dev-root   69G  9.7G   56G  15% /
tmpfs                                        7.2G  172K  7.2G   1% /tmp
/dev/vda2                                    974M  125M  782M  14% /boot
/dev/vda1                                    599M  6.4M  593M   2% /boot/efi
/dev/mapper/vg1-lv1                          196G  7.9G  178G   5% /data
/dev/mapper/openeuler_city--brain--dev-home   20G  2.4G   17G  13% /home
```

由此可见，服务器最大分区为 /data，因此需要将 docker 的数据目录，修改到 /data 目录下

```shell
[root@city-brain-dev docker]# cat /etc/docker/daemon.json
{
  "data-root": "/data/docker"
}
```

## 3.6 配置开机启动

编写开机启动配置文件，将文件复制到 /etc/systemd/system/ 注册目录

```shell
[root@city-brain-dev docker]# cat docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service
Wants=network-online.target
 
[Service]
Type=notify
ExecStart=/usr/local/bin/dockerd
ExecReload=/bin/kill -s HUP $MAINPID
LimitNOFILE=infinity
LimitNPROC=infinity
TimeoutStartSec=0
Delegate=yes
KillMode=process
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s
 
[Install]
WantedBy=multi-user.target
```

## 3.7 启动 docker 服务

```shell
[root@city-brain-dev docker]# systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
     Active: active (running) since Tue 2024-09-17 15:10:12 CST; 1h 39min ago
       Docs: https://docs.docker.com
   Main PID: 1680588 (dockerd)
      Tasks: 125 (limit: 93303)
     Memory: 407.5M
     CGroup: /system.slice/docker.service
...

echo '启动docker...'
systemctl start docker
echo '设置开机自启...'
systemctl enable docker.service
```

## 3.8 下载 docker-compose

访问 docker-compose 二进制下载地址：https://github.com/docker/compose/releases，找到对应版本的二进制文件，点击下载。

将下载后的文件上传到服务器

将 docker-compose 文件复制到 /usr/local/bin 目录中

查看安装结果

```shell
[root@city-brain-dev docker]# docker-compose -v
Docker Compose version v2.29.2
```
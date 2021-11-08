#!/bin/bash
# Safedog Yunlei installer
# by 1057 (lvxj@safedog.cn)
set -o nounset
set -o errexit

export SDC_DEBUG=
if [[ ${1-} == --debug ]]; then
    export SDC_DEBUG=1
    shift
    export PS4='+ [${BASH_SOURCE##*/}:${LINENO}:${FUNCNAME-}] '
    set -x
fi
export PS4='+ [${BASH_SOURCE##*/}:${LINENO}:${FUNCNAME-}] '

export MYSQL_PWD=
SETUPDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
INSTALLDIR=$(readlink -f ${SETUPDIR}/..)
SERVICEDIR=$INSTALLDIR/services
cd $SETUPDIR

# 配置文件
. safedog_cloud.cfg

# 部署前检查
if [[ ! -f $SDTMPDIR/pre_install.mark ]]; then
    bash ./pre_install.sh
fi

# 管理账号
bash ./user.sh -a $RUNUSER
cp safedog_cloud.cfg /home/$RUNUSER/mybk.cfg

# 系统环境
bash ./envinit.sh
. /etc/profile.d/sdprofile.sh

# 管理脚本
unzip -qo $INSTALLDIR/updates/sdscript.zip -d /home/$RUNUSER
bash /home/$RUNUSER/setup.sh

# 云眼基础环境
bash $SERVICEDIR/jdk/install.sh
bash $SERVICEDIR/zookeeper/install.sh
bash $SERVICEDIR/hadoop/install.sh
bash $SERVICEDIR/hbase/install.sh
bash $SERVICEDIR/phoenix/install.sh
bash $SERVICEDIR/snappy/install.sh
bash $SERVICEDIR/activemq/install.sh
bash $SERVICEDIR/tomcat/install.sh
bash $SERVICEDIR/redis/install.sh -p
bash $SERVICEDIR/nginx/install.sh -p
case $cloudeyes_version in
    4.0.2.*)
        echo "更新nginx4.0.2配置文件"
        rm -f /opt/nginx/conf/nginx.conf
        cp $SERVICEDIR/nginx/files/402/sdyunlei.nginx.conf /opt/nginx/conf/nginx.conf
        chown $RUNUSER. /opt/nginx/conf/nginx.conf
        ;;
    4.1.0.*|4.3.*)
        echo "更新nginx4.1.0配置文件"
        rm -f /opt/nginx/conf/nginx.conf
        cp $SERVICEDIR/nginx/files/410/sdyunlei.nginx.conf /opt/nginx/conf/nginx.conf
        chown $RUNUSER. /opt/nginx/conf/nginx.conf
        ;;
esac
bash $SERVICEDIR/mysql/install.sh -p
# 态势
bash $SERVICEDIR/rsyslog/install.sh -f
bash $SERVICEDIR/elasticsearch/install.sh
bash $SERVICEDIR/elasticsearch-head/install.sh
bash $SERVICEDIR/scala/install.sh
bash $SERVICEDIR/spark/install.sh
bash $SERVICEDIR/kafka/install.sh
bash $SERVICEDIR/clickhouse-server/install.sh -p
# 20191219
bash $SERVICEDIR/mysql-shell/install.sh
bash $SERVICEDIR/mysql-router/install.sh
# 平台监控
bash $SERVICEDIR/pythonmonitor/install.sh -p

# 在导入 Hadoop 数据前更新 hosts 文件
bash ./update_hosts.sh

# 初始化数据
bash ./gen_nginx_cert.sh
bash ./deploy_tomcat.sh
case $cloudeyes_version in
    4.1.0.*|4.3.*)
        echo "更新redis4.1.0配置文件"
        rm -f /opt/redis/etc/redis.conf
        cp $SERVICEDIR/redis/files/single/redis_410.conf /opt/redis/etc/redis.conf
        chown $RUNUSER. /opt/redis/etc/redis.conf
        if [[ $REDIS_PASSWD != "Ctx1ytxA@3zdj" ]]; then
            echo "更新redis密码"
            bash ./change_redis_passwd.sh $REDIS_PASSWD
        fi
        ;;
esac
case $cloudeyes_version in
    4.1.0.*|4.3.*)
        if [[ $MYSQL_PASSWD != "Ctx1ytxA@3zdj" ]]; then
            echo "更新mysql产品密码"
            bash ./change_mysql_passwd.sh $MYSQL_PASSWD
        fi
        ;;
esac
bash ./import_mysqldata.sh
bash ./import_hadoopdata.sh
if [[ $cloudmonitor == 1 ]]; then
    bash ./import_kafka.sh
fi
if [[ $cloudmonitor == 1 || $cloudarmor == 1 || $cloudeyes_version == "4.1.0.210426" ]]; then
    bash ./import_clickhouse.sh
fi
bash ./upload_updates.sh
case $cloudeyes_version in
    4.1.0.*|4.3.*)
        echo "更新4.1.0的sdtomcat命令"
        rm -f /home/mybk/bin/sdtomcat
        mv /home/mybk/bin/sdntomcat /home/mybk/bin/sdtomcat
        chown $RUNUSER. /home/mybk/bin/sdtomcat
        ;;
esac


# 部署后配置
bash ./post_install.sh

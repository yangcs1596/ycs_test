#!/bin/sh
if [ "$#" != "1" ]; then
    echo "usage: $(basename $0) <tomcat-instance-dir>"
    echo "example: $(basename $0) tomcat-inst1"
    exit 1
fi
export CATALINA_BASE=/usr/local/tomcat7/$1
/usr/local/tomcat7/bin/startup.sh

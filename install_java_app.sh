#!/bin/bash
set -eu

ZABBIX_SERVER_IP=$1
JMX_PORT=5000
APP_NAME=v2

docker build --build-arg ZABBIX_SERVER_IP=${ZABBIX_SERVER_IP} -t $APP_NAME simple-app/
docker run --rm -p $JMX_PORT:$JMX_PORT -p 8080:8080 $APP_NAME

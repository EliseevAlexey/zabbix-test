#!/bin/bash
set -eu

ZABBIX_SERVER_IP=$1
HOST_NAME=$(cat /etc/hostname)

echo "Running Zabbix-agent on host '${HOST_NAME}' with connecting to Zabbix server by IP ${ZABBIX_SERVER_IP}"
docker run \
    --name zabbix-agent \
    -e ZBX_HOSTNAME="${HOST_NAME}" -e ZBX_SERVER_HOST="${ZABBIX_SERVER_IP}" \
    -p 10050:10050 \
    --rm \
    -d \
    zabbix/zabbix-agent

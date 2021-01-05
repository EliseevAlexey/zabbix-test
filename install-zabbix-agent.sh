#!/bin/bash
set -eu

ZABBIX_SERVER_HOST=$1
docker run --rm --name zabbix-agent -e ZBX_HOSTNAME="test-container" -e ZBX_SERVER_HOST="${ZABBIX_SERVER_HOST}" -d -p 10050:10050 zabbix/zabbix-agent


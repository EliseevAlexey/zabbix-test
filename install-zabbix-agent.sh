#!/bin/bash
set -eu

ZBX_SERVER_HOST=$1
export ZBX_SERVER_HOST=$1

docker-compose install-zabbix-agent.yaml -d up


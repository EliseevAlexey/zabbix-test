#!/bin/bash
set -eu

ZBX_SERVER_IP=$1

echo '--> Install the repository configuration package'
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
sudo dpkg -i zabbix-release_5.0-1+focal_all.deb

echo '--> Update the package index'
sudo apt update

echo '--> Install the Zabbix agent'
sudo apt install zabbix-agent

echo "--> Configuring agent. Server IP: ${ZBX_SERVER_IP}"
sudo sed -i "s/Server=127.0.0.1/Server=${ZBX_SERVER_IP}/" /etc/zabbix/zabbix_agentd.conf
sudo sed -i "s/ServerActive=127.0.0.1/ServerActive=${ZBX_SERVER_IP}/" /etc/zabbix/zabbix_agentd.conf

echo '--> Configuring UFW to allow connections'
sudo ufw allow 10050/tcp
sudo ufw --force enable

echo '--> Restarting zabbix-agent'
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent

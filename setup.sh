#!/bin/sh
read -s -p "Enter Root Password: "  pswd
echo -e '$pswd\n$pswd' | passwd
# passwd
apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp
date
sed -i 's/ports 22/ports 50009/' /etc/ssd/sshd_config
systemctl restart sshd
ufw allow 50009/tcp
ufw allow 6800/tcp
ufw enable
ufw logging on
ufw logging medium
echo 'Please logoff and login again with SSH!' 

#!/bin/bash
read -s -p "Enter Root Password: "  pswd
echo -e "$pswd\n$pswd" | passwd
# passwd
adduser --disabled-password --gecos "" mike
read -s -p "Enter mike's new Password: "  pswd
echo -e "$pswd\n$pswd" | passwd mike
unset pswd
adduser mike sudo

mkdir /home/mike/.ssh
chmod 700 /home/mike/.ssh
cat ./.ssh/authorized_keys >> /home/mike/.ssh/authorized_keys
chown mike:mike /home/mike -R

apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp -y
date
sed -i 's/Port 22/Port 50009/' /etc/ssh/sshd_config
systemctl restart sshd
ufw allow 50009/tcp
echo -e "y\r" | ufw enable
ufw logging on
ufw logging medium
mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01
mkdir -p /mnt/volume-nyc1-01
mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01
echo /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/makeswap.sh
chmod +x makeswap.sh
./makeswap.sh

echo export GOPATH=$HOME/gocode | sudo tee -a /home/mike/.profile
echo PATH=$PATH:$HOME/gocode/bin | sudo tee -a /home/mike/.profile
echo 'Please logoff and login again with SSH with mike!' 
sleep 5
sudo reboot

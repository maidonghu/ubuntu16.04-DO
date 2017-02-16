#!/bin/sh
read -s -p "Enter Root Password: "  pswd
echo -e '$pswd\n$pswd' | passwd
# passwd
apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp
date
sed -i 's/Port 22/Port 50009/' /etc/ssd/sshd_config
systemctl restart sshd
ufw allow 50009/tcp
ufw allow 6800/tcp
ufw enable
ufw logging on
ufw logging medium
mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01
mkdir -p /mnt/volume-nyc1-01
mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01
echo /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
echo 'Please logoff and login again with SSH!' 

#wget https://github.com/shadowsocks/shadowsocks-libev/archive/master.zip
#unzip master.zip
#cd shadowsocks-libev-master
#./scripts/deb4xenial.sh
# apt install libsodium-dev
wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/shadowsocks.conf
mv shadowsocks.conf /etc/shadowsocks-libev/config.json
ufw allow 53214/tcp
systemctl start shadowsocks-libev
systemctl restart shadowsocks-libev

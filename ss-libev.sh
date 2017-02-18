git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
cd ..
apt install --no-install-recommends apg gettext build-essential autoconf libtool libpcre3-dev asciidoc xmlto libev-dev libudns-dev automake libmbedtls-dev
./autogen.sh && dpkg-buildpackage -b -us -uc
cd ..
dpkg -i shadowsocks-libev*.deb

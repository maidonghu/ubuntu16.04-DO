#!/bin/bash

nginx=stable # use nginx=development for latest development version
echo -e "\r" | sudo add-apt-repository ppa:nginx/$nginx
sudo apt-get update
sudo apt-get install nginx -y

sudo ufw allow 'Nginx Full'

#read -s -p "Enter MySQL Root Password: "  pswd
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"
sudo mysql -sfu root < "wordpress.sql"
rm -f mysql_secure_installation.sql
rm -f wordpress.sql

sudo apt-get install -y php-fpm php-mysql php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm

sudo wget -O /etc/nginx/sites-available/default https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/etc/nginx/sites-available/defaut
sudo wget -O /etc/nginx/snippets/ssl-digital.mikecloud.info.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/etc/nginx/snippets/ssl-digital.mikecloud.info.conf
sudo wget -O /etc/nginx/snippets/ssl-params.conf https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/etc/nginx/snippets/ssl-params.conf
echo "Please provide ssl certs, keys and dhparam file and then restart nginx"

sudo mysql -sfu root < "wordpress.sql"
rm -f wordpress.sql

cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/html
cd ~
sudo chown -R mike:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod g+s {} \;
sudo chmod g+w /var/www/html/wp-content
sudo chmod -R g+w /var/www/html/wp-content/themes
sudo chmod -R g+w /var/www/html/wp-content/plugins

get /var/www/html/wp-config.php

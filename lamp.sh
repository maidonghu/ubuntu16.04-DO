sudo apt-get update
sudo apt-get install apache2 -y
sudo ufw allow in "Apache Full"

sudo apt-get install mysql-server  -y
sudo mysql_secure_installation

sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
sudo sed -i "ServerName owncloud.mikecloud.info" > /etc/apache2/apache2.conf

sudo nano /etc/apache2/mods-enabled/dir.conf

  <IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
  </IfModule>
  
sudo systemctl restart apache2
  
sudo apt install php-bz2 php-curl php-gd php-imagick php-intl php-mbstring php-xml php-zip


sudo apt-get install python-letsencrypt-apache -y
sudo letsencrypt --apache -d owncloud.mikecloud.info

sudo curl https://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/Release.key | sudo apt-key add -
echo 'deb https://download.owncloud.org/download/repositories/stable/Ubuntu_16.04/ /' | sudo tee /etc/apt/sources.list.d/owncloud.list
sudo apt-get update
sudo apt-get install owncloud  -y
sudo systemctl reload apache2

mysql -u root -p
CREATE DATABASE owncloud;
GRANT ALL ON owncloud.* to 'owncloud'@'localhost' IDENTIFIED BY 'set_database_password';
FLUSH PRIVILEGES;
exit


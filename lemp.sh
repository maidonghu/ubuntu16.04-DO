sudo apt-get update
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'


echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get -y install mysql-server-5.6

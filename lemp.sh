sudo apt-get update
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'

read -s -p "Enter MySQL Root Password: "  pswd
echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
sudo -E apt-get install -y -q mysql-server

sudo mysql_secure_installation

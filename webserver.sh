#!/bin/bash
sudo apt install software-properties-common
sudo add-apt-repository -y  ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx php7.2-fpm php7.2-mysql mysql-server unzip 
sudo apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
wget 
curl -LO https://wordpress.org/latest.tar.gz
sudo tar xzvf /latest.tar.gz
curl -s https://api.wordpress.org/secret-key/1.1/salt/ > /auth.txt
cp /wordpress/wp-config-sample.php /wordpress/wp-config.php
sudo chown -R ubuntu:ubuntu /wordpress /auth.txt
sed -i '49,56d' /wordpress/wp-config.php
sed -i '48r auth.txt' /wordpress/wp-config.php
sed -i 's/database_name_here/wordpressdb/g' /wordpress/wp-config.php
sed -i 's/username_here/admin/g' /wordpress/wp-config.php
sed -i 's/password_here/1234567890/g' /wordpress/wp-config.php
sed -i '38a\define('FS_METHOD', 'direct');' /wordpress/wp-config.php
sed -i 's/\r$//g' /wordpress/wp-config.php
sudo cp -a /wordpress /var/www/
sudo rm -f /etc/nginx/sites-available/default
sudo rm -f /etc/nginx/sites-enable/default

#!/bin/bash

apt-get update
apt-get install nginx -y
echo "Hii Harshit" >/var/www/html/index.html
systemctl restart nginx

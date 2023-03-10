#!/bin/bash

# check and update system 
sudo yum check-update
sudo yum -y update # -y bypass inquiry step and automatically execute update

# install Apache HTTP web server
sudo yum -y install httpd # install the Apache HTTP webserver

# start the web server 
sudo systemctl start httpd # start the web server
sudo systemctl enable httpd # enable the server for start up upon (re)boot
sudo systemctl status httpd # check  the server status

echo "Current IP address: " && curl -4 icanhazip.com

# change directory ownership so current user can write in webser directory
sudo chown -R $USER:$USER /var/www
# change webserver directory attribute for all users to access webpage content
sudo chmod -R 755 /var/www
cd /var/www/html/

# write index.html using echo statements below
echo "<!DOCTYPE html>" >> index.html
echo "<html>" >> index.html
echo "   <head>" >> index.html
echo "      <title>Level It Up ~!!!</title>" >> index.html
echo "      <meta charset=\"UTF-8\">" >> index.html
echo "   </head>" >> index.html
echo "   <body>" >> index.html
echo "      <h2>Welcome to Level Up in Tech</h2>" >> index.html
echo "	    <h3>This web server is run on EC2 instance!!</h3>" >> index.html
echo "	    <h3>Date of creation: Feb. 10, 2023</h3>" >> index.html
echo "	    <h3>Date of correction: Feb. 11, 2023</h3>" >> index.html
echo "      <h4>Cheer Up, Gold Team!!</h4>" >> index.html
echo "   </body>" >> index.html
echo "</html>" >> index.html
# cat /var/www/html/index.html

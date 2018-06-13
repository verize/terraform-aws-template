#!/bin/bash -v

# Install nginx
sudo apt-get update -y
sudo apt-get install -y nginx > /tmp/nginx.log


# Install Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y
sudo apt-get -y install docker-ce

sudo rm -rf /var/www/html/*

# Adds default index html page
echo \
    "<html>
        <head>
            <title>Welcome to YourCompany</title>
        </head>
        <body>
            <center><h4>Copyright (c) 2017-2018 YourCompany Inc. All rights reserved.</h4></center>
        </body>
    </html>" >> /var/www/html/index.html
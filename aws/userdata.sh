#!/usr/bin/env bash
# Install OpenJDK 8
sudo yum update -y
sudo sudo amazon-linux-extras enable corretto8
sudo yum install java-1.8.0-amazon-corretto -y
sudo mkdir -p /app/  && cd /app

# Download App and config file
sudo wget https://saa-20220122.s3.amazonaws.com/crud-app/app.jar
sudo wget https://saa-20220122.s3.amazonaws.com/crud-app/application.properties

# Install MySQL
sudo amazon-linux-extras install epel -y
sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm -y
sudo yum install mysql-community-server -y
sudo systemctl start mysqld

echo "TEMPORARY PASSWORD"
tmpPassword=`sudo cat /var/log/mysqld.log | grep "A temporary password" | awk  -F ": " '{print $2}'`
sudo sed -i "s/tmpPassword/$tmpPassword/g" application.properties

# Start application
sudo java -jar /app/app.jar &


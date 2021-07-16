#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3.8 -y
sudo apt-get install python3-pip -y
pip install -r requirements.txt
sudo apt-get install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

readonly Q1="CREATE DATABASE IF NOT EXISTS urls;"
readonly Q2="CREATE USER IF NOT EXISTS 'DNS'@'localhost' IDENTIFIED BY 'password';"
readonly Q3="GRANT ALL PRIVILEGES ON *.* TO 'DNS'@'localhost';"
readonly Q4="FLUSH PRIVILEGES;"
readonly QUERY="${Q1}${Q2}${Q3}${Q4}"

sudo mysql -u root -p -e "$QUERY"

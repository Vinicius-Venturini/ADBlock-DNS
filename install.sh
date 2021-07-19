#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo python3 -m pip install -r requirements.txt
sudo apt-get install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

readonly Q1="CREATE DATABASE IF NOT EXISTS dns;"
readonly Q2="CREATE USER IF NOT EXISTS 'DNS'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
readonly Q3="GRANT ALL PRIVILEGES ON *.* TO 'DNS'@'localhost';"
readonly Q4="FLUSH PRIVILEGES;"
readonly Q5="USE dns;"
readonly Q6="CREATE TABLE IF NOT EXISTS urls (url varchar(255), Primary Key (url));"
readonly Q7="set global max_connections = 100000;"
readonly Q8="set global max_allowed_packet = 67108864;"
readonly QUERY="${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}${Q7}${Q8}"

sudo mysql -u root -p -e "$QUERY"

sudo python3 addurl.py
touch server.log

#!/bin/bash

#list database has format: [domain] [username] [password] [database]

list_database="databases-kimsufi1.txt"
passwordMySQL="[mysql_root_password]"
while read -r line
do
	domain=`echo $line | awk '{print $1}'`
	echo $domain
	username=`echo $line | awk '{print $2}'`
	password=`echo $line | awk '{print $3}'`
	database=`echo $line | awk '{print $4}'`
  echo "Creating databases: $database Username: $username Password: $password"
	`/usr/bin/mysql -u root -p$passwordMySQL -e "create database ${database}; "`
	`/usr/bin/mysql -u root -p$passwordMySQL -e "create user ${username}@'localhost' identified by '${password}';"`
	`/usr/bin/mysql -u root -p$passwordMySQL -e "grant all privileges on ${database}.* to ${username}@'%';"`
	
done < $list_database

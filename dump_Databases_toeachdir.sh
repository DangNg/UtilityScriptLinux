#!/bin/bash

for i in `ls /home/*/wp-config.php`
do
         domain=`echo $i | awk -F "/" '{ print $3}'`
         echo "Domain: $domain"
         user=`cat $i | grep DB_USER | awk -F "'" '{ print $4}' `
         database=`cat $i | grep DB_NAME |  awk -F "'" '{ print $4}' `
         password=`cat $i | grep DB_PASSWORD |  awk -F "'" '{ print $4}' `
         echo $user $password $database
	       sql_file="$database.sql"
	       `/usr/bin/mysqldump --opt -u $user -p$password $database > /home/$domain/$sql_file`
done

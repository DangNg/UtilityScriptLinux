#!/bin/bash

while true
do
        if ping -c 1 8.8.8.8  &> /dev/null
        then
                        echo   1
        else
                echo `date` >> /var/log/death_log.log
                `systemctl restart supervisor`
        fi
        sleep 10
done

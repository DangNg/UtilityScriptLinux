#!/bin/bash

while true
do
        PID=`pgrep autossh`
        if [ "$PID" = '' ]
        then
                echo "Process not exist"
                `autossh -M 0 -N -f  -o "PubkeyAuthentication=yes"  -o "PasswordAuthentication=no" -R 1990:localhost:22 -l user1 192.168.1.126 &`
        fi
        if [ "$PID" != '' ]
        then
                echo "Process $PID is running"
        fi
        sleep 5
done

#!/bin/bash

REST=`timeout 15 telnet  14.232.166.121 2020 | grep Connected`
echo "resuel is $REST"
if [ "$REST" == "Connected" ]
then
        echo "Connection is available"
else
        echo "Port is refused"
        `pkill autossh`
fi

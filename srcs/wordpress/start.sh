#!/bin/sh

sed -i "s/IP/$IP/g" /www/wp-config.php

telegraf &
php-fpm7
nginx

sleep 5
while pidof telegraf && pidof nginx && pidof php-fpm7
do
    sleep 5
done
exit 1

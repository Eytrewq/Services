#!/bin/sh

chmod 777 /www/tmp

telegraf &
php-fpm7
nginx

sleep 5
while pidof telegraf && pidof nginx && pidof php-fpm7
do
    sleep 5
done
exit 1
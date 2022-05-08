#!/bin/sh

mkdir -p /var/run/nginx

/usr/sbin/sshd
telegraf &

nginx

sleep 5
while pidof telegraf && pidof nginx
do
    sleep 5
done
exit 1

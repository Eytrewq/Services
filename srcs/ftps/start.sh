#!/bin/sh

sed -i "s/minikubeip/$IP/g" /etc/vsftpd/vsftpd.conf

telegraf &
vsftpd /etc/vsftpd/vsftpd.conf &

sleep 5
while pidof telegraf && pidof vsftpd
do
    sleep 5
done
exit 1

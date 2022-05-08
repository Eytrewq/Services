#!/bin/sh

telegraf &
influxd run -config /etc/influxdb.conf &

sleep 5
while pidof telegraf && pidof influxd
do
    sleep 5
done
exit 1

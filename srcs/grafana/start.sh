#!/bin/sh

telegraf &
cd ./grafana-6.7.2/bin/ && ./grafana-server --config=/grafana-6.7.2/grafana.ini &

sleep 5
while pidof telegraf && pidof grafana-server
do
    sleep 5
done
exit 1

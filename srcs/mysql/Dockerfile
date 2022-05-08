FROM alpine:latest

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

COPY ./init_docker.sh .
COPY ./init_mysql.sh .
COPY wordpress.sql .
COPY grafana.sql .

RUN chmod +x init_docker.sh
RUN chmod +x init_mysql.sh

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306
CMD ./init_docker.sh

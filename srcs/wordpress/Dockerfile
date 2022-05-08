FROM alpine

RUN apk update && apk add wget && mkdir -p /www \
&& apk add nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mv wordpress/* /www \
&& rm -rf /var/cache/apk/*

COPY wp-config.php /www/wp-config.php

RUN mkdir -p /etc/telegraf && mkdir -p /run/nginx

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh .

RUN chmod +x start.sh
EXPOSE 5050
CMD ./start.sh

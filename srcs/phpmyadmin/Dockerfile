FROM alpine

RUN apk update && apk upgrade && apk add bash \
&& apk add nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.7-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.7-all-languages /www \
&& rm -rf /var/cache/apk/*

COPY phpmyadmin.inc.php /www/config.inc.php

RUN mkdir -p /etc/telegraf /run/nginx /www/tmp
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh .

RUN chmod +x start.sh
EXPOSE 5000
CMD ./start.sh

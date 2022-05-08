FROM alpine

RUN apk update
RUN apk add nginx openssl openssh-server
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY index.html /var/www/localhost/htdocs
COPY setup.sh /tmp/

COPY nginx.conf /etc/nginx/nginx.conf

RUN adduser -D user
RUN echo "user:password"|chpasswd
RUN ssh-keygen -A

RUN mkdir -p /ssl/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -subj '/CN=localhost'

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443 22

RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["/tmp/setup.sh"]

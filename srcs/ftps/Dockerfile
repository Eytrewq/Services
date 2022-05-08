FROM alpine

RUN	apk update
RUN	apk add openrc openssl vsftpd
RUN mkdir -p /var/ftp

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN	mkdir -p /ftp_anon /user
RUN	printf "password\npassword\n" | adduser user -s /bin/false -h /user
RUN	printf "/bin/false\n" >> /etc/shells
RUN	chown user:user /user
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=PAR/L=PAR/O=42/CN=user' -keyout /etc/vsftpd/ftps.key -out /etc/vsftpd/ftps.crt

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

COPY    start.sh .
RUN     chmod +x start.sh

CMD    ./start.sh

EXPOSE 21 21000

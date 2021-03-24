FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl vsftpd openrc

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
 -out /etc/ssl/lnymella.pem -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY server.sh /

RUN chmod -R 777 /etc/vsftpd/vsftpd.conf
RUN chmod 755 /server.sh

RUN mkdir -p /var/log/ftp
RUN touch /var/log/ftp/xferlog

#RUN adduser -D -h /var/ftp admin
#RUN echo "admin:admin" | chpasswd

VOLUME /sys/fs/cgroup
VOLUME ["/var/lib/ftp"]

EXPOSE 21 3000

CMD ./server.sh

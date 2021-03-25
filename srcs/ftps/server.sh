#!/bin/sh

openrc boot
rc-update add vsftpd
rc-service vsftpd start
nc -zv 127.0.0.1 21
addgroup -S ftps_group && adduser -S admin -G ftps_group -h /var/www
echo "admin:admin" | chpasswd
chmod -R 777 /var/www
chown -R admin:ftps_group /var/www
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
#!/bin/sh

ssh-keygen -A
adduser -D lnymella | chpasswd
/usr/bin/ssh-keygen -A
/usr/bin/supervisord -c /etc/supervisord.conf

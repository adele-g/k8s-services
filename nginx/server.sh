#!/bin/sh

/usr/bin/ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf
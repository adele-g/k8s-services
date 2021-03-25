FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor vim wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-ctype php7-zlib php7-curl php7-mbstring php7-json php7-session

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
# -out /etc/ssl/lnymella.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"
RUN mkdir -p /run/nginx;

#WORKDIR /tmpcat

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz && mv wordpress /var/www/wordpress

COPY default.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY wp-config.php /var/www/wordpress/
#RUN rm -rf wp-config-sample.php

RUN rm -rf latest.tar.gz
#RUN echo -e "\
# [supervisord]                                \n\
# nodaemon=true                                \n\
# [program:nginx]                              \n\
# command=sh -c \"nginx -g 'daemon off;' &&\
# kill -s SIGSTREM $(cat supervisord.pid)\"    \n\
# [program:sshd]                               \n\
# command=sh -c \"/usr/sbin/sshd -D &&\
# kill -s SIGSTREM $(cat supervisord.pid)\"    \n\
# stdout_logfile=/home/nginx.log               \n\
# stderr_logfile=/home/nginxerr.log            \n\
# " > /etc/supervisord.conf

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

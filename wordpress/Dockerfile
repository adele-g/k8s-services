FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh-server supervisor vim wget php7 php7-fpm php7-mysqli php7-json ca-certificates
RUN update-ca-certificates
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
 -out /etc/ssl/lnymella.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"
RUN mkdir /run/nginx;
RUN mkdir /www;

RUN wget https://wordpress.org/latest.tar.gz

COPY default.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY ./wp-config.php /var/www/wordpress/

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

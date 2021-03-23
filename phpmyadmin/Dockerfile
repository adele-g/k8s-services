FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor vim wget php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-mbstring php7-json php7-session php7-xml php7-ctype

RUN mkdir -p /run/nginx;

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz && mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz

RUN mkdir /www
#RUN chown -R www:www /var/lib/nginx
#RUN chown -R www:www /www

RUN mkdir -p /var/run/nginx && mkdir -p var/run/php
RUN touch /var/run/nginx/nginx.pid
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/
COPY config.inc.php /var/www/phpmyadmin

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

FROM alpine:3.12

RUN apk update
RUN apk add nginx

COPY srcs/default etc/nginx/sites-available/default
COPY srcs/wp-config.php /var/www/html/wordpress

RUN mkdir -p /run/nginx

EXPOSE 80 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
 -out /etc/ssl/lnymella.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"

COPY srcs/server_config.sh .

CMD sh server_config.sh

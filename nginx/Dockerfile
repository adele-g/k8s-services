FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor vim

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
 -out /etc/ssl/lnymella.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"

RUN mkdir -p /run/nginx;
RUN mkdir /www;

COPY srcs/default.conf /etc/nginx/nginx.conf
COPY srcs/supervisor.conf /etc/supervisord.conf
COPY server.sh .
ADD srcs/image.jpg /var/www/image.jpg
RUN echo -e "<!DOCTYPE html>                                    \n\
<html>                                                          \n\
<body> \n\
<title>NGINX</title> \n\
<h2>HELLO!!!</h2> \n\
</body> \n\
</html> \n\
" > /var/www/index.html;

RUN ssh-keygen -A && \
    adduser -D admin && \
    echo "admin:admin" | chpasswd

RUN chmod 600 /etc/ssh/ssh_host_*

EXPOSE 80 443 22
CMD sh server.sh
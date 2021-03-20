FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh-server supervisor vim
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lnymella.key \
 -out /etc/ssl/lnymella.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=lnymella"
RUN mkdir /run/nginx;
RUN mkdir /www;

#RUN echo -e "\
#server {                                     \n\
#  listen 443          ssl;                   \n\
#  ssl_certificate_key /etc/ssl/localhost.key;\n\
#  ssl_certificate     /etc/ssl/localhost.crt;\n\
#  root                /www;                  \n\
#  location / {                               \n\
#    index               hi.html;             \n\
#  }                                          \n\
#}                                            \n\
#server {                                     \n\
#  listen        80;                          \n\
#  return 301 https://\$host\$request_uri;    \n\
#}" > /etc/nginx/conf.d/default.conf;
COPY srcs/default.conf /etc/nginx/nginx.conf
COPY srcs/supervisor.conf /etc/supervisord.conf
RUN echo -e "<!DOCTYPE html>                 \n\
<html lang=\"en\">                           \n\
<head>                                       \n\
    <meta charset=\"utf-8\" />               \n\
    <title>HTML5</title>                     \n\
</head>                                      \n\
<body>                                       \n\
    Welcome Back!                            \n\
</body>                                      \n\
</html>" > /var/www/index.html;

# #supervisor
# RUN echo -e "\
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

 # create SSH key ssh
 RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
   && echo "root:root" | chpasswd \
   && /usr/bin/ssh-keygen -A \
   && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 80 443
#CMD nginx -g 'daemon off;'
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
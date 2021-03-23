FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc libc6-compat

RUN mkdir -p /run/mysqld

VOLUME ["/var/lib/mysql"]
VOLUME /sys/fs/cgroup

COPY server.sh ./mysql.sh
COPY my.conf /etc/my.cnf
COPY create_database ./create_database
COPY database.sql .

RUN mkdir -p /var/log/mysql
RUN chmod -R 755 mysql.sh

EXPOSE 3306

CMD sh mysql.sh
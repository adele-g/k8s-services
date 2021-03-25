FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

RUN mkdir -p /var/lib/grafana/dashboards

COPY configs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY configs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY configs/ftps.json /var/lib/grafana/dashboards/ftps.json
COPY configs/Grafana.json /var/lib/grafana/dashboards/Grafana.json
COPY configs/influxdb.json /var/lib/grafana/dashboards/influxdb.json
COPY configs/metallb.json /var/lib/grafana/dashboards/metallb.json
COPY configs/mysql.json /var/lib/grafana/dashboards/mysql.json
COPY configs/nginx.json /var/lib/grafana/dashboards/nginx.json
COPY configs/ft_services_.json /var/lib/grafana/dashboards/ft_services.json
COPY configs/telegraf.json /var/lib/grafana/dashboards/telegraf.json
COPY configs/Wordpress.json /var/lib/grafana/dashboards/wordpress.json

EXPOSE 3000

CMD /usr/sbin/grafana-server --homepath=/usr/share/grafana
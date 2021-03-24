FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache


#RUN wget https://dl.grafana.com/oss/release/grafana-7.3.1.linux-amd64.tar.gz
#RUN tar -xzf grafana-7.3.1.linux-amd64.tar.gz && rm -rf grafana-7.3.1.linux-amd64.tar.gz
#RUN mv grafana-7.3.1 /grafana

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

RUN mkdir -p /var/lib/grafana/dashboards
COPY configs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY configs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY configs/custom.ini /usr/share/grafana/conf/custom.ini

EXPOSE 3000

CMD /usr/sbin/grafana-server --homepath=/usr/share/grafana
FROM alpine:3.12

RUN apk update && apk add openrc wget vim

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_i386.tar.gz
RUN tar -xvf telegraf-1.18.0_linux_i386.tar.gz
RUN mv telegraf-1.18.0 /telegraf && rm -rf telegraf-1.18.0_linux_i386.tar.gz

RUN cp -r telegraf/* ./
RUN rm -rf /telegraf

RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk --allow-untrusted

#RUN telegraf -sample-config telegraf.conf --input-filter cpu:mem --output-filter influxdb > telegraf.conf
COPY telegraf.conf /etc/telegraf/

CMD	telegraf

FROM ubuntu:14.04
MAINTAINER nickmich <nickmichalos@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl
RUN apt-get -y install default-jre

RUN curl -O http://archive.apache.org/dist/activemq/apache-activemq/5.9.0/apache-activemq-5.9.0-bin.tar.gz
RUN mkdir -p /opt/apache/activemq
RUN tar -zxvf apache-activemq-5.9.0-bin.tar.gz -C /opt/apache/activemq

WORKDIR /opt/apache/activemq/apache-activemq-5.9.0/bin
VOLUME /opt/apache/activemq/apache-activemq-5.9.0/conf

RUN echo './activemq start && tail -f /opt/apache/activemq/apache-activemq-5.9.0/data/activemq.log' > start.sh

# Main web interface port
EXPOSE 8161
# Transport connector ports
# OpenWire
EXPOSE 61616
# AMQP
EXPOSE 5672
# STOMP
EXPOSE 61613
# MQTT
EXPOSE 1883
# WS 
EXPOSE 61614

CMD ["/bin/bash", "./start.sh"]

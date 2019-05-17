FROM docker.elastic.co/beats/filebeat:6.7.2
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

ADD files/logzio.crt /etc/pki/tls/certs/

COPY files/filebeat.yml /usr/share/filebeat/filebeat.yml

USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml \
    && chmod go-w /usr/share/filebeat/filebeat.yml
USER filebeat


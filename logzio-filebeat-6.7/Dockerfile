FROM docker.elastic.co/beats/filebeat:6.7.2
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

ADD files/logzio.crt /etc/pki/tls/certs/
COPY files/filebeat.yml /usr/share/filebeat/filebeat.yml

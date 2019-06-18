FROM circleci/openjdk:jdk-stretch
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

ENV SONAR_SCANNER_VERSION=3.2.0.1227

RUN curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip > /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
    && sudo unzip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d /usr/lib \
    && sudo ln -s /usr/lib/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner

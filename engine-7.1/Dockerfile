FROM beappers/php-7.1-fpm-xdebug:latest
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

# NodeJS
RUN apt-get update && apt-get install -y apt-transport-https \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

FROM beappers/engine-7.2:latest
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

# Xdebug
RUN pecl install xdebug \
    && touch /var/log/xdebug.log \
    && chmod a+w /var/log/xdebug.log
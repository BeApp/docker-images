FROM php:7.1-fpm-jessie
MAINTAINER Damien Villeneuve <d.villeneuve@beapp.fr>

RUN apt-get update && apt-get install -y -qq \
        # Compression
        libbz2-dev \
        # Strings / Charset
        libicu-dev libfreetype6-dev libmcrypt-dev \
        # Databases
        libpq-dev \
        # Network
        libxml2-dev curl \
        # Images
        libjpeg-dev libpng-dev

RUN \
    # Compression
    docker-php-ext-install bz2 zip \
    # Strings / Charset
    && docker-php-ext-install iconv intl mbstring mcrypt \
    # Databases
    && docker-php-ext-install pdo_mysql mysqli pdo_pgsql pgsql \
    # Network
    && docker-php-ext-install sockets soap \
    # Images
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd exif \
    # Others
    && docker-php-ext-install bcmath calendar opcache

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

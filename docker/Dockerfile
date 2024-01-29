FROM php:8.2-apache

COPY php/php.ini /usr/local/etc/php/

# Dependencies
RUN apt-get update && apt-get install -y git unzip curl openssh-server nano libc-client-dev libkrb5-dev wget
RUN docker-php-ext-install pdo pdo_mysql bcmath

#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug

RUN apt-get install -y \
        libpng-dev \
        libwebp-dev \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip \
  && docker-php-ext-install zip


RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd

RUN docker-php-ext-configure calendar && docker-php-ext-install calendar

RUN docker-php-ext-configure exif
RUN docker-php-ext-install exif
RUN docker-php-ext-enable exif

RUN a2enmod rewrite
RUN service apache2 restart

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN mkdir -p /usr/local/bin
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony


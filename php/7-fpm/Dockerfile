FROM php:7.0-fpm

ENV ZLIB_VERSION 1.2.11

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        freetds-dev \
        libxml2-dev \
    && cp /usr/lib/x86_64-linux-gnu/libsybdb.* /usr/lib/ \
    && curl -O http://zlib.net/zlib-${ZLIB_VERSION}.tar.gz \
    && tar xvf zlib-${ZLIB_VERSION}.tar.gz \
    && cd zlib-${ZLIB_VERSION} && sh ./configure && make && make install \
    && cd .. && rm -fr zlib-${ZLIB_VERSION} && rm zlib-${ZLIB_VERSION}.tar.gz \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd zip pdo_dblib

ADD mhsendmail /usr/sbin/sendmail
ADD mail.ini /usr/local/etc/php/conf.d/99-mail.ini
ADD log.ini /usr/local/etc/php/conf.d/99-log.ini
ADD error.ini /usr/local/etc/php/conf.d/99-error.ini

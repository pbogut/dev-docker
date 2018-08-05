FROM php:5.6.36-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && echo 'cd $MAGENTO_PATH' >> /root/.bashrc

ADD mhsendmail /usr/sbin/sendmail
ADD mail.ini /usr/local/etc/php/conf.d/99-mail.ini

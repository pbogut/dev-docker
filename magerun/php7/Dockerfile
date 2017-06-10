FROM pbogut/php:mage-php7-fpm

RUN apt-get update && apt-get install -y unzip \
    && curl https://files.magerun.net/n98-magerun.phar -o /usr/bin/n98-magerun \
    && chmod +x /usr/bin/n98-magerun

ADD memory-limit.ini /usr/local/etc/php/conf.d/momery-limit.ini
ADD n98-magerun.sh /usr/bin/n98

ENTRYPOINT ["n98"]

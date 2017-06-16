FROM pbogut/php:7-fpm

RUN apt-get update && apt-get install -y \
    unzip \
    mysql-client

ADD memory-limit.ini /usr/local/etc/php/conf.d/momery-limit.ini
ADD artisan.sh /usr/bin/docker-artisan-entrypoint.sh

ENTRYPOINT ["docker-artisan-entrypoint.sh"]

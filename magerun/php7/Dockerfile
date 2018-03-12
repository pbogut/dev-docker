FROM pbogut/php:7-fpm

RUN apt-get update && apt-get install -y \
    unzip \
    mysql-client \
    && curl https://files.magerun.net/n98-magerun.phar -o /usr/bin/n98-magerun \
    && chmod +x /usr/bin/n98-magerun \
    && echo 'cd $MAGENTO_PATH' >> /root/.bashrc

ADD memory.ini /usr/local/etc/php/conf.d/99-memory.ini
ADD magerun.sh /usr/bin/docker-magerun-entrypoint.sh

ENTRYPOINT ["docker-magerun-entrypoint.sh"]

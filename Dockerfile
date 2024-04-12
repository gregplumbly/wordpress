# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:5.3.2-apache

RUN apt-get update && apt-get install -y magic-wormhole

RUN { \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'memory_limit = 256M'; \
} > /usr/local/etc/php/conf.d/custom.ini

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data

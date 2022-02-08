ARG BASE_IMAGE=latest
FROM php:${BASE_IMAGE}
LABEL maintainer="hello@columbus-interactive.de"

RUN apt-get update && apt-get install git -y
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions openswoole inotify
RUN install-php-extensions bcmath \
        bz2 \
        calendar \
        exif \
        gd \
        intl \
        ldap \
        memcached \
        mysqli \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        redis \
        soap \
        sockets \
        xsl \
        zip \
        imagick

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

ARG BASE_IMAGE=latest
FROM php:${BASE_IMAGE}
LABEL maintainer="hello@columbus-interactive.de"

# Download script to install PHP extensions and dependencies
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
      curl \
      git \
      zip unzip \
# iconv, mbstring and pdo_sqlite are omitted as they are already installed
    && PHP_EXTENSIONS=" \
      bcmath \
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
      imagick \
      gettext \
    " \
    && install-php-extensions $PHP_EXTENSIONS

# Install composer
ARG COMPOSER_MAJOR_VERSION=2
ENV PATH=$PATH:/root/composer/vendor/bin \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/root/composer
RUN curl -sSL -o composer-setup.php https://getcomposer.org/installer \
    && curl -sSL -o composer-setup.php.sha384sum https://composer.github.io/installer.sha384sum \
    && sha384sum -c composer-setup.php.sha384sum \
    && php composer-setup.php --$COMPOSER_MAJOR_VERSION --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php composer-setup.php.sha384sum

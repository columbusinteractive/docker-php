ARG BASE_IMAGE=latest
FROM php:${BASE_IMAGE}

LABEL org.opencontainers.image.title="PHP"
LABEL org.opencontainers.image.description="A popular general-purpose scripting language that is especially suited to web development."
LABEL org.opencontainers.image.version=$PHP_VERSION
LABEL org.opencontainers.image.url="https://github.com/columbusinteractive/docker-php"
LABEL org.opencontainers.image.documentation="https://github.com/columbusinteractive/docker-php#readme"
LABEL org.opencontainers.image.source="https://github.com/columbusinteractive/docker-php/tree/main"
LABEL org.opencontainers.image.vendor="Columbus Interactive GmbH"
LABEL org.opencontainers.image.authors="hello@columbus-interactive.de"

# Install some packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
        curl \
        git \
        zip \
        unzip \
        imagemagick \
    && rm -rf /var/lib/apt/lists/*

# Install docker-php-extension-installer
RUN curl -sSL -o /usr/local/bin/install-php-extensions \
    https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
    && chmod +x /usr/local/bin/install-php-extensions

# iconv, mbstring and pdo_sqlite are omitted as they are already installed
RUN PHP_EXTENSIONS=" \
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
      apcu \
      pcntl \
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

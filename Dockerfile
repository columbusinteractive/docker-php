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
ENV COMPOSER_HOME=/root/.local/share/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH=$PATH:$COMPOSER_HOME/vendor/bin
RUN mkdir -p "$COMPOSER_HOME" && chmod 777 "$COMPOSER_HOME"
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

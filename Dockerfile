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

# Install php-extension-installer
COPY --from=mlocati/php-extension-installer:1 \
    /usr/bin/install-php-extensions /usr/local/bin/install-php-extensions

# Install PHP extensions
RUN install-php-extensions \
    amqp \
    apcu \
    bcmath \
    bz2 \
    calendar \
    event \
    exif \
    gd \
    gettext \
    iconv \
    imagick \
    intl \
    ldap \
    mbstring \
    memcached \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pgsql \
    redis \
    soap \
    sockets \
    xsl \
    zip

# Install composer
ENV COMPOSER_HOME=/root/.local/share/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH=$PATH:$COMPOSER_HOME/vendor/bin
RUN mkdir -p "$COMPOSER_HOME" && chmod 777 "$COMPOSER_HOME"
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

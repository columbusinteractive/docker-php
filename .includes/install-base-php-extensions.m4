# Install php-extension-installer
COPY --from=mlocati/php-extension-installer:2 \
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
    ftp \
    gd \
    gettext \
    iconv \
    Imagick/imagick@master \
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

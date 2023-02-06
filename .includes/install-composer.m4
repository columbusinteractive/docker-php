# Install composer
ENV COMPOSER_HOME=/var/local/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH=$PATH:$COMPOSER_HOME/vendor/bin
RUN mkdir -p "$COMPOSER_HOME" && chmod 777 "$COMPOSER_HOME"
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

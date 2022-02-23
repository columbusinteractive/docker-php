ARG BASE_IMAGE=latest
FROM columbusinteractive/php:${BASE_IMAGE}
LABEL maintainer="hello@columbus-interactive.de"

RUN IPE_DONT_ENABLE=1 install-php-extensions openswoole \
    && docker-php-ext-enable --ini-name xx-php-ext-openswoole.ini openswoole

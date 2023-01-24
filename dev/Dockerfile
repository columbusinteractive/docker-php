ARG BASE_IMAGE_TAG=latest

FROM local/php:$BASE_IMAGE_TAG

LABEL org.opencontainers.image.documentation="https://github.com/columbusinteractive/docker-php/tree/main/dev#readme"
LABEL org.opencontainers.image.source="https://github.com/columbusinteractive/docker-php/tree/main/dev"

RUN install-php-extensions xdebug

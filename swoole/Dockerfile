ARG BASE_IMAGE_TAG=latest

FROM columbusinteractive/php:$BASE_IMAGE_TAG

LABEL org.opencontainers.image.documentation="https://github.com/columbusinteractive/docker-php/tree/main/swoole#readme"
LABEL org.opencontainers.image.source="https://github.com/columbusinteractive/docker-php/tree/main/swoole"

RUN install-php-extensions openswoole-^4.12 inotify

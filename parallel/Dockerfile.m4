ARG BASE_IMAGE_TAG=zts

FROM php:$BASE_IMAGE_TAG

include(`../.includes/define-labels.m4')
include(`../.includes/install-system-packages.m4')
include(`../.includes/install-base-php-extensions.m4')
include(`../.includes/install-composer.m4')

LABEL org.opencontainers.image.documentation="https://github.com/columbusinteractive/docker-php/tree/main/parallel#readme"
LABEL org.opencontainers.image.source="https://github.com/columbusinteractive/docker-php/tree/main/parallel"

RUN install-php-extensions parallel

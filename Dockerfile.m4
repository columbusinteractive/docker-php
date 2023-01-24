ARG BASE_IMAGE_TAG=latest

FROM php:$BASE_IMAGE_TAG

include(`./.includes/define-labels.m4')
include(`./.includes/install-system-packages.m4')
include(`./.includes/install-base-php-extensions.m4')
include(`./.includes/install-composer.m4')

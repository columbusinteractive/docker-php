SHELL := /bin/bash
ALL: build
.PHONY: build test push

IMAGE_NAME ?= columbusinteractive/php
IMAGE_TAG ?= latest
BASE_IMAGE_TAG ?= $(IMAGE_TAG)
PHP_VERSION := $(firstword $(subst -, ,$(IMAGE_TAG)))
PHP_EXTENSIONS := \
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
    zip \
	$(PHP_ADDITIONAL_EXTENSIONS)

build:
	@echo " =====> Building $(IMAGE_NAME):$(IMAGE_TAG) ..."
	docker image build --pull \
		--build-arg "BASE_IMAGE_TAG=$(BASE_IMAGE_TAG)" \
		--tag $(IMAGE_NAME):$(IMAGE_TAG) \
		.

test:
	@if ! docker image inspect $(IMAGE_NAME):$(IMAGE_TAG) 1>/dev/null; then \
		echo "FAIL [missing image: $(IMAGE_NAME):$(IMAGE_TAG)]" 1>&2; \
		exit 1; \
	fi

	@echo "=====> Testing php executable ..."
	@if ! docker run --rm $(IMAGE_NAME):$(IMAGE_TAG) php --help 1>/dev/null; then \
		echo "FAIL [php executable error]" 1>&2; \
		exit 1; \
	fi

	@if [[ "$(PHP_VERSION)" != "latest" ]]; then \
		@echo "=====> Testing php version ..." \
		@IMAGE_PHP_VERSION=`php --version | head -n 1 | sed -E 's/PHP ([0-9]+\.[0-9]+).*/\1/'`; \
		if [[ "$${IMAGE_PHP_VERSION}" != "$(PHP_VERSION)" ]]; then \
			echo "FAIL [wrong php version: expected $(PHP_VERSION) got $${IMAGE_PHP_VERSION}]" 1>&2; \
			exit 1; \
		fi \
	fi

	@echo "=====> Testing php extensions ..."
	@IMAGE_PHP_EXTENSIONS=`docker run --rm $(IMAGE_NAME):$(IMAGE_TAG) php -m`; \
	for expected_extension in $(PHP_EXTENSIONS); do \
		if ! echo "$${IMAGE_PHP_EXTENSIONS}" | grep -Fwi "$${expected_extension}" 1>/dev/null; then \
			echo "FAIL [missing php extension: $${expected_extension}]" 1>&2; \
			exit 1; \
		fi \
	done

	@echo "=====> Testing composer executable ..."
	@if ! docker run --rm $(IMAGE_NAME):$(IMAGE_TAG) composer --help 1>/dev/null; then \
		echo "FAIL [composer executable error]" 1>&2; \
		exit 1; \
	fi

	@echo "=====> Testing composer version ..."
	@IMAGE_COMPOSER_VERSION=`composer --version --no-ansi | sed -E 's/Composer version ([0-9]+).*/\1/'`; \
	if [[ "$${IMAGE_COMPOSER_VERSION}" != "2" ]]; then \
		echo "FAIL [wrong composer version: expected 2 got $${IMAGE_COMPOSER_VERSION}]" 1>&2; \
		exit 1; \
	fi

	@echo "=====> Testing convert (imagemagick) executable ..."
	@if ! docker run --rm $(IMAGE_NAME):$(IMAGE_TAG) convert --help 1>/dev/null; then \
		echo "FAIL [convert (imagemagick) executable error]" 1>&2; \
		exit 1; \
	fi

	@echo '=====> OK'

push:
	docker image push $(IMAGE_NAME):$(IMAGE_TAG)

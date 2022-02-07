SHELL := /bin/bash
ALL: build
.PHONY: build test push

PARENT_IMAGE := php
IMAGE := columbusinteractive/php
VERSION ?= latest
PHP_VERSION = $(firstword $(subst -, ,$(VERSION)))

# Extensions.
EXTENSIONS := \
	bcmath \
	bz2 \
	calendar \
	exif \
	iconv \
	intl \
	gd \
	ldap \
	mbstring \
	memcached \
	mysqli \
	OPcache \
	pdo_mysql \
	pdo_pgsql \
	pgsql \
	redis \
	soap \
	xsl \
	zip \
	sockets

build:
	@echo " =====> Building $(IMAGE):$(VERSION)..."
	docker image build --quiet --build-arg 'BASE_IMAGE=$(VERSION)' -t $(IMAGE):$(VERSION) .

test:
	@echo -e "=====> Testing loaded extensions... \c"
	@if [[ -z `docker image ls $(IMAGE) | grep "\s$(VERSION)\s"` ]]; then \
		echo 'FAIL [Missing image!!!]'; \
		exit 1; \
	fi
	@IMAGE_PHP_VERSION=`docker container run --rm $(IMAGE):$(VERSION) bash -c '/bin/echo $$PHP_VERSION' | cut -d '.' -f 1,2`; \
	if [[ "$(PHP_VERSION)" != "latest" && "$${IMAGE_PHP_VERSION}" != "$(PHP_VERSION)" ]]; then \
		echo "FAIL [wrong PHP version: expected $(PHP_VERSION), got $${IMAGE_PHP_VERSION}]"; \
		exit 1; \
	fi
	@modules=`docker container run --rm $(IMAGE):$(VERSION) php -m`; \
	for ext in $(EXTENSIONS); do \
		if [[ "$${modules}" != *"$${ext}"* ]]; then \
			echo "FAIL [$${ext}]"; \
			exit 1; \
		fi \
	done
	@if [[ -z `docker container run --rm $(IMAGE):$(VERSION) composer --version 2> /dev/null | grep '^Composer version 2\.[0-9][0-9]*'` ]]; then \
		echo 'FAIL [Composer]'; \
		exit 1; \
	fi
	@echo 'OK'

push:
	docker image push $(IMAGE):$(VERSION)

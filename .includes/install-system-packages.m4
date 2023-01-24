# Install system packages
RUN if which apt-get > /dev/null; then \
        export DEBIAN_FRONTEND=noninteractive \
            && apt-get update \
            && apt-get install -y imagemagick \
            && rm -rf /var/lib/apt/lists/* \
        ; \
    fi; \
    if which apk > /dev/null; then \
        apk update \
            && apk add --no-cache imagemagick \
        ; \
    fi;

<p align="center">
    <a href="https://www.columbus-interactive.de">
        <img alt="Docker PHP Images logo" src="https://www.columbus-interactive.de/typo3conf/ext/ci_corporate/Resources/Public/assets/img/logo/black.png" />
    </a>
</p>

<p align="center">
  <strong>Docker PHP images</strong>
</p>

<p align="center">
    <a href="https://github.com/columbusinteractive/docker-php/actions"><img alt="GitHub Workflow Status" src="https://github.com/columbusinteractive/docker-php/actions/workflows/main.yml/badge.svg?branch=main"></a>
    <a href="https://github.com/columbusinteractive/docker-php"><img alt="Source link" src="https://img.shields.io/badge/Source-GitHub-lightgrey.svg?style=flat-square"></a>
    <a href="https://www.columbus-interactive.de"><img alt="Authors link" src="https://img.shields.io/badge/Authors-columbusinteractive-lightgrey.svg?style=flat-square"></a>
    <a href="https://hub.docker.com/r/columbusinteractive/php/"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/columbusinteractive/php.svg?style=flat-square"></a>
    <a href="https://github.com/columbusinteractive/docker-php/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/github/license/columbusinteractive/docker-php.svg?style=flat-square"></a>
</p>

---

Docker images built on top of the [official PHP images](https://hub.docker.com/r/_/php/) with the addition of some common and useful extensions, installed with [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer). You can find these images on the [Docker Hub](https://hub.docker.com/r/columbusinteractive/php/) (and if you're reading this file, you're probably already there).

An automated build is set up, so they should be always up-to-date with the Dockerfiles in the [GitHub repository](https://github.com/columbusinteractive/docker-php).

Also see our other image variants:
- [columbusinteractive/php-dev](https://hub.docker.com/r/columbusinteractive/php-dev/) (with Xdebug)
- [columbusinteractive/php-swoole](https://hub.docker.com/r/columbusinteractive/php-swoole/) (with Open Swoole)
- [columbusinteractive/php-parallel](https://hub.docker.com/r/columbusinteractive/php-parallel/) (ZTS with parallel)

## Available tags
- `8.4`, `8.4-alpine`, `8.4-fpm`, `8.4-fpm-alpine`
- `8.3`, `8.3-alpine`, `8.3-fpm`, `8.3-fpm-alpine`
- `8.2`, `8.2-alpine`, `8.2-fpm`, `8.2-fpm-alpine`
- `8.1`, `8.1-alpine`, `8.1-fpm`, `8.1-fpm-alpine`
- `8.0`, `8.0-alpine`, `8.0-fpm`, `8.0-fpm-alpine`

## Installed extensions
The following modules and extensions have been enabled, in addition to those you can already find in the [official PHP image](https://hub.docker.com/r/_/php/):

- `amqp`
- `apcu`
- `bcmath`
- `bz2`
- `calendar`
- `event`
- `exif`
- `ftp`
- `gd`
- `gettext`
- `iconv`
- `imagick`
- `intl`
- `ldap`
- `mbstring`
- `memcached`
- `mysqli`
- `opcache`
- `pcntl`
- `pdo_mysql`
- `pdo_pgsql`
- `pdo_sqlite`
- `pgsql`
- `redis`
- `soap`
- `sockets`
- `xsl`
- `zip`

## Composer
Composer v2 is installed globally in all images. Please refer to their [documentation](https://getcomposer.org/doc/) for usage hints.

In case you want to use Composer v1, add the following to your Dockerfile:
```dockerfile
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer
```
This will overwrite Composer v2 with Composer v1 from their official docker image.

## Contributing
If you find an issue, or have a special wish not yet fulfilled, please [open an issue on GitHub](https://github.com/columbusinteractive/docker-php/issues) providing as many details as you can (the more you are specific about your problem, the easier it is for us to fix it).

Pull requests are welcome, too! Please, run `make build` and `make test` before attempting a pull request. Also, it would be nice if you could stick to the [best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/).

---

## License
Docker PHP Images is released under the [MIT](https://github.com/columbusinteractive/docker-php/blob/master/LICENSE) license.

## Origin
This repository and it's files are based on the work of [chialab/docker-php](https://github.com/chialab/docker-php)

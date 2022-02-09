<p align="center">
    <a href="https://www.columbus-interactive.de">
        <img alt="Docker PHP Images logo" src="https://www.columbus-interactive.de/typo3conf/ext/ci_corporate/Resources/Public/assets/img/logo/black.png" />
    </a>
</p>

<p align="center">
  <strong>Docker PHP images</strong>
</p>

<p align="center">
    <a href="https://github.com/columbusinteractive/docker-php/actions"><img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/columbusinteractive/docker-php/Build,%20test%20and%20publish%20images?style=flat-square"></a>
    <a href="https://github.com/columbusinteractive/docker-php"><img alt="Source link" src="https://img.shields.io/badge/Source-GitHub-lightgrey.svg?style=flat-square"></a>
    <a href="https://www.columbus-interactive.de"><img alt="Authors link" src="https://img.shields.io/badge/Authors-columbusinteractive-lightgrey.svg?style=flat-square"></a>
    <a href="https://hub.docker.com/r/columbusinteractive/php/"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/columbusinteractive/php.svg?style=flat-square"></a>
    <a href="https://github.com/columbusinteractive/docker-php/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/github/license/columbusinteractive/docker-php.svg?style=flat-square"></a>
</p>

---

Docker images built on top of the [official PHP images](https://hub.docker.com/r/_/php/) with the addition of some common and useful extensions, installed with [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer). You can find these images on the [Docker Hub](https://hub.docker.com/r/columbusinteractive/php/) (and if you're reading this file, you're probably already there).

An automated build is set up, so they should be always up-to-date with the Dockerfiles in the [GitHub repository](https://github.com/columbusinteractive/docker-php).

For development environments, you might want to choose an [image with XDebug installed](https://hub.docker.com/r/columbusinteractive/php-dev/) instead.

## Available tags
- `latest`
- `7.4`
- `8.0`
- `8.1`

As you might have guessed, all tags are built on top of the corresponding tag of the official image.

## Installed extensions
The following modules and extensions have been enabled,
in addition to those you can already find in the [official PHP image](https://hub.docker.com/r/_/php/):

- `bcmath`
- `bz2`
- `calendar`
- `exif`
- `gd`
- `imagick`
- `iconv`
- `intl`
- `ldap`
- `mbstring`
- `memcached`
- `mysqli`
- `pdo_mysql`
- `pdo_pgsql`
- `pgsql`
- `redis`
- `soap`
- `sockets`
- `xsl`
- `Zend OPcache`
- `zip`
- `gettext`
- `openswoole`
- `inotify`

You will probably not need all this stuff. Even if having some extra extensions loaded ain't a big issue in most cases, you will very likely want to checkout this repository, remove unwanted extensions from the `Dockerfile`, and build your own image — for sometimes removing is easier than adding. 😉

## Composer
[Composer](https://getcomposer.org) is installed globally in all images. Please, refer to their documentation for usage hints.


## Contributing
If you find an issue, or have a special wish not yet fulfilled, please [open an issue on GitHub](https://github.com/columbusinteractive/docker-php/issues) providing as many details as you can (the more you are specific about your problem, the easier it is for us to fix it).

Pull requests are welcome, too! 😁 Please, run `make build` and `make test` before attempting a pull request. Also, it would be nice if you could stick to the [best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/).

---

## License

Docker PHP Images is released under the [MIT](https://github.com/columbusinteractive/docker-php/blob/master/LICENSE) license.

## Origin
This repository and it's files are based on the work of https://github.com/Chialab/docker-php
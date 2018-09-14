FROM php:7.2-apache

LABEL maintainer="Adam Kubica <xcdr@kaizen-step.com>"

ENV REDIS_HOST 172.17.0.1
ENV REDIS_PORT 6379

ENV MYSQL_HOST 172.17.0.1
ENV MYSQL_USER webmail
ENV MYSQL_PASSWD S3cret

ENV SMTP_HELO localhost

WORKDIR /tmp

RUN apt-get update
RUN apt-get -y install curl libmemcached-dev zlib1g-dev libicu-dev g++ mariadb-client
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl install redis && docker-php-ext-enable redis
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo_mysql intl

RUN curl -OL https://github.com/roundcube/roundcubemail/releases/download/1.3.3/roundcubemail-1.3.3-complete.tar.gz
RUN tar xzf roundcubemail-*tar.gz -C /var/www/html --strip 1
RUN rm roundcubemail-*.tar.gz

WORKDIR /var/www/html

RUN rm -r .travis.yml installer skins/classic
RUN chown -R www-data:www-data .
RUN ln -s /dev/stderr logs/

COPY app_sources/config/config.inc.php config/

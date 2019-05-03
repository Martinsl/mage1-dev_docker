FROM php:7.1-fpm-alpine3.9
LABEL maintainer="Martinsl <https://github.com/Martinsl>"

ARG HUID=1000
ARG HGID=1000

ENV HUID ${HUID}
ENV HGID ${HGID}
ENV TERM xterm

RUN apk update && apk add --no-cache \
	autoconf \
	make \
	g++ \
	php7-pdo \
	php7-mysqli \
	php7-gd \
	php7-cli \
	php7-curl \
	php7-zip \
	php7-openssl \
	php7-mcrypt \
        && docker-php-source extract \
	&& pecl install xdebug \
        && docker-php-ext-enable xdebug \
	&& docker-php-ext-install pdo_mysql \
        && docker-php-source delete \
	&& addgroup -g ${HGID} -S host_g \
	&& adduser -u ${HUID} -S host_u -G host_g \
	&& addgroup -g 101 -S nginx \
	&& adduser -u 100 -S nginx -G nginx

WORKDIR /var/www

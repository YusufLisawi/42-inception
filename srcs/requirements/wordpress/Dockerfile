FROM alpine:3.18

ARG PHP_V=8.2

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_V} \
    php${PHP_V}-fpm \
    php${PHP_V}-mysqli \
    php${PHP_V}-json \
    php${PHP_V}-curl \
    php${PHP_V}-dom \
    php${PHP_V}-exif \
    php${PHP_V}-fileinfo \
    php${PHP_V}-mbstring \
    php${PHP_V}-openssl \
    php${PHP_V}-xml \
    php${PHP_V}-zip \
    php${PHP_V}-redis \
    wget && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php${PHP_V}/php-fpm.d/www.conf

COPY ./tools/setup_wp.sh .

EXPOSE 9000

ENTRYPOINT ["sh", "setup_wp.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]

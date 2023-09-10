FROM debian:bookworm

RUN apt update && apt install -f -y \
    php8.2-cli \
    php8.2-fpm \
    php8.2-mysql \
    wget \
    && mkdir -p /var/www/html/adminer \
    && wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:8080|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 8080

CMD ["php-fpm8.2", "-F", "-R"]

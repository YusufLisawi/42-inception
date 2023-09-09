FROM debian:bookworm

RUN apt update \ 
    && apt install -f -y php8.2-cli php8.2-fpm php8.2-mysql php-json php8.2-opcache \
    php8.2-mbstring php8.2-xml php8.2-gd php8.2-curl mariadb-client curl sendmail \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["sh", "setup_wp.sh"]

CMD ["php-fpm8.2", "-F"]

#!/bin/bash

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "WordPress is already installed in this directory."
    exec "$@"
    exit 0
fi

cd /tmp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -d "/var/www/html" ]; then
        mkdir -p /var/www/html
fi

chmod -R 755 /var/www/html
chown -R www-data:www-data /var/www/html

cd /var/www/html
rm -rf /var/www/html/*

wp core download --allow-root

wp user create ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html --allow-root

wp user create ${WP_USER} yusufisawii@gmail.com --role=editor --user_pass=${WP_PASSWD} --path=/var/www/html --allow-root 

wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}

wp config create --allow-root --dbname=${WP_DB_NAME} --dbuser=${WP_USER} --dbpass=${WP_PASSWD} --dbhost=${WP_HOST}

wp core install

exec "$@"
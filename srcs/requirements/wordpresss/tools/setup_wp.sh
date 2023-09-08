#!/bin/bash

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
if [ ! -f "/var/www/html/wp-config.php" ]; then
    rm -rf /var/www/html/*

    wp core download --allow-root

    wp config create --allow-root --dbname=${WP_DB_NAME} --dbuser=${WP_USER} --dbpass=${WP_PASSWD} --dbhost=${WP_HOST}

    wp db create --allow-root

    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}
fi
wp plugin update --all

wp user list --role=administrator --format=ids --path=/var/www/html --allow-root | grep 1
if [ $? -eq 0 ]
then
    wp user create ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html --allow-root
fi

wp user list --role=editor --format=ids --path=/var/www/html --allow-root | grep 1
if [ $? -eq 0 ]
then
    wp user create ${WP_USER} ${WP_USER}.42.fr --role=editor --user_pass=${WP_PASSWD} --path=/var/www/html --allow-root 
fi

wp core install

exec "$@"
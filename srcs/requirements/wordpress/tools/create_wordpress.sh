#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

	#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ./www.conf /etc/php/7.3/fpm/pool.d/

	#Inport env variables in the config file
	cd /var/www/html/
	sed -i "s/username_here/$WP_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_PASSWD/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/wordpress/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

exec "$@"

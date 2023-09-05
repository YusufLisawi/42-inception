#!/bin/bash

rc-service mariadb stop
if [ ! -d "/var/lib/mysql" ]; then
    mkdir -p /var/lib/mysql
fi

chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

mariadb-secure-installation << EOF

Y
root0011
Y
root0011
Y
Y
Y
Y
EOF

rc-service mariadb start
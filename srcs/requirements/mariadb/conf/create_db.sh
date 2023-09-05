#!bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '0011';
CREATE DATABASE wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'yelaissa'@'%' IDENTIFIED by '0011';
GRANT ALL PRIVILEGES ON wordpress.* TO 'yelaissa'@'%';
FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi
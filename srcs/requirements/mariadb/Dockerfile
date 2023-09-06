FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf; \
    sed -i "s|#bind-address|bind-address|g" /etc/my.cnf.d/mariadb-server.cnf; \

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

EXPOSE 3306

COPY ./conf/setup_db.sh .
RUN sh setup_db.sh && rm setup_db.sh
USER mysql
CMD ["/usr/bin/mysqld_safe", "--skip-log-error"]
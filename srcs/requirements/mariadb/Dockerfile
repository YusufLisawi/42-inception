FROM alpine:3.18

RUN apk update && apk upgrade \
    && apk add --no-cache mariadb mariadb-client openrc

COPY ./tools/wordpress.sql /tmp/wordpress.sql

COPY ./tools/init.sh /tmp/init.sh

RUN chmod +x /tmp/init.sh

EXPOSE 3306

CMD ["/tmp/init.sh"]
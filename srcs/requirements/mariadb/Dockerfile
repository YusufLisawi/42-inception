FROM alpine:3.18

RUN apk update && apk upgrade \
    && apk add --no-cache mariadb mariadb-client openrc

COPY ./conf/wordpress.sql /wordpress.sql

COPY ./tools/init.sh /init.sh

RUN chmod +x /init.sh

EXPOSE 3306

RUN sh /init.sh

CMD [ "mariadbd", "--user=root", "--bind-address=0.0.0.0"]
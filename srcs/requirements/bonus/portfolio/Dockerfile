FROM alpine:3.18

RUN apk update && apk add --no-cache git \
    && mkdir -p /var/www/html/portfolio

WORKDIR /var/www/html/portfolio

RUN git clone https://github.com/YusufLisawi/yusuflisawi.github.io .
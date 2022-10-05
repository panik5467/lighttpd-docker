# Dockerfile for lighttpd

FROM alpine

ENV LIGHTTPD_VERSION=1.4.64-r0

RUN apk add --update --no-cache \
	lighttpd=${LIGHTTPD_VERSION} \
	lighttpd-mod_auth \
  && rm -rf /var/cache/apk/*

COPY /lighttpd/* /etc/lighttpd/
COPY /html /var/www/localhost/htdocs/html

EXPOSE 80

VOLUME /var/www/localhost/htdocs
VOLUME /etc/lighttpd

CMD chmod a+w /dev/pts/0 && lighttpd -D -f /etc/lighttpd/lighttpd.conf

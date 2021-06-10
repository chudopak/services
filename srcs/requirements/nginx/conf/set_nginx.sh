#!/usr/bin/env bash

mkdir /etc/nginx/ssl

openssl req -x509 -nodes -sha256 -days 365 -newkey rsa:4096 \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=pmarash/CN=pmarash.42.fr" \
		-keyout /etc/nginx/ssl/pmarash.key \
		-out /etc/nginx/ssl/pmarash.crt

#if [ -f /var/www/nginx.conf ]; then
mv /var/www/nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
#rm -rf /etc/nginx/sites-available/default ; rm -rf /etc/nginx/sites-enabled/default
#fi
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
exec "$@"
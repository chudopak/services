#!/usr/bin/env bash

mkdir /etc/nginx/ssl

mv /var/www/openssl.cnf /etc/ssl/openssl.cnf

if [ ! -f /var/www/html/index.html ]
then
mv /var/www/index.html /var/www/html
fi

openssl req -config /etc/ssl/openssl.cnf \
-new -sha256 -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/pmarash.key \
-x509 -days 825 -out /etc/nginx/ssl/pmarash.crt


mv /var/www/nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
rm -rf /var/www/html/index.nginx-debian.html

chown -R www-data:www-data /var/www/*

exec "$@"
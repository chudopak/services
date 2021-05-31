ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=pmarash/CN=html" \
-keyout /etc/nginx/ssl/pmarash.key \
-out /etc/nginx/ssl/pmarash.crt

exec "$@"
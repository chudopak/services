#!/usr/bin/env bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/;security.limit_extensions = .php .php3 .php4 .php5 .php7/security.limit_extensions = .php .php3 .php4 .php5 .php7/" /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wp* ]
then
mkdir -p /var/www/html/
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 755 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --path=/var/www/html

mv /var/www/wp-config.php /var/www/html/

wp core install --allow-root --path=/var/www/html \
	--title=${WORDPRESS_WEBSITE_TITLE} \
	--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email

wp user create --allow-root --path=/var/www/html ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

chmod -R 755 /var/www/html/*
chmod 600 /var/www/html/wp-config.php

fi

exec "$@"
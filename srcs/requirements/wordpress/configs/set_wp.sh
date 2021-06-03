#!/bin/sh

# Switch default chanal to 9000
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf

# Wordpress CLI installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Create dir for PID php-fpm7.3
mkdir /var/run/php && chmod 755 /var/run/php

# Wordpress installation --url=${LOGIN}.42.fr
wp core install --path=/var/www/wordpress \
	--title=Inception --url=localhost \
	--admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email

wp user create --path=/var/www/wordpress ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASSWORD}

# Start 
/usr/sbin/php-fpm7.3 --nodaemonize
#/usr/sbin/php-fpm7.3 -F
#exec "$@"
FROM	debian:buster

RUN apt-get update --yes && apt-get --yes install wget \
												  curl \
												  php-fpm \
												  php-common \
												  php-mysql \
												  php-xml \
												  php-mbstring \
												  php-curl \
												  php-gd \
												  php-cli \
												  vim

EXPOSE 9000

# Installing wordpress
RUN		wget https://wordpress.org/latest.tar.gz
RUN		pwd ; ls
RUN		tar -xzf latest.tar.gz && rm latest.tar.gz \
	&& mkdir -p /var/www \
	&& mv wordpress /var/www
#RUN		mv /wordpress/ /var/www/wordpress
RUN		chmod 777 /var/www/wordpress


COPY ./configs/wp-config.php /var/www/wordpress/

#COPY configs/set_wp.sh /

RUN		sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf

# Wordpress CLI installation
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

# Wordpress installation
RUN		wp core install --path=/var/www/wordpress \
	--title=Inception --url=${LOGIN}.42.fr \
	--admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email

RUN		wp user create --path=/var/www/wordpress ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASSWORD}

#ENTRYPOINT [ "/bin/sh", "set_wp.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
#CMD ["/usr/sbin/php-fpm7", "-F"]

#CMD		service php7.3-fpm start
#CMD [ "bash" ]
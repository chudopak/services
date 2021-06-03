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
RUN		tar -xzf latest.tar.gz && rm latest.tar.gz \
		&& mkdir -p /var/www \
		&& mv wordpress /var/www
RUN		chmod 755 /var/www/wordpress


COPY	./configs/wp-config.php /var/www/wordpress/

COPY	configs/set_wp.sh /
RUN		chmod 755 /set_wp.sh

ENTRYPOINT [ "/bin/sh", "set_wp.sh" ]

#CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
#CMD ["/usr/sbin/php-fpm7", "-F"]

#CMD		service php7.3-fpm start
#CMD [ "bash" ]
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
ARG WORDPRESS_VERSION
RUN wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& tar -xzf wordpress-${WORDPRESS_VERSION}.tar.gz -C /var/www \
	&& rm wordpress-${WORDPRESS_VERSION}.tar.gz 

COPY ./configs/wp-config.php /var/www/wordpress/

#ENTRYPOINT [ "/var/www/html/nginx.sh" ]
CMD ["php-fpm7", "--nodaemonize"]
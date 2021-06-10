FROM		debian:buster

#prosp for ps aux
RUN			apt-get --yes update && apt-get --yes upgrade
RUN			apt-get  install --yes php-fpm php-mysql php-mbstring php-gd php-xml wget vim

EXPOSE		9000

COPY		./conf/  /var/www/

RUN			chmod 755 /var/www/set_wp.sh

ENTRYPOINT	[ "/var/www/set_wp.sh" ]

CMD			[ "/usr/sbin/php-fpm7.3", "--nodaemonize" ]
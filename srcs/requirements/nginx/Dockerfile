FROM		debian:buster

#prosp for ps aux
RUN			apt-get --yes update && apt-get --yes upgrade
RUN			apt-get -y install openssl php-gd php-xml vim nginx procps

EXPOSE		443

COPY		./conf/  /var/www/

RUN			chmod 755 /var/www/set_nginx.sh

ENTRYPOINT	[ "/var/www/set_nginx.sh" ]

CMD			[ "nginx", "-g", "daemon off;" ]

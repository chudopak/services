FROM		debian:buster

#prosp for ps aux
RUN			apt-get --yes update && apt-get --yes upgrade
RUN			apt-get -y install default-mysql-server procps vim

EXPOSE		3306

COPY		./conf/set_db.sh /var/www/

RUN			chmod 755 /var/www/set_db.sh

ENTRYPOINT	[ "/var/www/set_db.sh" ]

CMD			[ "mysqld" ]
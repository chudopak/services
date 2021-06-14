#!/usr/bin/env bash
sed -i "s/bind-ad/\#bind-ad/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/\#port   /port    /" /etc/mysql/mariadb.conf.d/50-server.cnf
#sed -i "s/socket                  = \/run\/mysqld\/mysqld.sock/socket                  = \/var\/run\/mysqld\/mysqld.sock/" /etc/mysql/mariadb.conf.d/50-server.cnf
#sed -i "s/pid-file                = \/run\/mysqld\/mysqld.pid/pid-file                = \/var\/run\/mysqld\/mysqld.pid/" /etc/mysql/mariadb.conf.d/50-server.cnf

chown -R mysql:mysql /var/lib/mysql

if [ ! -d var/lib/mysql/wp_db ]; then
	service mysql start

	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
	mysql -u root -e "FLUSH PRIVILEGES"

	mysqladmin -u root password boba

	service mysql stop

	#touch /var/run/mysqld/mysqld.pid
	#mkfifo /var/run/mysqld/mysqld.sock
	#chmod 777 /var/run/mysqld/mysqld.pid
	#chmod 777 /var/run/mysqld/mysqld.sock

else
mkdir /var/run/mysqld
touch /var/run/mysqld/mysqld.pid
mkfifo /var/run/mysqld/mysqld.sock
fi
chown -R mysql /var/run/mysqld
exec "$@"
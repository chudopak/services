FROM	debian:buster

RUN apt-get update --yes && apt-get --yes install nginx \
												  openssl \
												  vim

COPY	./configs/nginx.conf /etc/nginx/

COPY	./configs/nginx.conf /etc/nginx/sites-available/

COPY	./configs/index.html /var/www/html/

RUN		ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN		mkdir /etc/nginx/ssl
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=pmarash/CN=html" \
		-keyout /etc/nginx/ssl/pmarash.key \
		-out /etc/nginx/ssl/pmarash.crt

#ENTRYPOINT [ "/var/www/html/nginx.sh" ]

EXPOSE 443

CMD		["nginx", "-g", "daemon off;"]
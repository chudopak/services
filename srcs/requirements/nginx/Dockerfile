FROM	debian:buster

RUN apt-get update --yes && apt-get --yes install wget \
												  nginx \
												  vim


#FROM	alpine:latest
#
#RUN		apk update && apk upgrade
#
#RUN		apk add nginx openssl supervisor
#
##Fucking alpine doesn't have bash by difolt
#RUN		apk add vim bash wget
COPY	nginx.conf /etc/nginx/

COPY	nginx.conf /etc/nginx/sites-available/

COPY	./loop.sh ./

COPY	index.html /var/www/html/

CMD		bash ./loop.sh
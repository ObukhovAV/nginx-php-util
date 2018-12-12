FROM ubuntu:18.04
MAINTAINER ObukhovAV "https://github.com/ObukhovAV"

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y mc
RUN apt-get install -y nano
RUN apt-get install -y iputils-ping
RUN apt-get install -y curl
RUN apt-get install -y php7.2-fpm php7.2-mysql php7.2-curl php7.2-gd php7.2-xml
RUN mkdir /run/php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY default /etc/nginx/sites-enabled/default
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 80 443
CMD ["/usr/bin/supervisord"]

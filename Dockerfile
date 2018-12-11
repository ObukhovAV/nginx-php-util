FROM ubuntu:16.04
MAINTAINER ObukhovAV "https://github.com/ObukhovAV"
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y mc
RUN apt-get install -y nano
RUN apt-get install -y iputils-ping
RUN apt-get install -y curl
RUN apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd

RUN mkdir /run/php

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY default /etc/nginx/sites-enabled/default

EXPOSE 80 443
CMD ["/usr/bin/supervisord"]

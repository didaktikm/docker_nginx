#
FROM alpine:latest
MAINTAINER Didaktik-M
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN wget https://raw.githubusercontent.com/didaktikm/docker_nginx/master/nginx.conf -O /etc/nginx/nginx.conf
RUN wget https://raw.githubusercontent.com/didaktikm/docker_nginx/master/index.html -O /www/index.html
CMD [ "CMD nginx", "-g", "daemon off;" ]


#
FROM alpine:latest
MAINTAINER Didaktik-M
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
ADD https://raw.githubusercontent.com/didaktikm/docker_nginx/master/nginx.conf /etc/nginx/
ADD https://raw.githubusercontent.com/didaktikm/docker_nginx/master/index.html /www/
EXPOSE 80
CMD [ "CMD nginx", "-g", "daemon off;" ]


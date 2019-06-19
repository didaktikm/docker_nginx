#
FROM alpine:latest
MAINTAINER Didaktik-M
RUN apk add --update --no-cache nginx \
&& adduser -D -g 'www' www \
&& mkdir /www \
&& mkdir -p /run/nginx \
ADD https://raw.githubusercontent.com/didaktikm/docker_nginx/master/nginx.conf /etc/nginx/
ADD https://raw.githubusercontent.com/didaktikm/docker_nginx/master/index.html /www/
&& chown -R www:www /var/lib/nginx \
&& chown -R www:www /www
EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
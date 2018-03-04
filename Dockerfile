# 3.7.0 released  2017-11-30
FROM alpine:3.7

RUN apk update && apk add bash vim
RUN apk add nginx nginx-mod-rtmp

# cleanup after apk
RUN rm -rf /var/cache/*

# remove extra config with http virtualhost stuff we don't want:
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/modules/rtmp.conf

# for some reason it's having trouble creating a log directory for itself (the
# apk package should have done this?)
RUN mkdir /var/run/nginx && chown nginx /var/run/nginx

# Make nginx log to stdout and stderr so that we can see the logs with "docker
# logs" command:
RUN ln -s /dev/stdout /var/log/nginx/access.log && ln -s /dev/stderr /var/log/nginx/error.log

EXPOSE 1935

ENTRYPOINT ["nginx"]

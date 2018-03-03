# 3.7.0 released  2017-11-30
FROM alpine:3.7

RUN apk update && apk add bash vim

EXPOSE 1935

#RUN apk add --no-cache nginx nginx-mod-rtmp bash vim
RUN apk add nginx nginx-mod-rtmp

# cleanup
RUN rm -rf /var/cache/*

RUN rm /etc/nginx/conf.d/default.conf

#COPY nginx.conf /etc/nginx/conf.d/rtmp.conf
COPY nginx.conf /etc/nginx/modules/rtmp.conf
RUN mkdir /var/run/nginx && chown nginx /var/run/nginx

ENTRYPOINT ["nginx"]

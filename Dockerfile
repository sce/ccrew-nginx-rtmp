# 3.7.0 released  2017-11-30
FROM alpine:3.7

RUN apk update && apk add bash vim

RUN apk add nginx nginx-mod-rtmp && \
    # need these two to get envsubst:
    apk add gettext libintl

# cleanup after apk
RUN rm -rf /var/cache/*

# for some reason it's having trouble creating a log directory for itself (the
# apk package should have done this?)
RUN mkdir /var/run/nginx && chown nginx /var/run/nginx

# Make nginx log to stdout and stderr so that we can see the logs with "docker
# logs" command:
RUN ln -s /dev/stdout /var/log/nginx/access.log && ln -s /dev/stderr /var/log/nginx/error.log

# remove extra config with http virtualhost stuff we don't want:
RUN rm /etc/nginx/conf.d/default.conf

ENV PORT=1935 \
    STREAM_URL=rtmp://a.rtmp.youtube.com/live2 \
    STREAM_KEY=abc-123

EXPOSE ${PORT}

WORKDIR /root
COPY init.sh init.sh
COPY nginx.conf _rtmp.conf

#RUN envsubst '$STREAM_KEY $STREAM_URL $PORT' < /root/_rtmp.conf > /etc/nginx/modules/rtmp.conf

ENTRYPOINT ["/root/init.sh"]

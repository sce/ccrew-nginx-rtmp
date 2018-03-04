#!/bin/sh

# We do the substition here instead of in the Dockerfile so that you can simply
# change the environment variables and create a new container instead of having
# to build a new docker image:
envsubst '$STREAM_KEY $STREAM_URL $PORT' < /root/_rtmp.conf > /etc/nginx/modules/rtmp.conf && \
  cat /etc/nginx/modules/rtmp.conf &&
  nginx

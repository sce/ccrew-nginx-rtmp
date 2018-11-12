#!/bin/sh

docker run --env-file=./env -d -p 127.0.0.1:1935:1935 -p 8080:8080 --name nginx_cont nginx_dual_rtmp

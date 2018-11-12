#!/usr/bin/sh

set -euo pipefail

docker build -t nginx_dual_rtmp .

echo you can now do: docker run nginx_dual_rtmp

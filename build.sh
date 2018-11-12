#!/usr/bin/sh

set -euo pipefail

docker build -t nginx_dual_rtmp .

echo -e "\nRun image with ./run.sh and then view log output with ./logs.sh"
echo Kill container with ./kill.sh

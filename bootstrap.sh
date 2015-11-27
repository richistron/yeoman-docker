#! /bin/bash

set -eu

echo "server ip: `netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'`"

"$@"

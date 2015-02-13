#!/bin/bash
set -e

if [ "$1" == "dnsmasq" ]; then
  exec /usr/sbin/dnsmasq -h -k --log-facility=-
else
  exec "$@"
fi

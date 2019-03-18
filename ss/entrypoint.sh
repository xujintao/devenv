#!/bin/sh
set -eo pipefail

while getopts "s:o:" OPT; do
  case $OPT in
    s)
      SS=$OPTARG;;
    o)
      OBFS=$OPTARG;;
    ?)
      echo "Usage: `basename $0` [options] filename"
    esac
done

# start privoxy
privoxy /etc/privoxy/config

# start obfs-local
if [ -n "$OBFS" ]; then
  obfs-local $OBFS > obfs.out 2>&1 &
fi

# start ss2
shadowsocks2 \
-c $SS \
-verbose \
-socks :1080 \
-u \
-udptun :8053=8.8.8.8:53,:8054=8.8.4.4:53 \
-tcptun :8053=8.8.8.8:53,:8054=8.8.4.4:53
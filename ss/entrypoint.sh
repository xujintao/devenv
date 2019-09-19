#!/bin/sh
set -eo pipefail

while getopts "s:c:o:" OPT; do
  case $OPT in
    s)
      SERVER=$OPTARG;;
    c)
      CLIENT=$OPTARG;;
    o)
      OBFS=$OPTARG;;
    ?)
      echo "Usage: `basename $0` [options] filename"
    esac
done

#if server{
#  start obfs-server
#  start ss-server
#}elseif client{
#  start privoxy
#  start obfs-client
#  start ss-client
#}

if [ -n "$SERVER" ]; then # start client
  # start obfs-local
  if [ -n "$OBFS" ]; then
    obfs-server $OBFS > obfs.out 2>&1 &
  fi
  # start server
  shadowsocks2 \
  -s $SERVER \
  -verbose
elif [ -n "$CLIENT" ]; then # start client
  # start privoxy
  privoxy /etc/privoxy/config
  # start obfs-local
  if [ -n "$OBFS" ]; then
    obfs-local $OBFS > obfs.out 2>&1 &
  fi
  # start shadowsocks client
  shadowsocks2 \
  -c $CLIENT \
  -verbose \
  -socks :1080 \
  -u \
  -udptun :8053=8.8.8.8:53,:8054=8.8.4.4:53 \
  -tcptun :8053=8.8.8.8:53,:8054=8.8.4.4:53
fi
CONFIG_DIR=~/volumes/v2ray

docker run \
--restart=always \
-d \
--name v2ray \
-p 1080:1080 \
-p 8118:8118 \
-v $CONFIG_DIR:/etc/v2ray \
v2ray/official
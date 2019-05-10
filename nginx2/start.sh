export NGINX_HOME=~/volumes/nginx2

docker run \
--restart always \
-d \
--name nginx2 \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-v $NGINX_HOME:/etc/nginx \
-p 81:80 \
nginx:1.15.5-alpine

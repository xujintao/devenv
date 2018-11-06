export NGINX_HOME=~/nginx

docker run \
--rm \
-d \
--name nginx \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-v $NGINX_HOME/conf.d:/etc/nginx/conf.d \
-p 82:80 \
nginx:1.15.5-alpine

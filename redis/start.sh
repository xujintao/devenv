export REDIS_HOME=~/redis

docker run \
--rm \
--name redis \
-d \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-p 6379:6379 \
redis:5.0-alpine

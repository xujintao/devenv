export MYSQL_HOME=~/volumes/mysql

docker run \
--restart always \
--name mysql \
-d \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=1234 \
-v $MYSQL_HOME:/var/lib/mysql \
-p 3306:3306 \
mysql:5.7

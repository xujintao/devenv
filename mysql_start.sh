docker run \
--rm \
--name mysql \
-d \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=1234 \
-v ~/datadir:/var/lib/mysql \
-p 3306:3306 \
mysql:5.7

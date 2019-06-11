MYSQL_HOME=~/volumes/mysql2/data
VMANGOS_HOME=~/volumes/mysql2/vmangos

docker run \
--rm \
-d \
--name mysql2 \
--network mynet \
--network-alias mysql2 \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=1234 \
-v $MYSQL_HOME:/var/lib/mysql \
-v $VMANGOS_HOME:/vmangos \
mysql:5.7

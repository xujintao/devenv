MYSQL_HOME=~/volumes/vmangos/mysql
SQL_HOME=~/volumes/vmangos/sql

docker run \
--restart always \
-d \
-h vmgdb \
--name vmgdb \
--network mynet \
--network-alias vmgdb \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=1234 \
-v $MYSQL_HOME:/var/lib/mysql \
-v $SQL_HOME:/vmangos \
mysql:5.7

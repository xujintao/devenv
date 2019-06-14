VMANGOS_HOME=~/volumes/vmangos/etc

docker run \
--restart always \
-d \
--name realm \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
-p 3724:3724 \
xujintao/realm:1.12.1
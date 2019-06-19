VMANGOS_HOME=~/volumes/vmangos/etc

docker run \
--restart always \
-d \
-h realmd \
--name realmd \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
-p 3724:3724 \
xujintao/realmd:1.12.1

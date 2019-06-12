VMANGOS_HOME=~/volumes/vmangos/etc

docker run \
--rm \
-it \
--name realm \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
xujintao/realm:1.12.1 \
/bin/bash
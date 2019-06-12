VMANGOS_HOME=~/volumes/vmangos/etc

docker run \
--rm \
-it \
--name mangos \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
xujintao/mangos:1.12.1 \
/bin/bash
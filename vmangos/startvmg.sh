VMANGOS_HOME=~/volumes/vmangos/etc

docker run \
--rm \
-it \
--name vmangos \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
vmangos:1.12.1 \
/bin/bash
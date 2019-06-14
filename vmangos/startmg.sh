VMANGOS_HOME=~/volumes/vmangos/etc
DATA_HOME=~/volumes/vmangos/data
COREDUMP_HOME=~/volumes/vmangos/coredump

docker run \
--restart always \
-it \
--name mangos \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
-v $DATA_HOME:/vmangos/data \
-v $COREDUMP_HOME:/coredump \
-p 8085:8085 \
xujintao/mangos:1.12.1 \
/bin/bash
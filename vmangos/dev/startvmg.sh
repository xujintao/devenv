VMANGOS_HOME=~/volumes/vmangos/etc
DATA_HOME=~/volumes/vmangos/data
COREDUMP_HOME=~/volumes/vmangos/coredump

docker run \
--rm \
-it \
--name vmangos \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
-v $DATA_HOME:/vmangos/data \
-v $COREDUMP_HOME:/coredump \
-p 8085:8085 \
xujintao/vmangos:1.12.1 \
/bin/bash
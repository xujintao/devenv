VMANGOS_HOME=~/volumes/vmangos/etc
DATA_HOME=~/volumes/vmangos/data
COREDUMP_HOME=~/volumes/vmangos/coredump

docker run \
--rm \
-it \
--name vmangos \
--network mynet \
-e TZ=Asia/Shanghai \
-v $VMANGOS_HOME:/vmangos/etc \
-v $DATA_HOME:/vmangos/data \
-v $COREDUMP_HOME:/tmp \
-p 8085:8085 \
--security-opt seccomp=unconfined \
xujintao/vmangos:1.12.1 \
/bin/bash
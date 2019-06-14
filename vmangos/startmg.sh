VMANGOS_HOME=~/volumes/vmangos/etc
DATA_HOME=~/volumes/vmangos/data

docker run \
--restart always \
-it \
--name mangos \
--network mynet \
-v $VMANGOS_HOME:/vmangos/etc \
-v $DATA_HOME:/vmangos/data \
-p 8085:8085 \
xujintao/mangos:1.12.1 \
/bin/bash
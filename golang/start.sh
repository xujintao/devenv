docker run \
--rm \
-d \
--name golang \
-e LANG=C.UTF-8 \
-e TZ=Asia/Shanghai \
-p 84:8080 \
golang:alpine

FROM golang:1.11.2-alpine3.8

LABEL maintainer "xujintao@126.com"

RUN apk update && \
    apk add git curl tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    apk del tzdata

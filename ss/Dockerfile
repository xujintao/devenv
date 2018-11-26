FROM golang:1.11.2-alpine3.8 as builder

RUN apk update && \
    apk add git && \
    git clone https://github.com/xujintao/go-shadowsocks2.git \
      $GOPATH/src/github.com/shadowsocks/go-shadowsocks2 && \
    go install github.com/shadowsocks/go-shadowsocks2

FROM alpine:3.8
LABEL maintainer "xujintao@126.com"

RUN apk update && \
    apk add tzdata bash && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk add privoxy && \
    apk del tzdata && \
 
    # set listen-address
    sed -i '/^l.*127/ s/127.0.0.1/0.0.0.0/g' /etc/privoxy/config && \
    #sed -i '/^l.*\[/ s/^\(.*\)/#\1/g' /etc/privoxy/config && \

    # set forward-socks5t 
    sed -i 's/^#\s\+forward-socks5t.*9050.*$/forward-socks5t \/ 127.0.0.1:1080 ./g' \
      /etc/privoxy/config

COPY --from=builder /go/bin/go-shadowsocks2 /usr/bin/shadowsocks2

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

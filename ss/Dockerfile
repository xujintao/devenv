FROM golang:1.11.5-alpine3.8 as builder

RUN apk update && \
    apk add git && \
    git clone https://github.com/xujintao/go-shadowsocks2.git \
     $GOPATH/src/github.com/shadowsocks/go-shadowsocks2 && \
    go install github.com/shadowsocks/go-shadowsocks2 && \

    apk add gcc autoconf make libtool automake zlib-dev \
            openssl asciidoc xmlto libpcre32 libev-dev \
            g++ linux-headers && \
    git clone https://github.com/shadowsocks/simple-obfs.git && \
    cd simple-obfs && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && make && \
    make install

FROM alpine:3.8
LABEL maintainer "xujintao@126.com"

RUN apk update && \
## python程序，不清楚依赖什么，所以放到二阶段，感觉很傻逼，所以选择go
## 安装python版本的ss(只需要sslocal)
#apk add py-pip git && \
#pip install git+https://github.com/shadowsocks/shadowsocks.git@master && \

## sslocal依赖libsodium库实现加密
#apk add libsodium && \

## simple-obfs依赖libev
apk add libev && \

# 安装privoxy
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

COPY --from=builder /go/bin/go-shadowsocks2 /usr/local/bin/shadowsocks2
COPY --from=builder /usr/local/bin/obfs-* /usr/local/bin/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
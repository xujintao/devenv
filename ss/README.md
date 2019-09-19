![](https://github.com/xujintao/deven/blob/master/ss/ss.jpg)

## build
```sh
docker build -t xujintao/ss:2.1 .
```
## client
without obfs
```sh
docker run \
--restart=always \
-d \
--name ss \
-p 8118:8118 \
-p 1080:1080 \
xujintao/ss:2.0 \
-c ss://cipher:password@serverIP:Port
```

with obfs
```sh
docker run \
--restart=always \
-d \
--name ss \
-p 8118:8118 \
-p 1080:1080 \
xujintao/ss:2.0 \
-c ss://cipher:password@127.0.0.1:1984 \
-o "-s serverIP -p Port -l 1984 --obfs tls --obfs-host www.s4.com"
```

## server
[configure multiple users](https://github.com/shadowsocks/go-shadowsocks2/issues/111)

```sh
docker run \
--restart=always \
-d \
--name ss \
-p 8118:8118 \
-p 1080:1080 \
xujintao/ss:2.1 \
-s ss://cipher:password@:Port
```

## 支持的加密种类
```sh
AEAD方式
AEAD_AES_128_GCM
AEAD_AES_192_GCM
AEAD_AES_256_GCM
AEAD_CHACHA20_POLY1305

传统STREAM方式
AES-128-CTR
AES-192-CTR
AES-256-CTR
AES-128-CFB
AES-192-CFB
AES-256-CFB
CHACHA20-IETF
XCHACHA20
```

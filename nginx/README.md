## 执行
```sh
mkdir -p ~/ssl/nginx && cd ~/ssl/nginx

cp /etc/ssl/openssl.cnf openssl.cnf
#按照要求对本地openssl.cnf进行修改
1, 取消注释行 req_extensions = v3_req
2, [ v3_req ] 块下增加一行 subjectAltName = @alt_names
3, 增加[ alt_names ]字段填写如下：
DNS.1 = pi.com
DNS.2 = *.pi.com

sudo ./selfsign.sh #自签名方式
sudo ./casign.sh   #私有ca签名方式
```

## 说明
### 私有CA
1, 创建ca的key
```sh
openssl genrsa -out ca.key 2048
```

2, 生成ca的证书
```sh
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt -subj "/C=CN/ST=Shanghai/L=Shanghai/O=pi/CN=pi.ca"
```

### 创建证书
1, 创建private key
```
openssl genrsa -out pi.com.key 2048
```

2, 创建证书签名请求
```
cp /etc/ssl/openssl.cnf openssl.cnf
#按照要求对本地openssl.cnf进行修改
1, 取消注释行 req_extensions = v3_req
2, [ v3_req ] 块下增加一行 subjectAltName = @alt_names
3, 增加[ alt_names ]字段填写如下：
DNS.1 = pi.com
DNS.2 = *.pi.com

openssl req -new -key pi.com.key -out pi.com.csr -config openssl.cnf -subj "/C=CN/ST=Shanghai/L=Shanghai/O=pi/CN=pi.com"
openssl req -text -noout -in pi.com.csr
```

3, 签名  
方式一: 自签名
```
openssl x509 -req -days 1460 -in pi.com.csr -signkey pi.com.key -out pi.com.crt -extensions v3_req -extfile openssl.cnf
rm -rf pi.com.csr
chmod 600 pi.com.*
```
方式二: 私有CA签名
```sh
openssl x509 -req -days 1460 -in pi.com.csr -CAkey ca.key -CA ca.crt -set_serial 01 -out pi.com.crt -extensions v3_req -extfile openssl.cnf
```

参考：  
[Multiple Names on One Certificate](http://apetec.com/support/generatesan-csr.htm)  
[Generate ssl certificates with Subject Alt Names on OSX](https://gist.github.com/croxton/ebfb5f3ac143cd86542788f972434c96)  


### 导入nginx
```sh
sudo cp pi.com.crt pi.com.key ~/volumes/nginx/ssl
docker restart nginx
```

### 导入trust store
```sh
# 自签名方式直接导入服务器证书
sudo cp pi.com.crt /usr/local/share/ca-certificates

# 私有ca签名方式导入ca证书
sudo cp pi.ca.crt /usr/local/share/ca-certificates

sudo update-ca-certificates -f
```

### 测试
```sh
curl -v https://pi.com
自签名会报错curl: (60) SSL certificate problem: unable to get local issuer certificate，但是单域名自签名证书却能正常工作
私有签名是OK的
```
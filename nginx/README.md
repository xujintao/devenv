```sh
mkdir -p ~/ssl/nginx && cd ~/ssl/nginx
```

### 创建证书
1, 创建private key
```
openssl genrsa -des3 -out pi.com.key 2048
# 记住密码
mv pi.com.key 1.key
openssl rsa -in 1.key -out pi.com.key
rm -rf 1.key
# 忘记密码
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

openssl req -new -key pi.com.key -out pi.com.csr -config openssl.cnf
openssl req -text -noout -in pi.com.csr
```

3, 自签名
```
openssl x509 -req -days 1460 -in pi.com.csr -signkey pi.com.key -out pi.com.crt -extensions v3_req -extfile openssl.cnf
rm -rf pi.com.csr
chmod 600 pi.com.*
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
sudo cp pi.com.crt /usr/local/share/ca-certificates
sudo update-ca-certificates -f
```
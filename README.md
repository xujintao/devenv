![](https://github.com/xujintao/deven/blob/master/nginx.jpg)

### ssh config
```
Host github.com
  User git
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/github_rsa

Host gitlab.pi.com
  User git
  Hostname gitlab.pi.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/gitlab_rsa
```

### 创建证书
1, 创建private key
```
mkdir ssl && cd ssl
openssl genrsa -des3 -out pi.com.key 2048
# 记住密码
mv pi.com.key 1.key
openssl rsa -in 1.key -out pi.com.key
rm -rf 1.key
# 忘记密码
```

2, 创建证书签名请求
```
openssl req -new -key pi.com.key -out pi.com.csr
# 域名填写*.pi.com，会报错curl: (51) SSL: certificate subject name '*.pi.com' does not match target host name 'pi.com'
# 域名填写pi.com，会报错curl: (51) SSL: certificate subject name 'pi.com' does not match target host name 'www.pi.com'
# 需要多域名
```

3, 创建证书
```
openssl x509 -req -days 1460 -in pi.com.csr -signkey pi.com.key -out pi.com.crt
rm -rf pi.com.csr
chmod 600 pi.com.*
```
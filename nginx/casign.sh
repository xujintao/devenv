#1, pi.ca.key pi.ca.crt
openssl genrsa -out pi.ca.key 2048
openssl req -new -x509 -days 3650 -key pi.ca.key -out pi.ca.crt -subj "/C=CN/ST=Shanghai/L=Shanghai/O=pi/CN=pi.ca"

#2, pi.com.key pi.com.csr

rm -rf pi.com.csr
openssl genrsa -out pi.com.key 2048
openssl req -new -key pi.com.key -out pi.com.csr -config openssl.cnf -subj "/C=CN/ST=Shanghai/L=Shanghai/O=pi/CN=pi.com"

#3, sign
openssl x509 -req -days 1460 -in pi.com.csr -CAkey pi.ca.key -CA pi.ca.crt -set_serial 01 -out pi.com.crt -extensions v3_req -extfile openssl.cnf

#4, dists
sudo cp pi.com.key pi.com.crt ~/volumes/nginx/ssl
docker restart nginx

sudo cp pi.ca.crt /usr/local/share/ca-certificates
sudo update-ca-certificates -f

#5, test
curl -v https://pi.com

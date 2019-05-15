rm -rf pi.com.csr pi.com.crt
#1, pi.com.key
openssl genrsa -out pi.com.key 2048

#2, pi.com.csr
openssl req -new -key pi.com.key -out pi.com.csr -config openssl.cnf -subj "/C=CN/ST=Shanghai/L=Shanghai/O=pi/CN=pi.com"

#3, pi.com.crt
openssl x509 -req -days 1460 -in pi.com.csr -signkey pi.com.key -out pi.com.crt -extensions v3_req -extfile openssl.cnf

#4, dist
sudo cp pi.com.key pi.com.crt ~/volumes/nginx/ssl
docker restart nginx

sudo cp pi.com.crt /usr/local/share/ca-certificates
sudo update-ca-certificates -f

#5, test
curl -v https://pi.com

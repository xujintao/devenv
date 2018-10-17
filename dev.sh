echo "Please set utf8 if Chinese garbled under minGW"

echo "不认证主机公钥"
sed -i 's/^#\s\+StrictHostKeyChecking ask/StrictHostKeyChecking no/' \
/etc/ssh/ssh_config

echo "将yum的base源设置为aliyun"
if [ -z "`sed -n -e '/aliyun.*CentOS-7/p' /etc/yum.repos.d/CentOS-Base.repo`" ]; then
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
curl -o /etc/yum.repos.d/CentOS-Base.repo \
http://mirrors.aliyun.com/repo/Centos-7.repo
fi

echo "禁用fastmirror插件"
sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

echo "yum安装git"
yum install -y git

echo "yum安装net-tools（centos7.5的box没有net-bools）"
yum install -y net-tools

echo "yum安装vim"
yum install -y vim

echo "yum安装docker"
yum install -y yum-utils \
    device-mapper-persistent-data lvm2
yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce-18.03.0.ce

# 把vagrant用户添加到docker组
# 因为该脚本是root用户执行的，所以不能用${USER}
if [ -z "`sed -n -e '/docker:*:vagrant/p' /etc/group`" ];then
usermod -aG docker vagrant
systemctl enable docker
systemctl restart docker
fi

# 修复NetworkManager与network冲突的问题
echo "禁用NetworkManager"
systemctl disable NetworkManager

echo "设置CST时区"
timedatectl set-timezone Asia/Shanghai

echo "重启依赖系统时间的服务"
systemctl restart rsyslog
systemctl restart crond
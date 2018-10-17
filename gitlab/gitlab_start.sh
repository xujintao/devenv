export GITLAB_HOME=~/gitlab
docker run \
--restart always \
-d \
--name gitlab \
-h gitlab \
-p 8443:443 \
-p 80:80 \
-p 2222:22 \
-v $GITLAB_HOME/config:/etc/gitlab \
-v $GITLAB_HOME/logs:/var/log/gitlab \
-v $GITLAB_HOME/data:/var/opt/gitlab \
gitlab/gitlab-ce
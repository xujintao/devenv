export GITLAB_HOME=~/volumes/gitlab

docker run \
--restart always \
-d \
--name gitlab \
-h gitlab \
-p 8443:443 \
-p 8080:80 \
-p 2222:22 \
-v $GITLAB_HOME/config:/etc/gitlab \
-v $GITLAB_HOME/logs:/var/log/gitlab \
-v $GITLAB_HOME/data:/var/opt/gitlab \
gitlab/gitlab-ce:11.10.4-ce.0
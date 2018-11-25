#export DRONE_HOME=~/drone

docker run \
--volume=/var/run/docker.sock:/var/run/docker.sock \
--volume=/var/lib/drone:/data \
--env=DRONE_GIT_ALWAYS_AUTH=false \
--env=DRONE_GITLAB_SERVER=http://gitlab.xxx.com \
--env=DRONE_GITLAB_CLIENT_ID=64b88a8164049829fcf33fb37ce898ea7b4e70be54f08cce1524cae53844e955 \
--env=DRONE_GITLAB_CLIENT_SECRET=afa3f7c10577b58d9386d30562676f172913cc0ba4f4716696822623ff1c2993 \
--env=DRONE_RUNNER_CAPACITY=2 \
--env=DRONE_SERVER_HOST=10.51.13.36:83 \
--env=DRONE_SERVER_PROTO=http \
--env=DRONE_TLS_AUTOCERT=false \
--publish=83:80 \
--restart=always \
--detach=true \
--name=drone \
drone/drone:1.0.0-rc.1

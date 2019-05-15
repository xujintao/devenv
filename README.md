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

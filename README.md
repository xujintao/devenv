dev ssh config
```
Host github.com
  User git
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/github_rsa

Host 10.51.13.36
  User git
  Hostname 10.51.13.36
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/gitlab_rsa
```

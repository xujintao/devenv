### gitlab-behind-nginx

1, external_url
```yml
external_url 'https://gitlab.pi.com'
nginx['listen_port'] = 80
nginx['listen_https'] = false
```

2, 时区
```yml
gitlab_rails['time_zone'] = 'Asia/Shanghai'
```

3, 邮箱
```yml
gitlab_rails['gitlab_email_enabled'] = true
gitlab_rails['gitlab_email_from'] = 'ddwant@163.com'
gitlab_rails['gitlab_email_display_name'] = 'gitlab'
gitlab_rails['gitlab_email_reply_to'] = 'ddwant@163.com'
gitlab_rails['gitlab_email_subject_suffix'] = 'hello'

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.163.com"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_user_name'] = "ddwant"
gitlab_rails['smtp_password'] = "******"
gitlab_rails['smtp_domain'] = "163.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
```

参考:  
1, [Installing GitLab in an internal Docker Container behind a public Nginx](https://eliteinformatiker.de/2018/05/31/gitlab-in-docker-behind-nginx)  
2, [Could not connect to gitlab if external_url have https in it](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/950)
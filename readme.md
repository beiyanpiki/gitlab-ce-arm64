# gitlab-ce arm64

> Dockerhub: [beiyanpiki/gitlab-ce](https://hub.docker.com/r/beiyanpiki/gitlab-ce)

## usage

```yaml
# docker-compose.yaml
version: "3"
services:
  gitlab:
    image: beiyanpiki/gitlab-ce:13.4.6
    container_name: gitlab
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://domain.test'
        gitlab_rails['gitlab_shell_ssh_port'] = 22
        gitlab_rails['packages_enabled'] = true
        gitlab_rails['packages_storage_path'] = '/mnt/packages'
        postgresql['enable'] = false
        gitlab_rails['db_adapter'] = 'postgresql'
        gitlab_rails['db_encoding'] = 'utf8'
        gitlab_rails['db_host'] = 'postgres'
        gitlab_rails['db_port'] = '5432'
        gitlab_rails['db_username'] = 'gitlab'
        gitlab_rails['db_password'] = 'randompassword'
        redis['enable'] = false
        gitlab_rails['redis_host'] = 'redis'
        gitlab_rails['redis_port'] = 6379
        gitlab_rails['smtp_enable'] = true
        gitlab_rails['smtp_address'] = 'smtpdm.aliyun.com'
        gitlab_rails['smtp_port'] = 465
        gitlab_rails['smtp_user_name'] = 'username@mail.domain.test'
        gitlab_rails['smtp_password'] = 'smtp_password'
        gitlab_rails['smtp_domain'] = 'mail.domain.test'
        gitlab_rails['smtp_authentication'] = 'login'
        gitlab_rails['smtp_enable_starttls_auto'] = true
        gitlab_rails['smtp_tls'] = true
        gitlab_rails['smtp_openssl_verify_mode'] = 'none'
        gitlab_rails['gitlab_email_enabled'] = true
        gitlab_rails['gitlab_email_from'] = 'username@mail.domain.test'
        gitlab_rails['gitlab_email_display_name'] = 'Gitlab Server'
    volumes:
      - ./gitlab/config:/etc/gitlab
      - ./gitlab/logs:/var/log/gitlab
      - ./gitlab/data:/var/opt/gitlab
      - ./gitlab/package:/mnt/packages
    privileged: true
    ports:
      - "22:22"
    links:
      - postgres:postgres
      - redis:redis
  postgres:
    image: postgres
    container_name: postgres
    restart: always
    volumes:
      - ./postgres/data:/var/lib/postgresql/data
    environment:
      - POSTGRES_PASSWORD=randompassword
      - POSTGRES_USER=gitlab
      - POSTGRES_DB=gitlabhq_production
  redis:
    image: redis
    container_name: redis
    restart: always
    volumes:
      - ./redis/data:/data  
  nginx:
    image: nginx
    container_name: nginx
    restart: always
    ports:
      - 80:80
      - 443:443
    links:
      - gitlab:gitlab
    volumes:
      - ./nginx/conf.d:/etc/nginx/conf.d
      - ./nginx/cert:/cert
 ```

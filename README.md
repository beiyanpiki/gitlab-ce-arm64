# gitlab-ce arm64

> Dockerhub: [beiyanpiki/gitlab-ce-arm64](https://hub.docker.com/r/beiyanpiki/gitlab-ce-arm64)

## usage

Same as amd64 version, you can find usage on official GitLab Docker images.

## sample

```yaml
web:
  image: 'beiyanpiki/gitlab-ce-arm64:15.4.2-ce.0'
  restart: always
  hostname: 'gitlab.example.com'
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'https://gitlab.example.com'
  ports:
    - '80:80'
    - '443:443'
    - '22:22'
  volumes:
    - '/srv/gitlab/config:/etc/gitlab'
    - '/srv/gitlab/logs:/var/log/gitlab'
    - '/srv/gitlab/data:/var/opt/gitlab'
```

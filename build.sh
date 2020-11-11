#/bin/sh

echo "begin build full version ..."
docker image rm -f beiyanpiki/gitlab-ce:arm64
docker image prune -f
docker build -f ./Dockerfile -t beiyanpiki/gitlab-ce:arm64 .
docker push beiyanpiki/gitlab-ce:arm64
echo "end build full version ..."

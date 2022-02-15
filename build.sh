!#/bin/bash
rm -rf build || true
mkdir -p build
curl -o build/Dockerfile https://raw.githubusercontent.com/nginxinc/docker-nginx/master/modules/Dockerfile.alpine
mkdir build/fancyindex
echo "https://github.com/aperezdc/ngx-fancyindex/archive/refs/tags/v0.5.2.tar.gz" > build/fancyindex/source

docker build --build-arg ENABLED_MODULES=fancyindex build/. -t totev/nginx-fancyindex
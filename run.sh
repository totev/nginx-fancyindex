#!/bin/bash

docker run \
  --rm \
  -it \
  -p 8080:80 \
  -v $(pwd)/static-site.nginx.conf:/etc/nginx/conf.d/default.conf:ro \
  -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v somewhere:/usr/share/nginx/html:ro \
  totev/nginx-fancyindex

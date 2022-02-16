![ci/cd](https://github.com/totev/nginx-fancyindex/actions/workflows/build.yml/badge.svg)

## nginx-fancyindex
A container based on the [official alpine based nginx image](https://github.com/nginxinc/docker-nginx/tree/master/modules) compiled with the [Fancy Index module](https://github.com/aperezdc/ngx-fancyindex).

No modification is done to the original projects, feel free to inspect the build script `build.sh`.

Check out the awesome projects websites:
 - [docker-nginx](https://github.com/nginxinc/docker-nginx)
 - [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex#directives)

### Loading the Fancy Index Module
Following [the official documentation](https://docs.nginx.com/nginx/admin-guide/dynamic-modules/dynamic-modules/) you must enable the *Fancy Index module* in your nginx configuration by adding the following line:

`load_module modules/ngx_http_fancyindex_module.so;`

If you like, you can use the bundled file in this repository: `./nginx.conf`. It is just a copy of the official one with the one line from above addded.

### Enabling the Fancy Index Module
Following the [official module documentation](https://github.com/aperezdc/ngx-fancyindex#example), add the directives to the desired location.

```
location / {
  fancyindex on;              # Enable fancy indexes.
  fancyindex_exact_size off;  # Output human-readable file sizes.
}
```

Again if you wish, you can use included file `static-site.nginx.conf` as a starting point.

### Example usage
```
docker run \
  -dit \
  -p 8080:80 \
  -v $(pwd)/static-site.nginx.conf:/etc/nginx/conf.d/default.conf:ro \
  -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $(pwd)/build:/usr/share/nginx/html:ro \
  ghcr.io/totev/nginx-fancyindex:latest
```

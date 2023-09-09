
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    server {
      listen 9080;
      
      location ~* /userinfo$ {
          return 403;
      }

      location ~ ^/api/(.*) {
          proxy_pass http://{{ env "NOMAD_UPSTREAM_ADDR_clinical-info-service"}}/$1;
      }

      location / {
          proxy_pass http://{{ env "NOMAD_UPSTREAM_ADDR_keycloak"}}/;
          proxy_set_header Host $http_host;
          proxy_set_header X-Forwarded-For $remote_addr;
      }
    }

    include /etc/nginx/conf.d/*.conf;

}

# upstream puma {
#   server unix:///home/Administrador/apps/SIDEGAP/shared/tmp/sockets/SIDEGAP-puma.sock;
# }

# server {
#   listen 80 default_server deferred;

#   # If you're planning on using SSL (which you should), you can also go ahead and fill out the following server_name variable:
#   # server_name example.com;

#   # Don't forget to update these, too
#   root /home/Administrador/apps/SIDEGAP/current/public;
#   access_log /home/Administrador/apps/SIDEGAP/current/log/nginx.access.log;
#   error_log /home/Administrador/apps/SIDEGAP/current/log/nginx.error.log info;

#   location ^~ /assets/ {
#     gzip_static on;
#     expires max;
#     add_header Cache-Control public;
#   }

#   try_files $uri/index.html $uri @puma;
#   location @puma {
#     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#     proxy_set_header Host $http_host;
#     proxy_redirect off;

#     proxy_pass http://puma;
#   }

#   error_page 500 502 503 504 /500.html;
#   client_max_body_size 20M;
#   keepalive_timeout 10;
# }

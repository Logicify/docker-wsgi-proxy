#!/bin/sh

cat > /etc/nginx/nginx_params <<-EOF
set \$proxy_timeout $PROXY_TIMEOUT;
set \$nginx_port $NGINX_PORT;
set \$wsgi_port $WSGI_PORT;
set \$wsgi_host $WSGI_HOST;
EOF

nginx -g 'daemon off;'

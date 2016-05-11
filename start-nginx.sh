#!/bin/sh

cat > /etc/nginx/nginx_params <<-EOF
set \$proxy_timeout $PROXY_TIMEOUT;
set \$wsgi_port $WSGI_PORT;
set \$wsgi_host $WSGI_HOST;
EOF

nginx -g 'daemon off;'

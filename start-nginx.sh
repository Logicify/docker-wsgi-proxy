#!/bin/sh

cat > /etc/nginx/nginx_params <<-EOF
proxy_send_timeout $PROXY_TIMEOUT;
proxy_read_timeout $WSGI_PORT;
set \$wsgi_host '$WSGI_HOST';
set \$wsgi_port $WSGI_PORT;
EOF

nginx -g 'daemon off;'

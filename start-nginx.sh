#!/bin/sh

cat > /etc/nginx/nginx_params <<-EOF
proxy_send_timeout $PROXY_TIMEOUT;
proxy_read_timeout $WSGI_PORT;
proxy_pass http://$wsgi_host:$wsgi_port;
EOF

nginx -g 'daemon off;'

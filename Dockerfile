FROM logicify/centos7:latest
RUN yum -y update \    
    && yum -y install nginx gettext
    
ENV WSGI_PORT "8000"
ENV WSGI_HOST "localhost"
ENV PROXY_TIMEOUT "90"
ENV NGINX_PORT "80"
    
# Create a directory for config 
COPY ./nginx.template /etc/nginx/nginx.template
COPY ./start-nginx.sh /usr/bin/start-nginx.sh
COPY ./mime.types /etc/nginx/mime.types

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    
    && chmod +x /usr/bin/start-nginx.sh


EXPOSE 80
VOLUME ["/etc/nginx/config.d"]

CMD ["start-nginx.sh"]

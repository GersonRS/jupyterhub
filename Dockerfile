FROM nginx:alpine

COPY ./nginx_confs /etc/nginx/conf.d
COPY ./devops-stack-helloworld /usr/share/nginx/html

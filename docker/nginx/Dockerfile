FROM nginx:latest

COPY ./docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./docker/nginx/cert/api.daal.plus+3.pem /etc/nginx/ssl/api.daal.plus+3.pem
COPY ./docker/nginx/cert/api.daal.plus+3-key.pem  /etc/nginx/ssl/api.daal.plus+3-key.pem
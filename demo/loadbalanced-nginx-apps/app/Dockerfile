# Dockerfile to install nginx:alpine

FROM nginx:alpine

RUN rm /etc/nginx/conf.d/*

COPY default.conf /etc/nginx/conf.d/

COPY index.html /usr/share/nginx/html

#!/bin/sh

envsubst '${API_URL}' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
#!/bin/bash

sed -i -- 's|="/|="'$BASE_URL'/|g' /usr/share/nginx/html/index.html
sed -i -- 's|BASE_URL|'$BASE_URL'|g' /usr/share/nginx/html/app-config.js
sed -i -- 's|ORTHANC_HOST|'${ORTHANC_HOST:-orthanc}'|g' /etc/nginx/conf.d/default.conf

exec "$@"

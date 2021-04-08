#!/usr/bin/env bash

if [[ ${EUID} -eq 0 ]]; then
  apt-get install nginx -y
  cp ./spottop /etc/nginx/sites-available/spottop
  ln -s /etc/nginx/sites-available/spottop /etc/nginx/sites-enabled
  systemctl restart nginx
else
  echo "Please run with escalated privs"
fi


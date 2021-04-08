#!/usr/bin/env bash

if [[ ${EUID} -eq -0 ]]; then
  cp ./spottop.service /etc/systemd/system/.
  systemctl enable spottop
  systemctl daemon-reload
  systemctl restart spottop
else
  echo "Please run with escalated privs"
fi

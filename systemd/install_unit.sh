#!/usr/bin/env bash

UNIT=docker-spottop.service

if [[ ${EUID} -eq -0 ]]; then
  cp ./${UNIT} /etc/systemd/system/.
  systemctl enable ${UNIT}
  systemctl daemon-reload
  systemctl restart ${UNIT}
else
  echo "Please run with escalated privs"
fi

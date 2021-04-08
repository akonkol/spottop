#!/bin/bash

/usr/bin/chromium-browser -app  http://192.168.1.150/ \
  --kiosk \
  --noerrdialogs \
  --disable-session-crashed-bubble \
  --disable-infobars \
  --check-for-update-interval=604800 \
  --disable-pinch

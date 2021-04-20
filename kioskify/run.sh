#!/bin/bash

/usr/bin/chromium-browser -app  http://192.168.1.150/ \
  --noerrdialogs \
  --disable-session-crashed-bubble \
  --disable-infobars \
  --disable-pinch \
  --kiosk


# /usr/bin/chromium-browser -app  http://twitch.tv/shrimps247 \
#   --noerrdialogs \
#   --disable-session-crashed-bubble \
#   --disable-infobars \
#   --disable-pinch \
#   --kiosk

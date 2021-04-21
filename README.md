# README.md

SpotTop polls Spotify's API to gather information about the currently playing track for a user's account and displays it on a webpage. The webpage polls the `/update` endpoint using javascript every 10 seconds [by default](https://github.com/akonkol/spottop/blob/main/static/update.js#L29).

When you are playing a song using the mobile client (say on your phone) you are able to interogate the Spotify API [`/v1/me/player/currently-playing`](https://developer.spotify.com/console/get-users-currently-playing-track/) for track attributes.  However, when you are playing tracks using the Spotify Desktop client you are *not* able to get the current playing track information.
1. [499](https://github.com/spotify/web-api/issues/499)
1. [detect-a-users-current-song](https://stackoverflow.com/questions/25722194/detect-a-users-current-song-in-spotify-api)

## Applescript
A viable solution is to get currently playing information on the desktop machine using `applescript` via [spottop.applescript](applescript/spottop.applescript). Using this script you can retrieve information from the locally running Spotify Desktop client, turn it into json format and send the data to `spottop's` `/json-input` endpoint.  Track information sent to this endpoint is stored via in-memory [cache ](https://pythonhosted.org/Flask-Cache/) and is displayed on screen if calls to `/v1/me/player/currently-playing` yield no results.

## Launchd
You will want to run [spottop.applescript](applescript/spottop.applescript) on a regular basis, to do this on OSX I used `launchd`. Similar to cron, you define the path to the executable you'd like to run along with scheduling information which you can see [here](applescript/spottop-reporter.plist)

## Running as a Kiosk
For this project I used a [Weirdly Square HyperPixel Display](https://www.adafruit.com/product/4499) in conjunction with a [Raspberry Pi 4 4GB](https://www.adafruit.com/product/4296) mounted atop of my main monitor.  

I accidentally glued my screen upside down to the monitor mount and need to figure out how to rotate the display and touchscreen.  Here is a [video](https://www.youtube.com/watch?v=OJ59hXSyBoI&t=674s) that shows how to do this for a HyperPixel display (although they are using for a different project). Be sure to expand the description for links to HOWTO guides.


- [HyperPixel 4 display drivers for linux](https://github.com/pimoroni/hyperpixel4)
- [Rotate Screen](https://github.com/pimoroni/hyperpixel4/issues/51#issuecomment-583848997)
- [Rotate Touch Screen](https://www.instructables.com/Rotate-Raspberry-Pi-Display-and-Touchscreen/)

To get the desktop enviornment to open `chromium` on start in the right mode and hide the mouse cursor I found this super helpful [post ](https://wolfgang-ziegler.com/blog/setting-up-a-raspberrypi-in-kiosk-mode-2020)


## Systemd
I created a `systemd` unit to start this application's `docker` container in a very [hacky-but-hey-it-works](systemd) way :) 

# README.md

SpotTop polls Spotify's API to gather information about the currently playing track for a user's account and display it on a webpage.  When you are playing a song using the mobile client you are able to interogate the Spotify API `/currently_playing_track` for track attributes.  However, when you are playing tracks using the Spotify Desktop client you are *not* able to get the current playing track information and an alternative way to get currently playing information must be used.   

Alternative flow to get information from the desktop client:
Run script on local machine which interrogates the Spotify Desktop client and sends data to SpotTop to display using the `json-input` endpoint. 

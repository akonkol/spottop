#!/usr/bin/python3
import spotipy
from spotipy.oauth2 import SpotifyOAuth
import logging

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.DEBUG)
logging.debug('This message should appear on the console')
logging.info('So should this')
logging.warning('And this, too')


SCOPE = "user-read-playback-state"

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=SCOPE))

current_track = sp.current_user_playing_track()

track = current_track['item']
logging.info("Song: ", track['name'])

album=track['album']
album_name=album['name']
logging.info("Album: ", album_name)

artists=album['artists']
for artist in artists:
    logging.info("Group: ", artist['name'])

album_image_url=current_track['item']['album']['images']
logging.info(album_image_url)

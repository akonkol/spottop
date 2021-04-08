from flask import Flask, jsonify, render_template, request

import spotipy
from spotipy.oauth2 import SpotifyOAuth

app = Flask(__name__)
SCOPE = "user-read-playback-state"

@app.route('/')
def whats_playing():
    return render_template("playing.html",current_track=None)


@app.route('/update/', methods=['GET'])
def update():
  sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=SCOPE))
  current_track = sp.current_user_playing_track()
  if current_track:
    return jsonify(current_track)
  else:
    return jsonify(None)

if __name__ == '__main__':
    app.run()

from flask import Flask, jsonify, render_template, request
import spotipy
from spotipy.oauth2 import SpotifyOAuth
from flask_caching import Cache
#

config = {
    "DEBUG": True,          # some Flask specific configs
    "CACHE_TYPE": "SimpleCache",  # Flask-Caching related configs
    "CACHE_DEFAULT_TIMEOUT": 300
}

app = Flask(__name__)
# tell Flask to use the above defined config
app.config.from_mapping(config)
cache = Cache(app)

SCOPE = "user-read-playback-state"

@app.route('/')
def whats_playing():
    return render_template("playing.html",current_track=None)

@app.route('/update/', methods=['GET'])
def update():
  sp = spotipy.Spotify(auth_manager=SpotifyOAuth(open_browser=False,scope=SCOPE))
  current_track = sp.current_user_playing_track()
  if current_track:
    return jsonify(current_track)
  else:
    return jsonify(cache.get("current_track"))

@app.route('/json-input', methods=['POST'])
def json_example():
    request_data = request.get_json()
    current_track = request_data
    cache.set("current_track", request_data)
    return jsonify({"success":"true"})

if __name__ == '__main__':
    app.run(host="0.0.0.0")

#!/bin/bash
curl -X POST http://192.168.1.150:8080/json-input \
	   -H "Content-Type: application/json" \
     -d @./current_track.json 

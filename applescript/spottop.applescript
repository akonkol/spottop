on escape_quotes(string_to_escape)
  set AppleScript's text item delimiters to the "\""
  set the item_list to every text item of string_to_escape
  set AppleScript's text item delimiters to the "\\\""
  set string_to_escape to the item_list as string
  set AppleScript's text item delimiters to ""
  return string_to_escape
end escape_quotes

tell application "Spotify"
 set ctrack to "{"
 set ctrack to ctrack &     "\"item\": {"
 set ctrack to ctrack &        "\"album\": {"
 set ctrack to ctrack &          "\"artists\": ["
 set ctrack to ctrack &               "{\"name\" : \"" &  my escape_quotes(current track's artist) & "\"}"
 set ctrack to ctrack &              "],"
 set ctrack to ctrack &              "\"images\": ["
 set ctrack to ctrack &                  "{\"url\" : \"" & current track's artwork url & "\"}"
 set ctrack to ctrack &                "]"
 set ctrack to ctrack &          "},"
 set ctrack to ctrack &         "\"name\": \"" & my escape_quotes(current track's name) & "\""
 set ctrack to ctrack &         "}"
 set ctrack to ctrack & "}"
 return ctrack
end tell

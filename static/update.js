$(document).ready(function(){
  $("#album_art").hide();
  function fetchSpotifyInfo() {
    $.get("/update/",function(res){
      if ($.trim(res)){
        var album_art = res['item']['album']['images'][0]['url'];
        var track_name = res['item']['name'];
        var artists = res['item']['album']['artists'];
        var artist_list = "";
        artists.forEach(function (item, index) {
          artist_list += item['name'];
        });
        $('#album_art').attr("src", album_art);
        $("#album_art").show();
        $('#track').html(track_name);
        $("#track").show();
        $('#artists').html(artist_list);
        $('#artists').show();
      }
      else {
        $("#album_art").hide();
        $('#track').hide();
        $('#artists').hide();
      }

    }); 
  }
  var intervalId = window.setInterval(function(){
    fetchSpotifyInfo();
   }, 10000);
});

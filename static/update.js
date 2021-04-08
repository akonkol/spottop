$(document).ready(function(){
  $("#album_art").hide();
  $('#track').hide();
  $('#artists').hide();

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
        $('#track').html(track_name);
        $('#artists').html(artist_list);
        $("#album_art").toggle();
      }

    }); 
  }
  var intervalId = window.setInterval(function(){
    fetchSpotifyInfo();
   }, 10000);
 
  $("#info").click(function(){
        $("#album_art").toggle();
        $("#track").toggle();
        $('#artists').toggle();
  });
});

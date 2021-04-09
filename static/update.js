$(document).ready(function(){
  $("#album_art").hide();
  $('#track').hide();
  $('#artists').hide();

  function fetchSpotifyInfo() {
    $.get("/update/",function(res){
      if ($.trim(res)){
        var album_art_url = res['item']['album']['images'][0]['url'];
        var track_name = res['item']['name'];
        var artists = res['item']['album']['artists'];
        var artist_list = "";
        artists.forEach(function (item, index) {
          artist_list += item['name'];
        });
        var current_track_name = $('#track').text();
        if(current_track_name != track_name){
          $('#album_art').attr("src", album_art_url);
          $('#track').html(track_name);
          $('#artists').html(artist_list);
          $('#album_art').show();
	}
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

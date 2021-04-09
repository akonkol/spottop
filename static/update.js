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

        if($('#track').html != track_name){
          $('#album_art').attr("src", album_art_url);
          $('#album_art').show();
          $('#track').html(track_name);
          $('#artists').html(artist_list);
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


function playAud() {
    var musicplayer = document.getElementById("music_player");
    var icono = document.getElementById("play_pause");
    if (musicplayer.paused == true)
    {
      musicplayer.play()
      icono.className = "fa fa-pause";
    }
    else
    {
      musicplayer.pause()
      icono.className = "fa fa-play";
    }

 }

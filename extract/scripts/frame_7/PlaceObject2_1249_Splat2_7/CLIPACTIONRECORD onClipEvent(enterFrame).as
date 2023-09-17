onClipEvent(enterFrame){
   if(_name != "Splat2" && !_global.pause)
   {
      if(_currentframe > 5 || eval(marker) == undefined || _currentframe < 5)
      {
         play();
      }
      if(_currentframe == 32)
      {
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
}

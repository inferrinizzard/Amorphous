onClipEvent(enterFrame){
   if(_name != "GloopleDisintigrate" && !_global.pause)
   {
      if(_currentframe < 45)
      {
         play();
      }
      if(_currentframe == 45)
      {
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

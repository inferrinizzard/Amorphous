onClipEvent(enterFrame){
   if(_name != "HeroDisintigrate" && !_global.pause)
   {
      play();
      if(_currentframe == 38)
      {
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

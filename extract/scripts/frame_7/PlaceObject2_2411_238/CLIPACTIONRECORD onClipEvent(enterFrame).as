onClipEvent(enterFrame){
   if(_name != "Absorbing")
   {
      if(!_global.pause)
      {
         play();
         if(_currentframe == 16)
         {
            removeMovieClip(this);
         }
      }
      else
      {
         stop();
      }
   }
}

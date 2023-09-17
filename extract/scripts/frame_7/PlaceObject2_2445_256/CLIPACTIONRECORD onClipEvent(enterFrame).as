onClipEvent(enterFrame){
   if(_name != "QuillPop" && !_global.pause)
   {
      if(_currentframe < 12)
      {
         play();
      }
      if(_currentframe == 12)
      {
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

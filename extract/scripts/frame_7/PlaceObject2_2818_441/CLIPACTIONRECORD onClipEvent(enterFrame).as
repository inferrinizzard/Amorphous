onClipEvent(enterFrame){
   if(_name != "FuzzPuff" && !_global.pause)
   {
      if(_currentframe < 31)
      {
         play();
      }
      if(_currentframe == 31)
      {
         stop();
         _alpha = _alpha - 5;
         if(_alpha <= 0)
         {
            this.removeMovieClip();
         }
      }
   }
   else
   {
      stop();
   }
}

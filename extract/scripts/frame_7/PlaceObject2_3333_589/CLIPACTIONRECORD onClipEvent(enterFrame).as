onClipEvent(enterFrame){
   if(_name != "GroundDirt" && !_global.pause)
   {
      if(_currentframe < 21)
      {
         play();
      }
      if(_currentframe == 21)
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

onClipEvent(enterFrame){
   if(_name != "HeroBisect" && !_global.pause)
   {
      if(_currentframe < 15)
      {
         play();
      }
      if(_currentframe == 15)
      {
         stop();
      }
   }
   else
   {
      stop();
   }
}

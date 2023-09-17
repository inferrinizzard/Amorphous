onClipEvent(enterFrame){
   if(_currentframe == 51 && int(Math.random() * 5) != 1)
   {
      gotoAndPlay(11);
   }
   if(_currentframe == 95)
   {
      gotoAndPlay(2);
   }
}

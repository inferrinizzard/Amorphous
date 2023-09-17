onClipEvent(enterFrame){
   if(_currentframe == 41 && int(Math.random() * 3) != 1)
   {
      gotoAndPlay(1);
   }
   if(_currentframe == 76 && int(Math.random() * 3) != 1)
   {
      gotoAndPlay(56);
   }
}

onClipEvent(enterFrame){
   if(_currentframe == 1 && int(Math.random() * 4) == 1 && eval(myFlame) == null)
   {
      attachMovie("Gloople Flame","myFlame",1);
      myFlame._rotation -= 180;
   }
   if(eval(myFlame) != null)
   {
      if(myFlame._currentframe == 130)
      {
         myFlame.removeMovieClip();
      }
      if(myFlame._currentframe == 100 && int(Math.random() * 5) != 1)
      {
         myFlame.gotoAndPlay(30);
      }
   }
}

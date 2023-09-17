onClipEvent(enterFrame){
   if(_name != "HeroBounceback")
   {
      if(_global.pause)
      {
         stop();
      }
      else
      {
         play();
      }
      if(_global.HeroAction != "bounceback")
      {
         removeMovieClip(this);
      }
   }
}

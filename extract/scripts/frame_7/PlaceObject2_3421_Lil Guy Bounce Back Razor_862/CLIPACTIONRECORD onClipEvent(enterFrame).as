onClipEvent(enterFrame){
   if(_name != "HeroBouncebackRazor")
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

onClipEvent(enterFrame){
   if(_name != "GroundCrack" && !_global.pause)
   {
      if(_alpha > 0)
      {
         if(framesExisted > 900)
         {
            _alpha--;
         }
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

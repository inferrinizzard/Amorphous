onClipEvent(enterFrame){
   if(_name != "QueenWiggler" && !_global.pause)
   {
      play();
      if(framesExisted > 239)
      {
         this._alpha -= 10;
      }
      if(_alpha <= 0)
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
   else
   {
      stop();
   }
}

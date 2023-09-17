onClipEvent(enterFrame){
   if(_name != "VoidPulse" && !_global.pause)
   {
      if(framesExisted < 30)
      {
         this._xscale += 60;
         this._yscale += 60;
      }
      else
      {
         myBackdrop.removeMovieClip();
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

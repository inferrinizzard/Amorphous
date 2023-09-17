onClipEvent(enterFrame){
   if(_name != "Frost" && !_global.pause)
   {
      if(framesExisted < 30)
      {
         this._xscale--;
         this._yscale--;
      }
      else if(framesExisted > 59)
      {
         this._alpha -= 10;
      }
      if(_alpha <= 0)
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

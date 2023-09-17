onClipEvent(enterFrame){
   if(_name != "WhiteSmoke" && !_global.pause)
   {
      if(framesExisted < 100)
      {
         this._xscale = this._xscale + 1;
         this._yscale = this._yscale + 1;
         this._x += 0.5;
         this._y -= 0.5;
         if(framesExisted > 89)
         {
            this._alpha -= 10;
         }
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

onClipEvent(enterFrame){
   if(_name != "GroundDust" && !_global.pause)
   {
      if(_alpha == 100)
      {
         _alpha = 50;
      }
      if(framesExisted < 100)
      {
         if(framesExisted / 5 == int(framesExisted / 5))
         {
            this._xscale = this._xscale + 1;
            this._yscale = this._yscale + 1;
         }
         this._x += 1;
         this._y -= 1;
         if(framesExisted > 89)
         {
            this._alpha -= 5;
         }
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

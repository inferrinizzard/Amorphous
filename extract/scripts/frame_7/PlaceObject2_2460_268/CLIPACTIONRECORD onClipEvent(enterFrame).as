onClipEvent(enterFrame){
   if(_name != "GroundMound" && !_global.pause)
   {
      if(framesExisted < 80)
      {
         if(_alpha < 100)
         {
            _alpha = _alpha + 25;
         }
         if(framesExisted < 10)
         {
            _xscale = _xscale + 2;
            _yscale = _yscale + 2;
         }
         else if(framesExisted < 20)
         {
            _xscale = _xscale - 2;
            _yscale = _yscale - 2;
         }
      }
      else if(_alpha > 0)
      {
         _alpha = _alpha - 10;
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

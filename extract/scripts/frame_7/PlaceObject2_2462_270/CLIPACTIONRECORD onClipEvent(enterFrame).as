onClipEvent(enterFrame){
   if(_name != "GroundHole" && !_global.pause)
   {
      if(framesExisted < 120)
      {
         if(framesExisted < 5)
         {
            _xscale = _xscale + 10;
            _yscale = _yscale + 10;
         }
      }
      else if(_xscale > 10)
      {
         _xscale = _xscale - 10;
         _yscale = _yscale - 10;
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

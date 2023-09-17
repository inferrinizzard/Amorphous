onClipEvent(enterFrame){
   if(_name != "VoidBall" && !_global.pause)
   {
      if(framesExisted < 20)
      {
         _xscale = _xscale - 5;
         _yscale = _yscale - 5;
         _Y = _Y - 3 * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + 3 * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
}

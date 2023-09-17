onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(eval(hostObject) == undefined)
      {
         _alpha = _alpha - 1;
      }
      else if(hostObject._y > 0 && hostObject._x > 0 || notset)
      {
         this.lineTo(hostObject._x,hostObject._y);
         notset = false;
      }
      if(_alpha <= 0)
      {
         removeMovieClip(this);
      }
   }
}

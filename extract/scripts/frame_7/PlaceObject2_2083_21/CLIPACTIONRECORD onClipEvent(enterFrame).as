onClipEvent(enterFrame){
   if(_name != "HeroAbsorbed" && !_global.pause)
   {
      play();
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      _X = hostObject._x;
      _Y = hostObject._y;
      _rotation = hostObject._rotation;
   }
   else
   {
      stop();
   }
}

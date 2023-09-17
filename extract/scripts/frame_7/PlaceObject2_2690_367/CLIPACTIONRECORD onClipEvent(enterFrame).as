onClipEvent(enterFrame){
   if(_name != "BiterLunge")
   {
      if(eval(daddyBiter) == undefined)
      {
         removeMovieClip(this);
      }
      _X = daddyBiter._x;
      _Y = daddyBiter._y;
      _rotation = daddyBiter._rotation;
   }
}

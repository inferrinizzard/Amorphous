onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(lifeSpan > 0)
      {
         lifeSpan--;
      }
      else
      {
         _parent._alpha -= 10;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
      speed = lifeSpan / 40;
      _parent._xscale += 1;
      _parent._yscale += 1;
      _parent._y -= speed * Math.cos(_parent._rotation * 0.017453292519943295);
      _parent._x += speed * Math.sin(_parent._rotation * 0.017453292519943295);
   }
}

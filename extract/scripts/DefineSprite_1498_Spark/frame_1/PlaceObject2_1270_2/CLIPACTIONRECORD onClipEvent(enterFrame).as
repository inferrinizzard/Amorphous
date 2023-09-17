onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(lifeSpan > 0)
      {
         if(_parent._yscale >= 7)
         {
            _parent._yscale -= 7;
         }
         speed = lifeSpan / 2;
         _parent._y -= speed * Math.cos(_parent._rotation * 0.017453292519943295);
         _parent._x += speed * Math.sin(_parent._rotation * 0.017453292519943295);
         _parent._rotation += listTo;
         lifeSpan--;
      }
      else
      {
         _parent.removeMovieClip();
      }
   }
}

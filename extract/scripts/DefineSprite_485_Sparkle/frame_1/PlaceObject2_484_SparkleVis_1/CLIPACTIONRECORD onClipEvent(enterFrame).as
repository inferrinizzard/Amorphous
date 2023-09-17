onClipEvent(enterFrame){
   if(_parent._rotation > -180 && _parent._rotation < 0)
   {
      _parent._rotation -= 1;
   }
   else if(_parent._rotation < 180 && _parent._rotation > 0)
   {
      _parent._rotation += 1;
   }
   _parent._y -= speed * Math.cos(_parent._rotation * 0.017453292519943295);
   _parent._x += speed * Math.sin(_parent._rotation * 0.017453292519943295);
   _rotation = _rotation + spin;
   if(framesExisted >= life)
   {
      if(_parent._xscale > 5)
      {
         _parent._xscale -= 1;
         _parent._yscale -= 1;
      }
      else
      {
         removeMovieClip(_parent);
      }
   }
   framesExisted++;
}

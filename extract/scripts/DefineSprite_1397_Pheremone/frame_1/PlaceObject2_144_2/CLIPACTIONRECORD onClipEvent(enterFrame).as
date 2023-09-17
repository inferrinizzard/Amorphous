onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(lifespan > 0)
      {
         _parent._xscale += 2;
         _parent._yscale += 2;
         lifespan--;
      }
      else if(_parent._alpha > 0)
      {
         _parent._alpha -= 5;
      }
      else
      {
         _parent.removeMovieClip();
      }
      _parent._y -= 2 * Math.cos(driftDirection * 0.017453292519943295);
      _parent._x += 2 * Math.sin(driftDirection * 0.017453292519943295);
   }
}

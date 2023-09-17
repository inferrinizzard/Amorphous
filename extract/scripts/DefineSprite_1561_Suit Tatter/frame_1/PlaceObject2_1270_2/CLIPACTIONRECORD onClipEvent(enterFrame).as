onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!drift)
      {
         if(speed > 0)
         {
            _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
            _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
            framesAtSpeed++;
            if(framesAtSpeed >= flyRange)
            {
               speed -= 1;
            }
         }
         else
         {
            drift = true;
            framesAtSpeed = 0;
         }
      }
      else if(framesAtSpeed <= 20)
      {
         if(Clockwise)
         {
            _parent._rotation += 5;
         }
         else
         {
            _parent._rotation -= 5;
         }
         _parent._y -= 0.5 * Math.cos(_parent._rotation * 0.017453292519943295);
         _parent._x += 0.5 * Math.sin(_parent._rotation * 0.017453292519943295);
         _parent._xscale -= 2;
         _parent._yscale -= 2;
         framesAtSpeed++;
      }
      else
      {
         _parent._alpha--;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
   }
}

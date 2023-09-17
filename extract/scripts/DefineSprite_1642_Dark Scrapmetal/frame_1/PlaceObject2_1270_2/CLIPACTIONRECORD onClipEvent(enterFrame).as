onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(speed != 0)
      {
         if(Clockwise)
         {
            _parent._rotation += speed * 15;
         }
         else
         {
            _parent._rotation -= speed * 15;
         }
         _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
         _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            speed -= 1;
            framesAtSpeed = 0;
         }
      }
      else if(framesAtSpeed >= 90)
      {
         _parent._alpha -= 5;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
      framesAtSpeed++;
   }
}

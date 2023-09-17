onClipEvent(enterFrame){
   if(_name != "Ice1" && !_global.pause)
   {
      if(speed != 0)
      {
         _rotation = _rotation + rotateSpeed;
         _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            speed -= 1;
            framesAtSpeed = 0;
         }
      }
      else if(framesAtSpeed > 90)
      {
         if(_alpha > 0)
         {
            _alpha = _alpha - 5;
         }
         else
         {
            removeMovieClip(this);
         }
      }
      framesAtSpeed++;
   }
}

onClipEvent(enterFrame){
   if(_name != "Stone" && !_global.pause)
   {
      if(speed == 8)
      {
         if(int(Math.random() * 30) == 1)
         {
            _global.MakeNoise("Pebble");
         }
      }
      if(speed != 0)
      {
         if(_rotation + 20 > 179)
         {
            _rotation = _rotation - 340;
         }
         else
         {
            _rotation = _rotation + 20;
         }
         _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            speed -= 1;
            framesAtSpeed = 0;
         }
      }
      else if(framesAtSpeed >= 30)
      {
         removeMovieClip(this);
      }
      framesAtSpeed++;
   }
}

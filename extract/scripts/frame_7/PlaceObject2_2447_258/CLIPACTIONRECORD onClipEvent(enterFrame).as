onClipEvent(enterFrame){
   if(_name != "BoneChip1" && !_global.pause)
   {
      if(speed != 0)
      {
         if(Clockwise)
         {
            _rotation = _rotation + speed * 15;
         }
         else
         {
            _rotation = _rotation - speed * 15;
         }
         _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            speed -= 1;
            framesAtSpeed = 0;
         }
      }
      else if(framesAtSpeed >= 90)
      {
         _alpha = _alpha - 5;
      }
      if(_alpha <= 0)
      {
         removeMovieClip(this);
      }
      framesAtSpeed++;
   }
}

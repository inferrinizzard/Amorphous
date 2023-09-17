onClipEvent(enterFrame){
   if(_name != "Gib2" && !_global.pause)
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
         framesAtSpeed++;
      }
   }
}

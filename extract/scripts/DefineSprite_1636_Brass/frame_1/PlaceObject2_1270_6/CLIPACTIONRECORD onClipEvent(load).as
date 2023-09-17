onClipEvent(load){
   tumble = false;
   _parent.stop();
   tink = false;
   flight = 0;
   tumbleFast = false;
   speed = int(Math.random() * 2) + 4;
   framesAtSpeed = 0;
   atRest = false;
   lift = int(Math.random() * 3) + 2;
   speed -= lift;
   listLeft = false;
   moveDirection = _parent._rotation + 90;
   _parent._xscale = 105;
   _parent._yscale = 105;
   moveDirection += int(Math.random() * 30) - 15;
   spin = int(Math.random() * 30) + 20;
   if(moveDirection > 180)
   {
      moveDirection -= 360;
   }
   if(moveDirection < -180)
   {
      moveDirection += 360;
   }
   if(speed <= 0)
   {
      speed = 0.5;
   }
   if(int(Math.random() * 2) == 0)
   {
      tumble = true;
   }
   if(int(Math.random() * 2) == 0)
   {
      tumbleFast = true;
   }
   if(int(Math.random() * 2) == 0)
   {
      listLeft = true;
   }
}

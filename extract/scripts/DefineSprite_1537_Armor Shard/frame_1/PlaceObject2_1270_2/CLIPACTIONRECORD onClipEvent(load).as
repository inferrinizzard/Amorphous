onClipEvent(load){
   flyRange = int(Math.random() * 8) + 5;
   speed = int(Math.random() * 3) + 3;
   framesAtSpeed = 0;
   moveDirection = _parent._rotation;
   _parent.gotoAndStop(int(Math.random() * 5) + 1);
   if(int(Math.random() * 2) == 0)
   {
      Clockwise = true;
   }
   if(int(Math.random() * 2) == 0)
   {
      _parent._xscale = -100;
   }
}

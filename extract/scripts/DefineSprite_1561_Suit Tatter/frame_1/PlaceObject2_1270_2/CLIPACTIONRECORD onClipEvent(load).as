onClipEvent(load){
   flyRange = int(Math.random() * 10) + 10;
   drift = false;
   speed = int(Math.random() * 3) + 5;
   framesAtSpeed = 0;
   moveDirection = _parent._rotation;
   _parent.gotoAndStop(int(Math.random() * 5) + 1);
   if(int(Math.random() * 2) == 0)
   {
      Clockwise = true;
   }
   _parent._rotation = int(Math.random() * 360) - 180;
   _parent._xscale = 150;
   _parent._yscale = 150;
}

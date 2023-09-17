onClipEvent(load){
   speed = int(Math.random() * 2) + 4;
   framesAtSpeed = 0;
   moveDirection = _parent._rotation;
   if(int(Math.random() * 2) == 0)
   {
      Clockwise = true;
   }
   _parent._xscale = 120;
   _parent._yscale = 120;
}

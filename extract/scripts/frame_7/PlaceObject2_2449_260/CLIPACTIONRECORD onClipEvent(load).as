onClipEvent(load){
   if(_name != "BoneChip2")
   {
      flyRange = int(Math.random() * 8) + 5;
      speed = int(Math.random() * 3) + 3;
      framesAtSpeed = 0;
      moveDirection = _rotation;
      if(int(Math.random() * 2) == 0)
      {
         Clockwise = true;
      }
      if(int(Math.random() * 2) == 0)
      {
         _xscale = -100;
      }
   }
}

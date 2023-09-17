onClipEvent(load){
   if(_name != "ShedTooth")
   {
      flyRange = int(Math.random() * 6) + 6;
      speed = 3;
      framesAtSpeed = 0;
      moveDirection = _rotation;
      if(int(Math.random() * 2) == 0)
      {
         Clockwise = true;
      }
   }
}

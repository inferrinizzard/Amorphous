onClipEvent(load){
   if(_name != "Stone")
   {
      flyRange = int(Math.random() * 4) + 2;
      speed = 8;
      framesAtSpeed = 0;
      moveDirection = _rotation;
   }
}

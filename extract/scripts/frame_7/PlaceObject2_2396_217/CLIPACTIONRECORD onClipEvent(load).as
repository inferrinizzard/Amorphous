onClipEvent(load){
   if(_name != "Ice1")
   {
      flyRange = int(Math.random() * 6) + 1;
      speed = 8;
      framesAtSpeed = 0;
      moveDirection = _rotation;
      rotateSpeed = int(Math.random() * 15) + 6;
   }
}

onClipEvent(load){
   if(_name != "GroundPebble")
   {
      flyRange = int(Math.random() * 10) + 5;
      speed = 4;
      framesAtSpeed = 0;
      moveDirection = _rotation;
      myScale = int(Math.random() * 30) + 50;
      _xscale = myScale;
      _yscale = myScale;
   }
}

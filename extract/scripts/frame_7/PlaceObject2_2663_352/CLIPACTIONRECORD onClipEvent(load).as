onClipEvent(load){
   if(_name != "MoltenStone")
   {
      flyRange = int(Math.random() * 4) + 2;
      speed = 8;
      framesAtSpeed = 0;
      moveDirection = _rotation;
   }
}

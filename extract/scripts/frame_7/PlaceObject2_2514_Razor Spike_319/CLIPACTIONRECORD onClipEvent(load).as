onClipEvent(load){
   if(_name != "RazorSpike")
   {
      this.addProperty("spike",this.getSpike,null);
      spike = true;
      flyRange = int(Math.random() * 6) + 10;
      speed = 6;
      framesAtSpeed = 0;
      moveDirection = _rotation;
      myScale = int(Math.random() * 30) + 100;
      _xscale = myScale;
      _yscale = myScale;
   }
}

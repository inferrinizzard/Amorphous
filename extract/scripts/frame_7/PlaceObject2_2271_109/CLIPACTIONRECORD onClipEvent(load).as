onClipEvent(load){
   mommy = false;
   justBounced = 0;
   if(_name == "OozleGlom")
   {
      mommy = true;
      stop();
   }
   this.addProperty("speed",this.getSpeed,this.setSpeed);
   this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
   speed = 1;
}

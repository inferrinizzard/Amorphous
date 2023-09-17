onClipEvent(load){
   mommy = false;
   justBounced = 0;
   recoil = 0;
   rockCounter = 0;
   if(_name == "GrinderCracked")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("health",this.getHealth,this.setHealth);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("acidized",this.getAcidized,this.setAcidized);
      killedBy = null;
      health = 5;
      speed = 2;
      turnSpeed = 0.5;
      _global.Enemies.push(_name);
      if(_global.soundMode == "All" || _global.soundMode == "FX Only")
      {
         myGrind = new Sound(this);
         myGrind.attachSound("Grind");
         myGrind.start(0,10);
      }
   }
}

onClipEvent(load){
   mommy = false;
   justBounced = 0;
   overheadObstruction = false;
   if(_name == "RazorMite")
   {
      mommy = true;
      stop();
   }
   this.addProperty("speed",this.getSpeed,this.setSpeed);
   this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
   this.addProperty("mite",this.getMite,null);
   mite = true;
   this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   this.addProperty("inGround",this.getInGround,null);
   killedBy = null;
   inGround = false;
   surfaceFrames = 0;
   burrowFrames = 0;
   _xscale = 70;
   _yscale = 70;
   impacts = 0;
   swells = 0;
   mommyQueen = eval("_root." + _name.slice(0,_name.length - 6));
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      mySound = new Sound(this);
      mySound.attachSound("Grind");
   }
}

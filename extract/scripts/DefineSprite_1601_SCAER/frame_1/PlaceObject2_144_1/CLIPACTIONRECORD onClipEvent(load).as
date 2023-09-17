onClipEvent(load){
   airtime = 30;
   _parent.stop();
   moveDirection = _parent._rotation;
   myEffects = 0;
   _parent.addProperty("deployed",this.getDeployed,this.setDeployed);
   _parent.addProperty("Health",this.getHealth,this.setHealth);
   _parent.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   _parent.killedBy = null;
   _parent.addProperty("exploded",this.getExploded,this.setExploded);
   _parent.exploded = false;
   _parent.addProperty("ineffective",this.getIneffective,this.setIneffective);
   _parent.addProperty("tool",this.getTool,this.setTool);
   _parent.tool = true;
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   spin = int(Math.random() * 5);
   if(int(Math.random() * 2) == 1)
   {
      spin = - spin;
   }
   _parent._xscale = 140;
   _parent._yscale = 140;
   _parent.Health = 100;
   _parent.deployed = false;
   _parent.ineffective = false;
   LockOn = null;
   deployFrames = 0;
   refire = 0;
   muzzlePointX = 0;
   muzzlePointY = 0;
   if(speed < 3)
   {
      speed = 3;
   }
   if(speed > 7)
   {
      speed = 7;
   }
   myTab = eval(_global.RewardTab("BoxGun"));
   checkFire = false;
   turnSpeed = 4;
   warnings = 0;
   huskTime = 0;
   gearTracking = false;
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      myGear = new Sound(this);
      myGear.attachSound("Turret Track Amb");
   }
}

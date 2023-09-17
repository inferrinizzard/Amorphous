onClipEvent(load){
   airtime = 70;
   _parent.stop();
   myEffects = 0;
   crashDown = false;
   _parent.addProperty("deployed",this.getDeployed,this.setDeployed);
   _parent.addProperty("Health",this.getHealth,this.setHealth);
   _parent.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   _parent.killedBy = null;
   _parent.addProperty("exploded",this.getExploded,this.setExploded);
   _parent.exploded = false;
   _parent.addProperty("claw",this.getClaw,this.setClaw);
   _parent.claw = true;
   _parent.addProperty("disk",this.getDisk,this.setDisk);
   _parent.disk = true;
   _parent.addProperty("tool",this.getTool,this.setTool);
   _parent.tool = true;
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   spin = 0;
   banking = 0;
   drain = 0;
   _parent.Health = 100;
   _parent.deployed = false;
   LockOn = null;
   justBounced = 0;
   if(speed < 4)
   {
      speed = 4;
   }
   if(speed > 7)
   {
      speed = 7;
   }
   myTab = eval(_global.RewardTab("Drone"));
   turnSpeed = 4;
   speedBoost = 0;
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      myBuzz = new Sound(this);
      myBuzz.attachSound("Drone Buzz Amb 1");
   }
}

onClipEvent(load){
   mommy = false;
   justBounced = 0;
   fuzzRecover = 120;
   gracePeriod = 20;
   if(_name == "FuzzleHairless")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("gracePeriod",this.getGracePeriod,null);
      this.addProperty("beenShaved",this.getBeenShaved,this.setBeenShaved);
      killedBy = null;
      speed = 4;
      turnSpeed = 4;
      if(_root.SpawnPoint.SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      gotoSpotX = int(Math.random() * 540) + 6;
      gotoSpotY = int(Math.random() * 390) + 6;
   }
}

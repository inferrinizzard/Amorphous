onClipEvent(load){
   mommy = false;
   if(_name == "VoidEater")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("action",this.getAction,this.setAction);
      this.addProperty("exploded",this.getExploded,null);
      speed = 1;
      turnSpeed = 1;
      action = "none";
      proximity = false;
      chargedUp = 0;
      pulseDown = 0;
      exploded = false;
      if(_root.myLure.luring)
      {
         gotoSpotX = _root.myLure._x;
         gotoSpotY = _root.myLure._y;
      }
      else if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      else
      {
         gotoSpotX = _X + 20;
         gotoSpotY = _Y + 20;
      }
      if(SearchArray(EnemiesSeen,"VoidEater") == null)
      {
         EnemiesSeen.push("VoidEater");
      }
   }
}

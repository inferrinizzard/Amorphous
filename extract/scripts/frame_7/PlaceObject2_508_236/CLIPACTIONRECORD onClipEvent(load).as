onClipEvent(load){
   mommy = false;
   if(_name == "Amalgam")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("burnProtection",this.getBurnProtection,this.setBurnProtection);
      recoil = 20;
      stuffEaten = 0;
      justBounced = 0;
      burnProtection = 0;
      speed = 3;
      turnSpeed = 4;
      Splitting = false;
      if(_root.myLure.luring && _xscale > 70)
      {
         gotoSpotX = _root.myLure._x;
         gotoSpotY = _root.myLure._y;
      }
      else if(eval(_root.HeroPointer) != undefined && _xscale > 70)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      else
      {
         gotoSpotX = int(Math.random() * 490) + 26;
         gotoSpotY = int(Math.random() * 340) + 26;
      }
   }
}

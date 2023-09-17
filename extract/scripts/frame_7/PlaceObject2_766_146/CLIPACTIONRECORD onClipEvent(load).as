onClipEvent(load){
   mommy = false;
   if(_name == "Horror")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("action",this.getAction,this.setAction);
      speed = 1;
      turnSpeed = 1;
      justBounced = 0;
      action = "none";
      hookCount = 10;
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
      if(_global.soundMode == "All" || _global.soundMode == "FX Only")
      {
         myWhine = new Sound(this);
         myWhine.attachSound("HorrorAmb");
         myWhine.start(0,100);
      }
      if(SearchArray(EnemiesSeen,"Horror") == null)
      {
         EnemiesSeen.push("Horror");
      }
   }
}

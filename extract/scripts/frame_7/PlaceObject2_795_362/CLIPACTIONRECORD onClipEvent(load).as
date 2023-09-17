onClipEvent(load){
   mommy = false;
   if(_name == "Oozle")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("health",this.getHealth,this.setHealth);
      health = 3;
      recoil = 0;
      lilSplats = 0;
      speed = 2;
      turnSpeed = 2;
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
      if(SearchArray(EnemiesSeen,"Oozle") == null)
      {
         EnemiesSeen.push("Oozle");
      }
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
   }
}

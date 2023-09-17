onClipEvent(load){
   mommy = false;
   if(_name == "HorrorDisk")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("disk",this.getDisk,null);
      disk = true;
      this.addProperty("moveDirection",this.getMoveDirection,this.setMoveDirection);
      killedBy = null;
      wayBack = false;
      speed = 8;
      turnSpeed = 6;
      speedBoost = 0;
      beenDead = 0;
      daddyHorror = eval("_root." + _name.slice(0,_name.length - 5));
      gotoAndStop(1);
      moveDirection = _rotation;
      justStruck = 0;
      if(_root.myLure.luring)
      {
         gotoSpotX = _root.myLure._x;
         int(Math.random() * 80) - 40;
         gotoSpotY = _root.myLure._y;
         int(Math.random() * 80) - 40;
      }
      else if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x + int(Math.random() * 80) - 40;
         gotoSpotY = _root.HeroPointer._y + int(Math.random() * 80) - 40;
      }
      else
      {
         gotoSpotX = 275;
         gotoSpotY = 200;
      }
      framesExisted = 0;
   }
}

onClipEvent(load){
   mommy = false;
   if(_name == "Frostie")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      killedBy = null;
      framesExisted = 0;
      speed = 6;
      turnSpeed = 4;
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
         gotoSpotX = 275;
         gotoSpotY = 200;
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      _rotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      objectHitX = null;
      objectHitY = null;
   }
}

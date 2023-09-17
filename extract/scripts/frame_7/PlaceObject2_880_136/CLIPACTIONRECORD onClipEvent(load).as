onClipEvent(load){
   mommy = false;
   if(_name == "Torchie")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("burning",this.getBurning,this.setBurning);
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("exploded",this.getExploded,this.setExploded);
      killedBy = null;
      exploded = false;
      speed = 4;
      turnSpeed = 2;
      justBounced = 0;
      burning = true;
      littleFires = 0;
      framesBurned = 0;
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
      if(_X == -5 || _X == 555 || _Y == -5 || _Y == 405)
      {
         duplicateMovieClip(_root.Flames,_name + "Flame",16384 + _global.capDepth++);
         myFire = eval("_root." + _name + "Flame");
         stop();
      }
   }
}

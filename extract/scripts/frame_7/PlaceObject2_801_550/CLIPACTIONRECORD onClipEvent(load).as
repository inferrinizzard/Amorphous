onClipEvent(load){
   mommy = false;
   if(_name == "Queen")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("action",this.getAction,this.setAction);
      this.addProperty("wisps",this.getWisps,this.setWisps);
      this.addProperty("larva",this.getLarva,this.setLarva);
      speed = 3;
      turnSpeed = 4;
      justBounced = 0;
      justSwung = 0;
      stop();
      action = "prowl";
      lungeFrames = 0;
      larva = 0;
      _global.QueenRevive = false;
      LeftClaw = null;
      RightClaw = null;
      wisps = 0;
      wispCounter = 0;
      wigglers = 0;
      timesLunged = 0;
      if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      else
      {
         gotoSpotX = _X + 20;
         gotoSpotY = _Y + 20;
      }
      duplicateMovieClip(_root.QueenClaw,_name + "ClawL",16384 + _global.baddieDepth++);
      LeftClaw = eval("_root." + _name + "ClawL");
      ClawRotation = _rotation - 135;
      with(LeftClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
      duplicateMovieClip(_root.QueenClaw,_name + "ClawR",16384 + _global.baddieDepth++);
      RightClaw = eval("_root." + _name + "ClawR");
      ClawRotation = _rotation + 135;
      with(RightClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
   }
}

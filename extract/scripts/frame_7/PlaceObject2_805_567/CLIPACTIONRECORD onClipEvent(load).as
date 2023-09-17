onClipEvent(load){
   mommy = false;
   if(_name == "RazorQueen")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
      this.addProperty("action",this.getAction,this.setAction);
      this.addProperty("mode",this.getMode,this.setMode);
      this.addProperty("larva",this.getLarva,this.setLarva);
      this.addProperty("mites",this.getMites,this.setMites);
      this.addProperty("hogs",this.getHogs,this.setHogs);
      this.addProperty("miteCounter",this.getMiteCounter,this.setMiteCounter);
      this.addProperty("teeth",this.getTeeth,this.setTeeth);
      this.addProperty("health",this.getHealth,this.setHealth);
      health = 5;
      recoil = 0;
      lilSplats = 0;
      speed = 2;
      turnSpeed = 2;
      justBounced = 0;
      justSwung = 0;
      justSwitched = 300;
      spinClockwise = true;
      stop();
      action = "prowl";
      mode = "melee";
      lungeFrames = 0;
      larva = 0;
      lashLag = 0;
      mites = 0;
      miteCounter = 10;
      hogs = 10;
      LeftForClaw = null;
      RightForClaw = null;
      LeftDuClaw = null;
      RightDuClaw = null;
      teeth = 0;
      toothCounter = 10;
      quillCounter = 10;
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
      duplicateMovieClip(_root.RazorForClaw,_name + "FClawL",16384 + _global.baddieDepth++);
      LeftForClaw = eval("_root." + _name + "FClawL");
      ClawRotation = _rotation - 45;
      with(LeftForClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
      duplicateMovieClip(_root.RazorForClaw,_name + "FClawR",16384 + _global.baddieDepth++);
      RightForClaw = eval("_root." + _name + "FClawR");
      ClawRotation = _rotation + 45;
      with(RightForClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
      duplicateMovieClip(_root.RazorDuClaw,_name + "DClawL",16384 + _global.baddieDepth++);
      LeftDuClaw = eval("_root." + _name + "DClawL");
      ClawRotation = _rotation - 135;
      with(LeftDuClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
      duplicateMovieClip(_root.RazorDuClaw,_name + "DClawR",16384 + _global.baddieDepth++);
      RightDuClaw = eval("_root." + _name + "DClawR");
      ClawRotation = _rotation + 135;
      with(RightDuClaw)
      {
         _y = this._y - 20 * Math.cos(ClawRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(ClawRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
      duplicateMovieClip(_root.RazorTail,_name + "Tail1",16384 + _global.baddieDepth++);
      myTail = eval("_root." + _name + "Tail1");
      TailRotation = _rotation + 180;
      with(myTail)
      {
         _y = this._y - 20 * Math.cos(TailRotation * 0.017453292519943295);
         _x = this._x + 20 * Math.sin(TailRotation * 0.017453292519943295);
         _rotation = this._rotation;
      }
   }
}

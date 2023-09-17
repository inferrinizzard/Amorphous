onClipEvent(load){
   mommy = false;
   if(_name == "RazorDuClaw")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("action",this.getAction,this.setAction);
      this.addProperty("claw",this.getClaw,null);
      claw = true;
      killedBy = null;
      beenDead = 0;
      action = "none";
      turnSpeed = 6;
      speedBoost = 0;
      Right = false;
      sLoc = 0;
      swipeFrames = 0;
      stop();
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 6));
      gotoAndStop(1);
      moveDirection = _rotation;
      justStruck = 0;
      if(_name.slice(_name.length - 1,_name.length) == "R")
      {
         Right = true;
         _xscale = -100;
      }
      duplicateMovieClip(_root.RazorArm,_name + "Arm",16384 + _global.baddieDepth++);
      myArm = eval("_root." + _name + "Arm");
      with(myArm)
      {
         _y = this._y;
         _x = this._x;
         _rotation = this._rotation;
      }
   }
}

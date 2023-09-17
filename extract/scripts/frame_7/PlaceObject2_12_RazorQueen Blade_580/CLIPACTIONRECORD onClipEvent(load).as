onClipEvent(load){
   mommy = false;
   if(_name == "RazorBlade")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("action",this.getAction,this.setAction);
      this.addProperty("claw",this.getClaw,null);
      claw = true;
      this.addProperty("exploded",this.getExploded,null);
      exploded = true;
      killedBy = null;
      beenDead = 0;
      action = "none";
      turnSpeed = 6;
      speedBoost = 0;
      sLoc = 0;
      stretch = 10;
      swipeFrames = 0;
      stop();
      justStruck = 0;
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 5));
      gotoAndStop(1);
      moveDirection = _rotation;
      Anchor = eval("_root." + mommyQueen._name + "Tail4");
   }
}

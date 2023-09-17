onClipEvent(load){
   mommy = false;
   gotoSpotX = null;
   gotoSpotY = null;
   if(_name == "ClutterSpit")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      killedBy = null;
      stuck = false;
      stuckToArmor = false;
      speed = 8;
      priorRotation = 0;
      totalRotation = 0;
      daddyClutter = eval("_root." + _name.slice(0,_name.length - 6));
      gotoAndStop(1);
   }
}

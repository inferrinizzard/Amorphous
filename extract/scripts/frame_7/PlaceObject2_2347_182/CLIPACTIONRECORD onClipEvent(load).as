onClipEvent(load){
   mommy = false;
   if(_name == "HorrorHook")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("hook",this.getHook,null);
      hook = true;
      killedBy = null;
      framesLoose = 0;
      speed = 10;
      moveDirection = _rotation;
      daddyHorror = eval("_root." + _name.slice(0,_name.length - 6));
      gotoAndStop(1);
   }
}

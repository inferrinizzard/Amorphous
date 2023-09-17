onClipEvent(load){
   mommy = false;
   if(_name == "QueenLarva")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      killedBy = null;
      nearTarget = 0;
      speed = 1;
      turnSpeed = 2;
      _rotation = int(Math.random() * 360) - 179;
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 6));
      gotoSpotX = 275;
      gotoSpotY = 200;
   }
}

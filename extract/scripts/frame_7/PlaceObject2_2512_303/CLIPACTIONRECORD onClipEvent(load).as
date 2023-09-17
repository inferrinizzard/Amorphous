onClipEvent(load){
   mommy = false;
   if(_name == "RazorLarva")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      killedBy = null;
      huntHero = false;
      speed = 1;
      turnSpeed = 2;
      spikeCounter = 0;
      _rotation = int(Math.random() * 360) - 179;
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 6));
      gotoSpotX = int(Math.random() * 540) + 6;
      gotoSpotY = int(Math.random() * 390) + 6;
   }
}

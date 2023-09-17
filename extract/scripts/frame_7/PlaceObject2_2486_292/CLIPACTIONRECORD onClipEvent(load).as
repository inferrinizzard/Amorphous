onClipEvent(load){
   mommy = false;
   justBounced = 0;
   if(_name == "RazorHedgehog")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("hedgehog",this.getHedgehog,null);
      hedgehog = "Stun";
      this.addProperty("claw",this.getClaw,null);
      claw = true;
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("Health",this.getHealth,this.setHealth);
      killedBy = null;
      Planted = false;
      flightFrames = 0;
      Health = 5;
      chips = 1;
      speed = int(3 * (Math.sqrt((_X - _root.HeroPointer._x) * (_X - _root.HeroPointer._x) + (_Y - _root.HeroPointer._y) * (_Y - _root.HeroPointer._y)) / 100));
      speed += (int(Math.random() * 3) + 1) * 0.5;
      gotoAndPlay(int(Math.random() * 10) + 1);
   }
}

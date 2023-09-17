onClipEvent(load){
   airtime = 20;
   battery = 400;
   _parent.stop();
   myEffects = 0;
   inert = 0;
   _parent.addProperty("claw",this.getClaw,this.setClaw);
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   if(speed < 2)
   {
      speed = 2;
   }
   if(speed > 8)
   {
      speed = 8;
   }
   _parent.claw = true;
   Broken = false;
   flickerCount = 0;
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      myVibe = new Sound(this);
      myVibe.attachSound("Repulse Field Amb");
   }
}

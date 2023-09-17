onClipEvent(load){
   lifeSpan = 50;
   moveDirection = _parent._rotation;
   payload = 450;
   _parent.addProperty("luring",this.getLuring,this.setLuring);
   speed = int(2 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   if(speed < 2)
   {
      speed = 2;
   }
   _parent.luring = false;
   _parent.stop();
   roll = 0;
   windDirection = int(Math.random() * 360) - 180;
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      myHiss = new Sound(this);
      myHiss.attachSound("Lure Hiss 3");
   }
}

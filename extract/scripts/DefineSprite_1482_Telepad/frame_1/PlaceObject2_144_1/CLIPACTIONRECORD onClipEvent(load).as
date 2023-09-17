onClipEvent(load){
   airtime = 30;
   _parent.stop();
   moveDirection = _parent._rotation;
   _parent.addProperty("ready",this.getReady,this.setReady);
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   spin = int(Math.random() * 8) + 8;
   if(int(Math.random() * 2) == 1)
   {
      spin = - spin;
   }
   _parent._xscale = 100;
   _parent._yscale = 100;
   _parent.ready = false;
   if(speed < 1)
   {
      speed = 1;
   }
   if(speed > 5)
   {
      speed = 5;
   }
   _parent.Arm.stop();
   _parent.Bar.stop();
   myTab = eval(_global.RewardTab("Teleport"));
}

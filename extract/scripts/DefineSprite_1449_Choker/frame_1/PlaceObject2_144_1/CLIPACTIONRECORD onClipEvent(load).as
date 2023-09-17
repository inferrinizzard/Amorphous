onClipEvent(load){
   airtime = 20;
   battery = 600;
   _parent.stop();
   moveDirection = _parent._rotation;
   _parent.addProperty("jamming",this.getJamming,this.setJamming);
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   spin = int(Math.random() * 8) + 8;
   if(int(Math.random() * 2) == 1)
   {
      spin = - spin;
   }
   _parent._xscale = 130;
   _parent._yscale = 130;
   _parent.jamming = false;
   if(speed < 1)
   {
      speed = 1;
   }
   if(speed > 5)
   {
      speed = 5;
   }
   Quadrant = 0;
   myEffects = 0;
   inert = 0;
}

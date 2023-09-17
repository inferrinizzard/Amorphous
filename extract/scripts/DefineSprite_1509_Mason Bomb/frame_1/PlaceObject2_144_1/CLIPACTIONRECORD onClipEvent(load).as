onClipEvent(load){
   lifeSpan = 60;
   moveDirection = _parent._rotation;
   _parent.stop();
   _parent.addProperty("exploded",this.getExploded,this.setExploded);
   _parent.addProperty("tool",this.getTool,this.setTool);
   _parent.tool = true;
   speed = int(2 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed -= (int(Math.random() * 3) + 1) * 0.5;
   spin = 20;
   if(speed < 2)
   {
      speed = 2;
   }
   if(speed > 7)
   {
      speed = 7;
   }
   _parent.exploded = false;
}

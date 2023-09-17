onClipEvent(load){
   lifeSpan = 40;
   moveDirection = _parent._rotation;
   myEffects = 0;
   _parent.addProperty("exploded",this.getExploded,this.setExploded);
   _parent.addProperty("tool",this.getTool,this.setTool);
   _parent.tool = true;
   speed = int(3 * (Math.sqrt((_X - _xmouse) * (_X - _xmouse) + (_Y - _ymouse) * (_Y - _ymouse)) / 100));
   speed += (int(Math.random() * 3) + 1) * 0.5;
   spin = int(Math.random() * 40) - 20;
   if(speed < 4)
   {
      speed = 4;
   }
   _parent.exploded = false;
   _root.attachMovie("Grenade Pin","myPin",_global.effectDepth++);
   with(_root.myPin)
   {
      _x = this._parent._x;
      _y = this._parent._y;
      _rotation = this._parent._rotation + int(Math.random() * 30) + 80;
   }
   _global.MakeNoise("Grenade Pin Pull");
   if(_global.soundMode == "All" || _global.soundMode == "FX Only")
   {
      myFuse = new Sound(this);
      myFuse.attachSound("Fuse Burn");
      myFuse.start(0,2);
   }
}

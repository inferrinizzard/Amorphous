onClipEvent(enterFrame){
   if(flyframes < flyTo)
   {
      _parent._rotation += listTo;
      _parent._y -= speed * Math.cos(_parent._rotation * 0.017453292519943295);
      _parent._x += speed * Math.sin(_parent._rotation * 0.017453292519943295);
      flyframes++;
   }
   else if(popframes == 0)
   {
      _parent._rotation = int(Math.random() * 360) - 179;
      nextFrame();
      _global.MakeNoise("Firework" + (int(Math.random() * 2) + 1));
      duplicateMovieClip(_root.Blackout,this._name + "Bright",23479);
      with(eval("_root." + this._name + "Bright"))
      {
         _x = 275;
         _y = 200;
         _xscale = 1000;
         _yscale = 1000;
      }
      FlashColor = new Color(eval("_root." + this._name + "Bright"));
      FlashColor.setRGB(FireworkColor.getRGB());
      popframes++;
   }
   else if(popframes < 6)
   {
      _parent._xscale += 10;
      _parent._yscale += 10;
      popframes++;
   }
   else
   {
      _parent._y += 0.5;
      if(popframes >= 40)
      {
         if(_currentframe < 8)
         {
            nextFrame();
         }
         else
         {
            removeMovieClip(_parent);
         }
      }
      popframes++;
   }
}

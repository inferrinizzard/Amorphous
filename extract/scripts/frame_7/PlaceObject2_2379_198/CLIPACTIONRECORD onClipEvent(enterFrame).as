onClipEvent(enterFrame){
   if(_name != "HeroDecapitate" && !_global.pause)
   {
      if(_currentframe < 15)
      {
         play();
      }
      if(_currentframe == 15)
      {
         stop();
         if(!splat)
         {
            BloodName = "_root." + this._name + "Blood";
            duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood",16384 + _global.effectDepth++);
            setProperty(BloodName, _rotation, this._rotation);
            setProperty(BloodName, _X, this._x + 10 * Math.sin(_rotation * 0.017453292519943295));
            setProperty(BloodName, _xscale, 40);
            setProperty(BloodName, _Y, this._y - 10 * Math.cos(_rotation * 0.017453292519943295));
            setProperty(BloodName, _yscale, 40);
            splat = true;
         }
      }
      else
      {
         _Y = _Y - 3 * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + 3 * Math.sin(_rotation * 0.017453292519943295);
      }
   }
   else
   {
      stop();
   }
}

onClipEvent(enterFrame){
   if(_name != "HeroTorso")
   {
      if(_currentframe == 15)
      {
         stop();
         if(speed > 0)
         {
            BloodName = "_root." + this._name + "Blood";
            duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood",16384 + _global.effectDepth++);
            setProperty(BloodName, _rotation, _rotation + 180);
            setProperty(BloodName, _X, this._x);
            setProperty(BloodName, _xscale, 40);
            setProperty(BloodName, _Y, this._y);
            setProperty(BloodName, _yscale, 40);
            speed = 0;
         }
      }
      else
      {
         _Y = _Y - Speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + Speed * Math.sin(_rotation * 0.017453292519943295);
      }
   }
}

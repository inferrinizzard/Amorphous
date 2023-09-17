onClipEvent(enterFrame){
   if(_name != "HeroMangle" && !_global.pause)
   {
      if(_currentframe > 1 && eval(_root.HeroPointer) != undefined)
      {
         this.removeMovieClip();
      }
      play();
      if(_currentframe == 4)
      {
         removeMovieClip(daddyBiter);
      }
      if(_currentframe < 16)
      {
         if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
         {
            _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         }
         else
         {
            this.removeMovieClip();
         }
      }
      if(_currentframe == 25 || _currentframe == 40)
      {
         BloodName = "_root." + this._name + "Blood" + splats;
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         setProperty(BloodName, _rotation, int(Math.random() * 360) - 180);
         setProperty(BloodName, _X, this._x);
         setProperty(BloodName, _Y, this._y);
         splats++;
         _global.MakeNoise("Wound");
      }
      if(_currentframe == 46 && playsthrough < 3)
      {
         gotoAndPlay(16);
         playsthrough++;
      }
      else if(playsthrough == 3)
      {
         stop();
         duplicateMovieClip(_root.HeroMangled,"DeadHero",16384 + _global.effectDepth++);
         with(_root.DeadHero)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         duplicateMovieClip(_root.Biter,"Biter00",16384 + _global.baddieDepth++);
         with(_root.Biter00)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

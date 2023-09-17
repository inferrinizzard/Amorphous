onClipEvent(enterFrame){
   if(_name != "HeroChow" && !_global.pause)
   {
      if(_currentframe > 1 && eval(_root.HeroPointer) != undefined)
      {
         this.removeMovieClip();
      }
      play();
      if(_currentframe == 2)
      {
         x = 1;
         while(x < 3)
         {
            BloodName = "_root." + this._name + "Blood" + splats;
            duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
            setProperty(BloodName, _rotation, this._rotation + int(Math.random() * 40) - 20);
            setProperty(BloodName, _X, this._x);
            setProperty(BloodName, _xscale, 40);
            setProperty(BloodName, _Y, this._y);
            setProperty(BloodName, _yscale, 40);
            splats++;
            x++;
         }
      }
      if(_currentframe == 3)
      {
         removeMovieClip(daddyFuzzle);
      }
      if(_currentframe < 15)
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
      if(_currentframe == 47 || _currentframe == 77)
      {
         BloodName = "_root." + this._name + "Blood" + splats;
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         setProperty(BloodName, _rotation, this._rotation + int(Math.random() * 120) - 50);
         setProperty(BloodName, _X, this._x);
         setProperty(BloodName, _Y, this._y);
         splats++;
         _global.MakeNoise("FuzzBite" + (int(Math.random() * 2) + 1));
      }
      if(_currentframe == 55 || _currentframe == 85)
      {
         BloodName = "_root." + this._name + "Blood" + splats;
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         setProperty(BloodName, _rotation, this._rotation + int(Math.random() * 50) - 180);
         setProperty(BloodName, _X, this._x);
         setProperty(BloodName, _Y, this._y);
         splats++;
         duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + splats,16384 + _global.effectDepth++);
         with(eval("_root." + this._name + "Spray" + splats))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation + int(Math.random() * 360) - 180;
         }
         BloodColor = new Color(eval("_root." + this._name + "Spray" + splats++));
         BloodColor.setRGB(11800592);
         _global.MakeNoise("Rend");
      }
      if(_currentframe == 72 && playsthrough < 2)
      {
         gotoAndPlay(42);
         playsthrough++;
      }
      if(_currentframe == 110 && playsthrough == 2)
      {
         stop();
         duplicateMovieClip(_root.HeroChowed,"DeadHero",16384 + _global.effectDepth++);
         with(_root.DeadHero)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         duplicateMovieClip(_root.Fuzzle,"Fuzzle00",16384 + _global.baddieDepth++);
         with(_root.Fuzzle00)
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

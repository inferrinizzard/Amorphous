onClipEvent(enterFrame){
   if(_name != "HeroQuilled" && !_global.pause)
   {
      if(_currentframe < 30)
      {
         play();
      }
      if(_currentframe == 2)
      {
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         BloodName = eval("_root." + this._name + "Blood" + splats++);
         with(BloodName)
         {
            _rotation = this._rotation + int(Math.random() * 40) - 200;
            _x = this._x;
            _xscale = 40;
            _y = this._y;
            _yscale = 40;
         }
         duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + splats,16384 + _global.effectDepth++);
         with(eval("_root." + this._name + "Spray" + splats))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation + int(Math.random() * 40) - 200;
         }
         BloodColor = new Color(eval("_root." + this._name + "Spray" + splats++));
         BloodColor.setRGB(11800592);
      }
      if(_currentframe < 20)
      {
         if(_currentframe == 12)
         {
            speed = 4;
         }
         if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
         {
            _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         }
         else
         {
            this.removeMovieClip();
         }
         if(_currentframe == 11)
         {
            if(pauseFor > 0)
            {
               stop();
               pauseFor--;
            }
            else
            {
               play();
            }
         }
      }
      else if(_currentframe == 20)
      {
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         BloodName = eval("_root." + this._name + "Blood" + splats++);
         with(BloodName)
         {
            _rotation = this._rotation + int(Math.random() * 40) - 20;
            _x = this._x;
            _y = this._y;
         }
         x = 1;
         while(x < 3)
         {
            duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + splats,16384 + _global.effectDepth++);
            with(eval("_root." + this._name + "Spray" + splats))
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation + int(Math.random() * 80) - 40;
            }
            BloodColor = new Color(eval("_root." + this._name + "Spray" + splats++));
            BloodColor.setRGB(11800592);
            x++;
         }
      }
      else if(_currentframe == 30)
      {
         stop();
      }
   }
   else
   {
      stop();
   }
}

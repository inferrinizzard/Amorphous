onClipEvent(enterFrame){
   if(_name != "HeroSpear")
   {
      if(_currentframe == 2 && _global.HeroKilled)
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
         duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + splats,16384 + _global.effectDepth++);
         with(eval("_root." + this._name + "Spray" + splats))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation - 180;
         }
         BloodColor = new Color(eval("_root." + this._name + "Spray" + splats++));
         BloodColor.setRGB(11800592);
      }
      if(_currentframe == 2 && !_global.HeroKilled)
      {
         this.removeMovieClip();
      }
      if(_currentframe == 11 && daddyGray.action == "lance")
      {
         stop();
      }
      if(_currentframe == 11 && daddyGray.action == "reel")
      {
         play();
      }
      if(_currentframe == 21)
      {
         stop();
      }
   }
}

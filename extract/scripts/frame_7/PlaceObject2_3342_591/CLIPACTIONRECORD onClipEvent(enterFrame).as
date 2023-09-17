onClipEvent(enterFrame){
   if(_name != "HeroPiked" && !_global.pause)
   {
      if(_currentframe < 45)
      {
         play();
      }
      if(_currentframe == 2)
      {
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
      else if(_currentframe == 15)
      {
         duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
         BloodName = eval("_root." + this._name + "Blood" + splats++);
         with(BloodName)
         {
            _rotation = this._rotation + int(Math.random() * 40) - 20;
            _x = this._x;
            _y = this._y;
         }
      }
      else if(_currentframe == 45)
      {
         stop();
      }
   }
   else
   {
      stop();
   }
   if(!_global.HeroKilled)
   {
      this.removeMovieClip();
   }
}

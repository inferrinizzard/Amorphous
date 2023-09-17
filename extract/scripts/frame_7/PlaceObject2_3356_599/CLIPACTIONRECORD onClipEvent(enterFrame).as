onClipEvent(enterFrame){
   if(_name != "HeroHalf")
   {
      switch(Method)
      {
         case 1:
            if(_currentframe == 31)
            {
               SplatPtY = _Y - 25 * Math.cos((_rotation - 90 * (_xscale / 100)) * (Math.PI / 180));
               SplatPtX = _X + 25 * Math.sin((_rotation - 90 * (_xscale / 100)) * (Math.PI / 180));
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               BloodName = eval("_root." + this._name + "Blood" + splats++);
               with(BloodName)
               {
                  _rotation = this._rotation + int(Math.random() * 40) - 200;
                  _x = SplatPtX;
                  _y = SplatPtY;
               }
            }
            else if(_currentframe == 45)
            {
               stop();
            }
            break;
         case 2:
            if(_currentframe == 2)
            {
               gotoAndPlay(46);
            }
            else if(_currentframe == 66)
            {
               SplatPtY = _Y - 25 * Math.cos((_rotation - 180) * (Math.PI / 180));
               SplatPtX = _X + 25 * Math.sin((_rotation - 180) * (Math.PI / 180));
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               BloodName = eval("_root." + this._name + "Blood" + splats++);
               with(BloodName)
               {
                  _rotation = this._rotation + int(Math.random() * 40) + 70 * (this._xscale / 100);
                  _x = SplatPtX;
                  _y = SplatPtY;
               }
            }
            else if(_currentframe == 80)
            {
               stop();
            }
            break;
         case 3:
            if(_currentframe == 2)
            {
               gotoAndPlay(81);
            }
            else if(_currentframe == 96)
            {
               SplatPtY = _Y - 25 * Math.cos(_rotation * (Math.PI / 180));
               SplatPtX = _X + 25 * Math.sin(_rotation * (Math.PI / 180));
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               BloodName = eval("_root." + this._name + "Blood" + splats++);
               with(BloodName)
               {
                  _rotation = this._rotation + int(Math.random() * 40) + 70 * (this._xscale / 100);
                  _x = SplatPtX;
                  _y = SplatPtY;
               }
            }
            else if(_currentframe == 111)
            {
               stop();
            }
      }
   }
}

onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(airtime > 0)
      {
         airtime--;
         _parent._xscale -= 1;
         _parent._yscale -= 1;
         _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
         _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
         _parent._rotation += spin;
         if(speed > 0)
         {
            speed -= 0.05;
         }
         else
         {
            speed = 0;
         }
         if(_parent._y < 0 || _parent._x < 0 || _parent._y > 400 || _parent._x > 550)
         {
            myTab.charge = 200;
            _parent.removeMovieClip();
         }
      }
      else if(airtime == 0)
      {
         _global.MakeNoise("GrinderHurt");
         _global.MakeNoise("Dirt Hit");
         Dirtpuffs = int(Math.random() * 3) + 3;
         x = 0;
         while(x < Dirtpuffs)
         {
            DirtName = "PadDirt" + x;
            duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
            with(eval("_root." + DirtName))
            {
               _x = this._parent._x + int(Math.random() * 10) - 5;
               _y = this._parent._y + int(Math.random() * 10) - 5;
               _rotation = moveDirection + int(Math.random() * 180) - 90;
            }
            x++;
         }
         airtime--;
         _parent.play();
      }
      else if(_parent._currentframe == 6)
      {
         _parent.stop();
         _parent.ready = true;
         lightGrade = int(myTab.charge / 10);
         if(lightGrade == 0)
         {
            lightGrade++;
         }
         _parent.Arm.gotoAndStop(lightGrade);
         _parent.Bar.gotoAndStop(lightGrade);
         _parent.Arm._rotation -= myTab.charge / 15;
         _parent.Bar._rotation += myTab.charge / 10;
      }
      else
      {
         _parent.play();
      }
   }
   else
   {
      _parent.stop();
   }
}

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
         if(_parent._y < -5 || _parent._x < -5 || _parent._y > 405 || _parent._x > 555)
         {
            myTab = eval(_global.RewardTab("Choker"));
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
            DirtName = "SpikeDirt" + x;
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
      }
      else if(battery > 0)
      {
         _parent.play();
         _parent.jamming = true;
         if(battery / 30 == int(battery / 30))
         {
            runnerName = "Runner" + _global.effectDepth;
            _root.attachMovie("Runner Line",runnerName,_global.effectDepth++);
            with(eval("_root." + runnerName))
            {
               _x = this._parent._x;
               _y = this._parent._y;
               _rotation = Quadrant + int(Math.random() * 90) - 45;
            }
            Quadrant += 90;
            if(Quadrant == 270)
            {
               Quadrant = -90;
            }
            _global.MakeNoise("Choker Pulse");
         }
         if(int(Math.random() * 25) == 1)
         {
            arcName = "ChokeArc" + myEffects++;
            _root.attachMovie("Arc",arcName,_global.capDepth++);
            with(eval("_root." + arcName))
            {
               _x = this._parent._x + int(Math.random() * 20) - 10;
               _y = this._parent._y + int(Math.random() * 20) - 10;
               _xscale = int(Math.random() * 30) + 30;
               _yscale = int(Math.random() * 30) + 30;
               _rotation = int(Math.random() * 360) - 180;
            }
            arcColor = new Color(eval("_root." + arcName));
            arcColor.setRGB(14221312);
         }
         battery--;
         if(battery < 150 && int(battery / 30) == battery / 30)
         {
            LEDDir = _parent._rotation + 45;
            if(LEDDir > 180)
            {
               LED -= 360;
            }
            LEDSpotY = _parent._y - 5 * Math.cos(LEDDir * 0.017453292519943295);
            LEDSpotX = _parent._x + 5 * Math.sin(LEDDir * 0.017453292519943295);
            LEDName = "ChokeLED" + myEffects++;
            _root.attachMovie("LED",LEDName,_global.capDepth++);
            with(eval("_root." + LEDName))
            {
               _x = LEDSpotX;
               _y = LEDSpotY;
            }
            LEDColor = new Color(eval("_root." + LEDName));
            LEDColor.setRGB(15990543);
            _global.MakeNoise("Beep 1");
         }
      }
      else
      {
         if(inert == 0)
         {
            mySparks = int(Math.random() * 4) + 8;
            x = 1;
            while(x <= mySparks)
            {
               sparkName = "ChokerSpark" + myEffects++;
               _root.attachMovie("Spark",sparkName,_global.capDepth++);
               with(eval("_root." + sparkName))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = int(Math.random() * 360) - 180;
               }
               sparkColor = new Color(eval("_root." + sparkName));
               sparkColor.setRGB(14221312);
               x++;
            }
            _parent.gotoAndStop(1);
         }
         else if(inert > 60)
         {
            if(_parent._alpha <= 0)
            {
               _parent.removeMovieClip();
            }
            else
            {
               _parent._alpha--;
            }
         }
         inert++;
      }
   }
   else
   {
      _parent.stop();
   }
}

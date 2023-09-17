onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(airtime > 0)
      {
         airtime--;
         _parent._yscale -= 3;
         _parent._yscale -= 1;
         _parent._y -= speed * Math.cos(_parent._rotation * 0.017453292519943295);
         _parent._x += speed * Math.sin(_parent._rotation * 0.017453292519943295);
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
            myTab = eval(_global.RewardTab("Spike"));
            myTab.charge = 200;
            _parent.removeMovieClip();
         }
      }
      else if(airtime == 0)
      {
         _parent.gotoAndStop(2);
         _parent._xscale = 100;
         _parent._yscale = 100;
         _global.MakeNoise("GrinderHurt");
         _global.MakeNoise("SharpsIn");
         Dustpuffs = int(Math.random() * 2) + 1;
         x = 0;
         while(x < Dustpuffs)
         {
            DustName = "SpikeDust" + x;
            duplicateMovieClip(_root.GroundDust,DustName,16384 + _global.capDepth++);
            with(eval("_root." + DustName))
            {
               _x = this._parent._x + int(Math.random() * 20) - 10;
               _y = this._parent._y + int(Math.random() * 20) - 10;
               _rotation = int(Math.random() * 360) - 179;
            }
            x++;
         }
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
               _rotation = this._parent._rotation + int(Math.random() * 180) - 90;
            }
            x++;
         }
         CrackName = "SpikeCrack" + _global.backgroundDepth;
         duplicateMovieClip(_root.GroundCrack,CrackName,16384 + _global.backgroundDepth++);
         with(eval("_root." + CrackName))
         {
            _x = this._parent._x;
            _y = this._parent._y;
            _rotation = int(Math.random() * 360) - 179;
            gotoAndPlay((int(Math.random() * 3) + 1) * 2 - 1);
         }
         x = 0;
         while(x < _global.Hazards.length)
         {
            targetHazard = eval("_root." + _global.Hazards[x]);
            if(targetHazard.hitTest(_parent._x,_parent._y,false))
            {
               if(targetHazard._name.slice(0,5) == "Razor")
               {
                  targetHazard.killedBy = _parent;
               }
            }
            x++;
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            hitTarget = eval("_root." + _global.Enemies[x]);
            if(hitTarget.hitTest(_parent._x,_parent._y,true))
            {
               Hit = hitTarget._name.slice(0,4);
               if(hitTarget.spines || Hit == "Grin" || Hit == "Gray" && hitTarget.action == "gaurd" || Hit == "Horr" && hitTarget.action != "collect")
               {
                  toTargetX = _parent._x - hitTarget._x;
                  toTargetY = _parent._y - hitTarget._y;
                  targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                  _global.MakeNoise("Clang");
                  SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                  duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, targetDirection);
                  setProperty(SparkName, _X, hitTarget._x);
                  setProperty(SparkName, _Y, hitTarget._y);
                  myScraps = int(Math.random() * 4) + 6;
                  x = 1;
                  while(x <= myScraps)
                  {
                     scrapName = "Scrap" + _global.effectDepth;
                     _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
                     with(eval("_root." + scrapName))
                     {
                        _x = this._parent._x;
                        _y = this._parent._y;
                        _rotation = int(Math.random() * 360) - 180;
                     }
                     x++;
                  }
                  _global.MakeNoise("Repulsor Break");
                  _root.SpikeField.removeMovieClip();
                  _parent.removeMovieClip();
               }
               else
               {
                  hitTarget.killedBy = _parent;
               }
            }
            x++;
         }
         airtime--;
      }
      else if(battery > 0)
      {
         if(battery == 400)
         {
            myVibe.start(0,100);
            _root.attachMovie("Repulse Field","SpikeField",_global.capDepth++);
            with(_root.SpikeField)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
         }
         if(battery / 40 == int(battery / 40))
         {
            BloomName = "Bloom" + _global.capDepth;
            _root.attachMovie("Repulse Bloom",BloomName,_global.capDepth++);
            with(eval("_root." + BloomName))
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            hitTarget = eval("_root." + _global.Enemies[x]);
            subjName = hitTarget._name.slice(0,4);
            if(!(subjName == "Gray" && hitTarget.action != "none"))
            {
               if(subjName != "Void")
               {
                  toMyX = hitTarget._x - _parent._x;
                  toMyY = hitTarget._y - _parent._y;
                  distToEnemy = Math.sqrt(toMyX * toMyX + toMyY * toMyY);
                  toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                  pushDir = toMyDir - 180;
                  if(pushDir < -180)
                  {
                     pushDir += 360;
                  }
                  pushForce = int(10 - distToEnemy / 22);
                  if(subjName == "Oozl" || subjName == "Gray" || subjName == "Horr" || subjName == "Amal" && hitTarget._xscale > 70 || subjName == "Razo")
                  {
                     pushForce /= 2;
                  }
                  if(subjName == "Grin" || subjName == "Void")
                  {
                     pushForce /= 4;
                  }
                  if(distToEnemy < 200)
                  {
                     hitTarget._y -= pushForce * Math.cos(pushDir * 0.017453292519943295);
                     hitTarget._x += pushForce * Math.sin(pushDir * 0.017453292519943295);
                  }
               }
            }
            x++;
         }
         _parent._rotation += 4;
         battery--;
         if(_global.HeroAction == "attacking")
         {
            if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
            {
               if(_root.HeroSwing.hittest(_parent._x,_parent._y,true))
               {
                  SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                  duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                  setProperty(SparkName, _X, _parent._x);
                  setProperty(SparkName, _Y, _parent._y);
                  myScraps = int(Math.random() * 4) + 6;
                  x = 1;
                  while(x <= myScraps)
                  {
                     scrapName = "Scrap" + _global.effectDepth;
                     _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
                     with(eval("_root." + scrapName))
                     {
                        _x = this._parent._x;
                        _y = this._parent._y;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 90) + 45;
                     }
                     x++;
                  }
                  _global.MakeNoise("Repulsor Break");
                  _root.SpikeField.removeMovieClip();
                  _parent.removeMovieClip();
               }
            }
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _parent._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               targ = hitTarget._name.slice(0,4);
               if(targ == "Grin" || targ == "Bite" || targ == "Horr" || targ == "Razo")
               {
                  if(hitTarget.hitTest(_parent._x,_parent._y,true))
                  {
                     toTargetX = _parent._x - hitTarget._x;
                     toTargetY = _parent._y - hitTarget._y;
                     targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                     _global.MakeNoise("Clang");
                     SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                     duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                     setProperty(SparkName, _rotation, targetDirection);
                     setProperty(SparkName, _X, hitTarget._x);
                     setProperty(SparkName, _Y, hitTarget._y);
                     myScraps = int(Math.random() * 4) + 6;
                     x = 1;
                     while(x <= myScraps)
                     {
                        scrapName = "Scrap" + _global.effectDepth;
                        _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
                        with(eval("_root." + scrapName))
                        {
                           _x = this._parent._x;
                           _y = this._parent._y;
                           _rotation = int(Math.random() * 360) - 180;
                        }
                        x++;
                     }
                     _global.MakeNoise("Repulsor Break");
                     _root.SpikeField.removeMovieClip();
                     _parent.removeMovieClip();
                  }
               }
            }
            x++;
         }
         if(battery < 150 && battery / 30 == int(battery / 30))
         {
            LEDName = "SpikeLED" + myEffects++;
            _root.attachMovie("LED",LEDName,_global.capDepth++);
            with(eval("_root." + LEDName))
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            LEDColor = new Color(eval("_root." + LEDName));
            LEDColor.setRGB(15990543);
            _global.MakeNoise("Beep 1");
         }
         if(battery < 100 && flickerCount == 0)
         {
            if(int(Math.random() * 20) == 1)
            {
               flickerCount = int(Math.random() * 5) + 2;
            }
         }
         if(flickerCount > 0)
         {
            _root.SpikeField._visible = false;
            flickerCount--;
         }
         else
         {
            _root.SpikeField._visible = true;
         }
      }
      else
      {
         if(inert == 0)
         {
            myVibe.stop();
            _root.SpikeField.removeMovieClip();
            LEDName = "SpikeLED" + myEffects++;
            _root.attachMovie("LED",LEDName,_global.capDepth++);
            with(eval("_root." + LEDName))
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            LEDColor = new Color(eval("_root." + LEDName));
            LEDColor.setRGB(14221312);
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
}

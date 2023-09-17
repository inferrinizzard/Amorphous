onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!_parent.deployed)
      {
         if(airtime > 50)
         {
            _parent._xscale += 2;
            _parent._yscale += 2;
         }
         else if(airtime > 40)
         {
            if(_parent._currentframe < 7)
            {
               _parent.play();
            }
            else
            {
               _parent.stop();
            }
            _parent._xscale += 2;
            _parent._yscale += 2;
            if(airtime == 50)
            {
               _global.MakeNoise("Drone Snap");
               _global.MakeNoise("Drone Snap 2");
            }
         }
         else if(airtime > 20)
         {
            spin += 2;
            _parent.myArray._rotation += spin;
            _parent._xscale -= 1;
            _parent._yscale -= 1;
            if(airtime == 40)
            {
               _global.MakeNoise("Drone Buzz Start");
               _global.MakeNoise("Drone Buzz Start 2");
            }
         }
         else if(airtime > 0)
         {
            spin += 2;
            _parent.myArray._rotation += spin;
            speed += 0.15;
            _parent._xscale -= 2;
            _parent._yscale -= 2;
            if(airtime == 20)
            {
               myBuzz.start(0,100);
            }
         }
         else
         {
            _parent.gotoAndStop(8);
            _parent.myDisk._alpha = 0;
            _parent.stop();
            _parent.deployed = true;
            _global.Enemies.push(_parent._name);
         }
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
         airtime--;
      }
      else if(!crashDown)
      {
         if(_parent.myDisk._alpha < 100)
         {
            _parent.myDisk._alpha += 5;
         }
         _parent.myArray._rotation += spin;
         _parent.myDisk._rotation = - _parent._rotation;
         if(speed < 6)
         {
            speed += 0.2;
         }
         else
         {
            speed = 6;
         }
         if(speedBoost > 0)
         {
            speedBoost -= 0.2;
         }
         else
         {
            speedBoost = 0;
         }
         if(justBounced > 0)
         {
            justBounced--;
         }
         if(LockOn == null || eval(LockOn) == undefined)
         {
            x = _global.Enemies.length;
            while(x > 0)
            {
               if(_global.Enemies[x - 1] != _parent._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x - 1]);
                  targ = hitTarget._name.slice(0,4);
                  if(!hitTarget.burning && targ != "Grin" && targ != "myBo")
                  {
                     LockOn = hitTarget;
                     x = 0;
                  }
               }
               x--;
            }
         }
         oldRotation = _parent._rotation;
         delta_x = _parent._x - LockOn._x;
         delta_y = _parent._y - LockOn._y;
         targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         veer = false;
         Hdelta_x = _parent._x - _root.HeroPointer._x;
         Hdelta_y = _parent._y - _root.HeroPointer._y;
         HeroDir = (- Math.atan2(Hdelta_x,Hdelta_y)) / 0.017453292519943295;
         if(Math.sqrt(Hdelta_x * Hdelta_x + Hdelta_y * Hdelta_y) <= 150)
         {
            HeroVector = _global.RotationVector(_parent._rotation,HeroDir);
            if(Math.abs(HeroVector) < 90)
            {
               veer = true;
               if(HeroVector > 0)
               {
                  _parent._rotation -= turnSpeed;
               }
               else
               {
                  _parent._rotation += turnSpeed;
               }
            }
         }
         if(LockOn != null && eval(LockOn) != undefined && myTab.charge > 1 && !veer)
         {
            if(_parent._rotation != targetRotation)
            {
               if(_parent._rotation >= 0 && targetRotation >= 0)
               {
                  if(_parent._rotation > targetRotation)
                  {
                     if(_parent._rotation - targetRotation > turnSpeed)
                     {
                        _parent._rotation -= turnSpeed;
                     }
                     else
                     {
                        _parent._rotation = targetRotation;
                     }
                  }
                  else if(targetRotation - _parent._rotation > turnSpeed)
                  {
                     _parent._rotation += turnSpeed;
                  }
                  else
                  {
                     _parent._rotation = targetRotation;
                  }
               }
               else if(_parent._rotation < 0 && targetRotation < 0)
               {
                  if(_parent._rotation > targetRotation)
                  {
                     if(_parent._rotation - targetRotation > turnSpeed)
                     {
                        _parent._rotation -= turnSpeed;
                     }
                     else
                     {
                        _parent._rotation = targetRotation;
                     }
                  }
                  else if(targetRotation - _parent._rotation > turnSpeed)
                  {
                     _parent._rotation += turnSpeed;
                  }
                  else
                  {
                     _parent._rotation = targetRotation;
                  }
               }
               else if(_parent._rotation > targetRotation)
               {
                  if(_parent._rotation < targetRotation + 180)
                  {
                     _parent._rotation -= turnSpeed;
                  }
                  else
                  {
                     _parent._rotation += turnSpeed;
                  }
               }
               else if(_parent._rotation > targetRotation - 180)
               {
                  _parent._rotation += turnSpeed;
               }
               else
               {
                  _parent._rotation -= turnSpeed;
               }
            }
         }
         degreeOfChange = _global.rotationVector(oldRotation,_parent._rotation);
         if(degreeOfChange > 2)
         {
            banking++;
         }
         else if(degreeOfChange < -2)
         {
            banking--;
         }
         else if(banking > 0)
         {
            banking--;
         }
         else if(banking < 0)
         {
            banking++;
         }
         if(banking > 10)
         {
            banking = 10;
         }
         if(banking < -10)
         {
            banking = -10;
         }
         _parent._xscale = 100 - Math.abs(banking) * 2;
         _parent.myHat._xscale = 100 + Math.abs(banking) * 4;
         _parent.myHat._x = banking / 2;
         _parent._y -= (speed + speedBoost) * Math.cos(_parent._rotation * 0.017453292519943295);
         _parent._x += (speed + speedBoost) * Math.sin(_parent._rotation * 0.017453292519943295);
         if(_global.HeroAction == "attacking" && justBounced == 0)
         {
            if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
            {
               if(_root.HeroSwing.hittest(_parent._x,_parent._y,true))
               {
                  Hdelta_x = _root.HeroPointer._x - _parent._x;
                  Hdelta_y = _root.HeroPointer._y - _parent._y;
                  HeroVector = (- Math.atan2(Hdelta_x,Hdelta_y)) / 0.017453292519943295;
                  SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                  duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                  setProperty(SparkName, _X, _parent._x);
                  setProperty(SparkName, _Y, _parent._y);
                  _parent._rotation = HeroVector;
                  _parent.myDisk._alpha = 0;
                  justBounced = 10;
                  speedBoost = 4;
                  _global.MakeNoise("Clang");
                  _parent.Health -= 20;
                  if(_global.RazorGlaiveEquipped)
                  {
                     _parent.Health -= 80;
                  }
               }
            }
         }
         if(_parent.hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
         {
            _global.justHit = _parent;
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _parent._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               targ = hitTarget._name.slice(0,4);
               distance_x = _parent._x - hitTarget._x;
               distance_y = _parent._y - hitTarget._y;
               adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
               impactPointY = _parent._y - 15 * Math.cos(adjustedRotation * 0.017453292519943295);
               impactPointX = _parent._x + 15 * Math.sin(adjustedRotation * 0.017453292519943295);
               if(hitTarget.hitTest(impactPointX,impactPointY,true) || _parent.hitTest(hitTarget._x,hitTarget._y,true) || _parent.killedBy == hitTarget && !hitTarget.exploded)
               {
                  toMyX = hitTarget._x - _parent._x;
                  toMyY = hitTarget._y - _parent._y;
                  deflectDirection = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                  if(targ == "myBo" || targ == "Grin" || hitTarget.spines || targ == "Horr" && hitTarget.action != "collect" || hitTarget.action == "gaurd" || hitTarget.claw)
                  {
                     if(justBounced == 0)
                     {
                        _global.MakeNoise("Clang");
                        _parent.killedBy = hitTarget;
                        SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                        duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                        setProperty(SparkName, _rotation, deflectDirection);
                        setProperty(SparkName, _X, _parent._x);
                        setProperty(SparkName, _Y, _parent._y);
                        _parent._rotation = deflectDirection;
                        _parent.myDisk._alpha = 0;
                        justBounced = 10;
                        speedBoost = 2;
                        if(hitTarget.wall)
                        {
                           hitTarget.killedBy = this;
                        }
                     }
                  }
                  else
                  {
                     hitTarget.killedBy = _parent;
                  }
               }
            }
            x++;
         }
         if(_parent.killedBy != null)
         {
            if(_parent.killedBy.slug)
            {
               _parent.Health -= 100;
            }
            else if(_parent.killedBy.exploded)
            {
               _parent.Health -= 100;
            }
            else if(_parent.killedBy.disk || _parent.killedBy.claw)
            {
               toMyX = _parent.killedBy._x - _parent._x;
               toMyY = _parent.killedBy._y - _parent._y;
               deflectDirection = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
               _global.MakeNoise("Clang");
               SparkName = "_root." + _parent._name + "Sparks" + myEffects;
               duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
               setProperty(SparkName, _rotation, deflectDirection);
               setProperty(SparkName, _X, _parent._x);
               setProperty(SparkName, _Y, _parent._y);
               _parent._rotation = deflectDirection;
               _parent.myDisk._alpha = 0;
               justBounced = 10;
               speedBoost = 2;
               _parent.Health -= 10;
               _parent.killedBy.killedBy = this;
            }
            else
            {
               switch(_parent.killedBy._name.slice(0,4))
               {
                  case "Grin":
                     _parent.Health -= 10;
                     break;
                  case "Horr":
                     _parent.Health -= 30;
                     break;
                  case "Gray":
                     _parent.Health -= 10;
                     break;
                  case "Shar":
                     _parent.Health -= 5;
                     break;
                  case "Void":
                     _parent.Health--;
               }
            }
            _parent.killedBy = null;
         }
         if(_parent.Health < 100)
         {
            if(int(Math.random() * 100) > _parent.Health && int(Math.random() * 10) == 1)
            {
               mySparks = int(Math.random() * 3) + 1;
               x = 1;
               while(x <= mySparks)
               {
                  sparkName = "DronedamSpark" + myEffects++;
                  _root.attachMovie("Spark",sparkName,_global.capDepth++);
                  with(eval("_root." + sparkName))
                  {
                     _x = this._parent._x;
                     _y = this._parent._y;
                     _rotation = int(Math.random() * 360) - 180;
                  }
                  sparkColor = new Color(eval("_root." + sparkName));
                  sparkColor.setRGB(8766206);
                  x++;
               }
            }
         }
         if(_parent.Health <= 0)
         {
            _parent.exploded = true;
            myBuzz.stop();
            _global.MakeNoise("Explode");
            _global.MakeNoise("Lose Blade Wobble");
            duplicateMovieClip(_root.VoidPulse,"DroneShockwave",16384 + _global.effectDepth++);
            with(_root.DroneShockwave)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            duplicateMovieClip(_root.Blackout,"DroneBright",22384);
            with(_root.DroneBright)
            {
               _x = 275;
               _y = 200;
               _xscale = 1000;
               _yscale = 1000;
            }
            BlinkColor = new Color(_root.DroneBright);
            BlinkColor.setRGB(8766206);
            myScraps = int(Math.random() * 4) + 8;
            Quadrant = 0;
            x = 1;
            while(x <= myScraps)
            {
               scrapName = "Scrap" + _global.effectDepth;
               _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
               with(eval("_root." + scrapName))
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
               x++;
            }
            Quadrant = 0;
            x = 1;
            while(x <= 4)
            {
               bladeName = "Blade" + _global.effectDepth;
               _root.attachMovie("Loose Blade",bladeName,_global.effectDepth++);
               with(eval("_root." + bladeName))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = this._parent._rotation + Quadrant;
               }
               Quadrant += 90;
               if(Quadrant == 270)
               {
                  Quadrant = -90;
               }
               x++;
            }
            mySparks = int(Math.random() * 6) + 12;
            x = 1;
            while(x <= mySparks)
            {
               sparkName = "DroneexpSpark" + x;
               _root.attachMovie("Spark",sparkName,_global.capDepth++);
               with(eval("_root." + sparkName))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = int(Math.random() * 360) - 180;
               }
               sparkColor = new Color(eval("_root." + sparkName));
               sparkColor.setRGB(16053248);
               x++;
            }
            myTab.charge = 1;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
            _parent.removeMovieClip();
         }
         if(drain == 1)
         {
            myTab.charge--;
            drain = 0;
         }
         else
         {
            drain = 1;
         }
         if(myTab.charge < 60 && myTab.charge > 1)
         {
            if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
            {
               LEDSpotY = _parent._y - 10 * Math.cos(_parent._rotation * 0.017453292519943295);
               LEDSpotX = _parent._x + 10 * Math.sin(_parent._rotation * 0.017453292519943295);
               LEDName = "DroneLED" + myEffects++;
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
         if(myTab.charge == 1)
         {
            crashDown = true;
            _parent._xscale = 100;
            _parent.myHat._xscale = 100;
            _parent.myHat._x = 0;
            if(int(Math.random() * 2) == 1)
            {
               turnSpeed = -6;
            }
            else
            {
               turnSpeed = 6;
            }
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
         }
      }
      else
      {
         if(airtime == 1)
         {
            _global.MakeNoise("Drone Crash Noise");
         }
         if(airtime < 20)
         {
            _parent._xscale--;
            _parent._yscale--;
            _parent.myArray._rotation += spin--;
            if(_parent.myDisk._alpha > 0)
            {
               _parent.myDisk._alpha -= 5;
            }
            _parent._y -= (speed + speedBoost) * Math.cos(_parent._rotation * 0.017453292519943295);
            _parent._x += (speed + speedBoost) * Math.sin(_parent._rotation * 0.017453292519943295);
            _parent._rotation += turnSpeed;
         }
         else
         {
            _global.MakeNoise("GrinderHurt");
            _global.MakeNoise("SharpsIn");
            _global.MakeNoise("Thump");
            myBuzz.stop();
            _root.attachMovie("Drone Crash","myDroneWreck",_global.effectDepth++);
            with(_root.myDroneWreck)
            {
               _x = this._parent._x;
               _y = this._parent._y;
               _rotation = this._parent._rotation;
            }
            DirtSpotY = _parent._y - 10 * Math.cos(_parent._rotation * 0.017453292519943295);
            DirtSpotX = _parent._x + 10 * Math.sin(_parent._rotation * 0.017453292519943295);
            DirtName = "DroneDirt" + myEffects++;
            duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
            with(eval("_root." + DirtName))
            {
               _x = DirtSpotX;
               _y = DirtSpotY;
               _rotation = this._parent._rotation;
            }
            mySparks = int(Math.random() * 4) + 8;
            x = 1;
            while(x <= mySparks)
            {
               sparkName = "DroneSpark" + x;
               _root.attachMovie("Spark",sparkName,_global.capDepth++);
               with(eval("_root." + sparkName))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = this._parent._rotation + int(Math.random() * 90) - 45;
               }
               sparkColor = new Color(eval("_root." + sparkName));
               sparkColor.setRGB(16053248);
               x++;
            }
            _parent.removeMovieClip();
         }
         airtime++;
      }
   }
   else
   {
      _parent.stop();
   }
}

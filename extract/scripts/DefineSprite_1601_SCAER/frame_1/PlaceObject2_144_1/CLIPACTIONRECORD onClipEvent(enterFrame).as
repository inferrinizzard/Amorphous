onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!_parent.deployed)
      {
         if(airtime > 10)
         {
            airtime--;
            _parent._xscale -= 2;
            _parent._yscale -= 2;
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
               myTab.charge = 200;
               _parent.removeMovieClip();
            }
         }
         else if(airtime > 0)
         {
            if(airtime == 10)
            {
               speed -= 1.5;
               if(speed < 0)
               {
                  speed = 0;
               }
               Dirtpuffs = int(Math.random() * 3) + 3;
               x = 0;
               while(x < Dirtpuffs)
               {
                  DirtName = "BoxDirt" + myEffects++;
                  duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
                  with(eval("_root." + DirtName))
                  {
                     _x = this._parent._x + int(Math.random() * 10) - 5;
                     _y = this._parent._y + int(Math.random() * 10) - 5;
                     _rotation = moveDirection + int(Math.random() * 180) - 90;
                  }
                  x++;
               }
               _global.Enemies.push(_parent._name);
               _global.MakeNoise("GrinderHurt");
               _global.MakeNoise("Thump");
            }
            airtime--;
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
               myTab.charge = 200;
               _parent.removeMovieClip();
            }
         }
         else if(_parent._currentframe < 51)
         {
            if(deployFrames < 60)
            {
               if(deployFrames == 30 || deployFrames == 45)
               {
                  LEDSpotY = _parent._y - -8 * Math.cos(_parent._rotation * 0.017453292519943295);
                  LEDSpotX = _parent._x + -8 * Math.sin(_parent._rotation * 0.017453292519943295);
                  LEDName = "BoxGunLED" + myEffects++;
                  _root.attachMovie("LED",LEDName,_global.capDepth++);
                  with(eval("_root." + LEDName))
                  {
                     _x = LEDSpotX;
                     _y = LEDSpotY;
                  }
                  LEDColor = new Color(eval("_root." + LEDName));
                  LEDColor.setRGB(5956677);
                  _global.MakeNoise("Soft Beep");
               }
            }
            else if(deployFrames < 90)
            {
               if(deployFrames == 60)
               {
                  _global.MakeNoise("Box Deploy 2");
               }
               if(_parent._currentframe < 12)
               {
                  _parent.play();
               }
               else
               {
                  _parent.stop();
               }
            }
            else if(deployFrames < 120)
            {
               if(deployFrames == 90)
               {
                  _global.MakeNoise("Box Deploy 1");
               }
               if(_parent._currentframe < 24)
               {
                  _parent.play();
               }
               else
               {
                  _parent.stop();
               }
               if(_parent._currentframe == 23)
               {
                  DirtDir = _parent._rotation - 45;
                  if(DirtDir < -180)
                  {
                     DirtDir += 360;
                  }
                  x = 0;
                  while(x < 4)
                  {
                     DirtSpotY = _parent._y - 20 * Math.cos(DirtDir * 0.017453292519943295);
                     DirtSpotX = _parent._x + 20 * Math.sin(DirtDir * 0.017453292519943295);
                     DirtName = "BoxDirt" + myEffects++;
                     duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
                     with(eval("_root." + DirtName))
                     {
                        _x = DirtSpotX;
                        _y = DirtSpotY;
                        _rotation = DirtDir + int(Math.random() * 20) - 10;
                     }
                     DirtDir += 90;
                     if(DirtDir > 180)
                     {
                        DirtDir -= 360;
                     }
                     x++;
                  }
                  _global.MakeNoise("Box Deploy 3");
               }
            }
            else if(deployFrames < 150)
            {
               if(deployFrames == 120)
               {
                  _global.MakeNoise("Box Deploy 4");
               }
               _parent.play();
            }
            deployFrames++;
         }
         else
         {
            _parent.stop();
            _parent.deployed = true;
            _root.attachMovie("Box Turret","myTurret",4995);
            with(_root.myTurret)
            {
               _x = this._parent._x;
               _y = this._parent._y;
               _rotation = this._parent._rotation;
            }
         }
         if(airtime <= 0)
         {
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
                     _global.HeroAction = "bounceback";
                  }
               }
            }
            if(_parent.hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
            {
               _global.justHit = _parent;
               toTargetX = _parent._x - _root.HeroPointer._x;
               toTargetY = _parent._y - _root.HeroPointer._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               _root.HeroPointer._y -= 5 * Math.cos(targetDirection * 0.017453292519943295);
               _root.HeroPointer._x += 5 * Math.sin(targetDirection * 0.017453292519943295);
            }
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != _parent._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  targ = hitTarget._name.slice(0,4);
                  if(hitTarget.wall)
                  {
                     if(hitTarget.hitTest(_parent._x,_parent._y,true))
                     {
                        myTab.charge = 200;
                        _parent.removeMovieClip();
                     }
                  }
                  if(targ == "Bite" || targ == "Fuzz" || targ == "Oozl" || targ == "Gray" || targ == "Clut" || targ == "Horr" || targ == "Shar" || targ == "Amal" || targ == "Razo")
                  {
                     if(_parent.hitTest(hitTarget._x,hitTarget._y,true))
                     {
                        toTargetX = _parent._x - hitTarget._x;
                        toTargetY = _parent._y - hitTarget._y;
                        targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                        if(hitTarget.spines || targ == "Horr" && hitTarget.action != "collect")
                        {
                           _global.MakeNoise("Clang");
                           SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                           duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                           setProperty(SparkName, _rotation, targetDirection);
                           setProperty(SparkName, _X, hitTarget._x);
                           setProperty(SparkName, _Y, hitTarget._y);
                        }
                        else
                        {
                           _global.MakeNoise("Boing");
                        }
                        hitTarget._y -= 5 * Math.cos(targetDirection * 0.017453292519943295);
                        hitTarget._x += 5 * Math.sin(targetDirection * 0.017453292519943295);
                        hitTarget._rotation = targetDirection;
                     }
                  }
               }
               x++;
            }
            if(_parent.killedBy != null)
            {
               _parent.killedBy = null;
            }
         }
      }
      else if(!_parent.exploded)
      {
         checkFire = false;
         if(_root.myTurret._currentframe > 1)
         {
            _root.myTurret.play();
         }
         if(LockOn == null || eval(LockOn) == undefined || _parent.ineffective)
         {
            x = _global.Enemies.length;
            while(x > 0)
            {
               if(_global.Enemies[x - 1] != _parent._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x - 1]);
                  targ = hitTarget._name.slice(0,4);
                  if(!hitTarget.wall && !hitTarget.burning && targ != "myDr" && targ != "Grin")
                  {
                     LockOn = hitTarget;
                     x = 0;
                  }
               }
               x--;
            }
            _parent.ineffective = false;
         }
         delta_x = _parent._x - LockOn._x;
         delta_y = _parent._y - LockOn._y;
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 60)
         {
            LockOn = null;
         }
         if(refire == 0 && LockOn != null && eval(LockOn) != undefined && myTab.charge > 1)
         {
            targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
            if(_root.myTurret._rotation != targetRotation)
            {
               if(_root.myTurret._rotation >= 0 && targetRotation >= 0)
               {
                  if(_root.myTurret._rotation > targetRotation)
                  {
                     if(_root.myTurret._rotation - targetRotation > turnSpeed)
                     {
                        _root.myTurret._rotation -= turnSpeed;
                     }
                     else
                     {
                        _root.myTurret._rotation = targetRotation;
                     }
                  }
                  else if(targetRotation - _root.myTurret._rotation > turnSpeed)
                  {
                     _root.myTurret._rotation += turnSpeed;
                  }
                  else
                  {
                     _root.myTurret._rotation = targetRotation;
                  }
               }
               else if(_root.myTurret._rotation < 0 && targetRotation < 0)
               {
                  if(_root.myTurret._rotation > targetRotation)
                  {
                     if(_root.myTurret._rotation - targetRotation > turnSpeed)
                     {
                        _root.myTurret._rotation -= turnSpeed;
                     }
                     else
                     {
                        _root.myTurret._rotation = targetRotation;
                     }
                  }
                  else if(targetRotation - _root.myTurret._rotation > turnSpeed)
                  {
                     _root.myTurret._rotation += turnSpeed;
                  }
                  else
                  {
                     _root.myTurret._rotation = targetRotation;
                  }
               }
               else if(_root.myTurret._rotation > targetRotation)
               {
                  if(_root.myTurret._rotation < targetRotation + 180)
                  {
                     _root.myTurret._rotation -= turnSpeed;
                  }
                  else
                  {
                     _root.myTurret._rotation += turnSpeed;
                  }
               }
               else if(_root.myTurret._rotation > targetRotation - 180)
               {
                  _root.myTurret._rotation += turnSpeed;
               }
               else
               {
                  _root.myTurret._rotation -= turnSpeed;
               }
               if(!gearTracking)
               {
                  myGear.start(0,100);
                  gearTracking = true;
               }
            }
            else
            {
               myGear.stop();
               gearTracking = false;
            }
         }
         else
         {
            myGear.stop();
            gearTracking = false;
         }
         muzzlePointY = _parent._y - 51 * Math.cos(_root.myTurret._rotation * 0.017453292519943295);
         muzzlePointX = _parent._x + 51 * Math.sin(_root.myTurret._rotation * 0.017453292519943295);
         Hdelta_x = _parent._x - _root.HeroPointer._x;
         Hdelta_y = _parent._y - _root.HeroPointer._y;
         HeroVector = (- Math.atan2(Hdelta_x,Hdelta_y)) / 0.017453292519943295;
         if(Math.abs(HeroVector) > 175 && Math.abs(_root.myTurret._rotation) > 175)
         {
            if(Math.abs(_root.myTurret._rotation) - Math.abs(HeroVector) < 11)
            {
               checkFire = true;
            }
         }
         else if(Math.abs(_root.myTurret._rotation - HeroVector) < 11)
         {
            checkFire = true;
         }
         if(refire == 0 && !checkFire && myTab.charge > 1 && LockOn != null && eval(LockOn) != undefined)
         {
            onTarget = false;
            if(Math.abs(targetRotation) > 175 && Math.abs(_root.myTurret._rotation) > 175)
            {
               if(Math.abs(_root.myTurret._rotation) - Math.abs(targetRotation) < 3)
               {
                  onTarget = true;
               }
            }
            else if(Math.abs(_root.myTurret._rotation - targetRotation) < 3)
            {
               onTarget = true;
            }
            if(onTarget)
            {
               mySparks = int(Math.random() * 6) + 6;
               x = 1;
               while(x <= mySparks)
               {
                  sparkName = "bulletSpark" + myEffects++;
                  _root.attachMovie("Spark",sparkName,_global.capDepth++);
                  with(eval("_root." + sparkName))
                  {
                     _x = muzzlePointX;
                     _y = muzzlePointY;
                     _rotation = _root.myTurret._rotation + int(Math.random() * 20) - 10;
                  }
                  sparkColor = new Color(eval("_root." + sparkName));
                  sparkColor.setRGB(16777215);
                  x++;
               }
               _root.attachMovie("Muzzle Flare","myMuzzFlare",_global.capDepth++);
               with(_root.myMuzzFlare)
               {
                  _x = muzzlePointX;
                  _y = muzzlePointY;
                  _rotation = _root.myTurret._rotation;
               }
               _root.attachMovie("Box Bullet","myBullet",_global.effectDepth++);
               with(_root.myBullet)
               {
                  _x = muzzlePointX;
                  _y = muzzlePointY;
                  _rotation = _root.myTurret._rotation;
               }
               brassName = "SCAERBrass" + myEffects++;
               brassDir = _root.myTurret._rotation + 90;
               if(brassDir > 180)
               {
                  brassDir -= 360;
               }
               ejectPortY = _parent._y - 10 * Math.cos(brassDir * 0.017453292519943295);
               ejectPortX = _parent._x + 10 * Math.sin(brassDir * 0.017453292519943295);
               _root.attachMovie("Brass",brassName,_global.capDepth++);
               with(eval("_root." + brassName))
               {
                  _x = ejectPortX;
                  _y = ejectPortY;
                  _rotation = _root.myTurret._rotation;
               }
               _global.MakeNoise("Gunshot");
               _global.MakeNoise("Loud Boom");
               _root.myTurret.play();
               refire = 60;
               myTab.charge -= 10;
            }
         }
         if(refire > 0)
         {
            refire--;
            if(refire == 50)
            {
               _global.MakeNoise("Box Gun Cock 2");
            }
         }
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
                  _global.HeroAction = "bounceback";
                  _global.MakeNoise("Clang");
                  _parent.Health -= 20;
                  if(_global.RazorGlaiveEquipped)
                  {
                     _parent.Health -= 30;
                  }
               }
            }
         }
         if(_root.myTurret.hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
         {
            _global.justHit = _parent;
            toTargetX = _parent._x - _root.HeroPointer._x;
            toTargetY = _parent._y - _root.HeroPointer._y;
            targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
            _root.HeroPointer._y -= 5 * Math.cos(targetDirection * 0.017453292519943295);
            _root.HeroPointer._x += 5 * Math.sin(targetDirection * 0.017453292519943295);
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _parent._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               targ = hitTarget._name.slice(0,4);
               if(hitTarget.wall)
               {
                  if(hitTarget.hitTest(_parent._x,_parent._y,true))
                  {
                     _parent.health = 0;
                  }
               }
               if(targ == "Bite" || targ == "Fuzz" || targ == "Oozl" || targ == "Gray" || targ == "Clut" || targ == "Horr" || targ == "Shar" || targ == "Amal" || targ == "Razo")
               {
                  if(_root.myTurret.hitTest(hitTarget._x,hitTarget._y,true))
                  {
                     toTargetX = _parent._x - hitTarget._x;
                     toTargetY = _parent._y - hitTarget._y;
                     targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                     if(hitTarget.spines || targ == "Horr" && hitTarget.action != "collect")
                     {
                        _global.MakeNoise("Clang");
                        _parent.killedBy = hitTarget;
                        SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                        duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                        setProperty(SparkName, _rotation, targetDirection);
                        setProperty(SparkName, _X, hitTarget._x);
                        setProperty(SparkName, _Y, hitTarget._y);
                     }
                     else
                     {
                        _global.MakeNoise("Boing");
                     }
                     hitTarget._y -= 5 * Math.cos(targetDirection * 0.017453292519943295);
                     hitTarget._x += 5 * Math.sin(targetDirection * 0.017453292519943295);
                     hitTarget._rotation = targetDirection;
                  }
               }
            }
            x++;
         }
         if(_parent.killedBy != null)
         {
            if(_parent.killedBy.hedgehog != null)
            {
               _parent.Health -= 100;
            }
            else if(_parent.killedBy.slug)
            {
               _parent.Health -= 10;
            }
            else if(_parent.killedBy.exploded)
            {
               _parent.Health -= 80;
            }
            else if(_parent.killedBy.disk || _parent.killedBy.claw)
            {
               _parent.Health -= 20;
            }
            else
            {
               switch(_parent.killedBy._name.slice(0,4))
               {
                  case "Grin":
                     _parent.Health -= 100;
                     break;
                  case "Horr":
                     _parent.Health -= 60;
                     break;
                  case "Gray":
                     _parent.Health -= 5;
                     break;
                  case "Shar":
                     _parent.Health -= 10;
                     break;
                  case "Void":
                     _parent.Health--;
               }
            }
            _parent.killedBy = null;
         }
         if(_parent.Health < 100)
         {
            if(int(Math.random() * 100) > _parent.Health && int(Math.random() * 20) == 1)
            {
               mySparks = int(Math.random() * 3) + 1;
               x = 1;
               while(x <= mySparks)
               {
                  sparkName = "SCAERdamSpark" + myEffects++;
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
            if(int(Math.random() * 70) > _parent.Health && int(Math.random() * 15) == 1)
            {
               arcName = "SCAERdamArc" + myEffects++;
               _root.attachMovie("Arc",arcName,_global.capDepth++);
               with(eval("_root." + arcName))
               {
                  _x = this._parent._x + int(Math.random() * 30) - 15;
                  _y = this._parent._y + int(Math.random() * 30) - 15;
                  _xscale = int(Math.random() * 30) + 70;
                  _yscale = int(Math.random() * 30) + 70;
                  _rotation = int(Math.random() * 360) - 180;
               }
               arcColor = new Color(eval("_root." + arcName));
               arcColor.setRGB(8766206);
            }
            if(int(Math.random() * 30) > _parent.Health && int(Math.random() * 40) == 1)
            {
               smokeName = "SCAERsmoke" + myEffects++;
               duplicateMovieClip(_root.BlackSmoke,smokeName,16384 + _global.capDepth++);
               with(eval("_root." + smokeName))
               {
                  _x = this._parent._x + int(Math.random() * 30) - 15;
                  _y = this._parent._y + int(Math.random() * 30) - 15;
               }
            }
         }
         if(_parent.Health <= 0)
         {
            _parent.exploded = true;
            _global.MakeNoise("Explode");
            duplicateMovieClip(_root.VoidPulse,"SCAERShockwave",16384 + _global.effectDepth++);
            with(_root.SCAERShockwave)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            blastName = "SCAERBlastmark" + _global.backgroundDepth;
            duplicateMovieClip(_root.Blastmark,blastName,16384 + _global.backgroundDepth++);
            with(eval("_root." + blastName))
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            duplicateMovieClip(_root.Blackout,"SCAERBright",22384);
            with(_root.SCAERBright)
            {
               _x = 275;
               _y = 200;
               _xscale = 1000;
               _yscale = 1000;
            }
            BlinkColor = new Color(_root.SCAERBright);
            BlinkColor.setRGB(16777215);
            ashpuffs = int(Math.random() * 3) + 2;
            x = 0;
            while(x < ashpuffs)
            {
               duplicateMovieClip(_root.GroundDirt,"SCAERAsh" + x,16384 + _global.effectDepth++);
               with(eval("_root.SCAERAsh" + x))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = int(Math.random() * 360) - 179;
               }
               AshColor = new Color(eval("_root.SCAERAsh" + x));
               AshColor.setRGB(0);
               x++;
            }
            littleFires = int(Math.random() * 5) + 6;
            x = 0;
            while(x < littleFires)
            {
               FireName = "SCAERFire" + myEffects++;
               duplicateMovieClip(_root.SmallFire,FireName,16384 + _global.effectDepth++);
               with(eval("_root." + FireName))
               {
                  _x = this._parent._x + int(Math.random() * 160) - 80;
                  _y = this._parent._y + int(Math.random() * 160) - 80;
               }
               x++;
            }
            if(eval(_root.HeroPointer) != undefined && _global.justHit == null)
            {
               toTargetX = _parent._x - _root.HeroPointer._x;
               toTargetY = _parent._y - _root.HeroPointer._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               distToHero = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
               if(distToHero <= 120)
               {
                  _global.justHit = _root.myTurret;
               }
            }
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != _parent._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  toTargetX = _parent._x - hitTarget._x;
                  toTargetY = _parent._y - hitTarget._y;
                  targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                  distToEnemy = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
                  if(distToEnemy <= 80)
                  {
                     hitTarget.killedBy = _parent;
                  }
                  else if(distToEnemy <= 150)
                  {
                     if(!hitTarget.wall && !hitTarget.tool)
                     {
                        hitTarget._y -= 30 * Math.cos(targetDirection * 0.017453292519943295);
                        hitTarget._x += 30 * Math.sin(targetDirection * 0.017453292519943295);
                        hitTarget._rotation = targetDirection;
                     }
                  }
               }
               x++;
            }
            myScraps = int(Math.random() * 2) + 4;
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
            myFrag = int(Math.random() * 5) + 12;
            Quadrant = 0;
            x = 1;
            while(x <= myFrag)
            {
               scrapName = "Frag" + _global.effectDepth;
               _root.attachMovie("Dark Scrapmetal",scrapName,_global.effectDepth++);
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
            mySparks = int(Math.random() * 6) + 12;
            x = 1;
            while(x <= mySparks)
            {
               sparkName = "SCAERexpSpark" + x;
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
            _root.myTurret.removeMovieClip();
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
         }
         if(myTab.charge < 60 && myTab.charge > 1)
         {
            if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
            {
               LEDDir = _root.myTurret._rotation - 90;
               if(LEDDir < -180)
               {
                  LEDDir += 360;
               }
               LEDSpotY = _parent._y - 10 * Math.cos(LEDDir * 0.017453292519943295);
               LEDSpotX = _parent._x + 10 * Math.sin(LEDDir * 0.017453292519943295);
               LEDName = "BoxGunLED" + myEffects++;
               _root.attachMovie("LED",LEDName,_global.capDepth++);
               with(eval("_root." + LEDName))
               {
                  _x = LEDSpotX;
                  _y = LEDSpotY;
               }
               LEDColor = new Color(eval("_root." + LEDName));
               LEDColor.setRGB(15990543);
               _global.MakeNoise("Low Ammo Warning");
            }
         }
         if(myTab.charge == 1)
         {
            if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
            {
               if(warnings < 3)
               {
                  LEDDir = _root.myTurret._rotation - 90;
                  if(LEDDir < -180)
                  {
                     LEDDir += 360;
                  }
                  LEDSpotY = _parent._y - 10 * Math.cos(LEDDir * 0.017453292519943295);
                  LEDSpotX = _parent._x + 10 * Math.sin(LEDDir * 0.017453292519943295);
                  LEDName = "BoxGunLED" + myEffects++;
                  _root.attachMovie("LED",LEDName,_global.capDepth++);
                  with(eval("_root." + LEDName))
                  {
                     _x = LEDSpotX;
                     _y = LEDSpotY;
                  }
                  LEDColor = new Color(eval("_root." + LEDName));
                  LEDColor.setRGB(14221312);
                  if(warnings == 0)
                  {
                     _global.MakeNoise("SD Warning");
                  }
                  warnings++;
               }
               else
               {
                  _parent.exploded = true;
                  _global.MakeNoise("Explode");
                  duplicateMovieClip(_root.VoidPulse,"SCAERShockwave",16384 + _global.effectDepth++);
                  with(_root.SCAERShockwave)
                  {
                     _x = this._parent._x;
                     _y = this._parent._y;
                  }
                  blastName = "SCAERBlastmark" + _global.backgroundDepth;
                  duplicateMovieClip(_root.Blastmark,blastName,16384 + _global.backgroundDepth++);
                  with(eval("_root." + blastName))
                  {
                     _x = this._parent._x;
                     _y = this._parent._y;
                  }
                  duplicateMovieClip(_root.Blackout,"SCAERBright",22384);
                  with(_root.SCAERBright)
                  {
                     _x = 275;
                     _y = 200;
                     _xscale = 1000;
                     _yscale = 1000;
                  }
                  BlinkColor = new Color(_root.SCAERBright);
                  BlinkColor.setRGB(16777215);
                  ashpuffs = int(Math.random() * 3) + 2;
                  x = 0;
                  while(x < ashpuffs)
                  {
                     duplicateMovieClip(_root.GroundDirt,"SCAERAsh" + x,16384 + _global.effectDepth++);
                     with(eval("_root.SCAERAsh" + x))
                     {
                        _x = this._parent._x;
                        _y = this._parent._y;
                        _rotation = int(Math.random() * 360) - 179;
                     }
                     AshColor = new Color(eval("_root.SCAERAsh" + x));
                     AshColor.setRGB(0);
                     x++;
                  }
                  x = 0;
                  while(x < _global.Enemies.length)
                  {
                     if(_global.Enemies[x] != _parent._name)
                     {
                        hitTarget = eval("_root." + _global.Enemies[x]);
                        toTargetX = _parent._x - hitTarget._x;
                        toTargetY = _parent._y - hitTarget._y;
                        targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                        distToEnemy = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
                        if(distToEnemy <= 80)
                        {
                           if(!hitTarget.wall && !hitTarget.tool)
                           {
                              hitTarget._y -= 30 * Math.cos(targetDirection * 0.017453292519943295);
                              hitTarget._x += 30 * Math.sin(targetDirection * 0.017453292519943295);
                              hitTarget._rotation = targetDirection;
                           }
                        }
                     }
                     x++;
                  }
                  myScraps = int(Math.random() * 2) + 4;
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
                  myFrag = int(Math.random() * 5) + 12;
                  Quadrant = 0;
                  x = 1;
                  while(x <= myFrag)
                  {
                     scrapName = "Frag" + _global.effectDepth;
                     _root.attachMovie("Dark Scrapmetal",scrapName,_global.effectDepth++);
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
                  mySparks = int(Math.random() * 6) + 12;
                  x = 1;
                  while(x <= mySparks)
                  {
                     sparkName = "SCAERexpSpark" + x;
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
                  _root.myTurret.removeMovieClip();
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
               }
            }
         }
      }
      else if(huskTime < 120)
      {
         if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
         {
            smokeName = "SCAERsmoke" + myEffects++;
            duplicateMovieClip(_root.BlackSmoke,smokeName,16384 + _global.capDepth++);
            with(eval("_root." + smokeName))
            {
               _x = this._parent._x + int(Math.random() * 30) - 15;
               _y = this._parent._y + int(Math.random() * 30) - 15;
            }
         }
         huskTime++;
      }
      else if(_parent._alpha > 0)
      {
         _parent._alpha -= 2;
      }
      else
      {
         _parent.removeMovieClip();
      }
   }
   else
   {
      _parent.stop();
      _root.myTurret.stop();
   }
}

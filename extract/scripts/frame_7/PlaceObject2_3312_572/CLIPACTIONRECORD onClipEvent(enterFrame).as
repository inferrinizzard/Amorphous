onClipEvent(enterFrame){
   if(!mommy && beenDead == 0 && !_global.pause)
   {
      if(speedBoost > 0)
      {
         speedBoost -= 0.5;
      }
      if(justStruck > 0)
      {
         justStruck--;
      }
      deltaQ_x = _X - gotoSpotX;
      deltaQ_y = _Y - gotoSpotY;
      toSpot = Math.sqrt(deltaQ_x * deltaQ_x + deltaQ_y * deltaQ_y);
      speed = int(toSpot / 4);
      if(action == "jab")
      {
         speed *= 2;
      }
      if(action == "placed")
      {
         speed = 0;
      }
      switch(action)
      {
         case "none":
         case "draw":
         case "digup":
            zoneOff = 55;
            zoneDist = 30;
            break;
         case "jab":
            zoneOff = 15;
            zoneDist = 50;
            break;
         case "backswing":
            zoneOff = 80;
            zoneDist = 40;
            break;
         case "swing":
            zoneOff = 5;
            zoneDist = 80;
            break;
         case "entrench":
            zoneOff = 45;
            zoneDist = 50;
      }
      if(Right)
      {
         zoneOff = mommyQueen._rotation + zoneOff;
      }
      else
      {
         zoneOff = mommyQueen._rotation - zoneOff;
      }
      gotoSpotX = mommyQueen._x + zoneDist * Math.sin(zoneOff * 0.017453292519943295);
      gotoSpotY = mommyQueen._y - zoneDist * Math.cos(zoneOff * 0.017453292519943295);
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(Right)
            {
               radialAdjust = _rotation - 10;
            }
            else
            {
               radialAdjust = _rotation + 10;
            }
            if(radialAdjust > 180)
            {
               radialAdjust -= 360;
            }
            if(radialAdjust < -180)
            {
               radialAdjust += 360;
            }
            if(action == "placed")
            {
               ColPtExt = 25;
            }
            else
            {
               ColPtExt = 40;
            }
            ColPtY = _Y - ColPtExt * Math.cos(radialAdjust * 0.017453292519943295);
            ColPtX = _X + ColPtExt * Math.sin(radialAdjust * 0.017453292519943295);
            if(_root.HeroSwing.hittest(ColPtX,ColPtY,true))
            {
               if(justStruck == 0)
               {
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, moveDirection);
                  setProperty(SparkName, _X, ColPtX);
                  setProperty(SparkName, _Y, ColPtY);
                  _global.MakeNoise("Clang");
                  if(_global.gameMode != "Practice")
                  {
                     _global.PlayerSparks = _global.PlayerSparks + 1;
                     if(_global.PlayerSparks >= 50)
                     {
                        _global.GainAward("50 Sparks");
                     }
                  }
                  if(action != "placed")
                  {
                     moveDirection = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                     speedBoost = 3;
                     justStruck = 5;
                     if(action != "draw")
                     {
                        action = "draw";
                        sLoc = 0;
                     }
                  }
                  _global.HeroAction = "bounceback";
               }
            }
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
      {
         _global.justHit = this;
      }
      else
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != mommyQueen._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  if(hitTarget._name.slice(0,7) == "Grinder" || hitTarget.spines || hitTarget.action == "gaurd" || hitTarget._name.slice(0,6) == "Horror")
                  {
                     if(justStruck == 0)
                     {
                        SparkName = "_root." + this._name + "Sparks";
                        duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                        setProperty(SparkName, _rotation, moveDirection);
                        setProperty(SparkName, _X, this._x);
                        setProperty(SparkName, _Y, this._y);
                        _global.MakeNoise("Clang");
                        if(action != "placed")
                        {
                           moveDirection -= 180;
                           speedBoost = 3;
                           justStruck = 5;
                           if(action != "draw")
                           {
                              action = "draw";
                              sLoc = 0;
                           }
                        }
                     }
                     hitTarget.killedBy = this;
                  }
                  else
                  {
                     hitTarget.killedBy = this;
                  }
               }
            }
            x++;
         }
      }
      x = 0;
      while(x < _global.Hazards.length)
      {
         targetHazard = eval("_root." + _global.Hazards[x]);
         if(hitTest(targetHazard._x,targetHazard._y,true))
         {
            if(targetHazard._name.slice(0,5) == "Razor")
            {
               targetHazard.killedBy = this;
            }
         }
         x++;
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(justStruck == 0)
      {
         moveDirection = targetRotation;
      }
      if(action == "none" || action == "draw" || action == "digup")
      {
         if(Right)
         {
            targetRotation = mommyQueen._rotation - 10;
         }
         else
         {
            targetRotation = mommyQueen._rotation + 10;
         }
      }
      else if(action == "jab")
      {
         if(Right)
         {
            targetRotation = mommyQueen._rotation + 80;
         }
         else
         {
            targetRotation = mommyQueen._rotation - 80;
         }
      }
      else if(action == "backswing")
      {
         if(Right)
         {
            targetRotation = mommyQueen._rotation + 90;
         }
         else
         {
            targetRotation = mommyQueen._rotation - 90;
         }
      }
      else if(action == "entrench")
      {
         if(Right)
         {
            targetRotation = mommyQueen._rotation + 45;
         }
         else
         {
            targetRotation = mommyQueen._rotation - 45;
         }
      }
      else if(action == "placed")
      {
         targetRotation = _rotation;
      }
      if(targetRotation > 180)
      {
         targetRotation -= 360;
      }
      if(targetRotation < -180)
      {
         targetRotation += 360;
      }
      if(moveDirection > 180)
      {
         moveDirection -= 360;
      }
      if(moveDirection < -180)
      {
         moveDirection += 360;
      }
      if(action == "jab")
      {
         turnSpeed = 8;
      }
      else
      {
         turnSpeed = 4;
      }
      if(beenDead == 0)
      {
         if(_rotation != targetRotation)
         {
            if(_rotation >= 0 && targetRotation >= 0)
            {
               if(_rotation > targetRotation)
               {
                  if(_rotation - targetRotation > turnSpeed)
                  {
                     _rotation = _rotation - turnSpeed;
                  }
                  else
                  {
                     _rotation = targetRotation;
                  }
               }
               else if(targetRotation - _rotation > turnSpeed)
               {
                  _rotation = _rotation + turnSpeed;
               }
               else
               {
                  _rotation = targetRotation;
               }
            }
            else if(_rotation < 0 && targetRotation < 0)
            {
               if(_rotation > targetRotation)
               {
                  if(_rotation - targetRotation > turnSpeed)
                  {
                     _rotation = _rotation - turnSpeed;
                  }
                  else
                  {
                     _rotation = targetRotation;
                  }
               }
               else if(targetRotation - _rotation > turnSpeed)
               {
                  _rotation = _rotation + turnSpeed;
               }
               else
               {
                  _rotation = targetRotation;
               }
            }
            else if(_rotation > targetRotation)
            {
               if(_rotation < targetRotation + 180)
               {
                  _rotation = _rotation - turnSpeed;
               }
               else
               {
                  _rotation = _rotation + turnSpeed;
               }
            }
            else if(_rotation > targetRotation - 180)
            {
               _rotation = _rotation + turnSpeed;
            }
            else
            {
               _rotation = _rotation - turnSpeed;
            }
         }
      }
      if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > 5)
      {
         _Y = _Y - (speedBoost + speed) * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + (speedBoost + speed) * Math.sin(moveDirection * 0.017453292519943295);
      }
      else if(action == "draw")
      {
         action = "none";
      }
      else if(action == "entrench")
      {
         action = "placed";
      }
      if(action == "jab")
      {
         if(sLoc < 15)
         {
            sLoc++;
         }
         else
         {
            action = "draw";
            sLoc = 0;
         }
      }
      if(action == "backswing")
      {
         if(sLoc < 20)
         {
            sLoc++;
         }
         else
         {
            action = "swing";
            sLoc = 0;
         }
      }
      if(action == "swing")
      {
         if(sLoc < 20)
         {
            sLoc++;
         }
         else
         {
            action = "draw";
            sLoc = 0;
         }
      }
      deltaQ_x = _X - mommyQueen._x;
      deltaQ_y = _Y - mommyQueen._y;
      toQueen = Math.sqrt(deltaQ_x * deltaQ_x + deltaQ_y * deltaQ_y);
      armRotate = (- Math.atan2(deltaQ_x,deltaQ_y)) / 0.017453292519943295;
      if(eval(mommyQueen) != undefined)
      {
         with(myArm)
         {
            _x = this._x + toQueen * 0.25 * Math.sin(armRotate * 0.017453292519943295);
            _y = this._y - toQueen * 0.25 * Math.cos(armRotate * 0.017453292519943295);
         }
      }
      if(action == "entrench" || action == "placed")
      {
         if(_currentframe == 1)
         {
            if(Math.abs(_xscale > 30))
            {
               if(Right)
               {
                  _xscale = _xscale + 5;
               }
               else
               {
                  _xscale = _xscale - 5;
               }
            }
            else
            {
               if(Right)
               {
                  _xscale = -100;
               }
               else
               {
                  _xscale = 100;
               }
               gotoAndStop(2);
            }
         }
         else if(_currentframe == 2 && action == "placed" && _yscale == 100)
         {
            _yscale = 80;
            ePointX = _X + 40 * Math.sin(_rotation * 0.017453292519943295);
            ePointY = _Y - 40 * Math.cos(_rotation * 0.017453292519943295);
            duplicateMovieClip(_root.GroundCrack,this._name + "Crack",16384 + _global.backgroundDepth++);
            with(eval("_root." + this._name + "Crack"))
            {
               _x = ePointX;
               _y = ePointY;
               _rotation = int(Math.random() * 360) - 179;
               gotoAndPlay((int(Math.random() * 3) + 1) * 2 - 1);
            }
            Pebbles = int(Math.random() * 3) + 1;
            x = 0;
            while(x <= Pebbles)
            {
               duplicateMovieClip(_root.GroundPebble,this._name + "Pebble" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Pebble" + x))
               {
                  _x = ePointX;
                  _y = ePointY;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            Dustpuffs = int(Math.random() * 2);
            x = 0;
            while(x < Dustpuffs)
            {
               duplicateMovieClip(_root.GroundDust,this._name + "Dust" + x,16384 + _global.capDepth++);
               with(eval("_root." + this._name + "Dust" + x))
               {
                  _x = ePointX + int(Math.random() * 20) - 10;
                  _y = ePointY + int(Math.random() * 20) - 10;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            Dirtpuffs = int(Math.random() * 3);
            x = 0;
            while(x < Dirtpuffs)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Dirt" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Dirt" + x))
               {
                  _x = ePointX + int(Math.random() * 10) - 5;
                  _y = ePointY + int(Math.random() * 10) - 5;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            _global.MakeNoise("GrinderHurt");
            _global.MakeNoise("SharpsIn");
            if(int(Math.random() * 2) == 1)
            {
               _global.MakeNoise("Pebble");
            }
            _X = _X + 10 * Math.sin(armRotate * 0.017453292519943295);
            _Y = _Y - 10 * Math.cos(armRotate * 0.017453292519943295);
         }
      }
      if(action == "digup")
      {
         if(_currentframe == 2)
         {
            gotoAndStop(1);
            if(Right)
            {
               _xscale = -30;
            }
            else
            {
               _xscale = 30;
            }
            _yscale = 100;
            ePointX = _X + 40 * Math.sin(_rotation * 0.017453292519943295);
            ePointY = _Y - 40 * Math.cos(_rotation * 0.017453292519943295);
            Pebbles = int(Math.random() * 3) + 1;
            x = 0;
            while(x <= Pebbles)
            {
               duplicateMovieClip(_root.GroundPebble,this._name + "Pebble" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Pebble" + x))
               {
                  _x = ePointX;
                  _y = ePointY;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            Dirtpuffs = int(Math.random() * 3);
            x = 0;
            while(x < Dirtpuffs)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Dirt" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Dirt" + x))
               {
                  _x = ePointX + int(Math.random() * 10) - 5;
                  _y = ePointY + int(Math.random() * 10) - 5;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            if(int(Math.random() * 2) == 1)
            {
               _global.MakeNoise("Pebble");
            }
            _global.MakeNoise("SharpsOut");
         }
         else if(_currentframe == 1 && Math.abs(_xscale) < 100)
         {
            if(Right)
            {
               _xscale = _xscale - 5;
            }
            else
            {
               _xscale = _xscale + 5;
            }
            if(Math.abs(_xscale) == 100)
            {
               action = "none";
            }
         }
      }
      if(eval(mommyQueen) == undefined)
      {
         SplatName = "_root." + myArm._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),myArm._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, int(Math.random() * 360) - 179);
         setProperty(SplatName, _X, myArm._x);
         setProperty(SplatName, _xscale, 60);
         setProperty(SplatName, _Y, myArm._y);
         setProperty(SplatName, _yscale, 60);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(3560301);
         _global.MakeNoise("LilSplat");
         myArm.removeMovieClip();
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, this._rotation - 130);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _xscale, 40);
         setProperty(SplatName, _Y, this._y);
         setProperty(SplatName, _yscale, 40);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(3560301);
         if(action == "swipe")
         {
            turnSpeed = 15;
         }
         if(_rotation > targetRotation)
         {
            turnSpeed *= -1;
         }
         if(speed > 15)
         {
            speed = 15;
         }
         beenDead++;
      }
   }
   else if(!mommy && !_global.pause)
   {
      if(_currentframe != 3)
      {
         moveDirection = int(Math.random() * 360) - 180;
         turnSpeed = int(Math.random() * 18);
         if(int(Math.random() * 2) == 1)
         {
            turnSpeed *= -1;
         }
      }
      gotoAndStop(3);
      _rotation = _rotation + turnSpeed;
      _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
      _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
      beenDead++;
      if(speed > 0)
      {
         speed -= 1;
      }
      else
      {
         speed = 0;
      }
      if(Math.abs(turnSpeed) > 0)
      {
         if(turnSpeed > 0)
         {
            turnSpeed -= 1;
         }
         if(turnSpeed < 0)
         {
            turnSpeed += 1;
         }
      }
      else
      {
         turnSpeed = 0;
      }
      if(beenDead > 200)
      {
         if(_alpha > 0)
         {
            _alpha = _alpha - 5;
         }
         else
         {
            removeMovieClip(this);
         }
      }
   }
}

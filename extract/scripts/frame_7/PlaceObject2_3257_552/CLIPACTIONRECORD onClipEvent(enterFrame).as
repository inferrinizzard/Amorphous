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
      deltaQ_x = _X - mommyQueen._x;
      deltaQ_y = _Y - mommyQueen._y;
      toQueen = Math.sqrt(deltaQ_x * deltaQ_x + deltaQ_y * deltaQ_y);
      speed = int(toQueen / 10);
      if(action == "swipe")
      {
         speed = 7;
         swipeFrames++;
      }
      if(mommyQueen.action == "lunge")
      {
         speed = 12;
      }
      if(action == "none" || action == "pull" && toQueen > 50)
      {
         if(Right)
         {
            zoneOff = mommyQueen._rotation + (int(Math.random() * 90) + 45);
         }
         else
         {
            zoneOff = mommyQueen._rotation - (int(Math.random() * 90) + 45);
         }
         gotoSpotX = mommyQueen._x + (int(Math.random() * 10) + 10) * Math.sin(zoneOff * 0.017453292519943295);
         gotoSpotY = mommyQueen._y - (int(Math.random() * 10) + 10) * Math.cos(zoneOff * 0.017453292519943295);
         action = "pull";
      }
      else if(action == "swipe")
      {
         if(!Right)
         {
            if(sLoc == 0)
            {
               swipeRot = mommyQueen._rotation + 90;
            }
            else
            {
               swipeRot = mommyQueen._rotation;
            }
         }
         else if(sLoc == 0)
         {
            swipeRot = mommyQueen._rotation - 90;
         }
         else
         {
            swipeRot = mommyQueen._rotation;
         }
         gotoSpotX = mommyQueen._x + 30 * Math.sin(swipeRot * 0.017453292519943295);
         gotoSpotY = mommyQueen._y - 30 * Math.cos(swipeRot * 0.017453292519943295);
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               if(justStruck == 0)
               {
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, moveDirection);
                  setProperty(SparkName, _X, this._x);
                  setProperty(SparkName, _Y, this._y);
                  _global.MakeNoise("Clang");
                  if(_global.gameMode != "Practice")
                  {
                     _global.PlayerSparks = _global.PlayerSparks + 1;
                     if(_global.PlayerSparks >= 50)
                     {
                        _global.GainAward("50 Sparks");
                     }
                  }
                  moveDirection = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                  speedBoost = 3;
                  justStruck = 5;
                  if(action == "swipe")
                  {
                     action = "none";
                     sLoc = 0;
                     swipeFrames = 0;
                     mommyQueen.action = "dodge";
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
                        moveDirection -= 180;
                        speedBoost = 3;
                        justStruck = 5;
                        if(action == "swipe")
                        {
                           action = "none";
                           sLoc = 0;
                           swipeFrames = 0;
                           mommyQueen.action = "prowl";
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
         if(targetHazard.hitTest(_X,_Y,true))
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
      if(moveDirection > 180)
      {
         moveDirection -= 360;
      }
      if(moveDirection < -180)
      {
         moveDirection += 360;
      }
      if(mommyQueen._currentframe != 1)
      {
         turnSpeed = 30;
      }
      else
      {
         turnSpeed = 4;
      }
      if(beenDead == 0)
      {
         if(action != "swipe")
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
         else if(Right)
         {
            _rotation = _rotation + 15;
         }
         else
         {
            _rotation = _rotation - 15;
         }
      }
      _Y = _Y - (speedBoost + speed) * Math.cos(moveDirection * 0.017453292519943295);
      _X = _X + (speedBoost + speed) * Math.sin(moveDirection * 0.017453292519943295);
      if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 5)
      {
         if(action == "swipe")
         {
            if(sLoc < 2)
            {
               sLoc++;
            }
            else if(swipeFrames >= 17)
            {
               action = "none";
               sLoc = 0;
               swipeFrames = 0;
               mommyQueen.action = "prowl";
            }
         }
         else
         {
            action = "none";
         }
      }
      if(mommyQueen.action != "swing" && mommyQueen.action != "lunge" && action == "swipe")
      {
         action = "none";
         sLoc = 0;
         swipeFrames = 0;
      }
      armRotate = (- Math.atan2(deltaQ_x,deltaQ_y)) / 0.017453292519943295;
      if(eval(mommyQueen) != undefined)
      {
         with(myArm)
         {
            _x = this._x + toQueen / 2 * Math.sin(armRotate * 0.017453292519943295);
            _y = this._y - toQueen / 2 * Math.cos(armRotate * 0.017453292519943295);
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
         SplatColor.setRGB(16206387);
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
         SplatColor.setRGB(16206387);
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
      gotoAndStop(2);
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

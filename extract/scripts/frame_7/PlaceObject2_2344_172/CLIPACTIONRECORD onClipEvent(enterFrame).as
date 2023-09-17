onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(beenDead > 0 && _currentframe < 31)
      {
         play();
      }
      if(beenDead == 0)
      {
         _rotation = _rotation + 30;
         if(framesExisted > 120)
         {
            wayBack = true;
            turnSpeed = 30;
         }
      }
      if(speedBoost > 0)
      {
         speedBoost -= 0.5;
      }
      if(justStruck > 0)
      {
         justStruck--;
      }
      if(wayBack)
      {
         gotoSpotX = daddyHorror._x;
         gotoSpotY = daddyHorror._y;
      }
      if(eval(daddyHorror) == undefined || beenDead > 0)
      {
         if(beenDead == 0)
         {
            play();
            speed = 0;
            turnSpeed = 0;
            speedBoost = 0;
         }
         else if(beenDead < 150)
         {
            if(_currentframe == 31)
            {
               stop();
            }
         }
         else if(_alpha > 0)
         {
            _alpha = _alpha - 5;
         }
         else
         {
            removeMovieClip(this);
         }
         beenDead++;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               if(justStruck == 0 && beenDead == 0)
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
                  justStruck = 20;
               }
            }
         }
      }
      if(beenDead == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            _global.justHit = this;
         }
         else
         {
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != daddyHorror._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  if(hitTarget.hitTest(_X,_Y,true))
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
                           toMyX = hitTarget._x - _X;
                           toMyY = hitTarget._y - _Y;
                           toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                           moveDirection = toMyDir;
                           speedBoost = 3;
                           justStruck = 5;
                           hitTarget.killedBy = this;
                        }
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
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(moveDirection > 180)
      {
         moveDirection -= 360;
      }
      if(moveDirection < -180)
      {
         moveDirection += 360;
      }
      if(moveDirection != targetRotation)
      {
         if(moveDirection >= 0 && targetRotation >= 0)
         {
            if(moveDirection > targetRotation)
            {
               if(moveDirection - targetRotation > turnSpeed)
               {
                  moveDirection -= turnSpeed;
               }
               else
               {
                  moveDirection = targetRotation;
               }
            }
            else if(targetRotation - moveDirection > turnSpeed)
            {
               moveDirection += turnSpeed;
            }
            else
            {
               moveDirection = targetRotation;
            }
         }
         else if(moveDirection < 0 && targetRotation < 0)
         {
            if(moveDirection > targetRotation)
            {
               if(moveDirection - targetRotation > turnSpeed)
               {
                  moveDirection -= turnSpeed;
               }
               else
               {
                  moveDirection = targetRotation;
               }
            }
            else if(targetRotation - moveDirection > turnSpeed)
            {
               moveDirection += turnSpeed;
            }
            else
            {
               moveDirection = targetRotation;
            }
         }
         else if(moveDirection > targetRotation)
         {
            if(moveDirection < targetRotation + 180)
            {
               moveDirection -= turnSpeed;
            }
            else
            {
               moveDirection += turnSpeed;
            }
         }
         else if(moveDirection > targetRotation - 180)
         {
            moveDirection += turnSpeed;
         }
         else
         {
            moveDirection -= turnSpeed;
         }
      }
      if(beenDead == 0)
      {
         _Y = _Y - (speedBoost + speed) * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + (speedBoost + speed) * Math.sin(moveDirection * 0.017453292519943295);
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 30)
         {
            if(!wayBack)
            {
               gotoSpotX = daddyHorror._x;
               gotoSpotY = daddyHorror._y;
               wayBack = true;
            }
            else if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 15)
            {
               speed = 0.5;
            }
            else
            {
               speed = 8;
            }
         }
         else
         {
            speed = 8;
         }
      }
      framesExisted++;
   }
   else
   {
      stop();
   }
}

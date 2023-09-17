onClipEvent(enterFrame){
   if(!mommy && beenDead == 0 && !_global.pause)
   {
      if(speedBoost > 0)
      {
         speedBoost -= 0.5;
      }
      if(mommyQueen.action == "lash" || mommyQueen.mode == "turret")
      {
         stretch = 30;
      }
      else
      {
         stretch = 10;
      }
      zoneOff = Anchor._rotation - 180;
      gotoSpotX = Anchor._x + stretch * Math.sin(zoneOff * 0.017453292519943295);
      gotoSpotY = Anchor._y - stretch * Math.cos(zoneOff * 0.017453292519943295);
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      toSpot = Math.sqrt(delta_x * delta_x + delta_y * delta_y);
      speed = int(toSpot / 10);
      if(mommyQueen.action == "lunge" || mommyQueen.action == "lash")
      {
         speed *= 2;
      }
      if(toSpot < speed)
      {
         speed = toSpot;
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
                        if(_global.gameMode != "Practice")
                        {
                           _global.PlayerSparks = _global.PlayerSparks + 1;
                           if(_global.PlayerSparks >= 50)
                           {
                              _global.GainAward("50 Sparks");
                           }
                        }
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
      moveDirection = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(moveDirection > 180)
      {
         moveDirection -= 360;
      }
      if(moveDirection < -180)
      {
         moveDirection += 360;
      }
      deltaQ_x = _X - Anchor._x;
      deltaQ_y = _Y - Anchor._y;
      _rotation = (- Math.atan2(deltaQ_x,deltaQ_y)) / 0.017453292519943295;
      _Y = _Y - (speedBoost + speed) * Math.cos(moveDirection * 0.017453292519943295);
      _X = _X + (speedBoost + speed) * Math.sin(moveDirection * 0.017453292519943295);
      if(eval(mommyQueen) == undefined)
      {
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
      if(_currentframe != 2)
      {
         moveDirection = int(Math.random() * 360) - 180;
         speed = int(Math.random() * 4);
         turnSpeed = int(Math.random() * 25);
         if(int(Math.random() * 2) == 1)
         {
            turnSpeed *= -1;
         }
      }
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
            turnSpeed -= 0.5;
         }
         if(turnSpeed < 0)
         {
            turnSpeed += 0.5;
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

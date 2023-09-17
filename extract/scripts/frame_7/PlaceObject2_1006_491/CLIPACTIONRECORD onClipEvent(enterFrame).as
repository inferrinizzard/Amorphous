onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(_root.myLure.luring)
      {
         gotoSpotX = _root.myLure._x;
         gotoSpotY = _root.myLure._y;
      }
      else if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      if(exploded)
      {
         exploded = false;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(8589215);
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 50;
               _global.GainAward("First Void Eater");
               _global.KillCount("Void Eater",3);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"VoidEater") == null)
               {
                  EnemiesKilled.push("VoidEater");
               }
               removeMovieClip(eval(myDim));
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
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
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  hitTarget.killedBy = this;
               }
            }
            x++;
         }
      }
      if(killedBy != null)
      {
         if(killedBy._name.slice(0,5) == "Sharp" || killedBy._name.slice(0,7) == "Grinder" || killedBy.exploded || killedBy.claw)
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t50";
            }
            toKillX = _X - killedBy._x;
            toKillY = _Y - killedBy._y;
            killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
            killDir -= 180;
            SplatName = "_root." + this._name + "Splat";
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, killDir);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _Y, this._y);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(8589215);
            _global.MakeNoise("Splat");
            removeMovieClip(eval(myDim));
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
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
      if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
      {
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
      {
         gotoSpotX = int(Math.random() * 540) + 6;
         gotoSpotY = int(Math.random() * 390) + 6;
      }
      proximity = false;
      if(action == "none" || action == "grav")
      {
         if(_root.myLure.luring)
         {
            toHazardX = _X - _root.myLure._x;
            toHazardY = _Y - _root.myLure._y;
         }
         else
         {
            toHazardX = _X - _root.HeroPointer._x;
            toHazardY = _Y - _root.HeroPointer._y;
         }
         if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 120)
         {
            proximity = true;
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _name)
            {
               hazTarget = eval("_root." + _global.Enemies[x]);
               toHazardX = _X - hazTarget._x;
               toHazardY = _Y - hazTarget._y;
               if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 50)
               {
                  proximity = true;
               }
            }
            x++;
         }
      }
      if(action == "none" && eval(_root.HeroPointer) != undefined && !proximity && _currentframe < 71)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 200)
         {
            if(Math.abs(_rotation - targetRotation) < 20 && int(Math.random() * 10) == 1)
            {
               gotoAndPlay(81);
            }
         }
      }
      if(action == "none" && !proximity && int(Math.random() * 60) == 1 && _currentframe < 71)
      {
         action = "grav";
         gotoAndPlay(71);
      }
      if(proximity && _currentframe < 71 && pulseDown == 0)
      {
         action == "none";
         gotoAndPlay(71);
      }
      if(_currentframe == 78)
      {
         stop();
         speed = 0;
         turnspeed = 0;
         if(action == "none" || action == "grav")
         {
            if(_xscale > 20)
            {
               _xscale = _xscale - 20;
               _yscale = _yscale - 20;
            }
            else if(action == "none")
            {
               action = "pulse";
               pulseDown = 20;
               exploded = true;
               pulseName = _name + "Pulse" + _global.effectDepth;
               duplicateMovieClip(_root.VoidPulse,pulseName,16384 + _global.effectDepth++);
               with(eval("_root." + pulseName))
               {
                  _x = this._x;
                  _y = this._y;
               }
               _global.MakeNoise("VoidPulse");
               if(eval(_root.HeroPointer) != undefined && _global.justHit == null)
               {
                  Trudelta_x = _X - _root.HeroPointer._x;
                  Trudelta_y = _Y - _root.HeroPointer._y;
                  if(Math.sqrt(Trudelta_x * Trudelta_x + Trudelta_y * Trudelta_y) <= 120)
                  {
                     _global.justHit = this;
                  }
               }
               x = 0;
               while(x < _global.Enemies.length)
               {
                  if(_global.Enemies[x] != _name)
                  {
                     hitTarget = eval("_root." + _global.Enemies[x]);
                     toTargetX = _X - hitTarget._x;
                     toTargetY = _Y - hitTarget._y;
                     targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                     if(Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY) <= 150)
                     {
                        hitTarget.killedBy = this;
                     }
                  }
                  x++;
               }
            }
            else if(action == "grav")
            {
               if(eval("_root." + _name + "Spiral") == undefined)
               {
                  duplicateMovieClip(_root.VoidSpiral,_name + "Spiral",16384 + _global.effectDepth++);
                  with(eval("_root." + _name + "Spiral"))
                  {
                     _x = this._x;
                     _y = this._y;
                  }
               }
               myDim = "_root." + _name + "Dim";
               if(eval(myDim) == undefined)
               {
                  duplicateMovieClip(_root.Blackout,_name + "Dim",22384);
                  with(eval(myDim))
                  {
                     _x = 275;
                     _y = 200;
                     _xscale = 1000;
                     _yscale = 1000;
                     _alpha = 20;
                  }
               }
               if(_root.HeroPointer != undefined)
               {
                  toMyX = _root.HeroPointer._x - _X;
                  toMyY = _root.HeroPointer._y - _Y;
                  toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                  suitTab = eval(_global.RewardTab("Hazard Suit"));
                  if(suitTab != null && suitTab.charge > 1)
                  {
                     suitTab.charge--;
                     _root.HeroPointer._y -= 1 * Math.cos(toMyDir * 0.017453292519943295);
                     _root.HeroPointer._x += 1 * Math.sin(toMyDir * 0.017453292519943295);
                  }
                  else
                  {
                     _root.HeroPointer._y -= 4 * Math.cos(toMyDir * 0.017453292519943295);
                     _root.HeroPointer._x += 4 * Math.sin(toMyDir * 0.017453292519943295);
                  }
               }
               x = 0;
               while(x < _global.Enemies.length)
               {
                  if(_global.Enemies[x] != _name && _global.Enemies[x].slice(0,7) != "Grinder")
                  {
                     hitTarget = eval("_root." + _global.Enemies[x]);
                     if(!(hitTarget._name.slice(0,4) == "Gray" && hitTarget.action != "none"))
                     {
                        if(hitTarget._name.slice(0,5) != "myBox")
                        {
                           toMyX = hitTarget._x - _X;
                           toMyY = hitTarget._y - _Y;
                           toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                           hitTarget._y -= 4 * Math.cos(toMyDir * 0.017453292519943295);
                           hitTarget._x += 4 * Math.sin(toMyDir * 0.017453292519943295);
                        }
                     }
                  }
                  x++;
               }
               if(proximity && pulseDown == 0)
               {
                  removeMovieClip(eval(myDim));
                  removeMovieClip(eval("_root." + _name + "Spiral"));
                  action = "none";
               }
            }
         }
         else if(action == "pulse")
         {
            if(_xscale < 100)
            {
               _xscale = _xscale + 20;
               _yscale = _yscale + 20;
            }
            else
            {
               speed = 1;
               turnSpeed = 1;
               action = "none";
               gotoAndPlay(1);
            }
         }
      }
      if(_currentframe == 107)
      {
         if(chargedUp == 0)
         {
            stop();
            speed = 0;
            turnSpeed = 0;
            action = "charge";
            chargePointY = _Y - 20 * Math.cos(_rotation * 0.017453292519943295);
            chargePointX = _X + 20 * Math.sin(_rotation * 0.017453292519943295);
            myDim = "_root." + _name + "Dim";
            if(eval(myDim) == undefined)
            {
               duplicateMovieClip(_root.Blackout,_name + "Dim",22384);
               with(eval(myDim))
               {
                  _x = 275;
                  _y = 200;
                  _xscale = 1000;
                  _yscale = 1000;
                  _alpha = 20;
               }
            }
            chargedUp++;
         }
         else if(chargedUp < 45)
         {
            stop();
            if(int(chargedUp / 5) == chargedUp / 5)
            {
               chargeDir = _rotation + int(Math.random() * 180) - 90;
               duplicateMovieClip(_root.VoidBall,_name + "Charge" + chargedUp,16384 + _global.effectDepth++);
               myCharge = eval("_root." + _name + "Charge" + chargedUp);
               with(myCharge)
               {
                  _y = chargePointY - 50 * Math.cos(chargeDir * 0.017453292519943295);
                  _x = chargePointX + 50 * Math.sin(chargeDir * 0.017453292519943295);
                  _rotation = chargeDir - 180;
               }
            }
            chargedUp++;
         }
         else
         {
            if(eval(myDim) != undefined)
            {
               removeMovieClip(eval(myDim));
            }
            chargedUp = 0;
            play();
         }
      }
      if(_currentframe == 109)
      {
         stop();
         if(action == "charge")
         {
            duplicateMovieClip(_root.VoidBeam,_name + "Beam",16384 + _global.effectDepth++);
            myBeam = eval("_root." + _name + "Beam");
            with(myBeam)
            {
               _y = this._y - 10 * Math.cos(this._rotation * 0.017453292519943295);
               _x = this._x + 10 * Math.sin(this._rotation * 0.017453292519943295);
               _rotation = this._rotation;
               _yscale = 4000;
            }
            action = "shoot";
         }
         else if(eval(myBeam) == undefined)
         {
            speed = 1;
            turnSpeed = 1;
            action = "none";
            play();
         }
      }
      if(_currentframe == 70)
      {
         gotoAndPlay(11);
      }
      if(_currentframe == 117)
      {
         gotoAndPlay(1);
      }
      if(eval("_root." + _name + "Spiral") != undefined)
      {
         with(eval("_root." + _name + "Spiral"))
         {
            _x = this._x;
            _y = this._y;
         }
      }
      if(pulseDown > 0)
      {
         pulseDown--;
      }
   }
   else
   {
      stop();
   }
}

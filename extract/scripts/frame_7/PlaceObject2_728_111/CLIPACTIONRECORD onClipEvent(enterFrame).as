onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(_currentframe != 126 && _currentframe != 127)
      {
         play();
      }
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
      if(recoil > 0)
      {
         recoil--;
         if(recoil == 18)
         {
            action = "none";
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            distance_x = _X - _root.HeroPointer._x;
            distance_y = _Y - _root.HeroPointer._y;
            adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
            impactPointY = _Y - 10 * Math.cos(adjustedRotation * 0.017453292519943295);
            impactPointX = _X + 10 * Math.sin(adjustedRotation * 0.017453292519943295);
            if(_root.HeroSwing.hittest(impactPointX,impactPointY,true) && recoil == 0)
            {
               if(action != "gaurd")
               {
                  health--;
                  recoil = 20;
                  action = "stun";
                  SplatName = "_root." + this._name + "Splat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _Y, this._y);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(9803157);
                  if(health == 0 || _global.RazorGlaiveEquipped)
                  {
                     SplatName = "_root." + this._name + "BigSplat";
                     duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
                     setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                     setProperty(SplatName, _X, this._x);
                     setProperty(SplatName, _xscale, 170);
                     setProperty(SplatName, _Y, this._y);
                     setProperty(SplatName, _yscale, 170);
                     SplatColor = new Color(eval(SplatName));
                     SplatColor.setRGB(9803157);
                     _global.MakeNoise("Pop");
                     _global.MakeNoise("Splash");
                     duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                     setProperty("_root." + _name + "Bounty", _X, this._x);
                     setProperty("_root." + _name + "Bounty", _Y, this._y);
                     BountyObject = eval("_root." + _name + "Bounty");
                     BountyObject.bounty = 35;
                     _global.GainAward("First Gray");
                     _global.KillCount("Gray",5);
                     _root.Census.colorsOnKill.push(_name);
                     if(SearchArray(EnemiesKilled,"Gray") == null)
                     {
                        EnemiesKilled.push("Gray");
                     }
                     _visible = false;
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                     this.removeMovieClip();
                  }
                  else
                  {
                     _global.MakeNoise("Slice");
                  }
               }
               else
               {
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                  setProperty(SparkName, _X, this._x);
                  setProperty(SparkName, _Y, this._y);
                  if(_global.gameMode != "Practice")
                  {
                     _global.PlayerSparks = _global.PlayerSparks + 1;
                     if(_global.PlayerSparks >= 50)
                     {
                        _global.GainAward("50 Sparks");
                     }
                  }
                  _global.MakeNoise("Clang");
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
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  if(hitTarget._name.slice(0,7) == "Gloople" && int(Math.random() * 100) + 1 < 11)
                  {
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                     duplicateMovieClip(_root.GrayGlom,"Glom" + _name.slice(4),16384 + _global.baddieDepth++);
                     _global.Enemies.push("Glom" + _name.slice(4));
                     Glommie = eval("_root.Glom" + _name.slice(4));
                     with(Glommie)
                     {
                        _x = this._x;
                        _y = this._y;
                        _rotation = (- Math.atan2(this._x - hitTarget._x,this._y - hitTarget._y)) / 0.017453292519943295;
                     }
                     _global.MakeNoise("Glom");
                     removeMovieClip(hitTarget);
                     this.removeMovieClip();
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
      if(killedBy != null)
      {
         if(killedBy._name.slice(0,5) == "Sharp" || killedBy._name.slice(0,4) == "Gray" || killedBy._name.slice(0,7) == "Grinder" || killedBy.exploded || killedBy._name.slice(0,6) == "Horror" || killedBy.claw)
         {
            if(action != "gaurd")
            {
               if(killedBy.tool)
               {
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = "t35";
               }
               toKillX = _X - killedBy._x;
               toKillY = _Y - killedBy._y;
               killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
               killDir -= 180;
               SplatName = "_root." + this._name + "BigSplat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, killDir);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 170);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 170);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(9803157);
               _global.MakeNoise("Pop");
               _global.MakeNoise("Splash");
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
            else
            {
               killedBy = null;
            }
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
      hazard = false;
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
      if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 100)
      {
         if(_global.HeroAction == "attacking")
         {
            hazard = true;
         }
      }
      x = 0;
      while(x < _global.Enemies.length)
      {
         if(_global.Enemies[x] != _name)
         {
            hazTarget = eval("_root." + _global.Enemies[x]);
            if(hazTarget.claw || hazTarget._name.slice(0,5) == "Sharp" || hazTarget._name.slice(0,7) == "Grinder" && !hazTarget.wall)
            {
               toHazardX = _X - hazTarget._x;
               toHazardY = _Y - hazTarget._y;
               if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 100)
               {
                  hazard = true;
               }
            }
         }
         x++;
      }
      x = 0;
      while(x < _global.Hazards.length)
      {
         targetHazard = eval("_root." + _global.Hazards[x]);
         if(targetHazard._name.slice(0,6) == "Meltie")
         {
            p = 10;
            while(p < 70)
            {
               ProjPathX = _X + p * Math.sin(_rotation * 0.017453292519943295);
               ProjPathY = _Y - p * Math.cos(_rotation * 0.017453292519943295);
               if(targetHazard.hitTest(ProjPathX,ProjPathY,false))
               {
                  hazard = true;
               }
               p += 10;
            }
         }
         x++;
      }
      if(action == "none" && eval(_root.HeroPointer) != undefined && _currentframe < 55)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 210)
         {
            if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > 120)
            {
               if(Math.abs(_rotation - targetRotation) < 20)
               {
                  gotoAndPlay(101);
               }
            }
         }
      }
      if(hazard == true && (action == "none" || action == "reel") && (_currentframe < 55 || _currentframe > 92))
      {
         gotoAndPlay(55);
         speed = 1;
      }
      if(_currentframe > 55 && _currentframe < 93)
      {
         speed = 0;
         action = "gaurd";
      }
      if(_currentframe > 92 && _currentframe < 100)
      {
         speed = 1;
         action = "none";
      }
      if(_currentframe == 51 || _currentframe == 100 || _currentframe == 140)
      {
         speed = 2;
         turnSpeed = 2;
         action = "none";
         gotoAndPlay(11);
      }
      if(_currentframe > 100 && _currentframe < 126)
      {
         speed = 1;
         action = "none";
      }
      if(_currentframe == 126 && action == "none")
      {
         speed = 0;
         turnSpeed = 0;
         stop();
         action = "lance";
         duplicateMovieClip(_root.GrayTip,_name + "Tip",16384 + _global.baddieDepth++);
         with(eval("_root." + _name + "Tip"))
         {
            _y = this._y - 25 * Math.cos(this._rotation * 0.017453292519943295);
            _x = this._x + 25 * Math.sin(this._rotation * 0.017453292519943295);
            _rotation = this._rotation;
         }
         _global.MakeNoise("GraySpear");
      }
      if(_currentframe == 126 && action == "reel")
      {
         gotoAndStop(127);
      }
      if(_currentframe == 127 && action == "none")
      {
         speed = 1;
         turnSpeed = 2;
         play();
      }
      if(action == "stun")
      {
         gotoAndPlay(1);
      }
   }
   else
   {
      stop();
   }
}

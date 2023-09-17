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
      else if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
      {
         gotoSpotX = int(Math.random() * 540) + 6;
         gotoSpotY = int(Math.random() * 390) + 6;
      }
      if(speedBoost > 0)
      {
         speedBoost -= 0.5;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               if(justStruck == 0)
               {
                  if(!spines || _global.RazorGlaiveEquipped)
                  {
                     if(spines)
                     {
                        SparkName = "_root." + this._name + "Sparks";
                        duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                        setProperty(SparkName, _rotation, this._rotation);
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
                     SplatName = "_root." + this._name + "Splat";
                     duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                     setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                     setProperty(SplatName, _X, this._x);
                     setProperty(SplatName, _Y, this._y);
                     SplatColor = new Color(eval(SplatName));
                     SplatColor.setRGB(4776397);
                     _global.MakeNoise("Splat");
                     duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                     setProperty("_root." + _name + "Bounty", _X, this._x);
                     setProperty("_root." + _name + "Bounty", _Y, this._y);
                     BountyObject = eval("_root." + _name + "Bounty");
                     BountyObject.bounty = 12;
                     _global.GainAward("First Sharp");
                     _global.KillCount("Sharp",10);
                     _root.Census.colorsOnKill.push(_name);
                     if(SearchArray(EnemiesKilled,"Sharp") == null)
                     {
                        EnemiesKilled.push("Sharp");
                     }
                     _visible = false;
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                     this.removeMovieClip();
                  }
                  else
                  {
                     SparkName = "_root." + this._name + "Sparks";
                     duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                     setProperty(SparkName, _rotation, this._rotation);
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
                     _rotation = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                     speedBoost = 3;
                     justStruck = 20;
                     rattled = 50;
                     HerosFault = 60;
                  }
               }
            }
         }
      }
      if(justStruck > 0)
      {
         justStruck--;
      }
      if(killedBy != null && !spines)
      {
         if(killedBy.tool)
         {
            duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
            setProperty("_root." + _name + "Bounty", _X, this._x);
            setProperty("_root." + _name + "Bounty", _Y, this._y);
            BountyObject = eval("_root." + _name + "Bounty");
            BountyObject.bounty = "t12";
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
         SplatColor.setRGB(4776397);
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      else if(killedBy != null)
      {
         if(killedBy.exploded)
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t12";
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
            SplatColor.setRGB(4776397);
            _global.MakeNoise("Splat");
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
         else if(killedBy._name.slice(0,3) == "Ooz")
         {
            killedBy = null;
         }
         else
         {
            SparkName = "_root." + this._name + "Sparks";
            duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
            setProperty(SparkName, _rotation, this._rotation);
            setProperty(SparkName, _X, this._x);
            setProperty(SparkName, _Y, this._y);
            _global.MakeNoise("Clang");
            _rotation = killedBy._rotation + int(Math.random() * 61) + 30;
            speedBoost = 3;
            justStruck = 20;
            rattled = 50;
            killedBy = null;
         }
      }
      if(justBounced == 0)
      {
         if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
         {
            if(!spines)
            {
               justBounced = 8;
               bouncedOffX = _root.HeroPointer._x;
               bouncedOffY = _root.HeroPointer._y;
               _global.justHit = this;
            }
            else
            {
               _global.justHit = this;
               armorTab = eval(_global.RewardTab("Armor"));
               if(armorTab == null || armorTab.charge != 300)
               {
                  duplicateMovieClip(_root.HeroImpaled,_name + "Impale",16384 + _global.heroDepth++);
                  myImpale = eval("_root." + _name + "Impale");
                  with(myImpale)
                  {
                     _x = this._x;
                     _y = this._y;
                     _rotation = this._rotation;
                  }
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  _visible = false;
               }
            }
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
                     if(!spines)
                     {
                        justBounced = 8;
                        bouncedOffX = hitTarget._x;
                        bouncedOffY = hitTarget._y;
                        break;
                     }
                     if(hitTarget._name.slice(0,5) == "Sharp" && hitTarget.spines || hitTarget._name.slice(0,7) == "Grinder")
                     {
                        justBounced = 8;
                        bouncedOffX = hitTarget._x;
                        bouncedOffY = hitTarget._y;
                        break;
                     }
                     hitTarget.killedBy = this;
                     if(HerosFault > 0)
                     {
                        _global.GainAward("Sharp as Weapon");
                     }
                  }
               }
               x++;
            }
         }
         if(justBounced != 0)
         {
            if(spines)
            {
               SparkName = "_root." + this._name + "Sparks";
               duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
               setProperty(SparkName, _rotation, this._rotation);
               setProperty(SparkName, _X, this._x);
               setProperty(SparkName, _Y, this._y);
               _global.MakeNoise("Clang");
            }
            else
            {
               _global.MakeNoise("Boing");
            }
            if(_X > bouncedOffX)
            {
               BouncetoSpotX = int(Math.random() * (550 - _X)) + _X + 20;
            }
            else
            {
               BouncetoSpotX = int(Math.random() * _X) - 19;
            }
            if(_Y > bouncedOffY)
            {
               BouncetoSpotY = int(Math.random() * (400 - _Y)) + _Y + 20;
            }
            else
            {
               BouncetoSpotY = int(Math.random() * _Y) - 19;
            }
            delta_bounceX = Math.abs(_X - bouncedOffX);
            delta_bounceY = Math.abs(_Y - bouncedOffY);
            if(delta_bounceX > delta_bounceY)
            {
               if(BouncetoSpotX > 275)
               {
                  BouncetoSpotX = 555;
               }
               else
               {
                  BouncetoSpotX = -5;
               }
            }
            else if(BouncetoSpotY > 200)
            {
               BouncetoSpotY = 405;
            }
            else
            {
               BouncetoSpotY = -5;
            }
            _rotation = (- Math.atan2(_X - BouncetoSpotX,_Y - BouncetoSpotY)) / 0.017453292519943295;
         }
      }
      else
      {
         justBounced--;
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
         _Y = _Y - (speed + speedBoost) * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + (speed + speedBoost) * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         if(HerosFault > 0)
         {
            _global.GainAward("Fling Sharp");
         }
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(hazard)
      {
         if(_currentframe < 42)
         {
            gotoAndPlay(42);
         }
         if(_currentframe == 76)
         {
            gotoAndPlay(56);
         }
      }
      else if(_currentframe == 41)
      {
         gotoAndPlay(1);
      }
      hazard = false;
      if(_currentframe == 45)
      {
         _global.MakeNoise("SharpsOut");
      }
      if(_currentframe == 77)
      {
         _global.MakeNoise("SharpsIn");
      }
      if(eval("_root." + _name + "Flame") != undefined)
      {
         gotoAndStop(1);
      }
      if(eval("_root." + _name + "Goo") != undefined)
      {
         gotoAndStop(1);
      }
      if(eval("_root." + _name + "Morph") != undefined)
      {
         gotoAndStop(1);
      }
      if(eval("_root." + _name + "GloopleBurn") != undefined)
      {
         gotoAndStop(1);
      }
      if(eval("_root." + _name + "GloopleMelt") != undefined)
      {
         gotoAndStop(1);
      }
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
      hazardRotation = (- Math.atan2(toHazardX,toHazardY)) / 0.017453292519943295;
      if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 200)
      {
         if(Math.abs(_rotation - hazardRotation) < 60)
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
            toHazardX = _X - hazTarget._x;
            toHazardY = _Y - hazTarget._y;
            hazardRotation = (- Math.atan2(toHazardX,toHazardY)) / 0.017453292519943295;
            if(Math.sqrt(toHazardX * toHazardX + toHazardY * toHazardY) <= 100)
            {
               if(Math.abs(_rotation - hazardRotation) < 30)
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
         x++;
      }
      if(rattled > 0)
      {
         hazard = true;
         rattled--;
      }
      if(HerosFault > 0)
      {
         HerosFault--;
      }
      if(_currentframe < 46 || _currentframe > 89)
      {
         spines = false;
         turnspeed = 3;
      }
      else
      {
         spines = true;
         turnspeed = 2;
      }
   }
   else
   {
      stop();
   }
}

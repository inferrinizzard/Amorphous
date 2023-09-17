onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(exploded)
      {
         removeMovieClip(this);
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
      if(eval("_root." + _name + "Flame") != undefined)
      {
         exploded = true;
         _global.MakeNoise("Explode");
         duplicateMovieClip(_root.VoidPulse,_name + "Shockwave",16384 + _global.effectDepth++);
         with(eval("_root." + _name + "Shockwave"))
         {
            _x = this._x;
            _y = this._y;
         }
         duplicateMovieClip(_root.Blastmark,this._name + "Blastmark",16384 + _global.backgroundDepth++);
         with(eval("_root." + this._name + "Blastmark"))
         {
            _x = this._x;
            _y = this._y;
         }
         duplicateMovieClip(_root.Blackout,this._name + "Bright",22384);
         with(eval("_root." + this._name + "Bright"))
         {
            _x = 275;
            _y = 200;
            _xscale = 1000;
            _yscale = 1000;
         }
         BlinkColor = new Color(eval("_root." + this._name + "Bright"));
         BlinkColor.setRGB(16777215);
         x = 1;
         while(x < 5)
         {
            FireName = "_root." + this._name + "Fire" + littleFires;
            duplicateMovieClip(_root.SmallFire,this._name + "Fire" + littleFires,16384 + _global.effectDepth++);
            setProperty(FireName, _X, this._x + int(Math.random() * 160) - 80);
            setProperty(FireName, _Y, this._y + int(Math.random() * 160) - 80);
            littleFires++;
            x++;
         }
         ashpuffs = int(Math.random() * 3) + 2;
         x = 0;
         while(x < ashpuffs)
         {
            duplicateMovieClip(_root.GroundDirt,this._name + "Ash" + x,16384 + _global.effectDepth++);
            with(eval("_root." + this._name + "Ash" + x))
            {
               _x = this._x;
               _y = this._y;
               _rotation = int(Math.random() * 360) - 179;
            }
            AshColor = new Color(eval("_root." + this._name + "Ash" + x));
            AshColor.setRGB(0);
            x++;
         }
         FireName = "_root." + this._name + "BigFire";
         duplicateMovieClip(_root.BigFire,this._name + "BigFire",16384 + _global.effectDepth++);
         setProperty(FireName, _X, this._x);
         setProperty(FireName, _Y, this._y);
         if(eval(_root.HeroPointer) != undefined && _global.justHit == null)
         {
            _global.justHit = this;
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
               if(Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY) <= 250)
               {
                  hitTarget.killedBy = this;
               }
               else if(!hitTarget.wall && !hitTarget.tool)
               {
                  hitTarget._y -= 30 * Math.cos(targetDirection * 0.017453292519943295);
                  hitTarget._x += 30 * Math.sin(targetDirection * 0.017453292519943295);
                  hitTarget._rotation = targetDirection;
               }
            }
            x++;
         }
         x = 0;
         while(x < _global.Hazards.length)
         {
            targetHazard = eval("_root." + _global.Hazards[x]);
            if(targetHazard._name.slice(0,5) == "Razor")
            {
               toTargetX = _X - targetHazard._x;
               toTargetY = _Y - targetHazard._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               if(Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY) <= 250)
               {
                  targetHazard.killedBy = this;
               }
            }
            x++;
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               SplatName = "_root." + this._name + "Splat";
               SplatNum = int(Math.random() * 3) + 1;
               duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(0);
               duplicateMovieClip(_root.OilMark,this._name + "SplatOilMark",16384 + _global.markDepth++);
               with(eval(SplatName + "OilMark"))
               {
                  _x = this._x;
                  _y = this._y;
                  gotoAndStop(SplatNum);
               }
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 8;
               _global.GainAward("First Inkie");
               _global.KillCount("Inkie",30);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Inkie") == null)
               {
                  EnemiesKilled.push("Inkie");
               }
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
         }
      }
      if(killedBy != null)
      {
         if(killedBy.tool)
         {
            duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
            setProperty("_root." + _name + "Bounty", _X, this._x);
            setProperty("_root." + _name + "Bounty", _Y, this._y);
            BountyObject = eval("_root." + _name + "Bounty");
            BountyObject.bounty = "t8";
         }
         toKillX = _X - killedBy._x;
         toKillY = _Y - killedBy._y;
         killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         killDir -= 180;
         SplatName = "_root." + this._name + "Splat";
         SplatNum = int(Math.random() * 3) + 1;
         duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killDir);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(0);
         duplicateMovieClip(_root.OilMark,this._name + "SplatOilMark",16384 + _global.markDepth++);
         with(eval(SplatName + "OilMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(_root.HeroPointer.hitTest(_X,_Y,true))
      {
         objectHitX = _root.HeroPointer._x;
         objectHitY = _root.HeroPointer._y;
         _global.justHit = this;
         _root.Census.perfectRun = false;
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab != null && suitTab.charge > 1)
         {
            suitTab.charge -= 100;
         }
         else
         {
            duplicateMovieClip(_root.Blackout,this._name + "Blackout",22384);
            with(eval("_root." + this._name + "Blackout"))
            {
               _x = 275;
               _y = 200;
               _xscale = 1000;
               _yscale = 1000;
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
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  objectHitX = hitTarget._x;
                  objectHitY = hitTarget._y;
                  break;
               }
            }
            x++;
         }
      }
      if(objectHitX != null && objectHitY != null)
      {
         SplatName = "_root." + this._name + "Splat";
         SplatNum = int(Math.random() * 3) + 1;
         duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, (- Math.atan2(_X - objectHitX,_Y - objectHitY)) / 0.017453292519943295);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(0);
         duplicateMovieClip(_root.OilMark,this._name + "SplatOilMark",16384 + _global.markDepth++);
         with(eval(SplatName + "OilMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
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
   }
   else
   {
      stop();
   }
}

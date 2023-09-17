onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(exploded)
      {
         removeMovieClip(this);
      }
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(eval(myFire) == undefined)
      {
         burning = false;
         framesBurned = 0;
         play();
      }
      else
      {
         gotoAndStop(1);
         burning = true;
         if(framesBurned > 120 && int(Math.random() * 100) == 1)
         {
            duplicateMovieClip(_root.WhiteSmoke,_name + "WSmoke",16384 + _global.capDepth++);
            with(eval("_root." + _name + "WSmoke"))
            {
               _x = this._x;
               _y = this._y;
            }
            removeMovieClip(myFire);
         }
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
      if(burning)
      {
         if(int(framesBurned / 8) == framesBurned / 8)
         {
            FireName = "_root." + this._name + "Fire" + littleFires;
            duplicateMovieClip(_root.SmallFire,this._name + "Fire" + littleFires,16384 + _global.effectDepth++);
            setProperty(FireName, _X, this._x);
            setProperty(FireName, _Y, this._y);
            littleFires++;
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               if(burning)
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
               else
               {
                  SplatName = "_root." + this._name + "Splat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _Y, this._y);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(8207650);
                  _global.MakeNoise("Splat");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 28;
                  _global.GainAward("First Torchie");
                  _global.KillCount("Torchie",6);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Torchie") == null)
                  {
                     EnemiesKilled.push("Torchie");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
            }
         }
      }
      if(killedBy != null)
      {
         if(burning)
         {
            exploded = true;
            _global.MakeNoise("Explode");
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
            duplicateMovieClip(_root.Blastmark,this._name + "Blastmark",16384 + _global.backgroundDepth++);
            with(eval("_root." + this._name + "Blastmark"))
            {
               _x = this._x;
               _y = this._y;
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
         else
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t28";
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
            SplatColor.setRGB(8207650);
            _global.MakeNoise("Splat");
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            justBounced = 8;
            bouncedOffX = _root.HeroPointer._x;
            bouncedOffY = _root.HeroPointer._y;
            _global.justHit = this;
            if(!burning)
            {
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
                     justBounced = 8;
                     bouncedOffX = hitTarget._x;
                     bouncedOffY = hitTarget._y;
                     if(!burning)
                     {
                     }
                     break;
                  }
               }
               x++;
            }
         }
         if(justBounced != 0)
         {
            _global.MakeNoise("Boing");
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
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(burning)
      {
         framesBurned++;
      }
   }
   else
   {
      stop();
   }
}

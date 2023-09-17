onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(_xscale < 95)
      {
         little = true;
      }
      else
      {
         little = false;
      }
      if(_global.HeroAction == "attacking" && (!little || beenLittle > 10))
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, this._xscale);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, this._yscale);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(13781982);
               if(!little)
               {
                  littleClutters = int(Math.random() * 3) + 2;
                  x = 1;
                  while(x < littleClutters)
                  {
                     ClutterNum = _root.SpawnPoint.ChildCounter;
                     ClutterName = "_root.Clutter" + String(ClutterNum);
                     duplicateMovieClip(_root.Clutter,"Clutter" + String(ClutterNum),16384 + _global.baddieDepth++);
                     with(eval(ClutterName))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _xscale = 40;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _yscale = 40;
                        _rotation = this._rotation - (180 + int(Math.random() * 40) - 20);
                     }
                     _global.Enemies.push("Clutter" + String(ClutterNum));
                     _root.SpawnPoint.ChildCounter = _root.SpawnPoint.ChildCounter + 1;
                     x++;
                  }
               }
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               if(!little)
               {
                  BountyObject.bounty = 8;
                  _global.GainAward("First Clutter");
                  _global.KillCount("Clutter",50);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Clutter") == null)
                  {
                     EnemiesKilled.push("Clutter");
                  }
                  _global.MakeNoise("Splat");
               }
               else
               {
                  BountyObject.bounty = 3;
                  _global.MakeNoise("LilSplat");
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
            if(!little)
            {
               BountyObject.bounty = "t8";
            }
            else
            {
               BountyObject.bounty = "t3";
            }
         }
         toKillX = _X - killedBy._x;
         toKillY = _Y - killedBy._y;
         killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         killDir -= 180;
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killDir);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _xscale, this._xscale);
         setProperty(SplatName, _Y, this._y);
         setProperty(SplatName, _yscale, this._yscale);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(13781982);
         _global.MakeNoise("Splat");
         if(!little)
         {
            littleClutters = int(Math.random() * 3) + 2;
            x = 1;
            while(x < littleClutters)
            {
               ClutterNum = _root.SpawnPoint.ChildCounter;
               ClutterName = "_root.Clutter" + String(ClutterNum);
               duplicateMovieClip(_root.Clutter,"Clutter" + String(ClutterNum),16384 + _global.baddieDepth++);
               with(eval(ClutterName))
               {
                  _x = this._x + int(Math.random() * 20) - 10;
                  _xscale = 40;
                  _y = this._y + int(Math.random() * 20) - 10;
                  _yscale = 40;
                  _rotation = this._rotation - (180 + int(Math.random() * 40) - 20);
               }
               _global.Enemies.push("Clutter" + String(ClutterNum));
               _root.SpawnPoint.ChildCounter = _root.SpawnPoint.ChildCounter + 1;
               x++;
            }
         }
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            if(!little)
            {
               justBounced = 8;
               bouncedOffX = _root.HeroPointer._x;
               bouncedOffY = _root.HeroPointer._y;
               _global.justHit = this;
            }
            else
            {
               justBounced = 8;
               bouncedOffX = _root.HeroPointer._x;
               bouncedOffX = _root.HeroPointer._y;
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
      if(posture != "drift")
      {
         if(_root.myLure.luring)
         {
            gotoSpotX = _root.myLure._x;
            gotoSpotY = _root.myLure._y;
         }
         else
         {
            gotoSpotX = _root.HeroPointer._x;
            gotoSpotY = _root.HeroPointer._y;
         }
      }
      if(eval(_root.HeroPointer) != undefined && posture != "leave")
      {
         if(_root.myLure.luring)
         {
            toHero_x = _X - _root.myLure._x;
            toHero_y = _Y - _root.myLure._y;
         }
         else
         {
            toHero_x = _X - _root.HeroPointer._x;
            toHero_y = _Y - _root.HeroPointer._y;
         }
         heroDist = Math.sqrt(toHero_x * toHero_x + toHero_y * toHero_y);
         if(!little)
         {
            if(heroDist > 160)
            {
               posture = "search";
            }
            else if(heroDist <= 160 && heroDist > 140)
            {
               posture = "orbit";
            }
            else
            {
               posture = "flee";
            }
         }
         else if(heroDist > 140)
         {
            if(posture != "drift" || Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
            {
               gotoSpotX = int(Math.random() * 500) + 26;
               gotoSpotY = int(Math.random() * 350) + 26;
               delta_x = _X - gotoSpotX;
               delta_y = _Y - gotoSpotY;
               _rotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
            }
            posture = "drift";
         }
         else
         {
            posture = "flee";
         }
      }
      else if(posture != "leave")
      {
         posture = "search";
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
         {
            gotoSpotX = int(Math.random() * 540) + 6;
            gotoSpotY = int(Math.random() * 390) + 6;
         }
      }
      CluttersOnScreen = 0;
      x = 0;
      while(x < _global.Enemies.length)
      {
         if(_global.Enemies[x].slice(0,7) == "Clutter")
         {
            CluttersOnScreen++;
         }
         x++;
      }
      if(CluttersOnScreen >= _global.spawnLimit * 0.7)
      {
         if(int(Math.random() * 130) == 1)
         {
            posture = "leave";
         }
      }
      else if(posture == "leave")
      {
         posture = "flee";
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
      switch(posture)
      {
         case "search":
            moveRotation = _rotation;
            throttle = speed;
            break;
         case "orbit":
            throttle = speed / 2;
            if(driftChange > 60)
            {
               if(int(Math.random() * 2) + 1 == 1)
               {
                  orbitDir = "left";
               }
               else
               {
                  orbitDir = "right";
               }
               driftChange = 0;
            }
            if(orbitDir = "left")
            {
               moveRotation = targetRotation - (int(Math.random() * 20) + 80);
            }
            else
            {
               moveRotation = targetRotation + (int(Math.random() * 20) + 80);
            }
            break;
         case "flee":
         case "leave":
            if(driftChange > 10)
            {
               moveRotation = targetRotation - (int(Math.random() * 20) - 170);
               driftChange = 0;
            }
            if(!little)
            {
               throttle = speed / 2;
            }
            else
            {
               throttle = speed * 0.75;
            }
            driftChange++;
            break;
         case "drift":
            moveRotation = _rotation;
            throttle = speed * 0.75;
      }
      if(moveRotation > 179)
      {
         moveRotation -= 360;
      }
      if(moveRotation < -180)
      {
         moveRotation += 360;
      }
      driftChange++;
      if(posture != "leave")
      {
         if((_Y < 10 || _Y > 390) && heroDist > 100 && (posture == "flee" || posture == "orbit"))
         {
            lockY = true;
         }
         else
         {
            lockY = false;
         }
         if((_X < 10 || _X > 540) && heroDist > 100 && (posture == "flee" || posture == "orbit"))
         {
            lockX = true;
         }
         else
         {
            lockX = false;
         }
      }
      if(posture == "flee")
      {
         fleeFor++;
      }
      else
      {
         fleeFor = 0;
      }
      if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556 && !spitting)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed || posture == "flee" || posture == "leave")
         {
            if(!lockY)
            {
               _Y = _Y - throttle * Math.cos(moveRotation * 0.017453292519943295);
            }
            if(!lockX)
            {
               _X = _X + throttle * Math.sin(moveRotation * 0.017453292519943295);
            }
         }
      }
      else if(!spitting)
      {
         if(fleeFor >= 60)
         {
            _global.GainAward("Push Clutter");
         }
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(little)
      {
         beenLittle++;
      }
      if(little && beenLittle > 150 && _currentframe == 2)
      {
         this._xscale += 10;
         this._yscale += 10;
      }
      if(!little && eval(_root.HeroPointer) != undefined)
      {
         if(heroDist < 156 && posture == "orbit")
         {
            if(_rotation == targetRotation && spitDelay == 0)
            {
               gotoAndPlay(81);
               spitting = true;
               spitDelay = 60;
            }
         }
      }
      if(spitDelay > 0)
      {
         spitDelay--;
      }
      if(_currentframe == 80)
      {
         gotoAndPlay(1);
      }
      else if(_currentframe == 101)
      {
         BabyName = "_root." + this._name + "Spit" + spitBabies;
         duplicateMovieClip(_root.ClutterSpit,this._name + "Spit" + spitBabies,16384 + _global.baddieDepth++);
         setProperty(BabyName, _rotation, this._rotation);
         setProperty(BabyName, _X, this._x);
         setProperty(BabyName, _Y, this._y);
         if(spitBabies < 99)
         {
            spitBabies++;
         }
         else
         {
            spitBabies = 10;
         }
         _global.MakeNoise("Spit");
      }
      else if(_currentframe == 111)
      {
         spitting = false;
      }
   }
   else if(!mommy)
   {
      stop();
   }
}

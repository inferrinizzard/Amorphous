onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(_root.myLure.luring && _xscale > 70)
      {
         gotoSpotX = _root.myLure._x;
         gotoSpotY = _root.myLure._y;
      }
      else if(eval(_root.HeroPointer) != undefined && _xscale > 70)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      speed = 3 + 0.1 * ((100 - _xscale) / 5);
      if(speed < 0.5)
      {
         speed = 0.5;
      }
      turnSpeed = 4 + 0.2 * ((100 - _xscale) / 5);
      if(turnSpeed < 1)
      {
         turnSpeed = 1;
      }
      if(burnProtection > 0)
      {
         burnProtection--;
      }
      if(recoil > 0)
      {
         recoil--;
         speed /= 2;
         turnSpeed /= 2;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            myFatness = int((_xscale - 50) / 10 * 2);
            if(myFatness > 0)
            {
               distance_x = _X - _root.HeroPointer._x;
               distance_y = _Y - _root.HeroPointer._y;
               adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
               impactPointY = _Y - myFatness * Math.cos(adjustedRotation * 0.017453292519943295);
               impactPointX = _X + myFatness * Math.sin(adjustedRotation * 0.017453292519943295);
            }
            else
            {
               impactPointY = _Y;
               impactPointX = _X;
            }
            if(_root.HeroSwing.hittest(impactPointX,impactPointY,true) && recoil == 0)
            {
               recoil = 20;
               _xscale = _xscale - 10;
               _yscale = _yscale - 10;
               if(_global.RazorGlaiveEquipped)
               {
                  _xscale = _xscale - 10;
                  _yscale = _yscale - 10;
               }
               SplatNum = "Splat" + String(random(20));
               SplatName = "_root." + this._name + SplatNum;
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + SplatNum,16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(11589714);
               _global.MakeNoise("Slice");
               if(_xscale == 70)
               {
                  gotoSpotX = int(Math.random() * 490) + 26;
                  gotoSpotY = int(Math.random() * 340) + 26;
               }
               if(_xscale < 50)
               {
                  _global.MakeNoise("Splat");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 30;
                  _global.GainAward("First Amalgam");
                  _global.KillCount("Amalgam",15);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Amalgam") == null)
                  {
                     EnemiesKilled.push("Amalgam");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
               else if(_xscale >= 70)
               {
                  if(int(Math.random() * 2) + 1 == 1)
                  {
                     SpitDir = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                     KidName = "Amalgam" + String(_root.SpawnPoint.ChildCounter++);
                     duplicateMovieClip(_root.Amalgam,KidName,16384 + _global.baddieDepth++);
                     with(eval("_root." + KidName))
                     {
                        _x = this._x + (_xscale - 50) * Math.sin(SpitDir * 0.017453292519943295);
                        _y = this._y - (_xscale - 50) * Math.cos(SpitDir * 0.017453292519943295);
                        _xscale = 50;
                        _yscale = 50;
                        _rotation = SpitDir;
                     }
                     _global.Enemies.push(KidName);
                  }
               }
            }
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
      {
         if(_xscale > 70)
         {
            _global.justHit = this;
         }
         else if(justBounced == 0)
         {
            justBounced = 8;
            bouncedOffX = _root.HeroPointer._x;
            bouncedOffY = _root.HeroPointer._y;
            _global.justHit = this;
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
                  TouchWhat = hitTarget._name.slice(0,4);
                  if(hitTarget.tool || TouchWhat == "Quee" || TouchWhat == "Grin" || TouchWhat == "Void" || TouchWhat == "Horr" || TouchWhat == "Amal" && hitTarget._xscale > 90 && _xscale > 90)
                  {
                     if(justBounced == 0)
                     {
                        justBounced = 8;
                        bouncedOffX = hitTarget._x;
                        bouncedOffY = hitTarget._y;
                     }
                  }
                  else
                  {
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                     duplicateMovieClip(_root.Absorbing,"Yum" + String(stuffEaten),16384 + _global.effectDepth++);
                     Slurp = eval("_root.Yum" + String(stuffEaten++));
                     with(Slurp)
                     {
                        _x = hitTarget._x;
                        _y = hitTarget._y;
                        _rotation = (- Math.atan2(this._x - hitTarget._x,this._y - hitTarget._y)) / 0.017453292519943295;
                     }
                     if(TouchWhat == "Gray" || TouchWhat == "Oozl")
                     {
                        with(Slurp)
                        {
                           _xscale = 170;
                           _yscale = 170;
                        }
                     }
                     _global.MakeNoise("Glom");
                     _xscale = _xscale + 10;
                     _yscale = _yscale + 10;
                     if(TouchWhat == "Gray" || TouchWhat == "Oozl" || TouchWhat == "Amal" && hitTarget._xscale > 70)
                     {
                        _xscale = _xscale + 20;
                        _yscale = _yscale + 20;
                     }
                     removeMovieClip(hitTarget);
                  }
               }
            }
            x++;
         }
      }
      if(killedBy != null)
      {
         killName = killedBy._name.slice(0,4);
         if(killName == "Horr" || killedBy.exploded || killedBy.claw || killName == "Grin" || killName == "Razo" || killName == "Gray")
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t30";
            }
            toKillX = _X - killedBy._x;
            toKillY = _Y - killedBy._y;
            killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
            killDir -= 180;
            if(_xscale > 70)
            {
               SplatName = "_root." + this._name + "BigSplat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, killDir);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 170);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 170);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(11589714);
               _global.MakeNoise("Pop");
               _global.MakeNoise("Splash");
            }
            else
            {
               SplatNum = "Splat" + String(random(20));
               SplatName = "_root." + this._name + SplatNum;
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + SplatNum,16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(11589714);
               _global.MakeNoise("Splat");
            }
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
      }
      if(justBounced != 0 && bouncedOffX != null)
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
         bouncedOffX = null;
      }
      else if(justBounced > 0)
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
      _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
      _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
      {
         gotoSpotX = int(Math.random() * 490) + 26;
         gotoSpotY = int(Math.random() * 340) + 26;
      }
      if(_currentframe == 61)
      {
         if(_xscale > 130 && int(Math.random() * 5) + 1 == 1)
         {
            Splitting = true;
         }
         else
         {
            gotoAndPlay(1);
         }
      }
      if(_currentframe == 81)
      {
         SplatNum = "Splat" + String(random(20));
         SplatName = "_root." + this._name + SplatNum;
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + SplatNum,16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, this._rotation);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(11589714);
         _global.MakeNoise("Splat");
         SpitDir = _rotation + 90;
         newSize = _xscale * 0.8;
         newSize = int(newSize / 5) * 5;
         KidName = "Amalgam" + String(_root.SpawnPoint.ChildCounter++);
         duplicateMovieClip(_root.Amalgam,KidName,16384 + _global.baddieDepth++);
         with(eval("_root." + KidName))
         {
            _x = this._x + newSize / 2 * Math.sin(SpitDir * 0.017453292519943295);
            _y = this._y - newSize / 2 * Math.cos(SpitDir * 0.017453292519943295);
            _xscale = newSize;
            _yscale = newSize;
            _rotation = SpitDir;
         }
         _global.Enemies.push(KidName);
         _rotation = _rotation - 90;
         _xscale = newSize;
         _yscale = newSize;
         _X = _X + oldSize / 2 * Math.sin(_rotation * 0.017453292519943295);
         _Y = _Y - oldSize / 2 * Math.cos(_rotation * 0.017453292519943295);
         Splitting = false;
         gotoAndPlay(1);
      }
   }
   else if(!mommy)
   {
      stop();
   }
}

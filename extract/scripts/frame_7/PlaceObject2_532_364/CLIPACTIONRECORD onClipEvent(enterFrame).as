onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      myLunge.play();
      framesExisted++;
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
               SplatColor.setRGB(2781657);
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 8;
               _global.GainAward("First Biter");
               _global.KillCount("Biter",70);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Biter") == null)
               {
                  EnemiesKilled.push("Biter");
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
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killDir);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(2781657);
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            if(!lunging)
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
                  if(framesExisted <= 30)
                  {
                     _global.GainAward("Ambush");
                  }
                  removeMovieClip(myLunge);
                  duplicateMovieClip(_root.HeroMangle,_name + "Mangling",16384 + _global.heroDepth++);
                  myMangler = eval("_root." + _name + "Mangling");
                  with(myMangler)
                  {
                     _x = this._x;
                     _y = this._y;
                     _rotation = this._rotation;
                  }
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
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
                     if(hitTarget._name.slice(0,5) == "Biter" && int(Math.random() * 100) + 1 < 11)
                     {
                        _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                        _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                        duplicateMovieClip(_root.BiterGlom,"Glom" + _name.slice(5),16384 + _global.baddieDepth++);
                        _global.Enemies.push("Glom" + _name.slice(5));
                        Glommie = eval("_root.Glom" + _name.slice(5));
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
                        if(!lunging)
                        {
                           justBounced = 8;
                           bouncedOffX = hitTarget._x;
                           bouncedOffY = hitTarget._y;
                           break;
                        }
                        if(hitTarget._name.slice(0,5) != "Oozle")
                        {
                           hitTarget.killedBy = this;
                        }
                     }
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
      if(speed > 4 && !lunging)
      {
         speed = 4;
      }
      if(_rotation != targetRotation && !lunging)
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
      if(!lunging && speed == 4 && eval(_root.HeroPointer) != undefined)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 120)
         {
            if(Math.abs(_rotation - targetRotation) < 20)
            {
               _visible = false;
               duplicateMovieClip(_root.BiterLunge,_name + "Lunge",16384 + _global.baddieDepth++);
               myLunge = eval("_root." + _name + "Lunge");
               with(myLunge)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
               speed *= 1.5;
               lunging = true;
               _global.MakeNoise("BiterGrowl" + (int(Math.random() * 3) + 1));
            }
         }
      }
      if(lunging && myLunge._currentFrame == 20)
      {
         removeMovieClip(myLunge);
         _visible = true;
         speed /= 1.5;
         lunging = false;
      }
   }
   else if(!mommy)
   {
      stop();
      myLunge.stop();
   }
}

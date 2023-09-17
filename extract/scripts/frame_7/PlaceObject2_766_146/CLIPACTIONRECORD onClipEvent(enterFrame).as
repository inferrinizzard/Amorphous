onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(_currentframe != 91)
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
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(action == "collect")
            {
               impactPointY = _Y;
               impactPointX = _X;
            }
            else
            {
               distance_x = _X - _root.HeroPointer._x;
               distance_y = _Y - _root.HeroPointer._y;
               adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
               impactPointY = _Y - 10 * Math.cos(adjustedRotation * 0.017453292519943295);
               impactPointX = _X + 10 * Math.sin(adjustedRotation * 0.017453292519943295);
            }
            if(_root.HeroSwing.hittest(impactPointX,impactPointY,true))
            {
               if(action == "collect")
               {
                  SplatName = "_root." + this._name + "Splat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _Y, this._y);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(2781657);
                  _global.MakeNoise("Splat");
                  _global.MakeNoise("HorrorKill");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 50;
                  _global.GainAward("First Horror");
                  _global.KillCount("Horror",3);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Horror") == null)
                  {
                     EnemiesKilled.push("Horror");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
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
                  if(_global.RazorGlaiveEquipped)
                  {
                     _rotation = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                  }
               }
            }
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
      {
         _global.justHit = this;
      }
      else if(justBounced == 0)
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  if(hitTarget._name.slice(0,7) == "Grinder" || hitTarget.action == "gaurd" || hitTarget._name.slice(0,6) == "Horror")
                  {
                     justBounced = 8;
                     bouncedOffX = hitTarget._x;
                     bouncedOffY = hitTarget._y;
                     break;
                  }
                  hitTarget.killedBy = this;
               }
            }
            x++;
         }
      }
      else if(justBounced == 8)
      {
         SparkName = "_root." + this._name + "Sparks";
         duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
         setProperty(SparkName, _rotation, this._rotation);
         setProperty(SparkName, _X, this._x);
         setProperty(SparkName, _Y, this._y);
         _global.MakeNoise("Clang");
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
         justBounced--;
      }
      else
      {
         justBounced--;
      }
      if(killedBy != null)
      {
         if(action != "collect")
         {
            if(killedBy._name.slice(0,7) == "Grinder")
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
               SplatName = "_root." + this._name + "BigSplat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, killDir);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 170);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 170);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(2781657);
               _global.MakeNoise("Pop");
               _global.MakeNoise("Splash");
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
            else if(killedBy.exploded || killedBy.claw)
            {
               toKillX = killedBy._x - _X;
               toKillY = killedBy._y - _Y;
               killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
               _rotation = killDir;
               SparkName = "_root." + this._name + "Sparks";
               duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
               setProperty(SparkName, _rotation, killDir);
               setProperty(SparkName, _X, this._x);
               setProperty(SparkName, _Y, this._y);
               killedBy = null;
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
               BountyObject.bounty = "t50";
            }
            SplatName = "_root." + this._name + "Splat";
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _Y, this._y);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(2781657);
            _global.MakeNoise("Splat");
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
      if(action == "collect" && speed == 0 && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 100)
      {
         if(_Y > 10 && _Y < 390 && _X > 10 && _X < 540)
         {
            _Y = _Y - 2 * Math.cos((_rotation + 180) * 0.017453292519943295);
            _X = _X + 2 * Math.sin((_rotation + 180) * 0.017453292519943295);
         }
      }
      if(action == "none" && eval(_root.HeroPointer) != undefined && _currentframe < 71 && _currentframe > 40)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 70)
         {
            if(int(Math.random() * 100) == 1)
            {
               gotoAndPlay(102);
               _global.MakeNoise("HorrorHooks");
            }
         }
      }
      if(action == "none" && eval(_root.HeroPointer) != undefined && _currentframe < 71 && _currentframe > 40)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 150)
         {
            if(int(Math.random() * 100) == 1)
            {
               gotoAndPlay(72);
               _global.MakeNoise("HorrorSplit");
               myWhine.stop();
               myWhine.attachSound("HorrorDisk");
               myWhine.start(0,100);
            }
         }
      }
      if(_currentframe == 21 || _currentframe == 72)
      {
         speed = 2;
         turnSpeed = 2;
      }
      else if(_currentframe == 31)
      {
         speed = 3;
         turnSpeed = 3;
      }
      if(_currentframe == 76)
      {
         speed = 1;
         turnSpeed = 1;
         h = 1;
         while(h < 5)
         {
            duplicateMovieClip(_root.HorrorDisk,_name + "Disk" + h,16384 + _global.baddieDepth++);
            myDisk = eval("_root." + _name + "Disk" + h);
            diskRotation = _rotation + (h - 1) * 90 + 45;
            with(myDisk)
            {
               _y = this._y - 20 * Math.cos(hookRotation * 0.017453292519943295);
               _x = this._x + 20 * Math.sin(hookRotation * 0.017453292519943295);
               _rotation = diskRotation;
            }
            h++;
         }
         action = "collect";
      }
      if(_currentframe == 91)
      {
         speed = 0;
         disksBack = 0;
         stop();
         h = 1;
         while(h < 5)
         {
            myDisk = eval("_root." + _name + "Disk" + h);
            toDiskX = _X - myDisk._x;
            toDiskY = _Y - myDisk._y;
            if(Math.sqrt(toDiskX * toDiskX + toDiskY * toDiskY) <= 15)
            {
               disksBack++;
            }
            h++;
         }
         if(disksBack == 4)
         {
            speed = 1;
            action = "none";
            play();
            removeMovieClip(eval("_root." + _name + "Disk1"));
            removeMovieClip(eval("_root." + _name + "Disk2"));
            removeMovieClip(eval("_root." + _name + "Disk3"));
            removeMovieClip(eval("_root." + _name + "Disk4"));
         }
      }
      if(_currentframe == 101)
      {
         gotoAndPlay(1);
         myWhine.stop();
         myWhine.attachSound("HorrorAmb");
         myWhine.start(0,100);
      }
      if(_currentframe == 102)
      {
         h = 1;
         while(h < 9)
         {
            duplicateMovieClip(_root.HorrorHook,_name + "Hook" + hookCount,16384 + _global.capDepth++);
            myHook = eval("_root." + _name + "Hook" + hookCount);
            hookRotation = _rotation + (h - 1) * 45;
            with(myHook)
            {
               _y = this._y - 30 * Math.cos(hookRotation * 0.017453292519943295);
               _x = this._x + 30 * Math.sin(hookRotation * 0.017453292519943295);
               _rotation = hookRotation;
            }
            hookCount++;
            if(hookCount > 99)
            {
               hookCount = 10;
            }
            h++;
         }
      }
      if(_currentframe == 71 || _currentframe == 131)
      {
         action = "none";
         speed = 3;
         turnSpeed = 3;
         gotoAndPlay(41);
      }
   }
   else
   {
      stop();
   }
}

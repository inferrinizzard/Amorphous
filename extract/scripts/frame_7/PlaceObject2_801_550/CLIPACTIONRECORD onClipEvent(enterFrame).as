onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(action == "dodge" || _currentframe > 1)
      {
         play();
      }
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      if(action != "lunge")
      {
         turnSpeed = 4;
         if(timesLunged >= 5 && !_global.HeroKilled)
         {
            _global.GainAward("5 Queen Misses");
         }
         if(eval(_root.HeroPointer) != undefined)
         {
            toHero = Math.sqrt(delta_x * delta_x + delta_y * delta_y);
            if(toHero <= 150)
            {
               speed = 2;
               if(toHero <= 100)
               {
                  speed = 1;
                  if(toHero <= 50)
                  {
                     speed = 0.5;
                  }
               }
            }
            else
            {
               speed = 3;
            }
         }
         else
         {
            speed = 3;
         }
      }
      else
      {
         speed = 10;
         turnSpeed = 0;
         lungeFrames++;
      }
      if(wisps < 10 && int(Math.random() * 5) == 1)
      {
         duplicateMovieClip(_root.QueenWisp,_name + "Wisp" + wispCounter,16384 + _global.effectDepth++);
         wisps++;
         wispCounter++;
         if(wispCounter == 10)
         {
            wispCounter = 0;
         }
      }
      if(int(Math.random() * 20) == 1)
      {
         duplicateMovieClip(_root.QueenWiggler,_name + "Wiggler" + wigglers,16384 + _global.effectDepth++);
         with(eval("_root." + _name + "Wiggler" + wigglers))
         {
            _x = this._x + int(Math.random() * 20) - 10;
            _y = this._y + int(Math.random() * 20) - 10;
         }
         wigglers++;
      }
      if(larva < 5 && int(Math.random() * 100) == 1)
      {
         LarvaName = null;
         useNum = 0;
         while(useNum < 10)
         {
            if(eval("_root." + _name + "Larva" + useNum) == undefined)
            {
               LarvaName = _name + "Larva" + useNum;
               break;
            }
            useNum++;
         }
         if(LarvaName != null)
         {
            duplicateMovieClip(_root.QueenLarva,LarvaName,16384 + _global.markDepth++);
            with(eval("_root." + LarvaName))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
            }
            larva++;
            _global.MakeNoise("LarvaSpawn");
         }
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
               SplatColor.setRGB(16206129);
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 75;
               _global.GainAward("First Queen");
               _global.KillCount("Queen",3);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Queen") == null)
               {
                  EnemiesKilled.push("Queen");
               }
               _visible = false;
               _global.QueenRevive = true;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,false))
      {
         _global.justHit = this;
         justBounced = 8;
         bouncedOffX = HeroPointer._x;
         bouncedOffY = HeroPointer._y;
      }
      else if(justBounced == 0)
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
      else if(justBounced == 8)
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
         justBounced--;
      }
      else
      {
         justBounced--;
      }
      if(killedBy != null)
      {
         if(killedBy._name.slice(0,7) == "Grinder" || killedBy.exploded || killedBy._name.slice(0,6) == "Horror" || killedBy._name.slice(0,5) == "Razor" || killedBy.disk)
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t75";
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
            SplatColor.setRGB(16206129);
            _global.MakeNoise("Splat");
            _visible = false;
            _global.QueenRevive = true;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
         else
         {
            killedBy = null;
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
      if(_global.RazorGlaiveEquipped)
      {
         scareRange = 130;
      }
      else
      {
         scareRange = 100;
      }
      if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= scareRange)
      {
         if(_global.HeroAction == "attacking" && _currentframe == 1 && _root.HeroSlashin._currentframe < 14)
         {
            action = "dodge";
            gotoAndPlay(1);
         }
         if(eval(_root.HeroPointer) != undefined && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 20)
         {
            action = "dodge";
            gotoAndPlay(1);
         }
      }
      if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 100)
      {
         if(Math.abs(_rotation - targetRotation) < 100 && justSwung == 0)
         {
            if(int(Math.random() * 2) == 1 && Math.abs(_rotation - LeftClaw._rotation) < 20)
            {
               LeftClaw.action = "swipe";
               action = "swing";
               justSwung += int(Math.random() * 50) + 15;
               _global.MakeNoise("Swing");
               timesLunged++;
            }
            else if(Math.abs(_rotation - RightClaw._rotation) < 20)
            {
               RightClaw.action = "swipe";
               action = "swing";
               justSwung += int(Math.random() * 50) + 15;
               _global.MakeNoise("Swing");
               timesLunged++;
            }
         }
      }
      if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 300)
      {
         if(Math.abs(_rotation - targetRotation) < 50 && justSwung == 0)
         {
            if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 100 && _global.HeroAction != "attacking")
            {
               if(int(Math.random() * 2) == 1 && Math.abs(_rotation - LeftClaw._rotation) < 20)
               {
                  LeftClaw.action = "swipe";
                  action = "lunge";
                  justSwung += int(Math.random() * 60) + 25;
                  timesLunged++;
                  _rotation = _rotation - 10;
                  _global.MakeNoise("Swing");
               }
               else if(Math.abs(_rotation - RightClaw._rotation) < 20)
               {
                  RightClaw.action = "swipe";
                  action = "lunge";
                  justSwung += int(Math.random() * 60) + 25;
                  timesLunged++;
                  _rotation = _rotation + 10;
                  _global.MakeNoise("Swing");
               }
            }
         }
      }
      if(justSwung > 0)
      {
         justSwung--;
      }
      if(action == "prowl" || action == "lunge")
      {
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
         {
            gotoSpotX = int(Math.random() * 540) + 6;
            gotoSpotY = int(Math.random() * 390) + 6;
         }
      }
      else if(action == "dodge")
      {
         _rotation = targetRotation;
         _Y = _Y - 12 * Math.cos((_rotation + 180) * 0.017453292519943295);
         _X = _X + 12 * Math.sin((_rotation + 180) * 0.017453292519943295);
      }
      if(lungeFrames == 10)
      {
         action = "swing";
         lungeFrames = 0;
      }
      if(_currentframe == 10)
      {
         action = "prowl";
      }
      if(_currentframe == 30)
      {
         gotoAndStop(1);
      }
   }
   else
   {
      stop();
   }
}

onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
      if(eval(_root.myBoxGun) != undefined && _root.myBoxGun.deployed && !_root.myBoxGun.exploded)
      {
         gotoSpotX = _root.myBoxGun._x;
         gotoSpotY = _root.myBoxGun._y;
      }
      else if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      if(justSwitched > 0)
      {
         justSwitched--;
      }
      if(recoil > 0)
      {
         recoil--;
      }
      if(mode == "melee")
      {
         if(action == "prowl" || action == "pause")
         {
            turnSpeed = 2;
            if(eval(_root.HeroPointer) != undefined)
            {
               toHero = Math.sqrt(delta_x * delta_x + delta_y * delta_y);
               if(toHero <= 150)
               {
                  speed = 1;
                  if(toHero <= 100)
                  {
                     speed = 0.5;
                     if(toHero <= 50)
                     {
                        speed = 0.2;
                     }
                  }
               }
               else
               {
                  speed = 2;
               }
            }
            else
            {
               speed = 2;
            }
         }
         else if(action == "lunge")
         {
            speed = 7;
            turnSpeed = 0;
         }
         else if(action == "lash")
         {
            speed = 0;
            turnSpeed = 4;
         }
      }
      else if(mode == "turret")
      {
         speed = 0;
         turnSpeed = 2;
      }
      else
      {
         speed = 0;
         turnSpeed = 0;
      }
      if(teeth < 10 && (int(Math.random() * 20) == 1 && mode == "melee") || int(Math.random() * 50) == 1 && mode == "turret")
      {
         duplicateMovieClip(_root.RazorTooth,_name + "Tooth" + toothCounter,16384 + _global.capDepth++);
         with(eval("_root." + _name + "Tooth" + toothCounter))
         {
            _x = this._x;
            _y = this._y;
            _rotation = int(Math.random() * 359) - 180;
         }
         teeth++;
         toothCounter++;
         if(toothCounter == 80)
         {
            toothCounter = 10;
         }
      }
      if(larva < 2 && int(Math.random() * 400) == 1 && mode == "melee")
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
            duplicateMovieClip(_root.RazorLarva,LarvaName,16384 + _global.effectDepth++);
            with(eval("_root." + LarvaName))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
            }
            larva++;
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
               health--;
               recoil = 20;
               if(_global.RazorGlaiveEquipped)
               {
                  health -= 2;
               }
               SplatName = "_root." + this._name + "Splat" + lilSplats;
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat" + lilSplats++,16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(3560301);
               if(health <= 0)
               {
                  SplatName = "_root." + this._name + "BigSplat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _xscale, 130);
                  setProperty(SplatName, _Y, this._y);
                  setProperty(SplatName, _yscale, 130);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(3560301);
                  _global.MakeNoise("Pop");
                  _global.MakeNoise("Splash");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 500;
                  _global.GainAward("First Razor Queen");
                  _global.KillCount("Razor Queen",2);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"RazorQueen") == null)
                  {
                     EnemiesKilled.push("RazorQueen");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
               else
               {
                  _global.MakeNoise("Slice");
                  struckTeeth = int(Math.random() * 4) + 3;
                  x = 1;
                  while(x <= struckTeeth)
                  {
                     duplicateMovieClip("_root.ShedTooth",this._name + "sTooth" + x,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "sTooth" + x))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 140) + 70;
                     }
                     x++;
                  }
               }
            }
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,false))
      {
         if(justBounced == 0)
         {
            _global.justHit = this;
            justBounced = 8;
            bouncedOffX = HeroPointer._x;
            bouncedOffY = HeroPointer._y;
         }
      }
      else if(justBounced == 0)
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,false))
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
      if(killedBy != null && recoil == 0)
      {
         if(killedBy._name.slice(0,7) == "Grinder" || killedBy.exploded || killedBy._name.slice(0,6) == "Horror" || killedBy.disk)
         {
            health--;
            recoil = 20;
            if(killedBy._name.slice(0,7) == "Grinder")
            {
               health = 0;
            }
            SplatName = "_root." + this._name + "Splat" + lilSplats;
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat" + lilSplats++,16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, killedBy._rotation + int(Math.random() * 61) + 30);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _Y, this._y);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(3560301);
            if(health <= 0)
            {
               if(killedBy.tool)
               {
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = "t500";
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
               SplatColor.setRGB(3560301);
               _global.MakeNoise("Splat");
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
            killedBy = null;
         }
         else
         {
            killedBy = null;
         }
      }
      else
      {
         killedBy = null;
      }
      x = 0;
      while(x < _global.Hazards.length)
      {
         targetHazard = eval("_root." + _global.Hazards[x]);
         if(hitTest(targetHazard._x,targetHazard._y,true))
         {
            if(targetHazard._name.slice(0,5) == "Razor")
            {
               targetHazard.killedBy = this;
            }
         }
         x++;
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(action != "lash")
      {
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
      }
      else if(spinClockwise)
      {
         _rotation = _rotation + turnSpeed;
      }
      else
      {
         _rotation = _rotation - turnSpeed;
      }
      if(mode == "turret")
      {
         if(int(Math.random() * 20) == 1)
         {
            duplicateMovieClip(_root.RazorQuill,_name + "Quill" + quillCounter,16384 + _global.effectDepth++);
            quillRotation = targetRotation + int(Math.random() * 70) - 35;
            if(quillRotation > 180)
            {
               quillRotation -= 360;
            }
            if(quillRotation < 180)
            {
               quillRotation += 360;
            }
            with(eval("_root." + _name + "Quill" + quillCounter))
            {
               _x = this._x;
               _y = this._y;
               _rotation = quillRotation;
            }
            quillCounter++;
            if(quillCounter == 80)
            {
               quillCounter = 10;
            }
         }
      }
      if(mode == "melee" && action == "prowl" && justSwung == 0)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 100 && int(Math.random() * 200) == 1 && justSwitched == 0 && eval(_root.myBoxGun) == undefined)
         {
            LeftForClaw.action = "entrench";
            RightForClaw.action = "entrench";
            LeftDuClaw.action = "entrench";
            RightDuClaw.action = "entrench";
            mode = "turret";
            action = "track";
            justSwitched = 300;
         }
      }
      else if(mode == "turret" && action == "track" && eval("_root." + _name + "Maw") == undefined)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 100 && int(Math.random() * 200) == 1 && justSwitched == 0)
         {
            LeftForClaw.action = "digup";
            RightForClaw.action = "digup";
            LeftDuClaw.action = "digup";
            RightDuClaw.action = "digup";
            mode = "melee";
            action = "prowl";
            justSwitched = 300;
         }
      }
      if(eval(_root.HeroPointer) != undefined)
      {
         if(mode == "turret")
         {
            if(int(Math.random() * 250) == 1 && mites < 2 && Math.abs(_rotation - targetRotation) < 45 && eval("_root." + _name + "Maw") == undefined)
            {
               duplicateMovieClip(_root.RazorMaw,_name + "Maw",16384 + _global.baddieDepth++);
               myMaw = eval("_root." + _name + "Maw");
               with(myMaw)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
               myMaw.task = "mite";
               _global.MakeNoise("Razor Spit");
            }
            Hedgehogs = 0;
            x = 0;
            while(x < _global.Hazards.length)
            {
               targetHazard = eval("_root." + _global.Hazards[x]);
               if(targetHazard._name.slice(0,5) == "Razor")
               {
                  Hedgehogs++;
               }
               x++;
            }
            if((int(Math.random() * 200) == 1 || _root.myBoxGun.deployed && int(Math.random() * 30) == 1) && Math.abs(_rotation - targetRotation) < 45 && eval("_root." + _name + "Maw") == undefined && Hedgehogs < 4)
            {
               duplicateMovieClip(_root.RazorMaw,_name + "Maw",16384 + _global.baddieDepth++);
               myMaw = eval("_root." + _name + "Maw");
               with(myMaw)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
               myMaw.task = "hedgehog";
               _global.MakeNoise("Razor Spit");
            }
         }
         if(mode == "melee")
         {
            if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 150)
            {
               if(Math.abs(_rotation - targetRotation) < 45 && justSwung == 0)
               {
                  if(_rotation > targetRotation || _rotation == targetRotation && int(Math.random() * 2) == 0)
                  {
                     if(LeftForClaw.action == "none")
                     {
                        LeftForClaw.action = "jab";
                        justSwung += int(Math.random() * 50) + 15;
                        _global.MakeNoise("Swing");
                     }
                  }
                  else if(RightForClaw.action == "none")
                  {
                     RightForClaw.action = "jab";
                     justSwung += int(Math.random() * 50) + 15;
                     _global.MakeNoise("Swing");
                  }
               }
            }
            if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 180)
            {
               if(Math.abs(_rotation - targetRotation) < 85 && justSwung == 0)
               {
                  if(_rotation >= targetRotation && Math.abs(_rotation - LeftDuClaw._rotation) < 30 && LeftDuClaw.action == "none")
                  {
                     LeftDuClaw.action = "swipe";
                     justSwung += int(Math.random() * 40) + 35;
                     _global.MakeNoise("Swing");
                  }
                  else if(_rotation <= targetRotation && Math.abs(_rotation - RightDuClaw._rotation) < 30 && RightDuClaw.action == "none")
                  {
                     RightDuClaw.action = "swipe";
                     justSwung += int(Math.random() * 40) + 35;
                     _global.MakeNoise("Swing");
                  }
               }
            }
            if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 150 && justSwung == 0)
            {
               if(Math.abs(_rotation - targetRotation) > 50 && justSwung == 0 && lashLag == 0)
               {
                  if(_rotation > targetRotation || _rotation == targetRotation && int(Math.random() * 2) == 0)
                  {
                     spinClockwise = true;
                     action = "lash";
                     lashLag = 120;
                  }
                  else
                  {
                     spinClockwise = false;
                     action = "lash";
                     lashLag = 120;
                  }
               }
            }
            if(action == "prowl" && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 225 && !_root.myBoxGun.deployed)
            {
               if(Math.abs(_rotation - targetRotation) < 20 && justSwung == 0)
               {
                  if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) >= 180 && _global.HeroAction != "attacking")
                  {
                     if(LeftForClaw.action == "none" && RightForClaw.action == "none")
                     {
                        action = "pause";
                        LeftForClaw.action = "backswing";
                        RightForClaw.action = "backswing";
                        justSwung += int(Math.random() * 60) + 30;
                        lungeFrames = 0;
                     }
                  }
               }
            }
         }
      }
      if(action == "pause")
      {
         lungeFrames++;
         if(lungeFrames == 21)
         {
            action = "lunge";
            lungeFrames = 0;
            _global.MakeNoise("Swing");
         }
      }
      else if(action == "lunge")
      {
         lungeFrames++;
         if(lungeFrames == 21)
         {
            action = "prowl";
            lungeFrames = 0;
         }
      }
      else if(action == "lash")
      {
         lungeFrames++;
         if(lungeFrames == 91)
         {
            action = "prowl";
            lungeFrames = 0;
         }
      }
      if(justSwung > 0)
      {
         justSwung--;
      }
      if(lashLag > 0)
      {
         lashLag--;
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
   }
}

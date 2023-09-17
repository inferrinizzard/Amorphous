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
      if(recoil > 0)
      {
         recoil--;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 6 && _root.HeroSlashin._currentframe < 14)
         {
            distance_x = _X - _root.HeroSwing._x;
            distance_y = _Y - _root.HeroSwing._y;
            adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
            impactPointY = _Y - 25 * Math.cos(adjustedRotation * 0.017453292519943295);
            impactPointX = _X + 25 * Math.sin(adjustedRotation * 0.017453292519943295);
            if(_root.HeroSwing.hittest(impactPointX,impactPointY,true) && recoil == 0)
            {
               health--;
               recoil = 20;
               if(_global.RazorGlaiveEquipped)
               {
                  health -= 2;
               }
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, impactPointX);
               setProperty(SplatName, _Y, impactPointY);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(15884813);
               if(health <= 0)
               {
                  SplatName = "_root." + this._name + "BigSplat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _xscale, 230);
                  setProperty(SplatName, _Y, this._y);
                  setProperty(SplatName, _yscale, 230);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(15884813);
                  debrisNum = int(Math.random() * 5) + 10;
                  x = 0;
                  while(x < debrisNum)
                  {
                     if(int(Math.random() * 3) + 1 != 1)
                     {
                        rockType = "_root.Stone";
                     }
                     else
                     {
                        rockType = "_root.MoltenStone";
                     }
                     RockName = this._name + "Stone" + int(Math.random() * 1000);
                     duplicateMovieClip(eval(rockType),RockName,16384 + _global.effectDepth++);
                     RockName = "_root." + RockName;
                     setProperty(RockName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                     rockScale = int(Math.random() * 40) + 40;
                     setProperty(RockName, _X, impactPointX);
                     setProperty(RockName, _xscale, rockScale);
                     setProperty(RockName, _Y, impactPointY);
                     setProperty(RockName, _yscale, rockScale);
                     x++;
                  }
                  _global.MakeNoise("GrinderKill");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 100;
                  _global.GainAward("First Grinder");
                  _global.KillCount("Grinder",4);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Grinder") == null)
                  {
                     EnemiesKilled.push("Grinder");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
               else
               {
                  _global.MakeNoise("Slice");
                  _global.MakeNoise("GrinderHurt");
                  debrisNum = int(Math.random() * 5) + 4;
                  x = 0;
                  while(x < debrisNum)
                  {
                     if(int(Math.random() * 3) + 1 != 1)
                     {
                        rockType = "_root.Stone";
                     }
                     else
                     {
                        rockType = "_root.MoltenStone";
                     }
                     RockName = this._name + "Stone" + int(Math.random() * 1000);
                     duplicateMovieClip(eval(rockType),RockName,16384 + _global.effectDepth++);
                     RockName = "_root." + RockName;
                     setProperty(RockName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                     rockScale = int(Math.random() * 40) + 40;
                     setProperty(RockName, _X, impactPointX);
                     setProperty(RockName, _xscale, rockScale);
                     setProperty(RockName, _Y, impactPointY);
                     setProperty(RockName, _yscale, rockScale);
                     x++;
                  }
               }
            }
         }
      }
      if(killedBy != null)
      {
         if(killedBy._name.slice(0,7) != "Grinder")
         {
            justBounced = 8;
            bouncedOffX = killedBy._x;
            bouncedOffY = killedBy._y;
         }
         else if(killedBy.exploded)
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t100";
            }
            toBlastX = _X - killedBy._x;
            toBlastY = _Y - killedBy._y;
            blastDir = (- Math.atan2(toBlastX,toBlastY)) / 0.017453292519943295;
            blastDir -= 180;
            debrisNum = int(Math.random() * 5) + 10;
            x = 0;
            while(x < debrisNum)
            {
               if(int(Math.random() * 3) + 1 != 1)
               {
                  rockType = "_root.Stone";
               }
               else
               {
                  rockType = "_root.MoltenStone";
               }
               RockName = this._name + "Stone" + int(Math.random() * 1000);
               duplicateMovieClip(eval(rockType),RockName,16384 + _global.effectDepth++);
               RockName = "_root." + RockName;
               setProperty(RockName, _rotation, blastDir - (int(Math.random() * 40) + 70));
               rockScale = int(Math.random() * 40) + 40;
               setProperty(RockName, _X, this._x);
               setProperty(RockName, _xscale, rockScale);
               setProperty(RockName, _Y, this._y);
               setProperty(RockName, _yscale, rockScale);
               x++;
            }
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
         else
         {
            killedBy = null;
         }
      }
      x = 0;
      while(x < _global.Hazards.length)
      {
         targetHazard = eval("_root." + _global.Hazards[x]);
         if(targetHazard.hitTest(_X,_Y,true))
         {
            if(targetHazard._name.slice(0,5) == "Razor")
            {
               targetHazard.killedBy = this;
            }
         }
         x++;
      }
      if(justBounced == 0)
      {
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
                  if(hitTarget._name.slice(0,7) != "Grinder" && !(hitTarget._name.slice(0,4) == "Gray" && hitTarget.action == "gaurd"))
                  {
                     if(hitTest(hitTarget._x,hitTarget._y,true))
                     {
                        hitTarget.killedBy = this;
                     }
                  }
                  else
                  {
                     distance_x = _X - hitTarget._x;
                     distance_y = _Y - hitTarget._y;
                     adjustedRotation = (- Math.atan2(distance_x,distance_y)) / 0.017453292519943295;
                     impactPointY = _Y - 25 * Math.cos(adjustedRotation * 0.017453292519943295);
                     impactPointX = _X + 25 * Math.sin(adjustedRotation * 0.017453292519943295);
                     if(hitTarget.hitTest(impactPointX,impactPointY,true))
                     {
                        hitTarget.killedBy = this;
                        justBounced = 8;
                        bouncedOffX = hitTarget._x;
                        bouncedOffY = hitTarget._y;
                        break;
                     }
                  }
               }
               x++;
            }
         }
         if(justBounced != 0)
         {
            SparkName = "_root." + this._name + "Sparks";
            duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
            setProperty(SparkName, _rotation, this._rotation);
            setProperty(SparkName, _X, this._x);
            setProperty(SparkName, _Y, this._y);
            _global.MakeNoise("Pebble");
            _global.MakeNoise("GrindRumble",1.2);
            debrisNum = int(Math.random() * 5) + 4;
            x = 0;
            while(x < debrisNum)
            {
               if(int(Math.random() * 3) + 1 != 1)
               {
                  rockType = "_root.Stone";
               }
               else
               {
                  rockType = "_root.MoltenStone";
               }
               RockName = this._name + "Stone" + int(Math.random() * 1000);
               duplicateMovieClip(eval(rockType),RockName,16384 + _global.effectDepth++);
               RockName = "_root." + RockName;
               if(int(Math.random() * 2) + 1 == 1)
               {
                  setProperty(RockName, _rotation, this._rotation + (int(Math.random() * 40) + 70));
               }
               else
               {
                  setProperty(RockName, _rotation, this._rotation - (int(Math.random() * 40) + 70));
               }
               rockScale = int(Math.random() * 40) + 40;
               setProperty(RockName, _X, impactPointX);
               setProperty(RockName, _xscale, rockScale);
               setProperty(RockName, _Y, impactPointY);
               setProperty(RockName, _yscale, rockScale);
               x++;
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

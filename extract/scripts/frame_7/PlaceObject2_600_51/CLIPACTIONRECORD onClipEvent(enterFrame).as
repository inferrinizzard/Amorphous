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
      myFire = eval("_root." + _name + "Flame");
      if(eval(myFire) != undefined)
      {
         if(myFire._currentframe > 30)
         {
            duplicateMovieClip(_root.BlackSmoke,_name + "BSmoke",16384 + _global.capDepth++);
            with(eval("_root." + _name + "BSmoke"))
            {
               _x = this._x;
               _y = this._y;
            }
            removeMovieClip(myFire);
            duplicateMovieClip(_root.FuzzleHairless,_name + "Hairless",16384 + _global.baddieDepth++);
            myFuzzle = eval("_root." + _name + "Hairless");
            with(myFuzzle)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            beenShaved++;
            myFuzzle.beenShaved = beenShaved;
            if(beenShaved >= 3)
            {
               _global.GainAward("Shave Fuzzle 3 Times");
            }
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            _visible = false;
            removeMovieClip(this);
         }
      }
      if(fuzzRecover > 0)
      {
         fuzzRecover--;
      }
      if(fuzz < 2 && fuzzRecover == 0)
      {
         fuzz++;
      }
      if(recoil > 0)
      {
         recoil--;
      }
      if(speedBoost > 0)
      {
         speedBoost -= 0.5;
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true) && recoil == 0)
            {
               if(_global.RazorGlaiveEquipped)
               {
                  FuzzName = "_root." + this._name + "Fuzz" + furDecal;
                  duplicateMovieClip(_root.FuzzPuff,this._name + "Fuzz" + furDecal++,16384 + _global.effectDepth++);
                  setProperty(FuzzName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(FuzzName, _X, this._x);
                  setProperty(FuzzName, _Y, this._y);
                  SplatName = "_root." + this._name + "Splat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _Y, this._y);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(13806391);
                  _global.MakeNoise("Splat");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 14;
                  _global.GainAward("First Fuzzle");
                  _global.KillCount("Fuzzle",20);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Fuzzle") == null)
                  {
                     EnemiesKilled.push("Fuzzle");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
               if(fuzz == 1)
               {
                  FuzzName = "_root." + this._name + "Fuzz" + furDecal;
                  duplicateMovieClip(_root.FuzzPuff,this._name + "Fuzz" + furDecal++,16384 + _global.effectDepth++);
                  setProperty(FuzzName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(FuzzName, _X, this._x);
                  setProperty(FuzzName, _Y, this._y);
                  _global.MakeNoise("Slice");
                  _rotation = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                  duplicateMovieClip(_root.FuzzleHairless,_name + "Hairless",16384 + _global.baddieDepth++);
                  myFuzzle = eval("_root." + _name + "Hairless");
                  with(myFuzzle)
                  {
                     _x = this._x;
                     _y = this._y;
                     _rotation = this._rotation;
                  }
                  beenShaved++;
                  myFuzzle.beenShaved = beenShaved;
                  if(beenShaved >= 3)
                  {
                     _global.GainAward("Shave Fuzzle 3 Times");
                  }
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  _visible = false;
                  removeMovieClip(this);
               }
               else
               {
                  FuzzName = "_root." + this._name + "Fuzz" + furDecal;
                  duplicateMovieClip(_root.FuzzPuff,this._name + "Fuzz" + furDecal++,16384 + _global.effectDepth++);
                  setProperty(FuzzName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(FuzzName, _X, this._x);
                  setProperty(FuzzName, _Y, this._y);
                  _global.MakeNoise("Slice");
                  fuzz--;
                  fuzzRecover = 120;
                  recoil = 20;
                  _rotation = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
                  speedBoost = 3;
                  lunging = false;
                  if(_currentframe > 85)
                  {
                     speed /= 2;
                  }
                  else if(_currentframe > 61)
                  {
                     speed *= 2;
                  }
                  gotoAndPlay(1);
               }
            }
         }
      }
      if(killedBy != null && recoil == 0)
      {
         if(killedBy.tool)
         {
            duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
            setProperty("_root." + _name + "Bounty", _X, this._x);
            setProperty("_root." + _name + "Bounty", _Y, this._y);
            BountyObject = eval("_root." + _name + "Bounty");
            BountyObject.bounty = "t14";
         }
         toKillX = _X - killedBy._x;
         toKillY = _Y - killedBy._y;
         killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         killDir -= 180;
         if(killedBy._name.slice(0,7) == "Grinder" || killedBy.exploded || fuzz == 1)
         {
            FuzzName = "_root." + this._name + "Fuzz" + furDecal;
            duplicateMovieClip(_root.FuzzPuff,this._name + "Fuzz" + furDecal++,16384 + _global.effectDepth++);
            setProperty(FuzzName, _rotation, killDir);
            setProperty(FuzzName, _X, this._x);
            setProperty(FuzzName, _Y, this._y);
            SplatName = "_root." + this._name + "Splat";
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, killDir);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _Y, this._y);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(13806391);
            _global.MakeNoise("Splat");
            _visible = false;
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            this.removeMovieClip();
         }
         else
         {
            FuzzName = "_root." + this._name + "Fuzz" + furDecal;
            duplicateMovieClip(_root.FuzzPuff,this._name + "Fuzz" + furDecal++,16384 + _global.effectDepth++);
            setProperty(FuzzName, _rotation, killDir);
            setProperty(FuzzName, _X, this._x);
            setProperty(FuzzName, _Y, this._y);
            _global.MakeNoise("Slice");
            fuzz--;
            fuzzRecover = 120;
            justBounced = 8;
            recoil = 20;
            bouncedOffX = killedBy._x;
            bouncedOffY = killedBy._y;
         }
      }
      if(justBounced == 0 || killedBy != null)
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
                  duplicateMovieClip(_root.HeroChow,_name + "Chowing",16384 + _global.heroDepth++);
                  myChow = eval("_root." + _name + "Chowing");
                  with(myChow)
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
                     if(!lunging)
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
            killedBy = null;
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
         _Y = _Y - (speed + speedBoost) * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + (speed + speedBoost) * Math.sin(_rotation * 0.017453292519943295);
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
               speed *= 0.5;
               gotoAndPlay(62);
            }
         }
      }
      if(_currentframe == 86)
      {
         speed *= 4;
         lunging = true;
         _global.MakeNoise("FuzzGrowl");
      }
      else if(_currentframe == 106)
      {
         speed /= 2;
         lunging = false;
      }
      else if(_currentframe == 61)
      {
         gotoAndPlay(1);
      }
   }
   else
   {
      stop();
   }
}

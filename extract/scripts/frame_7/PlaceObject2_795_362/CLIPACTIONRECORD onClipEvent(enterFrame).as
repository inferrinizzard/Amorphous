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
      if(recoil > 0)
      {
         recoil--;
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
               SplatName = "_root." + this._name + "Splat" + lilSplats;
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat" + lilSplats++,16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               if(health == 0 || _global.RazorGlaiveEquipped)
               {
                  SplatName = "_root." + this._name + "BigSplat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "BigSplat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _xscale, 170);
                  setProperty(SplatName, _Y, this._y);
                  setProperty(SplatName, _yscale, 170);
                  _global.MakeNoise("Pop");
                  _global.MakeNoise("Splash");
                  duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Bounty", _X, this._x);
                  setProperty("_root." + _name + "Bounty", _Y, this._y);
                  BountyObject = eval("_root." + _name + "Bounty");
                  BountyObject.bounty = 15;
                  _global.GainAward("First Oozle");
                  _global.KillCount("Oozle",15);
                  _root.Census.colorsOnKill.push(_name);
                  if(SearchArray(EnemiesKilled,"Oozle") == null)
                  {
                     EnemiesKilled.push("Oozle");
                  }
                  _visible = false;
                  _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                  this.removeMovieClip();
               }
               else
               {
                  _global.MakeNoise("Slice");
               }
            }
         }
      }
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
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  if(hitTarget._name.slice(0,7) == "Gloople" && int(Math.random() * 100) + 1 < 11)
                  {
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                     _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                     duplicateMovieClip(_root.OozleGlom,"Glom" + _name.slice(5),16384 + _global.baddieDepth++);
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
                     hitTarget.killedBy = this;
                  }
               }
            }
            x++;
         }
      }
      if(killedBy != null)
      {
         killName = killedBy._name.slice(0,4);
         if(killName == "Oozl" || killName == "Shar" || killName == "Grin" || killName == "Gray" || killedBy.exploded || killName == "Horr" || killedBy.claw)
         {
            if(killedBy.tool)
            {
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = "t15";
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
            _global.MakeNoise("Pop");
            _global.MakeNoise("Splash");
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
   }
   else
   {
      stop();
   }
}

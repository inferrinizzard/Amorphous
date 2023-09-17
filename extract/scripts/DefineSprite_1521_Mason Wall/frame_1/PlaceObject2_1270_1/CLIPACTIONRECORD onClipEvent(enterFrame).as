onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_parent._currentframe < 31)
      {
         _parent.play();
      }
      else
      {
         if(!formed)
         {
            _global.Enemies.push(_parent._name);
            _parent.stop();
            formed = true;
         }
         if(_global.HeroAction == "attacking")
         {
            if(_root.HeroSlashin._currentframe > 6 && _root.HeroSlashin._currentframe < 14)
            {
               f = 0;
               while(f < 6)
               {
                  if(_root.HeroSwing.hittest(ContactsX[f],ContactsY[f],true))
                  {
                     SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                     duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                     setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                     setProperty(SparkName, _X, ContactsX[f]);
                     setProperty(SparkName, _Y, ContactsY[f]);
                     _global.MakeNoise("Clang");
                     _global.HeroAction = "bounceback";
                     if(_global.gameMode != "Practice")
                     {
                        _global.PlayerSparks = _global.PlayerSparks + 1;
                        if(_global.PlayerSparks >= 50)
                        {
                           _global.GainAward("50 Sparks");
                        }
                     }
                     if(_global.RazorGlaiveEquipped)
                     {
                        _parent.Health -= 15;
                     }
                     _parent.Health -= 10;
                     f = 6;
                  }
                  f++;
               }
            }
         }
         if(_parent.hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
         {
            _global.justHit = _parent;
            toTargetX = _parent._x - _root.HeroPointer._x;
            toTargetY = _parent._y - _root.HeroPointer._y;
            targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
            _root.HeroPointer._y -= 10 * Math.cos(targetDirection * 0.017453292519943295);
            _root.HeroPointer._x += 10 * Math.sin(targetDirection * 0.017453292519943295);
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _parent._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               targ = hitTarget._name.slice(0,4);
               if(targ == "Bite" || targ == "Fuzz" || targ == "Oozl" || targ == "Gray" || targ == "Clut" || targ == "Horr" || targ == "Shar" || targ == "Amal" || targ == "Razo")
               {
                  if(_parent.hitTest(hitTarget._x,hitTarget._y,true))
                  {
                     toTargetX = _parent._x - hitTarget._x;
                     toTargetY = _parent._y - hitTarget._y;
                     targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                     if(hitTarget.spines || targ == "Horr" && hitTarget.action != "collect")
                     {
                        _global.MakeNoise("Clang");
                        _parent.killedBy = hitTarget;
                        SparkName = "_root." + _parent._name + "Sparks" + myEffects;
                        duplicateMovieClip(_root.Sparks,_parent._name + "Sparks" + myEffects++,16384 + _global.effectDepth++);
                        setProperty(SparkName, _rotation, targetDirection);
                        setProperty(SparkName, _X, hitTarget._x);
                        setProperty(SparkName, _Y, hitTarget._y);
                     }
                     else
                     {
                        _global.MakeNoise("Boing");
                     }
                     hitTarget._y -= 10 * Math.cos(targetDirection * 0.017453292519943295);
                     hitTarget._x += 10 * Math.sin(targetDirection * 0.017453292519943295);
                     hitTarget._rotation = targetDirection;
                  }
               }
            }
            x++;
         }
         if(_parent.killedBy != null)
         {
            if(_parent.killedBy.exploded)
            {
               _parent.Health -= 40;
            }
            else if(_parent.killedBy.disk || _parent.killedBy.claw)
            {
               _parent.Health -= 5;
            }
            else
            {
               switch(_parent.killedBy._name.slice(0,4))
               {
                  case "Grin":
                     _parent.Health -= 25;
                     break;
                  case "Horr":
                     _parent.Health -= 15;
                     break;
                  case "Gray":
                     _parent.Health -= 5;
                     break;
                  case "Shar":
                     _parent.Health -= 5;
                     break;
                  case "Void":
                     _parent.Health--;
               }
            }
            _parent.killedBy = null;
         }
         if(_parent.Health < healthWas)
         {
            damageTook = healthWas - _parent.Health;
            rubble = int(Math.random() * 3) + 2 + int(damageTook / 5) * 2;
            if(damageTook == 1)
            {
               rubble = 1;
            }
            x = 1;
            while(x <= rubble)
            {
               _global.MakeNoise("Pebble");
               RockName = this._name + "Stone" + myEffects++;
               duplicateMovieClip(_root.Stone,RockName,16384 + _global.effectDepth++);
               RockName = "_root." + RockName;
               legalSpot = false;
               while(legalSpot == false)
               {
                  rockDistance = int(Math.random() * 75);
                  rockOffset = int(Math.random() * 360) - 180;
                  rockX = _parent._x + rockDistance * Math.sin(rockOffset * 0.017453292519943295);
                  rockY = _parent._y - rockDistance * Math.cos(rockOffset * 0.017453292519943295);
                  if(_parent.hitTest(rockX,rockY,true))
                  {
                     legalSpot = true;
                  }
               }
               rockScale = int(Math.random() * 40) + 10;
               with(eval(RockName))
               {
                  _x = rockX;
                  _y = rockY;
                  _rotation = int(Math.random() * 360) - 180;
                  _xscale = rockScale;
                  _yscale = rockScale;
               }
               _root.attachMovie("RockDust","Dust" + myEffects,_global.capDepth++);
               with(eval("_root.Dust" + myEffects++))
               {
                  _x = rockX;
                  _y = rockY;
                  _rotation = rockOffset;
               }
               x++;
            }
            healthWas = _parent.Health;
         }
         if(_parent.Health <= 0)
         {
            rubble = int(Math.random() * 4) + 15;
            x = 1;
            while(x <= rubble)
            {
               _global.MakeNoise("Pebble");
               _global.MakeNoise("GrinderKill");
               RockName = this._name + "Stone" + myEffects++;
               duplicateMovieClip(_root.Stone,RockName,16384 + _global.effectDepth++);
               RockName = "_root." + RockName;
               legalSpot = false;
               while(legalSpot == false)
               {
                  rockDistance = int(Math.random() * 75);
                  rockOffset = int(Math.random() * 360) - 180;
                  rockX = _parent._x + rockDistance * Math.sin(rockOffset * 0.017453292519943295);
                  rockY = _parent._y - rockDistance * Math.cos(rockOffset * 0.017453292519943295);
                  if(_parent.hitTest(rockX,rockY,true))
                  {
                     legalSpot = true;
                  }
               }
               rockScale = int(Math.random() * 80) + 50;
               with(eval(RockName))
               {
                  _x = rockX;
                  _y = rockY;
                  _rotation = rockOffset;
                  _xscale = rockScale;
                  _yscale = rockScale;
               }
               _root.attachMovie("RockDust","Dust" + myEffects,_global.capDepth++);
               with(eval("_root.Dust" + myEffects++))
               {
                  _x = rockX;
                  _y = rockY;
                  _rotation = 60 + int(Math.random() * 40) - 20;
               }
               x++;
            }
            _parent.removeMovieClip();
         }
      }
   }
   else
   {
      _parent.stop();
   }
}

onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_parent.exploded)
      {
         _parent.removeMovieClip();
      }
      if(lifeSpan > 0)
      {
         lifeSpan--;
         _parent._rotation += spin;
         if(lifeSpan > 40)
         {
            _parent._xscale += 1;
            _parent._yscale += 1;
         }
         else if(lifeSpan > 20)
         {
            _parent._xscale -= 1;
            _parent._yscale -= 1;
         }
         else if(lifeSpan > 10)
         {
            _parent._xscale += 2;
            _parent._yscale += 2;
         }
         else
         {
            _parent._xscale -= 2;
            _parent._yscale -= 2;
         }
         if(lifeSpan == 20)
         {
            spin = 10;
         }
      }
      else if(lifeSpan >= -3)
      {
         alignment = moveDirection - 180;
         if(alignment < -180)
         {
            alignment += 360;
         }
         x = 1;
         while(x <= spin)
         {
            if(int(_parent._rotation) == int(moveDirection) || int(_parent._rotation) == int(alignment))
            {
               if(_parent._currentframe == 1)
               {
                  _global.MakeNoise("Mason Activate");
               }
               _parent.gotoAndStop(2);
               lifeSpan--;
               break;
            }
            _parent._rotation = _parent._rotation + 1;
            x++;
         }
      }
      else if(lifeSpan == -4)
      {
         _parent.exploded = true;
         _global.MakeNoise("Wall Pop");
         _global.MakeNoise("Explode");
         duplicateMovieClip(_root.VoidPulse,"MasonShockwave",16384 + _global.effectDepth++);
         with(_root.MasonShockwave)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         blastName = "MasonBlastmark" + _global.backgroundDepth;
         duplicateMovieClip(_root.Blastmark,blastName,16384 + _global.backgroundDepth++);
         with(eval("_root." + blastName))
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         duplicateMovieClip(_root.Blackout,"MasonBright",22384);
         with(_root.MasonBright)
         {
            _x = 275;
            _y = 200;
            _xscale = 1000;
            _yscale = 1000;
         }
         BlinkColor = new Color(_root.MasonBright);
         BlinkColor.setRGB(16777215);
         ashpuffs = int(Math.random() * 3) + 2;
         x = 0;
         while(x < ashpuffs)
         {
            duplicateMovieClip(_root.GroundDirt,"MasonAsh" + x,16384 + _global.effectDepth++);
            with(eval("_root.MasonAsh" + x))
            {
               _x = this._parent._x;
               _y = this._parent._y;
               _rotation = int(Math.random() * 360) - 179;
            }
            AshColor = new Color(eval("_root.MasonAsh" + x));
            AshColor.setRGB(0);
            x++;
         }
         _root.attachMovie("Mason Blast","myBlast",_global.capDepth++);
         with(_root.myBlast)
         {
            _x = this._parent._x;
            _y = this._parent._y;
            _rotation = this._parent._rotation;
         }
         if(eval(_root.HeroPointer) != undefined && _global.justHit == null)
         {
            toTargetX = _parent._x - _root.HeroPointer._x;
            toTargetY = _parent._y - _root.HeroPointer._y;
            targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
            distToHero = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
            if(distToHero <= 30)
            {
               _global.justHit = _parent;
            }
            else if(distToHero <= 80)
            {
               _global.justHit = this;
            }
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               toTargetX = _parent._x - hitTarget._x;
               toTargetY = _parent._y - hitTarget._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               distToEnemy = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
               if(distToEnemy <= 50)
               {
                  hitTarget.killedBy = _parent;
               }
               else if(distToEnemy <= 100)
               {
                  if(!hitTarget.wall && !hitTarget.tool)
                  {
                     hitTarget._y -= 30 * Math.cos(targetDirection * 0.017453292519943295);
                     hitTarget._x += 30 * Math.sin(targetDirection * 0.017453292519943295);
                     hitTarget._rotation = targetDirection;
                  }
               }
            }
            x++;
         }
         x = 0;
         while(x < _global.Hazards.length)
         {
            targetHazard = eval("_root." + _global.Hazards[x]);
            if(targetHazard._name.slice(0,5) == "Razor")
            {
               toTargetX = _parent._x - targetHazard._x;
               toTargetY = _parent._y - targetHazard._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               if(Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY) <= 80)
               {
                  targetHazard.killedBy = _parent;
               }
            }
            x++;
         }
      }
      _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
      _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
      if(speed > 0)
      {
         speed -= 0.05;
      }
      else
      {
         speed = 0;
      }
      if(speed == 0 && lifeSpan > 0)
      {
         spin = 10;
         lifeSpan = 0;
      }
      if(_parent._y < -5 || _parent._x < -5 || _parent._y > 405 || _parent._x > 555)
      {
         myTab = eval(_global.RewardTab("Mason"));
         myTab.charge = 200;
         _parent.removeMovieClip();
      }
   }
}

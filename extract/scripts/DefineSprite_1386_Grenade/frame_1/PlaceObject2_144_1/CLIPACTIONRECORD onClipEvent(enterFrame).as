onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_parent.exploded)
      {
         _parent.removeMovieClip();
      }
      if(lifeSpan > 0)
      {
         Lift = int(lifeSpan / 5) - 6;
         if(Lift <= -4)
         {
            Lift += 5;
         }
         _parent._xscale += Lift;
         _parent._yscale += Lift;
         if(lifeSpan == 10)
         {
            spin = int(Math.random() * 40) - 20;
            _global.MakeNoise("Dirt Hit");
         }
         lifeSpan--;
         _parent._rotation += spin;
         if(lifeSpan > 5)
         {
            fusePointY = _parent._y - 10 * Math.cos(_parent._rotation * 0.017453292519943295);
            fusePointX = _parent._x + 10 * Math.sin(_parent._rotation * 0.017453292519943295);
            sparkName = "grenadeFuse" + myEffects++;
            _root.attachMovie("Spark",sparkName,_global.capDepth++);
            with(eval("_root." + sparkName))
            {
               _x = fusePointX;
               _y = fusePointY;
               _rotation = this._parent._rotation + int(Math.random() * 20) - 10;
            }
            sparkColor = new Color(eval("_root." + sparkName));
            sparkColor.setRGB(16577155);
         }
      }
      else
      {
         myFuse.stop();
         _parent.exploded = true;
         _global.MakeNoise("Grenade Pop");
         _global.MakeNoise("Explode");
         duplicateMovieClip(_root.VoidPulse,"GrenadeShockwave",16384 + _global.effectDepth++);
         with(_root.GrenadeShockwave)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         blastName = "GrenadeBlastmark" + _global.backgroundDepth;
         duplicateMovieClip(_root.Blastmark,blastName,16384 + _global.backgroundDepth++);
         with(eval("_root." + blastName))
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         duplicateMovieClip(_root.Blackout,"GrenadeBright",22384);
         with(_root.GrenadeBright)
         {
            _x = 275;
            _y = 200;
            _xscale = 1000;
            _yscale = 1000;
         }
         BlinkColor = new Color(_root.GrenadeBright);
         BlinkColor.setRGB(16777215);
         ashpuffs = int(Math.random() * 3) + 2;
         x = 0;
         while(x < ashpuffs)
         {
            duplicateMovieClip(_root.GroundDirt,"GrenadeAsh" + x,16384 + _global.effectDepth++);
            with(eval("_root.GrenadeAsh" + x))
            {
               _x = this._parent._x;
               _y = this._parent._y;
               _rotation = int(Math.random() * 360) - 179;
            }
            AshColor = new Color(eval("_root.GrenadeAsh" + x));
            AshColor.setRGB(0);
            x++;
         }
         if(eval(_root.HeroPointer) != undefined && _global.justHit == null)
         {
            toTargetX = _parent._x - _root.HeroPointer._x;
            toTargetY = _parent._y - _root.HeroPointer._y;
            targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
            distToHero = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
            if(distToHero <= 100)
            {
               _global.justHit = _parent;
            }
            else if(distToHero <= 150)
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
               if(distToEnemy <= 180)
               {
                  hitTarget.killedBy = _parent;
               }
               else if(distToEnemy <= 250)
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
               if(Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY) <= 250)
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
      if(_parent._y < -5 || _parent._x < -5 || _parent._y > 405 || _parent._x > 555)
      {
         myTab = eval(_global.RewardTab("Grenade"));
         myTab.charge = 200;
         _parent.removeMovieClip();
      }
   }
}

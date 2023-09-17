onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
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
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 1;
               _global.GainAward("First Gloople");
               _global.KillCount("Gloople",1000);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Gloople") == null)
               {
                  EnemiesKilled.push("Gloople");
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
            BountyObject.bounty = "t1";
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
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            justBounced = 8;
            bouncedOffX = _root.HeroPointer._x;
            bouncedOffY = _root.HeroPointer._y;
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
                  if(hitTarget.hitTest(_X,_Y,true))
                  {
                     if(hitTarget._name.slice(0,7) == "Gloople" && int(Math.random() * 100) + 1 < 6)
                     {
                        _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                        _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
                        duplicateMovieClip(_root.GloopleGlom,"Glom" + _name.slice(7),16384 + _global.baddieDepth++);
                        _global.Enemies.push("Glom" + _name.slice(7));
                        Glommie = eval("_root.Glom" + _name.slice(7));
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
                     else if(hitTarget._name.slice(0,4) != "Amal")
                     {
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
            _global.MakeNoise("Boing");
            if(_X > bouncedOffX)
            {
               gotoSpotX = int(Math.random() * (550 - _X)) + _X + 20;
            }
            else
            {
               gotoSpotX = int(Math.random() * _X) - 19;
            }
            if(_Y > bouncedOffY)
            {
               gotoSpotY = int(Math.random() * (400 - _Y)) + _Y + 20;
            }
            else
            {
               gotoSpotY = int(Math.random() * _Y) - 19;
            }
            delta_bounceX = Math.abs(_X - bouncedOffX);
            delta_bounceY = Math.abs(_Y - bouncedOffY);
            if(delta_bounceX > delta_bounceY)
            {
               if(gotoSpotX > 275)
               {
                  gotoSpotX = 555;
               }
               else
               {
                  gotoSpotX = -5;
               }
            }
            else if(gotoSpotY > 200)
            {
               gotoSpotY = 405;
            }
            else
            {
               gotoSpotY = -5;
            }
         }
      }
      else
      {
         justBounced--;
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      _rotation = targetRotation;
      if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed)
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

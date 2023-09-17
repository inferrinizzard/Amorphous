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
               SplatNum = int(Math.random() * 3) + 1;
               duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(15329345);
               duplicateMovieClip(_root.StickyMark,this._name + "SplatStickyMark",16384 + _global.markDepth++);
               with(eval(SplatName + "StickyMark"))
               {
                  _x = this._x;
                  _y = this._y;
                  gotoAndStop(SplatNum);
               }
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 3;
               _global.GainAward("First Stickie");
               _global.KillCount("Stickie",100);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Stickie") == null)
               {
                  EnemiesKilled.push("Stickie");
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
            BountyObject.bounty = "t3";
         }
         toKillX = _X - killedBy._x;
         toKillY = _Y - killedBy._y;
         killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         killDir -= 180;
         SplatName = "_root." + this._name + "Splat";
         SplatNum = int(Math.random() * 3) + 1;
         duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killDir);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(15329345);
         duplicateMovieClip(_root.StickyMark,this._name + "SplatStickyMark",16384 + _global.markDepth++);
         with(eval(SplatName + "StickyMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(_root.HeroPointer.hitTest(_X,_Y,true))
      {
         objectHitX = _root.HeroPointer._x;
         objectHitY = _root.HeroPointer._y;
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
                  objectHitX = hitTarget._x;
                  objectHitY = hitTarget._y;
                  break;
               }
            }
            x++;
         }
      }
      if(objectHitX != null && objectHitY != null)
      {
         SplatName = "_root." + this._name + "Splat";
         SplatNum = int(Math.random() * 3) + 1;
         duplicateMovieClip(eval("_root.Splat" + SplatNum),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, (- Math.atan2(_X - objectHitX,_Y - objectHitY)) / 0.017453292519943295);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(15329345);
         duplicateMovieClip(_root.StickyMark,this._name + "SplatStickyMark",16384 + _global.markDepth++);
         with(eval(SplatName + "StickyMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(!hasMoved)
      {
         delta_x = _X - pathSpotX;
         delta_y = _Y - pathSpotY;
         targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         _rotation = targetRotation;
      }
      if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
      {
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         hasMoved = true;
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

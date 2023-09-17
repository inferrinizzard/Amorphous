onClipEvent(enterFrame){
   if(!mommy && !stuck && !_global.pause)
   {
      if(gotoSpotX == null)
      {
         gotoSpotX = _X + 170 * Math.sin(_rotation * 0.017453292519943295);
         gotoSpotY = _Y - 170 * Math.cos(_rotation * 0.017453292519943295);
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
               setProperty(SplatName, _xscale, 40);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 40);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(13781982);
               _global.MakeNoise("LilSplat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 3;
               _visible = false;
               this.removeMovieClip();
            }
         }
      }
      if(killedBy != null)
      {
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killedBy._rotation);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _xscale, 40);
         setProperty(SplatName, _Y, this._y);
         setProperty(SplatName, _yscale, 40);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(13781982);
         _global.MakeNoise("LilSplat");
         _visible = false;
         this.removeMovieClip();
      }
      if(_root.HeroPointer.hitTest(_X,_Y,true))
      {
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab != null && suitTab.charge > 1)
         {
            suitTab.charge -= 15;
            SplatName = "_root." + this._name + "Splat";
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, this._rotation);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _xscale, 40);
            setProperty(SplatName, _Y, this._y);
            setProperty(SplatName, _yscale, 40);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(13781982);
            _global.MakeNoise("LilSplat");
            _root.Census.perfectRun = false;
            _visible = false;
            this.removeMovieClip();
         }
         else if(_root.HeroPointer.clutters.length < 10)
         {
            play();
            stuck = true;
            stuck_x = _root.HeroPointer._x - this._x;
            stuck_y = _root.HeroPointer._y - this._y;
            stuckRotation = (- Math.atan2(stuck_x,stuck_y)) / 0.017453292519943295;
            offHeroRotation = stuckRotation - _root.HeroPointer._rotation;
            _root.HeroPointer.clutters.push(this);
            _root.Census.perfectRun = false;
            armorTab = eval(_global.RewardTab("Armor"));
            if(armorTab != null && armorTab.charge == 300)
            {
               stuckToArmor = true;
            }
         }
      }
      else
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != daddyClutter._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  SplatName = "_root." + this._name + "Splat";
                  duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                  setProperty(SplatName, _rotation, killedBy._rotation);
                  setProperty(SplatName, _X, this._x);
                  setProperty(SplatName, _xscale, 40);
                  setProperty(SplatName, _Y, this._y);
                  setProperty(SplatName, _yscale, 40);
                  SplatColor = new Color(eval(SplatName));
                  SplatColor.setRGB(13781982);
                  _global.MakeNoise("LilSplat");
                  _visible = false;
                  this.removeMovieClip();
               }
            }
            x++;
         }
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
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, this._rotation);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _xscale, 40);
         setProperty(SplatName, _Y, this._y);
         setProperty(SplatName, _yscale, 40);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(13781982);
         _global.MakeNoise("LilSplat");
         _visible = false;
         this.removeMovieClip();
      }
   }
   else if(!mommy && stuck && !_global.pause)
   {
      if(_currentframe < 10)
      {
         play();
      }
      gotoSpotX = _root.HeroPointer._x;
      gotoSpotY = _root.HeroPointer._y;
      if(_currentframe == 10)
      {
         stop();
      }
      armorTab = eval(_global.RewardTab("Armor"));
      if(armorTab != null && armorTab.charge != 300)
      {
         if(stuckToArmor)
         {
            SplatName = "_root." + this._name + "Splat";
            duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
            setProperty(SplatName, _rotation, this._rotation);
            setProperty(SplatName, _X, this._x);
            setProperty(SplatName, _xscale, 40);
            setProperty(SplatName, _Y, this._y);
            setProperty(SplatName, _yscale, 40);
            SplatColor = new Color(eval(SplatName));
            SplatColor.setRGB(13781982);
            _root.HeroPointer.clutters -= 1;
            _root.HeroPointer.speed += 1;
            _global.MakeNoise("LilSplat");
            _visible = false;
            this.removeMovieClip();
         }
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      myRotation = _root.HeroPointer._rotation + offHeroRotation;
      if(myRotation > 179)
      {
         myRotation -= 360;
      }
      if(myRotation < -180)
      {
         myRotation += 360;
      }
      this._x = gotoSpotX + 10 * Math.sin(myRotation * 0.017453292519943295);
      this._y = gotoSpotY - 10 * Math.cos(myRotation * 0.017453292519943295);
      this._rotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(Math.abs(_rotation - priorRotation) < 190)
      {
         totalRotation += Math.abs(_rotation - priorRotation);
      }
      priorRotation = _rotation;
      if((totalRotation >= 3000 || eval(_root.HeroPointer) == undefined) && (_global.gameMode != "Single" || _global.ClearTime == 0))
      {
         ClutterNum = _root.SpawnPoint.ChildCounter;
         ClutterName = "_root.Clutter" + String(ClutterNum);
         duplicateMovieClip(_root.Clutter,"Clutter" + String(ClutterNum),16384 + _global.baddieDepth++);
         with(eval(ClutterName))
         {
            _x = this._x;
            _xscale = 40;
            _y = this._y;
            _yscale = 40;
            _rotation = this._rotation - 180;
         }
         _global.Enemies.push("Clutter" + String(ClutterNum));
         _root.SpawnPoint.ChildCounter = _root.SpawnPoint.ChildCounter + 1;
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
}

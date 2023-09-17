onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(framesLoose < 30)
      {
         _rotation = _rotation + 30;
      }
      if(framesLoose > 0)
      {
         if(framesLoose < 30)
         {
            speed = 3;
         }
         else if(framesLoose < 90)
         {
            speed = 0;
         }
         else
         {
            removeMovieClip(this);
         }
         framesLoose++;
      }
      if(_global.HeroAction == "attacking" && framesLoose == 0)
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               SplatDir = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, SplatDir);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 40);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 40);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(2781657);
               _global.MakeNoise("LilSplat");
               moveDirection = SplatDir;
               gotoAndStop(2);
               framesLoose++;
            }
         }
      }
      if(framesLoose == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            _global.justHit = this;
            armorTab = eval(_global.RewardTab("Armor"));
            if(armorTab != null && armorTab.charge == 300)
            {
               SplatDir = _rotation - 180;
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, SplatDir);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 40);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 40);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(2781657);
               _global.MakeNoise("LilSplat");
               moveDirection = SplatDir;
               gotoAndStop(2);
               framesLoose++;
            }
         }
         else
         {
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != daddyHorror._name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  if(hitTarget.hitTest(_X,_Y,true))
                  {
                     Hit = hitTarget._name.slice(0,4);
                     if(Hit == "myBo" || Hit == "myDr" || Hit == "Bite" || Hit == "Shar" && hitTarget.spines || Hit == "Grin" || Hit == "Oozl" || Hit == "Gray" || Hit == "Void" || Hit == "Horr" || Hit == "Quee" || Hit == "Razo" || Hit == "Amal" && hitTarget._xscale > 70)
                     {
                        SplatDir = _rotation - 180;
                        SplatName = "_root." + this._name + "Splat";
                        duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                        setProperty(SplatName, _rotation, SplatDir);
                        setProperty(SplatName, _X, this._x);
                        setProperty(SplatName, _xscale, 40);
                        setProperty(SplatName, _Y, this._y);
                        setProperty(SplatName, _yscale, 40);
                        SplatColor = new Color(eval(SplatName));
                        SplatColor.setRGB(2781657);
                        _global.MakeNoise("LilSplat");
                        moveDirection = SplatDir;
                        gotoAndStop(2);
                        framesLoose++;
                     }
                     else
                     {
                        hitTarget.gotoAndStop(1);
                        duplicateMovieClip(_root.BiterMorph,hitTarget._name + "Morph",16384 + _global.capDepth++);
                        removeMovieClip(this);
                     }
                  }
               }
               x++;
            }
         }
      }
      if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
      {
         _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
      }
      else
      {
         _visible = false;
         this.removeMovieClip();
      }
   }
}

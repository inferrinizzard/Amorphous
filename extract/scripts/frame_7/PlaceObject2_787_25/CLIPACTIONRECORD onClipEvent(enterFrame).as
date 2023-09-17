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
      if(_currentframe == 20 || _currentframe == 40 || _currentframe == 60)
      {
         switch(_currentframe)
         {
            case 20:
               bubbleRotation = _rotation + 45;
               break;
            case 40:
               bubbleRotation = _rotation - 90;
               break;
            case 60:
               bubbleRotation = _rotation - 180;
         }
         if(bubbleRotation > 179)
         {
            bubbleRotation -= 360;
         }
         if(bubbleRotation < -180)
         {
            bubbleRotation += 360;
         }
         PopName = "_root." + this._name + "Pop" + _currentframe;
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Pop" + _currentframe,16384 + _global.effectDepth++);
         setProperty(PopName, _rotation, bubbleRotation);
         setProperty(PopName, _X, this._x + 10 * Math.sin(bubbleRotation * 0.017453292519943295));
         setProperty(PopName, _Y, this._y - 10 * Math.cos(bubbleRotation * 0.017453292519943295));
         setProperty(PopName, _xscale, 30);
         setProperty(PopName, _yscale, 30);
         PopColor = new Color(eval(PopName));
         PopColor.setRGB(15898925);
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
               SplatColor.setRGB(15898925);
               duplicateMovieClip(_root.AcidMark,this._name + "SplatAcidMark",16384 + _global.markDepth++);
               with(eval(SplatName + "AcidMark"))
               {
                  _x = this._x;
                  _y = this._y;
                  gotoAndStop(SplatNum);
               }
               _global.MakeNoise("Splat");
               _global.MakeNoise("Sizzle");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 10;
               _global.GainAward("First Meltie");
               _global.KillCount("Meltie",50);
               _root.Census.colorsOnKill.push(_name);
               if(SearchArray(EnemiesKilled,"Meltie") == null)
               {
                  EnemiesKilled.push("Meltie");
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
            BountyObject.bounty = "t10";
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
         SplatColor.setRGB(15898925);
         duplicateMovieClip(_root.AcidMark,this._name + "SplatAcidMark",16384 + _global.markDepth++);
         with(eval(SplatName + "AcidMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _global.MakeNoise("Sizzle");
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
         SplatColor.setRGB(15898925);
         duplicateMovieClip(_root.AcidMark,this._name + "SplatAcidMark",16384 + _global.markDepth++);
         with(eval(SplatName + "AcidMark"))
         {
            _x = this._x;
            _y = this._y;
            gotoAndStop(SplatNum);
         }
         _global.MakeNoise("Splat");
         _global.MakeNoise("Sizzle");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
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

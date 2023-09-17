onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(gotoSpotX == null)
      {
         gotoSpotX = _X + 210 * Math.sin(_rotation * 0.017453292519943295);
         gotoSpotY = _Y - 210 * Math.cos(_rotation * 0.017453292519943295);
      }
      if(eval(daddyGray) == undefined || daddyGray.action == "stun" || daddyGray.action == "gaurd")
      {
         lancing = false;
         bowing = false;
         reeling = false;
         x = 0;
         while(x < tendrilBits)
         {
            BitName = eval("_root." + bankName + "Bit" + x);
            BitName.play();
            x++;
         }
         play();
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true))
            {
               SparkName = "_root." + this._name + "Sparks";
               duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
               setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
               setProperty(SparkName, _X, this._x);
               setProperty(SparkName, _Y, this._y);
               if(_global.gameMode != "Practice")
               {
                  _global.PlayerSparks = _global.PlayerSparks + 1;
                  if(_global.PlayerSparks >= 50)
                  {
                     _global.GainAward("50 Sparks");
                  }
               }
               _global.MakeNoise("Clang");
               lancing = false;
               bowing = true;
               framesExisted = 0;
               daddyGray.action = "reel";
               _global.HeroAction = "bounceback";
            }
         }
      }
      if(_root.HeroPointer.hitTest(_X,_Y,true))
      {
         if(lancing)
         {
            armorTab = eval(_global.RewardTab("Armor"));
            if(armorTab == null || armorTab.charge != 300)
            {
               _visible = false;
               duplicateMovieClip(_root.HeroSpear,daddyGray._name + "HeroSpear",16384 + _global.heroDepth++);
               heroSpeared = eval("_root." + daddyGray._name + "HeroSpear");
               with(heroSpeared)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
            }
            else
            {
               lancing = false;
               bowing = true;
               framesExisted = 0;
               daddyGray.action = "reel";
            }
            _global.justHit = this;
         }
         else
         {
            _global.justHit = this;
         }
      }
      else
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != daddyGray._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  if(hitTarget._name.slice(0,5) == "myBox" || hitTarget._name.slice(0,6) == "Horror" || hitTarget._name.slice(0,7) == "Grinder" || hitTarget._name.slice(0,4) == "Gray" && hitTarget.action == "guard")
                  {
                     SparkName = "_root." + this._name + "Sparks";
                     duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                     setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                     setProperty(SparkName, _X, this._x);
                     setProperty(SparkName, _Y, this._y);
                     _global.MakeNoise("Clang");
                     if(lancing)
                     {
                        lancing = false;
                        bowing = true;
                        framesExisted = 0;
                        daddyGray.action = "reel";
                     }
                  }
                  else if(hitTarget._name.slice(0,5) == "Sharp" && hitTarget.spines)
                  {
                     SparkName = "_root." + this._name + "Sparks";
                     duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                     setProperty(SparkName, _rotation, _root.HeroPointer._rotation - 90);
                     setProperty(SparkName, _X, this._x);
                     setProperty(SparkName, _Y, this._y);
                     _global.MakeNoise("Clang");
                     if(lancing)
                     {
                        lancing = false;
                        bowing = true;
                        framesExisted = 0;
                        daddyGray.action = "reel";
                     }
                     hitTarget.killedBy = this;
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
      if(lancing)
      {
         delta_x = _X - gotoSpotX;
         delta_y = _Y - gotoSpotY;
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed)
         {
            _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
            x = 0;
            while(x < tendrilBits)
            {
               BitName = "_root." + daddyGray._name + "Bit" + x;
               with(eval(BitName))
               {
                  _y -= speed * Math.cos(_rotation * 0.017453292519943295);
                  _x += speed * Math.sin(_rotation * 0.017453292519943295);
               }
               x++;
            }
         }
         else
         {
            lancing = false;
            bowing = true;
            framesExisted = 0;
            daddyGray.action = "reel";
            _global.MakeNoise("GraySnap");
         }
      }
      else if(bowing)
      {
         if(framesExisted < 11)
         {
            speed = 4;
            gotoSpotX = daddyGray._x;
            gotoSpotY = daddyGray._y;
            delta_x = _X - gotoSpotX;
            delta_y = _Y - gotoSpotY;
            moveRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
            _Y = _Y - speed * Math.cos(moveRotation * 0.017453292519943295);
            _X = _X + speed * Math.sin(moveRotation * 0.017453292519943295);
            position = "leftout";
            x = 0;
            while(x < tendrilBits)
            {
               dirRotation = moveRotation;
               BitName = eval("_root." + daddyGray._name + "Bit" + x);
               if(eval("_root." + daddyGray._name + "Bit" + x) == undefined)
               {
                  tendrilBits--;
               }
               else
               {
                  with(BitName)
                  {
                     switch(position)
                     {
                        case "leftout":
                           _rotation -= 4.5;
                           position = "leftfull";
                           break;
                        case "leftfull":
                           dirRotation -= 20;
                           position = "leftin";
                           break;
                        case "leftin":
                           dirRotation -= 20;
                           _rotation += 4.5;
                           position = "leftbridge";
                           break;
                        case "leftbridge":
                           _rotation += 0;
                           position = "rightout";
                           speed -= 0.5;
                           break;
                        case "rightout":
                           _rotation += 4.5;
                           position = "rightfull";
                           break;
                        case "rightfull":
                           dirRotation += 20;
                           position = "rightin";
                           break;
                        case "rightin":
                           dirRotation += 20;
                           _rotation -= 4.5;
                           position = "rightbridge";
                           break;
                        case "rightbridge":
                           _rotation -= 0;
                           position = "leftout";
                           speed -= 0.5;
                     }
                     _y -= speed * Math.cos(dirRotation * 0.017453292519943295);
                     _x += speed * Math.sin(dirRotation * 0.017453292519943295);
                  }
                  if(daddyGray.hitTest(BitName._x,BitName._y,true))
                  {
                     BitName.removeMovieClip();
                     tendrilBits--;
                  }
               }
               x++;
            }
         }
         else
         {
            bowing = false;
            reeling = true;
            _global.MakeNoise("GrayRetract");
         }
      }
      else if(reeling == true)
      {
         speed = 4;
         nextBit = eval("_root." + daddyGray._name + "Bit1");
         if(nextBit == undefined)
         {
            gotoSpotX = daddyGray._x;
            gotoSpotY = daddyGray._y;
         }
         else
         {
            gotoSpotX = nextBit._x;
            gotoSpotY = nextBit._y;
         }
         delta_x = _X - gotoSpotX;
         delta_y = _Y - gotoSpotY;
         moveRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         _Y = _Y - speed * Math.cos(moveRotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveRotation * 0.017453292519943295);
         _rotation = moveRotation - 180;
         x = 0;
         while(x < tendrilBits)
         {
            dirRotation = moveRotation;
            BitName = eval("_root." + daddyGray._name + "Bit" + x);
            if(eval("_root." + daddyGray._name + "Bit" + x) == undefined)
            {
               tendrilBits--;
            }
            else
            {
               with(BitName)
               {
                  nextBit = eval("_root." + daddyGray._name + "Bit" + (x + 1));
                  if(nextBit == undefined)
                  {
                     gotoSpotX = daddyGray._x;
                     gotoSpotY = daddyGray._y;
                  }
                  else
                  {
                     gotoSpotX = nextBit._x;
                     gotoSpotY = nextBit._y;
                  }
                  delta_x = _x - gotoSpotX;
                  delta_y = _y - gotoSpotY;
                  moveRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
                  _y -= speed * Math.cos(moveRotation * 0.017453292519943295);
                  _x += speed * Math.sin(moveRotation * 0.017453292519943295);
                  _rotation = moveRotation - 180;
               }
               if(daddyGray.hitTest(BitName._x,BitName._y,true))
               {
                  BitName.removeMovieClip();
                  tendrilBits--;
               }
            }
            x++;
         }
         if(daddyGray.hitTest(_X,_Y,true))
         {
            x = 0;
            while(x < 15)
            {
               BitName = "_root." + daddyGray._name + "Bit" + x;
               if(eval(BitName) != undefined)
               {
                  removeMovieClip(eval(BitName));
               }
               x++;
            }
            if(heroSpeared != null)
            {
               removeMovieClip(heroSpeared);
               _global.MakeNoise("Glom");
               duplicateMovieClip(_root.HeroSpearAbsorbed,daddyGray._name + "Hero",16384 + _global.effectDepth++);
               with(eval("_root." + daddyGray._name + "Hero"))
               {
                  _x = daddyGray._x;
                  _y = daddyGray._y;
                  _rotation = daddyGray._rotation;
               }
               daddyGray._xscale = 120;
               daddyGray._yscale = 120;
               daddyGray._alpha = 75;
            }
            daddyGray.action = "none";
            removeMovieClip(this);
         }
      }
      if(lancing && int(framesExisted / 2) == framesExisted / 2)
      {
         BitName = "_root." + daddyGray._name + "Bit" + tendrilBits;
         duplicateMovieClip(_root.GrayBit,daddyGray._name + "Bit" + tendrilBits,16384 + _global.effectDepth++);
         with(eval(BitName))
         {
            _x = buildAtX;
            _y = buildAtY;
            _rotation = this._rotation;
            bitNumber = tendrilBits;
         }
         tendrilBits++;
      }
      framesExisted++;
      if(_currentframe == 16)
      {
         removeMovieClip(heroSpeared);
         removeMovieClip(this);
      }
      if(heroSpeared != null)
      {
         heroSpeared._x = this._x;
         heroSpeared._y = this._y;
         heroSpeared._rotation = this._rotation;
      }
      else
      {
         _visible = true;
      }
   }
   else
   {
      stop();
   }
}

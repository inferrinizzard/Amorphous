onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      ColPtY = _Y - 18 * Math.cos(_rotation * 0.017453292519943295);
      ColPtX = _X + 18 * Math.sin(_rotation * 0.017453292519943295);
      if(!Loose)
      {
         _Y = mommyQueen._y;
         _X = mommyQueen._x;
         _rotation = mommyQueen._rotation + myAim;
         if(framesExisted < 30)
         {
            _yscale = _yscale + 2;
         }
         else if(framesExisted == 45)
         {
            duplicateMovieClip(_root.QuillPop,_name + "Pop",16384 + _global.effectDepth++);
            with(eval("_root." + _name + "Pop"))
            {
               _x = ColPtX;
               _y = ColPtY;
               _rotation = this._rotation;
            }
            _global.MakeNoise("LilSplat");
            Loose = true;
            speed = 15;
            _yscale = 100;
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(ColPtX,ColPtY,true))
            {
               if(Loose)
               {
                  pieces = int(Math.random() * 2) + 3;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + x))
                     {
                        _x = ColPtX + int(Math.random() * 20) - 10;
                        _y = ColPtY + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 140) + 70;
                     }
                     x++;
                  }
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, _root.HeroPointer._rotation + 80);
                  setProperty(SparkName, _X, ColPtX);
                  setProperty(SparkName, _Y, ColPtY);
                  if(_global.gameMode != "Practice")
                  {
                     _global.PlayerSparks = _global.PlayerSparks + 1;
                     if(_global.PlayerSparks >= 50)
                     {
                        _global.GainAward("50 Sparks");
                     }
                  }
                  _global.MakeNoise("Shatter");
                  this.removeMovieClip();
               }
               else
               {
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, moveDirection);
                  setProperty(SparkName, _X, ColPtX);
                  setProperty(SparkName, _Y, ColPtY);
                  _global.MakeNoise("Clang");
                  _global.HeroAction = "bounceback";
               }
            }
         }
      }
      if(_root.HeroPointer.hitTest(ColPtX,ColPtY,true))
      {
         if(Loose)
         {
            _global.justHit = this;
            armorTab = eval(_global.RewardTab("Armor"));
            if(armorTab == null || armorTab.charge != 300)
            {
               duplicateMovieClip(_root.HeroQuilled,_name + "Hit",16384 + _global.heroDepth++);
               myHit = eval("_root." + _name + "Hit");
               with(myHit)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
            }
            else
            {
               _rotation = _rotation - 180;
               pieces = int(Math.random() * 2) + 3;
               x = 1;
               while(x <= pieces)
               {
                  duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
                  with(eval("_root." + _name + "Chip" + x))
                  {
                     _x = ColPtX + int(Math.random() * 20) - 10;
                     _y = ColPtY + int(Math.random() * 20) - 10;
                     _rotation = this._rotation + int(Math.random() * 90) - 45;
                  }
                  x++;
               }
               _global.MakeNoise("Shatter");
               this.removeMovieClip();
            }
         }
      }
      else
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != mommyQueen._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTarget.hitTest(ColPtX,ColPtY,true))
               {
                  Hit = hitTarget._name.slice(0,4);
                  if(hitTarget.spines || Hit == "Grin" || Hit == "Gray" && hitTarget.action == "gaurd" || Hit == "Horr" && hitTarget.action != "collect")
                  {
                     _rotation = _rotation - 180;
                     pieces = int(Math.random() * 2) + 3;
                     x = 1;
                     while(x <= pieces)
                     {
                        duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
                        with(eval("_root." + _name + "Chip" + x))
                        {
                           _x = ColPtX + int(Math.random() * 20) - 10;
                           _y = ColPtY + int(Math.random() * 20) - 10;
                           _rotation = this._rotation + int(Math.random() * 90) - 45;
                        }
                        x++;
                     }
                     _global.MakeNoise("Shatter");
                     if(hitTarget.wall)
                     {
                        hitTarget.Health -= 2;
                     }
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
         x = 0;
         while(x < _global.Hazards.length)
         {
            targetHazard = eval("_root." + _global.Hazards[x]);
            if(targetHazard.hitTest(_X,_Y,true))
            {
               if(targetHazard._name.slice(0,5) == "Razor")
               {
                  _rotation = _rotation - 180;
                  pieces = int(Math.random() * 2) + 3;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + x))
                     {
                        _x = ColPtX + int(Math.random() * 20) - 10;
                        _y = ColPtY + int(Math.random() * 20) - 10;
                        _rotation = this._rotation + int(Math.random() * 90) - 45;
                     }
                     x++;
                  }
                  targetHazard.Health--;
                  _global.MakeNoise("Shatter");
                  this.removeMovieClip();
               }
            }
            x++;
         }
      }
      if(Loose)
      {
         if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
         {
            _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         }
         else
         {
            _visible = false;
            this.removeMovieClip();
         }
      }
      framesExisted++;
   }
}

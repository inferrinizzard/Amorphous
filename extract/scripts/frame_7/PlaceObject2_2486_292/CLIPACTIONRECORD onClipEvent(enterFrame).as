onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(!Planted)
      {
         play();
      }
      claw = true;
      if(Planted && hedgehog != "Crush")
      {
         hedgehog = "Ground";
      }
      else
      {
         hedgehog = "Stun";
      }
      if(!Planted)
      {
         if(flightFrames < 15)
         {
            _xscale = _xscale + 5;
            _yscale = _yscale + 5;
            flightFrames++;
         }
         else if(flightFrames < 30)
         {
            _xscale = _xscale - 5;
            _yscale = _yscale - 5;
            flightFrames++;
         }
         else
         {
            Planted = true;
            stop();
            flightFrames = 0;
            duplicateMovieClip(_root.GroundCrack,this._name + "Crack",16384 + _global.backgroundDepth++);
            with(eval("_root." + this._name + "Crack"))
            {
               _x = this._x;
               _y = this._y;
               _rotation = int(Math.random() * 360) - 179;
               gotoAndPlay((int(Math.random() * 3) + 1) * 2 - 1);
            }
            Pebbles = int(Math.random() * 4) + 4;
            x = 0;
            while(x <= Pebbles)
            {
               duplicateMovieClip(_root.GroundPebble,this._name + "Pebble" + x + impacts,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Pebble" + x + impacts))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            Dustpuffs = int(Math.random() * 2) + 1;
            x = 0;
            while(x < Dustpuffs)
            {
               duplicateMovieClip(_root.GroundDust,this._name + "Dust" + x + impacts,16384 + _global.capDepth++);
               with(eval("_root." + this._name + "Dust" + x + impacts))
               {
                  _x = this._x + int(Math.random() * 20) - 10;
                  _y = this._y + int(Math.random() * 20) - 10;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            Dirtpuffs = int(Math.random() * 3) + 3;
            x = 0;
            while(x < Dirtpuffs)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Dirt" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Dirt" + x))
               {
                  _x = this._x + int(Math.random() * 10) - 5;
                  _y = this._y + int(Math.random() * 10) - 5;
                  _rotation = int(Math.random() * 360) - 179;
               }
               x++;
            }
            speed = 0;
            _global.MakeNoise("GrinderHurt");
            _global.MakeNoise("Impact");
            if(int(Math.random() * 2) == 1)
            {
               _global.MakeNoise("Pebble");
            }
            if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
            {
               hedgehog = "Crush";
               _global.justHit = this;
            }
            else if(Math.sqrt((_X - _root.HeroPointer._x) * (_X - _root.HeroPointer._x) + (_Y - _root.HeroPointer._y) * (_Y - _root.HeroPointer._y)) < 40)
            {
               claw = false;
               _global.justHit = this;
            }
            x = 0;
            while(x < _global.Hazards.length)
            {
               targetHazard = eval("_root." + _global.Hazards[x]);
               if(targetHazard.hitTest(_X,_Y,false))
               {
                  if(targetHazard._name.slice(0,5) == "Razor")
                  {
                     targetHazard.killedBy = this;
                  }
               }
               x++;
            }
            _global.Hazards.push(_name);
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true) && Planted)
            {
               if(Health > 1 && !_global.RazorGlaiveEquipped)
               {
                  pieces = int(Math.random() * 3) + int((7 - Health) / 2);
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + chips++))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation - int(Math.random() * 140) + 70;
                     }
                     x++;
                  }
                  SparkName = "_root." + this._name + "Sparks";
                  duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
                  setProperty(SparkName, _rotation, _root.HeroPointer._rotation + 80);
                  setProperty(SparkName, _X, this._x);
                  setProperty(SparkName, _Y, this._y);
                  _global.MakeNoise("Clang");
                  if(_global.gameMode != "Practice")
                  {
                     _global.PlayerSparks = _global.PlayerSparks + 1;
                     if(_global.PlayerSparks >= 50)
                     {
                        _global.GainAward("50 Sparks");
                     }
                  }
                  Health--;
                  _global.HeroAction = "bounceback";
               }
               else
               {
                  pieces = int(Math.random() * 3) + 4;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + chips++))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 140) + 70;
                     }
                     x++;
                  }
                  pieces = int(Math.random() * 2) + 2;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + chips++))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 140) + 70;
                        _xscale = 150;
                        _yscale = 150;
                     }
                     x++;
                  }
                  _global.MakeNoise("Shatter");
                  _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
                  removeMovieClip(this);
               }
            }
         }
      }
      if(_root.HeroPointer.hitTest(_X,_Y,true))
      {
         if(Planted && hedgehog == "Ground")
         {
            armorTab = eval(_global.RewardTab("Armor"));
            if(armorTab == null || armorTab.charge != 300)
            {
               _global.justHit = this;
               duplicateMovieClip(_root.HeroPiked,_name + "Hit",16384 + _global.capDepth++);
               myHit = eval("_root." + _name + "Hit");
               with(myHit)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = (- Math.atan2(_x - _root.HeroPointer._x,_y - _root.HeroPointer._y)) / 0.017453292519943295;
               }
            }
            else
            {
               _global.justHit = this;
            }
         }
      }
      else if(Planted)
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            hitTarget = eval("_root." + _global.Enemies[x]);
            if(hitTarget.hitTest(_X,_Y,true))
            {
               Hit = hitTarget._name.slice(0,4);
               if(Hit == "Grin" || Hit == "Horr" && hitTarget.action != "collect" || hitTarget.claw)
               {
                  pieces = int(Math.random() * 3) + 4;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + chips++))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 360) - 179;
                     }
                     x++;
                  }
                  pieces = int(Math.random() * 2) + 2;
                  x = 1;
                  while(x <= pieces)
                  {
                     duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
                     with(eval("_root." + _name + "Chip" + chips++))
                     {
                        _x = this._x + int(Math.random() * 20) - 10;
                        _y = this._y + int(Math.random() * 20) - 10;
                        _rotation = _root.HeroPointer._rotation + int(Math.random() * 360) - 179;
                        _xscale = 150;
                        _yscale = 150;
                     }
                     x++;
                  }
                  _global.MakeNoise("Shatter");
                  _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
                  removeMovieClip(this);
               }
               else
               {
                  hitTarget.killedBy = this;
               }
            }
            x++;
         }
      }
      if(killedBy != null || Health <= 0)
      {
         pieces = int(Math.random() * 3) + 4;
         x = 1;
         while(x <= pieces)
         {
            duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
            with(eval("_root." + _name + "Chip" + chips++))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
               _rotation = _root.HeroPointer._rotation + int(Math.random() * 360) - 179;
            }
            x++;
         }
         pieces = int(Math.random() * 2) + 2;
         x = 1;
         while(x <= pieces)
         {
            duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + chips,16384 + _global.effectDepth++);
            with(eval("_root." + _name + "Chip" + chips++))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
               _rotation = _root.HeroPointer._rotation + int(Math.random() * 360) - 179;
               _xscale = 150;
               _yscale = 150;
            }
            x++;
         }
         _global.MakeNoise("Shatter");
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
         removeMovieClip(this);
      }
      if(_Y > -6 && _X > -6 && _Y < 406 && _X < 556)
      {
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

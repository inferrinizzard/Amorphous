onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
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
      overheadObstruction = false;
      if(!inGround)
      {
         speed = 10;
         turnSpeed = 0;
         if(surfaceFrames < 8)
         {
            _xscale = _xscale + 5;
            _yscale = _yscale + 5;
            surfaceFrames++;
         }
         else if(surfaceFrames < 16)
         {
            _xscale = _xscale - 5;
            _yscale = _yscale - 5;
            surfaceFrames++;
         }
         else
         {
            _visible = false;
            inGround = true;
            surfaceFrames = 0;
            impacts++;
            duplicateMovieClip(_root.GroundHole,this._name + "Hole" + impacts,16384 + _global.markDepth++);
            with(eval("_root." + this._name + "Hole" + impacts))
            {
               _x = this._x;
               _y = this._y;
               _rotation = int(Math.random() * 360) - 179;
            }
            Pebbles = int(Math.random() * 4) + 2;
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
               duplicateMovieClip(_root.GroundDirt,this._name + "Dirt" + x + impacts,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Dirt" + x + impacts))
               {
                  _x = this._x + int(Math.random() * 10) - 5;
                  _y = this._y + int(Math.random() * 10) - 5;
                  _rotation = this._rotation + int(Math.random() * 180) - 90;
               }
               x++;
            }
            speed = 4;
            turnSpeed = 5;
            _global.MakeNoise("SharpsIn");
            _global.MakeNoise("GrinderHurt");
            mySound.start(0,100);
         }
      }
      else
      {
         burrowFrames++;
      }
      if(inGround && burrowFrames > 0)
      {
         if(int(burrowFrames / 7) == burrowFrames / 7)
         {
            duplicateMovieClip(_root.GroundMound,this._name + "Swell" + swells,16384 + _global.markDepth++);
            with(eval("_root." + this._name + "Swell" + swells))
            {
               _x = this._x;
               _y = this._y;
               _rotation = int(Math.random() * 360) - 179;
            }
            swells++;
         }
      }
      if(_global.HeroAction == "attacking")
      {
         if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
         {
            if(_root.HeroSwing.hittest(_X,_Y,true) && !inGround)
            {
               SplatName = "_root." + this._name + "Splat";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x);
               setProperty(SplatName, _xscale, 70);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 70);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(3560301);
               teeth = int(Math.random() * 3) + 1;
               x = 1;
               while(x <= teeth)
               {
                  duplicateMovieClip("_root.ShedTooth",this._name + "Tooth" + x,16384 + _global.effectDepth++);
                  with(eval("_root." + _name + "Tooth" + x))
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
                  duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
                  with(eval("_root." + _name + "Chip" + x))
                  {
                     _x = this._x + int(Math.random() * 20) - 10;
                     _y = this._y + int(Math.random() * 20) - 10;
                     _rotation = _root.HeroPointer._rotation + int(Math.random() * 140) + 70;
                  }
                  x++;
               }
               SparkName = "_root." + this._name + "Sparks";
               duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
               setProperty(SparkName, _rotation, _root.HeroPointer._rotation + 80);
               setProperty(SparkName, _X, this._x);
               setProperty(SparkName, _Y, this._y);
               _global.MakeNoise("Clang");
               _global.MakeNoise("LilSplat");
               if(_global.gameMode != "Practice")
               {
                  _global.PlayerSparks = _global.PlayerSparks + 1;
                  if(_global.PlayerSparks >= 50)
                  {
                     _global.GainAward("50 Sparks");
                  }
               }
               mommyQueen.mites--;
               this.removeMovieClip();
            }
         }
      }
      if(killedBy != null)
      {
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, this._rotation + int(Math.random() * 40) + 160);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _xscale, 70);
         setProperty(SplatName, _Y, this._y);
         setProperty(SplatName, _yscale, 70);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(3560301);
         teeth = int(Math.random() * 3) + 1;
         x = 1;
         while(x <= teeth)
         {
            duplicateMovieClip("_root.ShedTooth",this._name + "Tooth" + x,16384 + _global.effectDepth++);
            with(eval("_root." + _name + "Tooth" + x))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
               _rotation = this._rotation + int(Math.random() * 80) + 140;
            }
            x++;
         }
         pieces = int(Math.random() * 2) + 2;
         x = 1;
         while(x <= pieces)
         {
            duplicateMovieClip(eval("_root.BoneChip" + String(random(2) + 1)),this._name + "Chip" + x,16384 + _global.effectDepth++);
            with(eval("_root." + _name + "Chip" + x))
            {
               _x = this._x + int(Math.random() * 20) - 10;
               _y = this._y + int(Math.random() * 20) - 10;
               _rotation = this._rotation + int(Math.random() * 80) + 140;
            }
            x++;
         }
         SparkName = "_root." + this._name + "Sparks";
         duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
         setProperty(SparkName, _rotation, this._rotation + 180);
         setProperty(SparkName, _X, this._x);
         setProperty(SparkName, _Y, this._y);
         _global.MakeNoise("Clang");
         _global.MakeNoise("LilSplat");
         mommyQueen.mites--;
         this.removeMovieClip();
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            if(!inGround)
            {
               _global.justHit = this;
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
                  if(hitTarget.hitTest(_X,_Y,true))
                  {
                     hitWhat = hitTarget._name.slice(0,4);
                     if(hitWhat == "myBo" || hitWhat == "Grin" || hitWhat == "Horr" && hitTarget.action == "none" || hitWhat == "Gray" && hitTarget.action == "guard" || hitTarget.spines)
                     {
                        if(!inGround)
                        {
                           justBounced = 8;
                           bouncedOffX = hitTarget._x;
                           bouncedOffY = hitTarget._y;
                           if(hitWhat == "myBo" || hitTarget.wall)
                           {
                              hitTarget.killedBy = this;
                           }
                           break;
                        }
                        overheadObstruction = true;
                     }
                     else if(!inGround)
                     {
                        hitTarget.killedBy = this;
                     }
                  }
               }
               x++;
            }
         }
         x = 0;
         while(x < _global.Hazards.length)
         {
            targetHazard = eval("_root." + _global.Hazards[x]);
            if(targetHazard.hitTest(_X,_Y,true))
            {
               if(targetHazard._name.slice(0,5) == "Razor")
               {
                  if(!inGround)
                  {
                     justBounced = 8;
                     targetHazard.Health--;
                     bouncedOffX = hitTarget._x;
                     bouncedOffY = hitTarget._y;
                     break;
                  }
                  overheadObstruction = true;
               }
            }
            x++;
         }
         if(justBounced != 0)
         {
            _global.MakeNoise("Clang");
            SparkName = "_root." + this._name + "Sparks";
            duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
            with(eval(SparkName))
            {
               _rotation = this._rotation;
               _x = this._x;
               _y = this._y;
            }
            if(_X > bouncedOffX)
            {
               BouncetoSpotX = int(Math.random() * (550 - _X)) + _X + 20;
            }
            else
            {
               BouncetoSpotX = int(Math.random() * _X) - 19;
            }
            if(_Y > bouncedOffY)
            {
               BouncetoSpotY = int(Math.random() * (400 - _Y)) + _Y + 20;
            }
            else
            {
               BouncetoSpotY = int(Math.random() * _Y) - 19;
            }
            delta_bounceX = Math.abs(_X - bouncedOffX);
            delta_bounceY = Math.abs(_Y - bouncedOffY);
            if(delta_bounceX > delta_bounceY)
            {
               if(BouncetoSpotX > 275)
               {
                  BouncetoSpotX = 555;
               }
               else
               {
                  BouncetoSpotX = -5;
               }
            }
            else if(BouncetoSpotY > 200)
            {
               BouncetoSpotY = 405;
            }
            else
            {
               BouncetoSpotY = -5;
            }
            _rotation = (- Math.atan2(_X - BouncetoSpotX,_Y - BouncetoSpotY)) / 0.017453292519943295;
         }
      }
      else
      {
         justBounced--;
      }
      x = 0;
      while(x < _global.Hazards.length)
      {
         targetHazard = eval("_root." + _global.Hazards[x]);
         if(targetHazard._name.slice(0,5) == "Razor")
         {
            p = 10;
            while(p < 30)
            {
               ProjPathX = _X + p * Math.sin(_rotation * 0.017453292519943295);
               ProjPathY = _Y - p * Math.cos(_rotation * 0.017453292519943295);
               if(targetHazard.hitTest(ProjPathX,ProjPathY,false))
               {
                  overheadObstruction = true;
               }
               p += 10;
            }
         }
         x++;
      }
      delta_x = _X - gotoSpotX;
      delta_y = _Y - gotoSpotY;
      targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
      if(_rotation != targetRotation && inGround)
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
      _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
      _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      if(inGround && eval(_root.HeroPointer) != undefined)
      {
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 90)
         {
            if(Math.abs(_rotation - targetRotation) < 15 && !overheadObstruction)
            {
               inGround = false;
               _visible = true;
               burrowFrames = 0;
               impacts++;
               duplicateMovieClip(_root.GroundHole,this._name + "Hole" + impacts,16384 + _global.markDepth++);
               with(eval("_root." + this._name + "Hole" + impacts))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = int(Math.random() * 360) - 179;
               }
               Pebbles = int(Math.random() * 4) + 2;
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
                  duplicateMovieClip(_root.GroundDirt,this._name + "Dirt" + x + impacts,16384 + _global.effectDepth++);
                  with(eval("_root." + this._name + "Dirt" + x + impacts))
                  {
                     _x = this._x + int(Math.random() * 10) - 5;
                     _y = this._y + int(Math.random() * 10) - 5;
                     _rotation = this._rotation + int(Math.random() * 180) - 90;
                  }
                  x++;
               }
               mySound.stop();
               _global.MakeNoise("GrinderHurt");
               _global.MakeNoise("Mite Jump");
            }
         }
      }
   }
   else
   {
      stop();
   }
}

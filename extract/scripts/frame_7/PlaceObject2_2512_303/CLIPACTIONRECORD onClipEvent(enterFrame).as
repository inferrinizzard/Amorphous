onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(_currentframe < 40)
      {
         play();
      }
      if(eval(_root.HeroPointer) != undefined)
      {
         if(_root.myLure.luring)
         {
            gotoSpotX = _root.myLure._x;
            gotoSpotY = _root.myLure._y;
            huntHero = true;
         }
         else if(Math.sqrt(Math.pow(_X - _root.HeroPointer._x,2) + Math.pow(_Y - _root.HeroPointer._y,2)) < 150)
         {
            gotoSpotX = _root.HeroPointer._x;
            gotoSpotY = _root.HeroPointer._y;
            huntHero = true;
         }
         else if(huntHero)
         {
            gotoSpotX = int(Math.random() * 540) + 6;
            gotoSpotY = int(Math.random() * 390) + 6;
            huntHero = false;
         }
      }
      if(int(Math.random() * 100) == 1)
      {
         _global.MakeNoise("Spiny Chirp");
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
               setProperty(SplatName, _xscale, 80);
               setProperty(SplatName, _Y, this._y);
               setProperty(SplatName, _yscale, 80);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(3560301);
               pieces = int(Math.random() * 3) + 3;
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
               mommyQueen.larva--;
               this.removeMovieClip();
            }
         }
      }
      if(!_root.HeroPointer.hitTest(_X,_Y,true))
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != mommyQueen._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               Targ = hitTarget._name.slice(0,4);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  if(Targ == "Grin" || hitTarget.spines || hitTarget.action == "gaurd" || Targ == "Horr" || Targ == "Quee")
                  {
                     SplatName = "_root." + this._name + "Splat";
                     duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
                     setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
                     setProperty(SplatName, _X, this._x);
                     setProperty(SplatName, _xscale, 40);
                     setProperty(SplatName, _Y, this._y);
                     setProperty(SplatName, _yscale, 40);
                     SplatColor = new Color(eval(SplatName));
                     SplatColor.setRGB(16206387);
                     _global.MakeNoise("LarvaCrunch");
                     mommyQueen.larva--;
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
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
         {
            gotoSpotX = int(Math.random() * 540) + 6;
            gotoSpotY = int(Math.random() * 390) + 6;
         }
      }
      else
      {
         mommyQueen.larva--;
         this.removeMovieClip();
      }
      if(huntHero && Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= 100)
      {
         if(_currentframe < 26)
         {
            gotoAndPlay(26);
            speed = 0;
            turnSpeed = 0;
            _global.MakeNoise("Spiny Pressure");
         }
      }
      else if(_currentframe == 25)
      {
         gotoAndPlay(1);
      }
      if(_currentframe == 40)
      {
         facing = 0;
         while(facing < 4)
         {
            Spikes = int(Math.random() * 3) + 3;
            x = 0;
            while(x <= Spikes)
            {
               duplicateMovieClip(_root.RazorSpike,this._name + "Spike" + spikeCounter,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Spike" + spikeCounter))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = int(Math.random() * 90) - 45 + 90 * facing;
               }
               spikeCounter++;
               x++;
            }
            facing++;
         }
         SplatName = "_root." + this._name + "Pop";
         duplicateMovieClip(_root.RazorLarvaPop,this._name + "Pop",16384 + _global.effectDepth++);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         _global.MakeNoise("Spiny Pop");
         mommyQueen.larva--;
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
}

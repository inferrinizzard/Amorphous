onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(int(Math.random() * 200) == 1)
      {
         _global.MakeNoise("LarvaSpawn");
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
               SplatColor.setRGB(16206387);
               _global.MakeNoise("LarvaCrunch");
               mommyQueen.larva--;
               this.removeMovieClip();
            }
         }
      }
      nearTarget = 1000;
      if(_root.HeroPointer.hitTest(_X,_Y,true))
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
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != mommyQueen._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               Targ = hitTarget._name.slice(0,4);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  if(Targ == "myBo" || Targ == "myDr" || Targ == "Grin" || hitTarget.spines || hitTarget.action == "gaurd" || Targ == "Horr" || Targ == "Quee" || Targ == "Razo" || Targ == "Void")
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
                  else if(eval("_root." + hitTarget._name + "Seed") == undefined)
                  {
                     duplicateMovieClip(_root.QueenSeed,hitTarget._name + "Seed",16384 + _global.effectDepth++);
                     seedName = eval("_root." + hitTarget._name + "Seed");
                     seedName.mommyQueen = mommyQueen;
                     hitTarget._alpha = 70;
                     mommyQueen.larva--;
                     this.removeMovieClip();
                  }
               }
               else if(Targ != "Grin" && Targ != "Horr" && Targ != "Gray" && Targ != "Razo" && Targ != "Void")
               {
                  deltaX = _X - hitTarget._x;
                  deltaY = _Y - hitTarget._y;
                  toGloople = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
                  if(toGloople < nearTarget)
                  {
                     gotoSpotX = hitTarget._x;
                     gotoSpotY = hitTarget._y;
                     nearTarget = toGloople;
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
      }
      else
      {
         mommyQueen.larva--;
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
}

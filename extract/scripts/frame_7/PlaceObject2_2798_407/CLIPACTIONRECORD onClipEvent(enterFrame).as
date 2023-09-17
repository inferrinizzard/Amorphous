onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
      if(eval(_root.HeroPointer) != undefined)
      {
         gotoSpotX = _root.HeroPointer._x;
         gotoSpotY = _root.HeroPointer._y;
      }
      else if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) <= speed)
      {
         gotoSpotX = int(Math.random() * 540) + 6;
         gotoSpotY = int(Math.random() * 390) + 6;
      }
      if(justBounced == 0)
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != _name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
               {
                  if(hitTarget._name.slice(0,5) == "Sharp" && hitTarget.spines)
                  {
                     justBounced = 8;
                     bouncedOffX = hitTarget._x;
                     bouncedOffY = hitTarget._y;
                     break;
                  }
                  hitTarget.killedBy = this;
               }
            }
            x++;
         }
         if(justBounced != 0)
         {
            SparkName = "_root." + this._name + "Sparks";
            duplicateMovieClip(_root.Sparks,this._name + "Sparks",16384 + _global.effectDepth++);
            setProperty(SparkName, _rotation, this._rotation);
            setProperty(SparkName, _X, this._x);
            setProperty(SparkName, _Y, this._y);
            ClangNoise = new Sound();
            ClangNoise.attachSound("Sword Clang Sound");
            ClangNoise.onSoundComplete = function()
            {
               ClangNoise.stop();
            };
            ClangNoise.start();
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
         _Y = _Y - (speed + speedBoost) * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + (speed + speedBoost) * Math.sin(_rotation * 0.017453292519943295);
      }
      else
      {
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(_currentframe == 6 && printcount < 6)
      {
         printName = "_root." + _name + "Bloodprint" + printcount;
         duplicateMovieClip(_root.BloodPrint,_name + "Bloodprint" + printcount++,16384 + _global.effectDepth++);
         with(eval(printName))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
            gotoAndStop(printcount);
         }
      }
   }
   else
   {
      stop();
   }
}

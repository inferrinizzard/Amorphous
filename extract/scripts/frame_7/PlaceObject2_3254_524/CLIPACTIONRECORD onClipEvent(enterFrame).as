onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      play();
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
               setProperty(SplatName, _Y, this._y);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(2781657);
               SplatName = "_root." + this._name + "Splat2";
               duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat2",16384 + _global.effectDepth++);
               setProperty(SplatName, _rotation, _root.HeroPointer._rotation + int(Math.random() * 61) + 30);
               setProperty(SplatName, _X, this._x + 10);
               setProperty(SplatName, _Y, this._y + 10);
               SplatColor = new Color(eval(SplatName));
               SplatColor.setRGB(2781657);
               _global.MakeNoise("Splat");
               duplicateMovieClip(_root.Bounty,_name + "Bounty",16384 + _global.markDepth++);
               setProperty("_root." + _name + "Bounty", _X, this._x);
               setProperty("_root." + _name + "Bounty", _Y, this._y);
               BountyObject = eval("_root." + _name + "Bounty");
               BountyObject.bounty = 16;
               _global.GainAward("Splat a Glom");
               _visible = false;
               _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
               this.removeMovieClip();
            }
         }
      }
      if(killedBy != null)
      {
         toKillX = _X - killedBy._x;
         toKillY = _Y - killedBy._y;
         killDir = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         killDir -= 180;
         SplatName = "_root." + this._name + "Splat";
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Splat",16384 + _global.effectDepth++);
         setProperty(SplatName, _rotation, killdir);
         setProperty(SplatName, _X, this._x);
         setProperty(SplatName, _Y, this._y);
         SplatColor = new Color(eval(SplatName));
         SplatColor.setRGB(2781657);
         _global.MakeNoise("Splat");
         _visible = false;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
      if(justBounced == 0)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            justBounced = 8;
            bouncedOffX = _root.HeroPointer._x;
            bouncedOffY = _root.HeroPointer._x;
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
                     justBounced = 8;
                     bouncedOffX = hitTarget._x;
                     bouncedOffY = hitTarget._y;
                     break;
                  }
               }
               x++;
            }
         }
         if(justBounced != 0)
         {
            _global.MakeNoise("Boing");
            if(_X > bouncedOffX)
            {
               gotoSpotX = int(Math.random() * (550 - _X)) + _X + 20;
            }
            else
            {
               gotoSpotX = int(Math.random() * _X) - 19;
            }
            if(_Y > bouncedOffY)
            {
               gotoSpotY = int(Math.random() * (400 - _Y)) + _Y + 20;
            }
            else
            {
               gotoSpotY = int(Math.random() * _Y) - 19;
            }
            delta_bounceX = Math.abs(_X - bouncedOffX);
            delta_bounceY = Math.abs(_Y - bouncedOffY);
            if(delta_bounceX > delta_bounceY)
            {
               if(gotoSpotX > 275)
               {
                  gotoSpotX = 555;
               }
               else
               {
                  gotoSpotX = -5;
               }
            }
            else if(gotoSpotY > 200)
            {
               gotoSpotY = 405;
            }
            else
            {
               gotoSpotY = -5;
            }
         }
      }
      else
      {
         justBounced--;
      }
      if(justBounced > 0)
      {
         delta_x = _X - gotoSpotX;
         delta_y = _Y - gotoSpotY;
         targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         _rotation = targetRotation;
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
      if(_currentframe == 31)
      {
         duplicateMovieClip(_root.Horror,"Horror" + _name.slice(4),16384 + _global.baddieDepth++);
         _global.Enemies.push("Horror" + _name.slice(4));
         with(eval("_root.Horror" + _name.slice(4)))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         this.removeMovieClip();
      }
   }
   else if(!mommy)
   {
      stop();
   }
}

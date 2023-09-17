onClipEvent(enterFrame){
   if(_name != "Frozen" && !_global.pause)
   {
      if(_currentframe == 1)
      {
         if(_global.HeroAction == "attacking")
         {
            if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
            {
               if(_root.HeroSwing.hittest(_X,_Y,true))
               {
                  brokeTo = _root.HeroPointer._rotation + int(Math.random() * 61) + 30;
               }
            }
         }
         if(killedBy != null)
         {
            toKillX = killedBy._x - _X;
            toKillY = killedBy._y - _Y;
            brokeTo = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
         }
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            toKillX = _root.HeroPointer._x - _X;
            toKillY = _root.HeroPointer._y - _Y;
            brokeTo = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
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
                     toKillX = hitTarget._x - _X;
                     toKillY = hitTarget._y - _Y;
                     brokeTo = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
                  }
               }
               x++;
            }
         }
         if(broketo != null)
         {
            iceNum = int(Math.random() * 6) + 8;
            if(_xscale > 101)
            {
               iceNum += 5;
            }
            ice = 1;
            while(ice < iceNum)
            {
               IceName = "_root." + this._name + "Ice" + ice;
               duplicateMovieClip(eval("_root.Ice" + String(random(3) + 1)),this._name + "Ice" + Ice,16384 + _global.effectDepth++);
               setProperty(IceName, _rotation, brokeTo + int(Math.random() * 100) - 59);
               setProperty(IceName, _X, this._x);
               setProperty(IceName, _Y, this._y);
               ice++;
            }
            FrostName = "_root." + this._name + "Frost";
            duplicateMovieClip(_root.Frost,this._name + "Frost",16384 + _global.effectDepth++);
            setProperty(FrostName, _X, this._x);
            setProperty(FrostName, _Y, this._y);
            _global.MakeNoise("Icebreak" + (int(Math.random() * 3) + 1));
            _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
            removeMovieClip(this);
         }
      }
      if(framesExisted > 120)
      {
         play();
      }
      if(_currentframe == 10)
      {
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_name),1);
         duplicateMovieClip(eval(hostArch),hostName,16384 + _global.baddieDepth++);
         hostObject = eval("_root." + hostName);
         hostObject._x = this._x;
         hostObject._y = this._y;
         hostObject._rotation = this._rotation;
         if(hostArch == "_root.Clutter")
         {
            hostObject._xscale = this._xscale;
            hostObject._yscale = this._yscale;
         }
         _global.Enemies.push(hostName);
         _global.Hazards.push(_name.slice(2));
      }
      else if(_currentframe == 31)
      {
         stop();
         if(framesExisted > 200)
         {
            _alpha = _alpha - 5;
         }
      }
      if(_alpha <= 0)
      {
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name.slice(2)),1);
         removeMovieClip(this);
      }
      framesExisted++;
   }
   else
   {
      stop();
   }
}

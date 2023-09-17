onClipEvent(enterFrame){
   if(_name != "SmallFire" && !_global.pause)
   {
      play();
      if(_currentframe == 60 && framesExisted < 150)
      {
         gotoAndPlay(20);
      }
      if(_currentframe > 19 && _currentframe < 61)
      {
         if(_global.HeroAction == "attacking")
         {
            if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
            {
               if(_root.HeroSwing.hittest(_X,_Y,true))
               {
                  putOut = true;
                  _root.Census.firesStomped = _root.Census.firesStomped + 1;
               }
            }
         }
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            putOut = true;
            _root.Census.firesStomped = _root.Census.firesStomped + 1;
         }
         else
         {
            x = 0;
            while(x < _global.Enemies.length)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  if(eval("_root." + hitTarget._name + "Flame") == undefined)
                  {
                     if(hitTarget._name.slice(0,7) == "Torchie" && eval("_root." + hitTarget._name + "Goo") == undefined)
                     {
                        duplicateMovieClip(_root.Flames,hitTarget._name + "Flame",16384 + _global.capDepth++);
                     }
                     else
                     {
                        putOut = true;
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
               if(targetHazard._name.slice(0,5) == "Inkie")
               {
                  targetHazard.onFire = true;
               }
               else
               {
                  putOut = true;
               }
            }
            x++;
         }
      }
      if(putOut)
      {
         duplicateMovieClip(_root.WhiteSmoke,_name + "WSmoke",16384 + _global.capDepth++);
         with(eval("_root." + _name + "WSmoke"))
         {
            _x = this._x;
            _y = this._y;
         }
         removeMovieClip(this);
      }
      if(_currentframe == 87)
      {
         duplicateMovieClip(_root.BlackSmoke,_name + "BSmoke",16384 + _global.capDepth++);
         with(eval("_root." + _name + "BSmoke"))
         {
            _x = this._x;
            _y = this._y;
         }
      }
      if(_currentframe == 90)
      {
         removeMovieClip(this);
      }
      framesExisted++;
   }
   else
   {
      stop();
   }
}

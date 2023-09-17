onClipEvent(enterFrame){
   if(_name != "HeroFlamingRazor" && !_global.pause)
   {
      play();
      if(eval(_root.HeroPointer) == undefined && _currentframe < 92)
      {
         removeMovieClip(this);
      }
      if(eval(_root.HeroPointer) != undefined)
      {
         _X = _root.HeroPointer._x;
         _Y = _root.HeroPointer._y;
         _rotation = _root.HeroPointer._rotation;
      }
      if(_currentframe > 30 && _currentframe < 92)
      {
         if(int(framesExisted / 20) == framesExisted / 20)
         {
            duplicateMovieClip(_root.BlackSmoke,_name + "Smoke" + smokies,16384 + _global.capDepth++);
            with(eval("_root." + _name + "Smoke" + smokies))
            {
               _x = this._x;
               _y = this._y;
            }
            smokies++;
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != hostObject._name)
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTarget.hitTest(_X,_Y,true))
               {
                  if(eval("_root." + hitTarget._name + "Flame") == undefined)
                  {
                     if(eval("_root." + hitTarget._name + "Goo") == undefined)
                     {
                        if(hitTarget._name.slice(0,7) != "Stickie")
                        {
                           if(hitTarget._name.slice(0,7) != "Grinder")
                           {
                              duplicateMovieClip(_root.Flames,hitTarget._name + "Flame",16384 + _global.capDepth++);
                              GloopleFire = eval("_root." + hitTarget._name + "Flame");
                              if(hitTarget._name.slice(0,5) == "Oozle" || hitTarget._name.slice(0,4) == "Gray")
                              {
                                 with(GloopleFire)
                                 {
                                    _xscale = 170;
                                    _yscale = 170;
                                 }
                              }
                           }
                        }
                     }
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
               if(targetHazard._name.slice(0,5) == "Inkie")
               {
                  targetHazard.onFire = true;
               }
               else
               {
                  p = 1;
                  while(p < 4)
                  {
                     duplicateMovieClip(_root.WhiteSmoke,_name + "WSmoke" + p,16384 + _global.capDepth++);
                     with(eval("_root." + _name + "WSmoke" + p))
                     {
                        _x = this._x;
                        _y = this._y;
                     }
                     p++;
                  }
                  _global.HeroAction = "none";
                  if(targetHazard._name.slice(0,6) != "Meltie")
                  {
                     _global.GainAward("Survive Fire");
                  }
                  removeMovieClip(this);
               }
            }
            x++;
         }
      }
      if(_currentframe == 91 && framesExisted < 200)
      {
         gotoAndPlay(31);
      }
      if(_currentframe == 92)
      {
         if(!putOut)
         {
            _global.HeroAction = "burned";
         }
      }
      if(_currentframe == 130)
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

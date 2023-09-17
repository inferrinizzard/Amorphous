onClipEvent(enterFrame){
   if(_name != "Flames" && !_global.pause)
   {
      play();
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      if(eval(hostObject._name + "Goo") != undefined)
      {
         removeMovieClip(this);
      }
      _X = hostObject._x;
      _Y = hostObject._y;
      _rotation = hostObject._rotation;
      if(_currentframe == 2 && !TorchieFlame)
      {
         hostObject.speed = 2;
      }
      if(_currentframe > 29 && _currentframe < 101)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            if(_global.HeroAction != "flamed" && _global.HeroAction != "frozen")
            {
               if(_root.HeroPointerGoo == undefined)
               {
                  armorTab = eval(_global.RewardTab("Armor"));
                  if(armorTab == null || armorTab.charge != 300)
                  {
                     _root.Census.perfectRun = false;
                     suitTab = eval(_global.RewardTab("Hazard Suit"));
                     if(suitTab != null && suitTab.charge > 1)
                     {
                        suitTab.charge -= 50;
                     }
                     else
                     {
                        _global.HeroAction = "flamed";
                     }
                  }
               }
            }
         }
         else
         {
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
                           if(hitTarget._name.slice(0,8) != "myBoxGun")
                           {
                              if(hitTarget._name.slice(0,7) != "myDrone")
                              {
                                 if(hitTarget._name.slice(0,7) != "Stickie")
                                 {
                                    if(hitTarget._name.slice(0,7) != "Grinder")
                                    {
                                       if(hitTarget._name.slice(0,4) != "Void")
                                       {
                                          if(hitTarget._name.slice(0,6) != "Horror")
                                          {
                                             if(hitTarget._name.slice(0,5) != "Queen")
                                             {
                                                if(hitTarget._name.slice(0,5) != "Razor")
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
                                                   else if(hitTarget._name.slice(0,7) == "Clutter")
                                                   {
                                                      with(GloopleFire)
                                                      {
                                                         _xscale = hitTarget._xscale;
                                                         _yscale = hitTarget._yscale;
                                                      }
                                                   }
                                                   else if(hitTarget._name.slice(0,7) == "Amalgam")
                                                   {
                                                      with(GloopleFire)
                                                      {
                                                         _xscale = hitTarget._xscale + 70;
                                                         _yscale = hitTarget._yscale + 70;
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                       }
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
                  duplicateMovieClip(_root.WhiteSmoke,_name + "WSmoke",16384 + _global.capDepth++);
                  with(eval("_root." + _name + "WSmoke"))
                  {
                     _x = this._x;
                     _y = this._y;
                  }
                  removeMovieClip(this);
               }
            }
            x++;
         }
      }
      if(_currentframe == 100 && TorchieFlame)
      {
         gotoAndPlay(30);
      }
      if(_currentframe == 100 && !TorchieFlame)
      {
         hostObject.gotoAndStop(1);
         duplicateMovieClip(_root.GloopleBurn,hostObject._name + "GloopleBurn",16384 + _global.capDepth++);
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

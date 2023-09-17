onClipEvent(enterFrame){
   if(_name != "BigFire" && !_global.pause)
   {
      play();
      if(_currentframe == 121 && framesExisted < 300)
      {
         gotoAndPlay(41);
      }
      if(int(framesExisted / 20) == framesExisted / 20)
      {
         duplicateMovieClip(_root.BlackSmoke,_name + "Smoke" + smokies,16384 + _global.capDepth++);
         with(eval("_root." + _name + "Smoke" + smokies))
         {
            _x = this._x + int(Math.random() * 40) + 10;
            _y = this._y + int(Math.random() * 40) - 70;
         }
         smokies++;
      }
      if(_currentframe > 40 && _currentframe < 122)
      {
         if(_root.HeroPointer.hitTest(_X,_Y,true))
         {
            if(_global.HeroAction != "flamed")
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
                        suitTab.charge -= 3;
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
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(hitTest(hitTarget._x,hitTarget._y,true))
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
                                    if(hitTarget._name.slice(0,6) != "Horror")
                                    {
                                       if(hitTarget._name.slice(0,4) != "Void")
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
                  x = 1;
                  while(x < 5)
                  {
                     duplicateMovieClip(_root.WhiteSmoke,_name + "WSmoke" + x,16384 + _global.capDepth++);
                     with(eval("_root." + _name + "WSmoke" + x))
                     {
                        _x = this._x + int(Math.random() * 40) + 10;
                        _y = this._y + int(Math.random() * 40) - 70;
                     }
                     x++;
                  }
                  gotoAndPlay(122);
               }
            }
            x++;
         }
      }
      if(_currentframe == 160 || _currentframe == 25 && !putOut)
      {
         x = 1;
         while(x < 5)
         {
            duplicateMovieClip(_root.BlackSmoke,_name + "BSmoke" + x,16384 + _global.capDepth++);
            with(eval("_root." + _name + "BSmoke" + x))
            {
               _x = this._x + int(Math.random() * 40) + 10;
               _y = this._y + int(Math.random() * 40) - 70;
            }
            x++;
         }
      }
      if(_currentframe == 170)
      {
         removeMovieClip(this);
         flameSound.stop();
      }
      framesExisted++;
   }
   else if(_name != "BigFire")
   {
      stop();
   }
}

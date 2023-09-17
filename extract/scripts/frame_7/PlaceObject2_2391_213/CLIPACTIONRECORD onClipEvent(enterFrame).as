onClipEvent(enterFrame){
   if(_name != "ColdBurst" && !_global.pause)
   {
      if(framesExisted < 6)
      {
         this._xscale += 100;
         this._yscale += 100;
         if(framesExisted > 2)
         {
            this._alpha -= 20;
         }
      }
      else
      {
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
         removeMovieClip(this);
      }
      f = 1;
      while(f < 6)
      {
         setOutDir = int(Math.random() * 360) - 179;
         setOutDist = int(Math.random() * 100) + 1;
         FrostName = "_root." + this._name + "Frost" + littleFrosts;
         duplicateMovieClip(_root.Frost,this._name + "Frost" + littleFrosts,16384 + _global.effectDepth++);
         setProperty(FrostName, _X, this._x + setOutDist * Math.sin(setOutDir * 0.017453292519943295));
         setProperty(FrostName, _Y, this._y - setOutDist * Math.cos(setOutDir * 0.017453292519943295));
         littleFrosts++;
         f++;
      }
      if(framesExisted == 2)
      {
         if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
         {
            if(_root.HeroPointerGoo == undefined)
            {
               suitTab = eval(_global.RewardTab("Hazard Suit"));
               if(suitTab != null && suitTab.charge > 1)
               {
                  suitTab.charge -= 50;
                  _root.Census.perfectRun = false;
               }
               else
               {
                  _global.HeroAction = "frozen";
                  toHero_x = _X - _root.HeroPointer._x;
                  toHero_y = _Y - _root.HeroPointer._y;
                  heroDist = Math.sqrt(toHero_x * toHero_x + toHero_y * toHero_y);
                  _root.HeroPointer.frozenFrames = 120 - heroDist;
                  _root.Census.perfectRun = false;
               }
            }
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x].slice(0,8) != "myBoxGun")
            {
               if(_global.Enemies[x].slice(0,7) != "myDrone")
               {
                  if(_global.Enemies[x].slice(0,4) != "Void")
                  {
                     if(_global.Enemies[x].slice(0,7) != "Frostie")
                     {
                        if(_global.Enemies[x].slice(0,7) != "Grinder")
                        {
                           if(_global.Enemies[x].slice(0,5) != "Queen")
                           {
                              if(_global.Enemies[x].slice(0,5) != "Razor")
                              {
                                 if(eval("_root." + _global.Enemies[x] + "Goo") == undefined)
                                 {
                                    targetEnemy = eval("_root." + _global.Enemies[x]);
                                    if(!(targetEnemy._name.slice(0,7) == "Torchie" && targetEnemy.burning))
                                    {
                                       if(hitTest(targetEnemy._x,targetEnemy._y,true))
                                       {
                                          if(targetEnemy._name.slice(targetEnemy._name.length - 6) != "Frozen")
                                          {
                                             duplicateMovieClip(_root.Frozen,targetEnemy._name + "Frozen",16384 + _global.effectDepth++);
                                             with(eval("_root." + targetEnemy._name + "Frozen"))
                                             {
                                                _x = targetEnemy._x;
                                                _y = targetEnemy._y;
                                                _rotation = targetEnemy._rotation;
                                                if(targetEnemy._name.slice(0,5) == "Oozle" || targetEnemy._name.slice(0,4) == "Gray" || targetEnemy._name.slice(0,6) == "Horror")
                                                {
                                                   _xscale = 170;
                                                   _yscale = 170;
                                                }
                                                else if(targetEnemy._name.slice(0,7) == "Clutter")
                                                {
                                                   _xscale = targetEnemy._xscale;
                                                   _yscale = targetEnemy._yscale;
                                                }
                                                else if(targetEnemy._name.slice(0,7) == "Amalgam")
                                                {
                                                   _xscale = targetEnemy._xscale + 70;
                                                   _xscale = targetEnemy._yscale + 70;
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
      framesExisted++;
   }
}

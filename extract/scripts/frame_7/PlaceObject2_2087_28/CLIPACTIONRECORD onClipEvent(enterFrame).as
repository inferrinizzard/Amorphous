onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(daddySplat._currentframe == 5)
      {
         daddySplat.stop();
      }
      if(daddySplat._currentframe == 5)
      {
         if(int(framesSitting / 10) == framesSitting / 10)
         {
            BubbleName = "_root." + _name + "Bubble" + _global.effectDepth;
            duplicateMovieClip(_root.AcidBubble,this._name + "Bubble" + _global.effectDepth,16384 + _global.effectDepth++);
            BubbleDistance = int(Math.random() * 60);
            BubbleOffset = _rotation + int(Math.random() * 40) - 20;
            setProperty(BubbleName, _X, this._x + BubbleDistance * Math.sin(BubbleOffset * 0.017453292519943295));
            setProperty(BubbleName, _Y, this._y - BubbleDistance * Math.cos(BubbleOffset * 0.017453292519943295));
         }
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
      {
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab != null && suitTab.charge > 1)
         {
            suitTab.charge -= 3;
            _root.Census.perfectRun = false;
         }
         else
         {
            _global.HeroAction = "melted";
            _global.MakeNoise("Sizzle");
         }
      }
      else
      {
         x = 0;
         for(; x < _global.Enemies.length; x++)
         {
            if(_global.Enemies[x].slice(0,8) != "myBoxGun")
            {
               if(_global.Enemies[x].slice(0,7) != "myDrone")
               {
                  if(_global.Enemies[x].slice(0,6) != "Meltie")
                  {
                     if(_global.Enemies[x].slice(0,7) != "Torchie")
                     {
                        if(_global.Enemies[x].slice(0,4) != "Void")
                        {
                           if(_global.Enemies[x].slice(0,6) != "Horror")
                           {
                              if(_global.Enemies[x].slice(0,5) != "Queen")
                              {
                                 if(_global.Enemies[x].slice(0,5) != "Razor")
                                 {
                                    targetEnemy = eval("_root." + _global.Enemies[x]);
                                    if(!(targetEnemy._name.slice(0,5) == "Sharp" && targetEnemy.spines))
                                    {
                                       if(!(targetEnemy._name.slice(0,5) == "Amalg" && targetEnemy.burnProtection > 0))
                                       {
                                          if(hitTest(targetEnemy._x,targetEnemy._y,true))
                                          {
                                             if(targetEnemy._name.slice(0,7) == "Grinder")
                                             {
                                                targetEnemy.acidized = true;
                                             }
                                             else
                                             {
                                                if(targetEnemy._name.slice(0,7) == "Amalgam")
                                                {
                                                   if(targetEnemy._xscale > 60)
                                                   {
                                                      targetEnemy._xscale -= 10;
                                                      targetEnemy._yscale -= 10;
                                                      targetEnemy.burnProtection = 60;
                                                      _global.MakeNoise("Sizzle");
                                                      x = 1;
                                                      while(x < 3)
                                                      {
                                                         duplicateMovieClip(_root.WhiteSmoke,_name + "Smoke" + x,16384 + _global.capDepth++);
                                                         with(eval("_root." + _name + "Smoke" + x))
                                                         {
                                                            _x = targetEnemy._x + int(Math.random() * 60) - 30;
                                                            _y = targetEnemy._y + int(Math.random() * 60) - 30;
                                                         }
                                                         x++;
                                                      }
                                                      continue;
                                                   }
                                                }
                                                if(targetEnemy._name.slice(0,6) == "Fuzzle")
                                                {
                                                   if(targetEnemy.gracePeriod > 0)
                                                   {
                                                      continue;
                                                   }
                                                   if(targetEnemy.fuzz != undefined)
                                                   {
                                                      if(eval("_root." + targetEnemy._name + "Flame") == undefined)
                                                      {
                                                         if(eval("_root." + targetEnemy._name + "Goo") != undefined)
                                                         {
                                                            continue;
                                                         }
                                                         duplicateMovieClip(_root.Flames,targetEnemy._name + "Flame",16384 + _global.capDepth++);
                                                      }
                                                      continue;
                                                   }
                                                }
                                                if(eval("_root." + targetEnemy._name + "GloopleMelt") == undefined)
                                                {
                                                   targetEnemy.gotoAndStop(1);
                                                   duplicateMovieClip(_root.GloopleMelt,targetEnemy._name + "GloopleMelt",16384 + _global.capDepth++);
                                                   _global.MakeNoise("Sizzle");
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
      }
      framesSitting++;
      if(framesSitting >= 155)
      {
         daddySplat.play();
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
         removeMovieClip(this);
      }
   }
}

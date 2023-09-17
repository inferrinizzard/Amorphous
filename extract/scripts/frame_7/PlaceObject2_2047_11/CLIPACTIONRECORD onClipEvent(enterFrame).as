onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(daddySplat._currentframe == 5)
      {
         daddySplat.stop();
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true) && eval(_root.HeroPointer) != undefined)
      {
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab != null && suitTab.charge > 1)
         {
            suitTab.charge -= 2;
         }
         else if(_root.HeroPointerGoo == undefined)
         {
            duplicateMovieClip(_root.Goo,"HeroPointerGoo",16384 + _global.capDepth++);
            _global.MakeNoise("Goo");
         }
         _root.Census.perfectRun = false;
      }
      else
      {
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x].slice(0,8) != "myBoxGun")
            {
               if(_global.Enemies[x].slice(0,7) != "myDrone")
               {
                  if(_global.Enemies[x].slice(0,5) != "Oozle")
                  {
                     if(_global.Enemies[x].slice(0,4) != "Gray")
                     {
                        if(_global.Enemies[x].slice(0,7) != "Grinder")
                        {
                           if(_global.Enemies[x].slice(0,4) != "Void")
                           {
                              if(_global.Enemies[x].slice(0,6) != "Horror")
                              {
                                 if(_global.Enemies[x].slice(0,7) != "Amalgam")
                                 {
                                    if(_global.Enemies[x].slice(0,5) != "Queen")
                                    {
                                       if(_global.Enemies[x].slice(0,5) != "Razor")
                                       {
                                          targetEnemy = eval("_root." + _global.Enemies[x]);
                                          if(!(targetEnemy._name.slice(0,5) == "Sharp" && targetEnemy.spines))
                                          {
                                             if(hitTest(targetEnemy._x,targetEnemy._y,true))
                                             {
                                                if(eval("_root." + targetEnemy._name + "Goo") == undefined)
                                                {
                                                   duplicateMovieClip(_root.Goo,targetEnemy._name + "Goo",16384 + _global.capDepth++);
                                                   _global.MakeNoise("Goo");
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
      framesSitting++;
      if(framesSitting >= 155)
      {
         daddySplat.play();
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
         removeMovieClip(this);
      }
   }
}

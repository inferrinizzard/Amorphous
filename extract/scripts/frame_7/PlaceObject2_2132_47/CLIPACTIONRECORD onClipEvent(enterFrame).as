onClipEvent(enterFrame){
   if(!mommy && !_global.pause)
   {
      if(daddySplat._currentframe == 5)
      {
         daddySplat.stop();
      }
      if(onFire)
      {
         ignitePointY = _Y - 30 * Math.cos(_rotation * 0.017453292519943295);
         ignitePointX = _X + 30 * Math.sin(_rotation * 0.017453292519943295);
         FireName = "_root." + this._name + "Fire";
         duplicateMovieClip(_root.BigFire,this._name + "Fire",16384 + _global.effectDepth++);
         setProperty(FireName, _X, ignitePointX);
         setProperty(FireName, _Y, ignitePointY);
         daddySplat.play();
         _global.Hazards.splice(_root.SpawnPoint.SearchArray(_global.Hazards,_name),1);
         removeMovieClip(this);
      }
      if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
      {
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab != null && suitTab.charge > 1)
         {
            suitTab.charge -= 2;
         }
         else if(_root.HeroPointerSlickTag == undefined)
         {
            duplicateMovieClip(_root.SlickTag,"HeroPointerSlickTag",16384 + _global.markDepth++);
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
                  if(_global.Enemies[x].slice(0,5) != "Inkie")
                  {
                     if(_global.Enemies[x].slice(0,7) != "Grinder")
                     {
                        if(_global.Enemies[x].slice(0,7) != "Torchie")
                        {
                           if(_global.Enemies[x].slice(0,4) != "Void")
                           {
                              if(_global.Enemies[x].slice(0,5) != "Razor")
                              {
                                 targetEnemy = eval("_root." + _global.Enemies[x]);
                                 if(!(targetEnemy._name.slice(0,5) == "Sharp" && targetEnemy.spines))
                                 {
                                    if(hitTest(targetEnemy._x,targetEnemy._y,true))
                                    {
                                       if(eval("_root." + targetEnemy._name + "SlickTag") == undefined)
                                       {
                                          duplicateMovieClip(_root.SlickTag,targetEnemy._name + "SlickTag",16384 + _global.markDepth++);
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

onClipEvent(enterFrame){
   if(_name != "VoidBeam" && !_global.pause)
   {
      play();
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      if(framesExisted < 90)
      {
         if(_root.HeroPointer != undefined)
         {
            movingForward = true;
            dragToX = _X;
            dragToY = _Y;
            testAtX = _X + 20 * Math.sin(_rotation * 0.017453292519943295);
            testAtY = _Y - 20 * Math.cos(_rotation * 0.017453292519943295);
            m = 0;
            while(m < 15)
            {
               dragDifX = dragToX - _root.HeroPointer._x;
               dragDifY = dragToY - _root.HeroPointer._y;
               dragToDist = Math.sqrt(dragDifX * dragDifX + dragDifY * dragDifY);
               testDifX = testAtX - _root.HeroPointer._x;
               testDifY = testAtY - _root.HeroPointer._y;
               testAtDist = Math.sqrt(testDifX * testDifX + testDifY * testDifY);
               if(testAtDist < dragToDist)
               {
                  dragToX = testAtX;
                  dragToY = testAtY;
                  if(movingForward)
                  {
                     testAtX += 20 * Math.sin(_rotation * 0.017453292519943295);
                     testAtY -= 20 * Math.cos(_rotation * 0.017453292519943295);
                  }
                  else
                  {
                     testAtX += 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                     testAtY -= 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
                  }
               }
               else if(movingForward && dragToX == _X)
               {
                  movingForward = false;
                  testAtX = _X + 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                  testAtY = _Y - 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
               }
               else
               {
                  m = 20;
               }
               if(!hitTest(testAtX,testAtY,true))
               {
                  if(movingForward && dragToX == _X)
                  {
                     movingForward = false;
                     testAtX = _X + 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                     testAtY = _Y - 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
                  }
                  else
                  {
                     m = 20;
                  }
               }
               m++;
            }
            toMyX = _root.HeroPointer._x - dragToX;
            toMyY = _root.HeroPointer._y - dragToY;
            toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
            suitTab = eval(_global.RewardTab("Hazard Suit"));
            if(suitTab != null && suitTab.charge > 1)
            {
               suitTab.charge--;
               _root.HeroPointer._y -= 2 * Math.cos(toMyDir * 0.017453292519943295);
               _root.HeroPointer._x += 2 * Math.sin(toMyDir * 0.017453292519943295);
            }
            else
            {
               _root.HeroPointer._y -= 6 * Math.cos(toMyDir * 0.017453292519943295);
               _root.HeroPointer._x += 6 * Math.sin(toMyDir * 0.017453292519943295);
            }
            if(hitTest(_root.HeroPointer._x,_root.HeroPointer._y,true))
            {
               _global.justHit = hostObject;
               duplicateMovieClip(_root.HeroDisintigrate,"HeroDisInt",16384 + _global.effectDepth++);
               with(_root.HeroDisInt)
               {
                  _x = _root.HeroPointer._x;
                  _y = _root.HeroPointer._y;
                  _rotation = toMyDir;
               }
            }
         }
         x = 0;
         while(x < _global.Enemies.length)
         {
            if(_global.Enemies[x] != hostObject._name && _global.Enemies[x].slice(0,7) != "Grinder")
            {
               hitTarget = eval("_root." + _global.Enemies[x]);
               if(!(hitTarget._name.slice(0,4) == "Gray" && hitTarget.action != "none"))
               {
                  if(hitTarget._name.slice(0,5) != "myBox")
                  {
                     movingForward = true;
                     dragToX = _X;
                     dragToY = _Y;
                     testAtX = _X + 20 * Math.sin(_rotation * 0.017453292519943295);
                     testAtY = _Y - 20 * Math.cos(_rotation * 0.017453292519943295);
                     m = 0;
                     while(m < 15)
                     {
                        dragDifX = dragToX - hitTarget._x;
                        dragDifY = dragToY - hitTarget._y;
                        dragToDist = Math.sqrt(dragDifX * dragDifX + dragDifY * dragDifY);
                        testDifX = testAtX - hitTarget._x;
                        testDifY = testAtY - hitTarget._y;
                        testAtDist = Math.sqrt(testDifX * testDifX + testDifY * testDifY);
                        if(testAtDist < dragToDist)
                        {
                           dragToX = testAtX;
                           dragToY = testAtY;
                           if(movingForward)
                           {
                              testAtX += 20 * Math.sin(_rotation * 0.017453292519943295);
                              testAtY -= 20 * Math.cos(_rotation * 0.017453292519943295);
                           }
                           else
                           {
                              testAtX += 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                              testAtY -= 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
                           }
                        }
                        else if(movingForward && dragToX == _X)
                        {
                           movingForward = false;
                           testAtX = _X + 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                           testAtY = _Y - 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
                        }
                        else
                        {
                           m = 20;
                        }
                        if(!hitTest(testAtX,testAtY,true))
                        {
                           if(movingForward && dragToX == _X)
                           {
                              movingForward = false;
                              testAtX = _X + 20 * Math.sin((_rotation - 180) * 0.017453292519943295);
                              testAtY = _Y - 20 * Math.cos((_rotation - 180) * 0.017453292519943295);
                           }
                           else
                           {
                              m = 20;
                           }
                        }
                        m++;
                     }
                     toMyX = hitTarget._x - dragToX;
                     toMyY = hitTarget._y - dragToY;
                     toMyDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                     if(hitTarget._name.slice(0,5) == "Oozle" || hitTarget._name.slice(0,4) == "Gray" || hitTarget._name.slice(0,6) == "Horror" && hitTarget.action != "collect")
                     {
                        hitTarget._y -= 2 * Math.cos(toMyDir * 0.017453292519943295);
                        hitTarget._x += 2 * Math.sin(toMyDir * 0.017453292519943295);
                     }
                     else
                     {
                        hitTarget._y -= 6 * Math.cos(toMyDir * 0.017453292519943295);
                        hitTarget._x += 6 * Math.sin(toMyDir * 0.017453292519943295);
                     }
                     if(hitTest(hitTarget._x,hitTarget._y,true))
                     {
                        duplicateMovieClip(_root.GloopleDisintigrate,hitTarget._name + "DisInt",16384 + _global.effectDepth++);
                        with(eval("_root." + hitTarget._name + "DisInt"))
                        {
                           _x = hitTarget._x;
                           _y = hitTarget._y;
                           _rotation = toMyDir;
                           if(hitTarget._name.slice(0,5) == "Oozle" || hitTarget._name.slice(0,4) == "Gray" || hitTarget._name.slice(0,6) == "Horror" && hitTarget.action != "collect")
                           {
                              _xscale = 170;
                              _yscale = 170;
                           }
                        }
                        _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hitTarget._name),1);
                        removeMovieClip(hitTarget);
                     }
                  }
               }
            }
            x++;
         }
      }
      else
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

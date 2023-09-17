onClipEvent(enterFrame){
   if(myReward != "Armor")
   {
      if(_parent.charge < 1)
      {
         _parent.charge = 1;
      }
      if(_parent.charge > 300)
      {
         _parent.charge = 300;
      }
      _parent.myGauge.gotoAndStop(_parent.charge);
   }
   if(!_global.pause && _global.HeroKilled)
   {
      if(myReward == "Armor" && _parent.charge == 300)
      {
         _parent.charge = 1;
         _parent.myIcon.gotoAndStop(2);
         myShards = int(Math.random() * 4) + 8;
         Quadrant = 0;
         x = 1;
         while(x <= myShards)
         {
            shardName = "Shard" + _global.effectDepth;
            _root.attachMovie("Armor Shard",shardName,_global.effectDepth++);
            with(eval("_root." + shardName))
            {
               _x = _global.heroWasX;
               _y = _global.heroWasY;
               _rotation = Quadrant + int(Math.random() * 90) - 45;
            }
            Quadrant += 90;
            if(Quadrant == 270)
            {
               Quadrant = -90;
            }
            x++;
         }
         armSparks = int(Math.random() * 6) + 12;
         x = 1;
         while(x <= armSparks)
         {
            sparkName = "ArmorSpark" + x;
            _root.attachMovie("Spark",sparkName,_global.capDepth++);
            with(eval("_root." + sparkName))
            {
               _x = _global.heroWasX;
               _y = _global.heroWasY;
               _rotation = int(Math.random() * 360) - 180;
            }
            sparkColor = new Color(eval("_root." + sparkName));
            sparkColor.setRGB(16053248);
            x++;
         }
      }
      if(myReward == "Hazard Suit" && _parent.charge > 1)
      {
         _parent.charge = 1;
         myScraps = int(Math.random() * 2) + 4;
         Quadrant = 0;
         x = 1;
         while(x <= myScraps)
         {
            scrapName = "Scrap" + _global.effectDepth;
            _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
            with(eval("_root." + scrapName))
            {
               _x = _global.heroWasX;
               _y = _global.heroWasY;
               _rotation = Quadrant + int(Math.random() * 90) - 45;
            }
            Quadrant += 90;
            if(Quadrant == 270)
            {
               Quadrant = -90;
            }
            x++;
         }
         myShreds = int(Math.random() * 5) + 15;
         Quadrant = 0;
         x = 1;
         while(x <= myShreds)
         {
            scrapName = "Shred" + _global.effectDepth;
            _root.attachMovie("Suit Tatter",scrapName,_global.effectDepth++);
            with(eval("_root." + scrapName))
            {
               _x = _global.heroWasX;
               _y = _global.heroWasY;
               _rotation = Quadrant + int(Math.random() * 90) - 45;
            }
            Quadrant += 90;
            if(Quadrant == 270)
            {
               Quadrant = -90;
            }
            x++;
         }
         suitSparks = int(Math.random() * 6) + 12;
         x = 1;
         while(x <= suitSparks)
         {
            sparkName = "SuitSpark" + x;
            _root.attachMovie("Spark",sparkName,_global.capDepth++);
            with(eval("_root." + sparkName))
            {
               _x = _global.heroWasX;
               _y = _global.heroWasY;
               _rotation = int(Math.random() * 360) - 180;
            }
            sparkColor = new Color(eval("_root." + sparkName));
            sparkColor.setRGB(16053248);
            x++;
         }
      }
   }
   if(!_global.pause && !HeroKilled && (_global.ClearTime == 0 || _global.gameMode != "Single"))
   {
      switch(myReward)
      {
         case "Sprint":
            if(_parent.charge == 1)
            {
               _parent.myLight.gotoAndStop(1);
               _parent.myIcon.gotoAndStop(2);
            }
            else
            {
               _parent.myLight.gotoAndStop(2);
               _parent.myIcon.gotoAndStop(1);
            }
            break;
         case "Grenade":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               _parent.myIcon.gotoAndStop(2);
               if(tick == 5 || _global.gameMode == "Practice")
               {
                  _parent.charge = _parent.charge + 1;
                  tick = 0;
               }
               else
               {
                  tick++;
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myLight.gotoAndStop(2);
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
            }
            break;
         case "Lure":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               if(eval(_root.myLure) == undefined)
               {
                  _parent.myIcon.gotoAndStop(2);
                  if(tick == 7 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
               else
               {
                  _parent.myIcon.gotoAndStop(1);
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myLight.gotoAndStop(2);
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
            }
            break;
         case "Spike":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               if(eval(_root.mySpike) == undefined)
               {
                  _parent.myIcon.gotoAndStop(2);
                  if(tick == 5 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
               else
               {
                  _parent.myIcon.gotoAndStop(1);
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myLight.gotoAndStop(2);
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
            }
            break;
         case "Choker":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               if(eval(_root.myChoker) == undefined)
               {
                  _parent.myIcon.gotoAndStop(2);
                  if(tick == 8 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
               else
               {
                  _parent.myIcon.gotoAndStop(1);
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myLight.gotoAndStop(2);
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
            }
            break;
         case "Drone":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               if(eval(_root.myDrone) == undefined)
               {
                  _parent.myIcon.gotoAndStop(2);
                  if(tick == 3 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
               else
               {
                  _parent.myIcon.gotoAndStop(1);
               }
            }
            else
            {
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
               if(eval(_root.myDrone) == undefined)
               {
                  if(_parent.myLight._currentframe == 1)
                  {
                     _global.MakeNoise("Bleep");
                  }
                  _parent.myLight.gotoAndStop(2);
               }
               else
               {
                  _parent.myLight.gotoAndStop(1);
               }
            }
            break;
         case "BoxGun":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               if(eval(_root.myBoxGun) == undefined)
               {
                  _parent.myIcon.gotoAndStop(2);
                  if(tick == 11 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
               else
               {
                  _parent.myIcon.gotoAndStop(1);
               }
            }
            else
            {
               tick = 0;
               _parent.myIcon.gotoAndStop(1);
               if(eval(_root.myBoxGun) == undefined)
               {
                  if(_parent.myLight._currentframe == 1)
                  {
                     _global.MakeNoise("Bleep");
                  }
                  _parent.myLight.gotoAndStop(2);
               }
               else
               {
                  _parent.myLight.gotoAndStop(1);
               }
            }
            break;
         case "Teleport":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               _parent.myIcon.gotoAndStop(2);
               if(tick == 9 || _global.gameMode == "Practice")
               {
                  _parent.charge = _parent.charge + 1;
                  tick = 0;
               }
               else
               {
                  tick++;
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myIcon.gotoAndStop(1);
               _parent.myLight.gotoAndStop(2);
               tick = 0;
            }
            break;
         case "Mason":
            if(_parent.charge < 300)
            {
               _parent.myLight.gotoAndStop(1);
               _parent.myIcon.gotoAndStop(2);
               if(eval(_root.GrinderWall) == undefined && eval(_root.myMasonBomb) == undefined && eval(_root.myBlast) == undefined)
               {
                  if(tick == 11 || _global.gameMode == "Practice")
                  {
                     _parent.charge = _parent.charge + 1;
                     tick = 0;
                  }
                  else
                  {
                     tick++;
                  }
               }
            }
            else
            {
               if(_parent.myLight._currentframe == 1)
               {
                  _global.MakeNoise("Bleep");
               }
               _parent.myIcon.gotoAndStop(1);
               _parent.myLight.gotoAndStop(2);
               tick = 0;
            }
            break;
         case "Hazard Suit":
            suitDamage = suitHealth - _parent.charge;
            if(suitDamage > 0)
            {
               suitSparks = int(Math.random() * 3) + int(suitDamage / 10);
               x = 1;
               while(x <= suitSparks)
               {
                  sparkName = "SuitSpark" + _global.capDepth;
                  _root.attachMovie("Spark",sparkName,_global.capDepth++);
                  with(eval("_root." + sparkName))
                  {
                     _x = _global.heroWasX;
                     _y = _global.heroWasY;
                     _rotation = _root.HeroPointer._rotation + int(Math.random() * 40) - 200;
                  }
                  sparkColor = new Color(eval("_root." + sparkName));
                  sparkColor.setRGB(16053248);
                  x++;
               }
               suitArcs = int(suitDamage / 30);
               if(suitArcs == 0 && int(Math.random() * 5) == 0)
               {
                  suitArcs = 1;
               }
               x = 1;
               while(x <= suitArcs)
               {
                  arcName = "SuitArc" + _global.capDepth;
                  _root.attachMovie("Arc",arcName,_global.capDepth++);
                  with(eval("_root." + arcName))
                  {
                     _x = _global.heroWasX + int(Math.random() * 20) - 10;
                     _y = _global.heroWasY + int(Math.random() * 20) - 10;
                     _xscale = int(Math.random() * 30) + 70;
                     _yscale = int(Math.random() * 30) + 70;
                     _rotation = int(Math.random() * 360) - 180;
                  }
                  arcColor = new Color(eval("_root." + arcName));
                  arcColor.setRGB(16053248);
                  x++;
               }
            }
            if(_parent.charge == 1 && suitHealth > 1)
            {
               myScraps = int(Math.random() * 2) + 4;
               Quadrant = 0;
               x = 1;
               while(x <= myScraps)
               {
                  scrapName = "Scrap" + _global.effectDepth;
                  _root.attachMovie("Light Scrapmetal",scrapName,_global.effectDepth++);
                  with(eval("_root." + scrapName))
                  {
                     _x = _global.heroWasX;
                     _y = _global.heroWasY;
                     _rotation = Quadrant + int(Math.random() * 90) - 45;
                  }
                  Quadrant += 90;
                  if(Quadrant == 270)
                  {
                     Quadrant = - 90;
                  }
                  x++;
               }
               myShreds = int(Math.random() * 5) + 15;
               Quadrant = 0;
               x = 1;
               while(x <= myShreds)
               {
                  scrapName = "Shred" + _global.effectDepth;
                  _root.attachMovie("Suit Tatter",scrapName,_global.effectDepth++);
                  with(eval("_root." + scrapName))
                  {
                     _x = _global.heroWasX;
                     _y = _global.heroWasY;
                     _rotation = Quadrant + int(Math.random() * 90) - 45;
                  }
                  Quadrant += 90;
                  if(Quadrant == 270)
                  {
                     Quadrant = - 90;
                  }
                  x++;
               }
               suitSparks = int(Math.random() * 6) + 12;
               x = 1;
               while(x <= suitSparks)
               {
                  sparkName = "SuitSpark" + x;
                  _root.attachMovie("Spark",sparkName,_global.capDepth++);
                  with(eval("_root." + sparkName))
                  {
                     _x = _global.heroWasX;
                     _y = _global.heroWasY;
                     _rotation = int(Math.random() * 360) - 180;
                  }
                  sparkColor = new Color(eval("_root." + sparkName));
                  sparkColor.setRGB(16053248);
                  x++;
               }
            }
            suitHealth = _parent.charge;
            if(_parent.charge > 1)
            {
               _parent.myIcon.gotoAndStop(1);
            }
            else
            {
               _parent.myIcon.gotoAndStop(2);
            }
      }
   }
}

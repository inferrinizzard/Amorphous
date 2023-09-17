onClipEvent(keyDown){
   if(!_global.pause && !HeroKilled && (_global.ClearTime == 0 || _global.gameMode != "Single"))
   {
      if(Key.getCode() == _global.RewardKey(myReward) && (myReward == "Teleport" || _global.HeroAction == "none"))
      {
         switch(myReward)
         {
            case "Grenade":
               if(_parent.charge == 300)
               {
                  _root.attachMovie("Grenade","myGrenade",_global.capDepth++);
                  with(_root.myGrenade)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _parent.charge = 1;
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "Lure":
               if(_parent.charge == 300)
               {
                  _root.attachMovie("Lure","myLure",_global.effectDepth++);
                  with(_root.myLure)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _parent.charge = 1;
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "Spike":
               if(_parent.charge == 300)
               {
                  _root.attachMovie("Spike","mySpike",_global.effectDepth++);
                  with(_root.mySpike)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _parent.charge = 1;
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "Choker":
               if(_parent.charge == 300)
               {
                  _root.attachMovie("Choker","myChoker",_global.baddieDepth++);
                  with(_root.myChoker)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _parent.charge = 1;
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "BoxGun":
               if(_parent.charge == 300 && eval(_root.myBoxGun) == undefined)
               {
                  _root.attachMovie("SCAER","myBoxGun",996);
                  with(_root.myBoxGun)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "Drone":
               if(_parent.charge == 300 && eval(_root.myDrone) == undefined)
               {
                  _root.attachMovie("Buzz Drone","myDrone",_global.heroDepth++);
                  with(_root.myDrone)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _global.MakeNoise("Toss Noise");
               }
               break;
            case "Teleport":
               if(eval(_root.myTelepad) == undefined)
               {
                  _root.attachMovie("Telepad","myTelepad",995);
                  with(_root.myTelepad)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
               }
               else if(_parent.charge == 300 && _root.myTelepad.ready)
               {
                  _root.attachMovie("Teleport Gap","myGap",_global.capDepth++);
                  with(_root.myGap)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  myArcs = int(Math.random() * 3) + 3;
                  x = 1;
                  while(x <= myArcs)
                  {
                     arcName = "myArc" + _global.capDepth;
                     _root.attachMovie("Arc",arcName,_global.capDepth++);
                     with(eval("_root." + arcName))
                     {
                        _x = _root.HeroPointer._x + int(Math.random() * 60) - 30;
                        _y = _root.HeroPointer._y + int(Math.random() * 60) - 30;
                        _xscale = int(Math.random() * 30) + 70;
                        _yscale = int(Math.random() * 30) + 70;
                        _rotation = int(Math.random() * 360) - 180;
                     }
                     arcColor = new Color(eval("_root." + arcName));
                     arcColor.setRGB(3848943);
                     x++;
                  }
                  toMyX = _root.HeroPointer._x - _root.myTelepad._x;
                  toMyY = _root.HeroPointer._y - _root.myTelepad._y;
                  distToHero = Math.sqrt(toMyX * toMyX + toMyY * toMyY);
                  toMyDir = (- Math.atan2(toMyX,toMyY)) / (Math.PI / 180);
                  _root.attachMovie("Teleport Bolt","myBolt",_global.effectDepth++);
                  with(_root.myBolt)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = toMyDir;
                     _yscale = distToHero;
                     _xscale = 100 + distToHero / 5;
                  }
                  mySparks = int(Math.random() * 6) + 8;
                  x = 1;
                  while(x <= mySparks)
                  {
                     sparkName = "TeleSpark" + x;
                     _root.attachMovie("Spark",sparkName,_global.capDepth++);
                     with(eval("_root." + sparkName))
                     {
                        _x = _root.myTelepad._x;
                        _y = _root.myTelepad._y;
                        _rotation = int(Math.random() * 360) - 180;
                     }
                     sparkColor = new Color(eval("_root." + sparkName));
                     sparkColor.setRGB(3848943);
                     x++;
                  }
                  x = 0;
                  while(x < _global.Enemies.length)
                  {
                     hitTarget = eval("_root." + _global.Enemies[x]);
                     if(hitTarget.hitTest(_root.myTelepad._x,_root.myTelepad._y,true))
                     {
                        hitTarget.killedBy = _root.myTelepad;
                     }
                     x++;
                  }
                  _root.HeroPointer._x = _root.myTelepad._x;
                  _root.HeroPointer._y = _root.myTelepad._y;
                  _parent.charge = 1;
                  _global.MakeNoise("Teleport A");
                  _global.MakeNoise("Teleport B");
               }
               break;
            case "Mason":
               if(_parent.charge == 300)
               {
                  _root.attachMovie("Mason Bomb","myMasonBomb",_global.capDepth++);
                  with(_root.myMasonBomb)
                  {
                     _x = _root.HeroPointer._x;
                     _y = _root.HeroPointer._y;
                     _rotation = _root.HeroPointer._rotation;
                  }
                  _parent.charge = 1;
                  _global.MakeNoise("Toss Noise");
               }
         }
      }
   }
}

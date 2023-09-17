onClipEvent(load){
   _parent.addProperty("charge",this.getCharge,this.setCharge);
   myKeyCode = null;
   myReward = null;
   _parent.charge = 300;
   tick = 0;
   switch(_parent._name.slice(0,1))
   {
      case "A":
         myReward = _global.ABind;
         myKeyCode = 65;
         break;
      case "S":
         myReward = _global.SBind;
         myKeyCode = 83;
         break;
      case "D":
         myReward = _global.DBind;
         myKeyCode = 68;
   }
   if(myReward != "Armor" && myReward != "Glaive" && myReward != "Hazard Suit")
   {
      _parent.attachMovie("SetLight " + _parent._name.slice(0,1),"myLight",2);
      _parent.myLight.gotoAndStop(2);
   }
   if(myReward != "Armor" && myReward != "Glaive")
   {
      _parent.attachMovie("Charge Gauge","myGauge",5);
      _parent.myGauge._y = 6;
      _parent.myGauge.gotoAndStop(300);
   }
   _parent.attachMovie("Reward Icon " + myReward,"myIcon",3);
   _parent.myIcon.gotoAndStop(1);
   if(myReward == "Glaive")
   {
      _global.RazorGlaiveEquipped = true;
   }
   if(myReward == "Armor")
   {
      _parent.armorHit = function()
      {
         hitTarget = _global.justHit;
         if(HeroAction == "frozen")
         {
            _parent.charge = 2;
            _global.justHit = null;
            HeroAction = "none";
            _root.HeroPointer.frozenFrames = 0;
         }
         else if(_global.justHit._name.slice(0,5) == "Oozle" || _global.justHit._name.slice(0,4) == "Gray" && _global.justHit.action == "none" || _global.justHit._name.slice(0,7) == "Amalgam" && _global.justHit._xscale > 70)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(_global.justHit._name.slice(0,5) == "Biter" && _global.justHit.lunging == true)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(_global.justHit._name.slice(0,5) == "Sharp" && _global.justHit.spines == true)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(_global.justHit._name.slice(0,7) == "Grinder" && !_global.justHit.wall)
         {
            _parent.charge = 2;
         }
         else if(_global.justHit._name.slice(0,6) == "Fuzzle" && _global.justHit.lunging == true)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(_global.justHit._name.slice(0,4) == "Gray" && _global.justHit.lancing)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(_global.justHit.exploded && Math.sqrt(Math.pow(_root.HeroPointer._x - justHit._x,2) + Math.pow(_root.HeroPointer._y - justHit._y,2)) < 150)
         {
            _parent.charge = 2;
            _global.justHit = null;
         }
         else if(!(_global.justHit._name.slice(0,4) == "Void" && _global.justHit.action == "shoot"))
         {
            if(_global.justHit.hook || _global.justHit.spike)
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit.quill || _global.justHit.slug)
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit.mite)
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit.hedgehog == "Crush")
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit.hedgehog == "Ground")
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit.disk || _global.justHit.claw)
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.justHit._name.slice(0,6) == "Horror" && _global.justHit.action != "collect")
            {
               _parent.charge = 2;
               _global.justHit = null;
            }
            else if(_global.HeroAction != "flamed")
            {
            }
         }
         if(_parent.charge == 2)
         {
            _root.HeroPointer.exploded = true;
            _root.attachMovie("Armor Blast","ArmorBlast",_global.heroDepth++);
            with(_root.ArmorBlast)
            {
               _x = _root.HeroPointer._x;
               _y = _root.HeroPointer._y;
               _rotation = _root.HeroPointer._rotation;
            }
            myShards = int(Math.random() * 4) + 8;
            Quadrant = 0;
            x = 1;
            while(x <= myShards)
            {
               shardName = "Shard" + _global.effectDepth;
               _root.attachMovie("Armor Shard",shardName,_global.effectDepth++);
               with(eval("_root." + shardName))
               {
                  _x = _root.HeroPointer._x;
                  _y = _root.HeroPointer._y;
                  _rotation = Quadrant + int(Math.random() * 90) - 45;
               }
               Quadrant += 90;
               if(Quadrant == 270)
               {
                  Quadrant = -90;
               }
               x++;
            }
            duplicateMovieClip(_root.VoidPulse,"ArmorShockwave",16384 + _global.effectDepth++);
            with(_root.ArmorShockwave)
            {
               _x = _root.HeroPointer._x;
               _y = _root.HeroPointer._y;
            }
            blastName = "ArmorBlastmark" + _global.backgroundDepth;
            duplicateMovieClip(_root.Blastmark,blastName,16384 + _global.backgroundDepth++);
            with(eval("_root." + blastName))
            {
               _x = _root.HeroPointer._x;
               _y = _root.HeroPointer._y;
            }
            duplicateMovieClip(_root.Blackout,"ArmorBright",22384);
            with(_root.ArmorBright)
            {
               _x = 275;
               _y = 200;
               _xscale = 1000;
               _yscale = 1000;
            }
            BlinkColor = new Color(_root.ArmorBright);
            BlinkColor.setRGB(16777215);
            ashpuffs = int(Math.random() * 2) + 2;
            x = 0;
            while(x < ashpuffs)
            {
               duplicateMovieClip(_root.GroundDirt,"ArmorAsh" + x,16384 + _global.effectDepth++);
               with(eval("_root.ArmorAsh" + x))
               {
                  _x = _root.HeroPointer._x;
                  _y = _root.HeroPointer._y;
                  _rotation = int(Math.random() * 360) - 179;
               }
               AshColor = new Color(eval("_root.ArmorAsh" + x));
               AshColor.setRGB(0);
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
                  _x = _root.HeroPointer._x;
                  _y = _root.HeroPointer._y;
                  _rotation = int(Math.random() * 360) - 180;
               }
               sparkColor = new Color(eval("_root." + sparkName));
               sparkColor.setRGB(16053248);
               x++;
            }
            if(!hitTarget.exploded && hitTarget._name.slice(0,7) != "Grinder")
            {
               toTargetX = _root.HeroPointer._x - hitTarget._x;
               toTargetY = _root.HeroPointer._y - hitTarget._y;
               targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
               hitTarget._y -= 10 * Math.cos(targetDirection * 0.017453292519943295);
               hitTarget._x += 10 * Math.sin(targetDirection * 0.017453292519943295);
               hitTarget._rotation = targetDirection;
               if(hitTarget.disk)
               {
                  hitTarget.moveDirection = targetDirection;
               }
               if(hitTarget.claw || hitTarget.mite)
               {
                  hitTarget.killedBy = _root.HeroPointer;
               }
            }
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != _name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  toTargetX = _root.HeroPointer._x - hitTarget._x;
                  toTargetY = _root.HeroPointer._y - hitTarget._y;
                  targetDirection = (- Math.atan2(toTargetX,toTargetY)) / 0.017453292519943295;
                  distToEnemy = Math.sqrt(toTargetX * toTargetX + toTargetY * toTargetY);
                  if(distToEnemy <= 100)
                  {
                     hitTarget.killedBy = _root.HeroPointer;
                  }
                  else if(distToEnemy <= 150)
                  {
                     if(!hitTarget.wall)
                     {
                        hitTarget._y -= 10 * Math.cos(targetDirection * 0.017453292519943295);
                        hitTarget._x += 10 * Math.sin(targetDirection * 0.017453292519943295);
                        hitTarget._rotation = targetDirection;
                     }
                  }
               }
               x++;
            }
            _global.MakeNoise("Armor Explode");
            _global.MakeNoise("Explode");
            if(_global.justHit == null)
            {
               _root.HeroPointer.invincFrames = 5;
            }
            _parent.charge = 1;
            _parent.myIcon.gotoAndStop(2);
         }
      };
   }
   if(myReward == "Hazard Suit")
   {
      suitHealth == 300;
   }
}

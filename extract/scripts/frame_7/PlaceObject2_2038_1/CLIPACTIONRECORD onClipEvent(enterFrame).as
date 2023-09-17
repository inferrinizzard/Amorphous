onClipEvent(enterFrame){
   if(_name != "PointMark" && !_global.pause)
   {
      if(clutters.length >= 5)
      {
         _global.GainAward("Bogged by Clutters");
      }
      x = 1;
      while(x <= clutters.length)
      {
         if(eval(clutters[x - 1]) == undefined)
         {
            clutters.splice(x - 1,1);
         }
         x++;
      }
      if(_global.gameMode == "Single" && _global.ClearTime > 0)
      {
         passiveTime = 0;
      }
      passiveTime++;
      if(passiveTime >= 900)
      {
         _global.GainAward("30 Secs Without Swinging");
      }
      if(killsOnSwing > 1 && _global.HeroAction != "attacking")
      {
         CP = String(random(1000));
         duplicateMovieClip(_root.Bounty,_name + "Multi" + CP,16384 + _global.markDepth++);
         setProperty("_root." + _name + "Multi" + CP, _X, this._x);
         setProperty("_root." + _name + "Multi" + CP, _Y, this._y);
         BountyObject = eval("_root." + _name + "Multi" + CP);
         BountyObject.bounty = "x" + String(killsOnSwing);
         if(killsOnSwing > _global.BestCombo)
         {
            _global.BestCombo = killsOnSwing;
         }
         pointsOnSwing *= killsOnSwing;
         if(pointsOnSwing >= 300)
         {
            _global.GainAward("300pt Swing");
         }
         if(pointsOnSwing >= 200)
         {
            _global.GainAward("200pt Swing");
         }
         if(pointsOnSwing >= 150)
         {
            _global.GainAward("150pt Swing");
         }
         if(pointsOnSwing >= 100)
         {
            _global.GainAward("100pt Swing");
         }
         if(pointsOnSwing >= 75)
         {
            _global.GainAward("75pt Swing");
         }
         if(pointsOnSwing >= 50)
         {
            _global.GainAward("50pt Swing");
         }
         if(pointsOnSwing >= 20)
         {
            _global.GainAward("20pt Swing");
         }
      }
      if(killsOnSwing > 0 && _global.HeroAction != "attacking")
      {
         if(pointsOnSwing > _global.BestSwing)
         {
            _global.BestSwing = pointsOnSwing;
         }
         _global.Score += pointsOnSwing;
         if(killsOnSwing == 1)
         {
            consecCombo = 0;
         }
         else
         {
            consecCombo++;
         }
         if(consecCombo >= 10)
         {
            _global.GainAward("10 Straight Combos");
         }
         killsOnSwing = 0;
         pointsOnSwing = 0;
      }
      if(_global.HeroAction == "melted")
      {
         if(eval(_root.HeroWalkin) != undefined)
         {
            removeMovieClip(_root.HeroWalkin);
         }
         if(eval(_root.HeroSlashin) != undefined)
         {
            removeMovieClip(_root.HeroSlashin);
         }
         if(eval(_root.HeroStagger) != undefined)
         {
            removeMovieClip(_root.HeroStagger);
         }
         duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
         with(_root.mySword)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         duplicateMovieClip(_root.HeroMelt,"HeroMelting",16384 + _global.effectDepth++);
         with(_root.HeroMelting)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         _global.HeroKilled = true;
         if(_global.SearchArray(_global.BadEnds,"Melted") == null && _global.gameMode != "Practice")
         {
            _global.BadEnds.push("Melted");
         }
         this.removeMovieClip();
      }
      if(_global.HeroAction == "frozen")
      {
         if(eval(_root.HeroWalkin) != undefined)
         {
            removeMovieClip(_root.HeroWalkin);
         }
         if(eval(_root.HeroSlashin) != undefined)
         {
            removeMovieClip(_root.HeroSlashin);
         }
         if(eval(_root.HeroStagger) != undefined)
         {
            removeMovieClip(_root.HeroStagger);
         }
         if(eval(_root.HeroOnFire) != undefined)
         {
            removeMovieClip(_root.HeroOnFire);
            _global.GainAward("Survive Fire");
         }
         if(eval(_root.HeroOnIce) == undefined)
         {
            duplicateMovieClip(_root.HeroFrozen,"HeroOnIce",16384 + _global.heroDepth++);
         }
         with(_root.HeroOnIce)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      if(_global.HeroAction == "flamed")
      {
         if(eval(_root.HeroWalkin) != undefined)
         {
            removeMovieClip(_root.HeroWalkin);
         }
         if(eval(_root.HeroSlashin) != undefined)
         {
            removeMovieClip(_root.HeroSlashin);
         }
         if(eval(_root.HeroStagger) != undefined)
         {
            removeMovieClip(_root.HeroStagger);
         }
         if(eval(_root.HeroOnFire) == undefined)
         {
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroFlamingRazor,"HeroOnFire",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroFlaming,"HeroOnFire",16384 + _global.heroDepth++);
            }
         }
         with(_root.HeroOnFire)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      if(_global.HeroAction == "burned")
      {
         if(eval(_root.HeroWalkin) != undefined)
         {
            removeMovieClip(_root.HeroWalkin);
         }
         if(eval(_root.HeroSlashin) != undefined)
         {
            removeMovieClip(_root.HeroSlashin);
         }
         if(eval(_root.HeroStagger) != undefined)
         {
            removeMovieClip(_root.HeroStagger);
         }
         duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
         with(_root.mySword)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         duplicateMovieClip(_root.HeroBurn,"HeroBurning",16384 + _global.effectDepth++);
         with(_root.HeroBurning)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         _global.HeroKilled = true;
         if(_global.SearchArray(_global.BadEnds,"Burned") == null && _global.gameMode != "Practice")
         {
            _global.BadEnds.push("Burned");
         }
         this.removeMovieClip();
      }
      if(_global.HeroAction == "bounceback")
      {
         if(eval(_root.HeroBounce) == undefined)
         {
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            if(eval(_root.HeroStagger) != undefined)
            {
               removeMovieClip(_root.HeroStagger);
            }
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroBouncebackRazor,"HeroBounce",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroBounceback,"HeroBounce",16384 + _global.heroDepth++);
            }
            with(_root.HeroBounce)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
         }
         _root.Census.perfectRun = false;
      }
      armorTab = eval(_global.RewardTab("Armor"));
      if(armorTab != null && armorTab.charge == 300)
      {
         if(_global.justHit != null)
         {
            armorTab.armorHit();
         }
      }
      if(invincFrames > 0)
      {
         _global.justHit = null;
         invincFrames--;
         if(invincFrames == 1)
         {
            exploded = false;
         }
      }
      if(_global.justHit != null)
      {
         if(HeroAction == "frozen")
         {
            targetEnemy = _global.justHit;
            _global.justHit = null;
            removeMovieClip(_root.HeroOnIce);
            duplicateMovieClip(_root.SwordCold,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            iceNum = int(Math.random() * 6) + 8;
            toKillX = targetEnemy._x - _X;
            toKillY = targetEnemy._y - _Y;
            brokeTo = (- Math.atan2(toKillX,toKillY)) / 0.017453292519943295;
            _global.MakeNoise("HeroIcebreak");
            ice = 1;
            while(ice < iceNum)
            {
               IceName = "_root." + this._name + "Ice" + ice;
               duplicateMovieClip(eval("_root.Ice" + String(random(3) + 1)),this._name + "Ice" + Ice,16384 + _global.effectDepth++);
               setProperty(IceName, _rotation, brokeTo + int(Math.random() * 100) - 59);
               setProperty(IceName, _X, this._x);
               setProperty(IceName, _xscale, 150);
               setProperty(IceName, _Y, this._y);
               setProperty(IceName, _yscale, 150);
               ice++;
            }
            targetEnemy = null;
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Shattered") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Shattered");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,5) == "Oozle" || _global.justHit._name.slice(0,4) == "Gray" && _global.justHit.action == "none" || _global.justHit._name.slice(0,7) == "Amalgam" && _global.justHit._xscale > 70)
         {
            _global.MakeNoise("Glom");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "absorbed";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            duplicateMovieClip(_root.HeroAbsorbed,targetEnemy._name + "Hero",16384 + _global.effectDepth++);
            with(eval("_root." + targetEnemy._name + "Hero"))
            {
               _x = targetEnemy._x;
               _y = targetEnemy._y;
               _rotation = targetEnemy._rotation;
            }
            targetEnemy._xscale = 120;
            targetEnemy._yscale = 120;
            targetEnemy._alpha = 75;
            targetEnemy = null;
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Absorbed") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Absorbed");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,5) == "Biter" && _global.justHit.lunging == true)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "mangled";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Mangled") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Mangled");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,5) == "Sharp" && _global.justHit.spines == true)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "impaled";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            splats = 1;
            while(splats < 4)
            {
               BloodName = "_root." + this._name + "Blood" + splats;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, targetEnemy._rotation + int(Math.random() * 180) - 89);
               setProperty(BloodName, _X, this._x);
               setProperty(BloodName, _Y, this._y);
               splats++;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Impaled") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Impaled");
            }
            removeMovieClip(targetEnemy);
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,7) == "Grinder" && !_global.justHit.wall)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "squashed";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            splats = 1;
            while(splats < 6)
            {
               BloodName = "_root." + this._name + "Blood" + splats;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, targetEnemy._rotation + int(Math.random() * 180) - 89);
               setProperty(BloodName, _X, this._x + int(Math.random() * 30) - 15);
               setProperty(BloodName, _Y, this._y + int(Math.random() * 30) - 15);
               splats++;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Squashed") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Squashed");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,6) == "Fuzzle" && _global.justHit.lunging == true)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "chowed";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Chowed") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Chowed");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,4) == "Gray" && _global.justHit.lancing)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "speared";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Speared") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Speared");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit.slug)
         {
            _global.MakeNoise("Wound");
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "shot";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            deltaE_x = _global.justHit._x - _X;
            deltaE_y = _global.justHit._y - _Y;
            enemyDir = (- Math.atan2(deltaE_x,deltaE_y)) / 0.017453292519943295;
            _root.attachMovie("Lil Guy Shot","HeroTagged",_global.effectDepth++);
            with(_root.HeroTagged)
            {
               _x = this._x;
               _y = this._y;
               _rotation = justHit._rotation;
            }
            duplicateMovieClip(_root.GroundDirt,this._name + "Spray",16384 + _global.effectDepth++);
            with(eval("_root." + this._name + "Spray"))
            {
               _x = this._x;
               _y = this._y;
               _rotation = enemyDir + int(Math.random() * 40) - 160;
            }
            BloodColor = new Color(eval("_root." + this._name + "Spray"));
            BloodColor.setRGB(11800592);
            _global.justHit = null;
            _global.HeroKilled = true;
            this.removeMovieClip();
         }
         else if(_global.justHit.exploded && Math.sqrt(Math.pow(_X - justHit._x,2) + Math.pow(_Y - justHit._y,2)) < 150)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "gibbed";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            toBlastX = _X - targetEnemy._x;
            toBlastY = _Y - targetEnemy._y;
            blastDir = (- Math.atan2(toBlastX,toBlastY)) / 0.017453292519943295;
            blastDir -= 180;
            gibsNum = int(Math.random() * 5) + 6;
            gibs = 1;
            while(gibs < gibsNum)
            {
               GibName = "_root." + this._name + "Gib" + gibs;
               duplicateMovieClip(eval("_root.Gib" + String(random(3) + 1)),this._name + "Gib" + gibs,16384 + _global.effectDepth++);
               setProperty(GibName, _rotation, blastDir + (int(Math.random() * 20) - 40));
               setProperty(GibName, _X, this._x);
               setProperty(GibName, _Y, this._y);
               gibs++;
            }
            splats = 1;
            while(splats < 4)
            {
               BloodName = "_root." + this._name + "Blood" + splats;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, blastDir + int(Math.random() * 40) - 20);
               setProperty(BloodName, _X, this._x);
               setProperty(BloodName, _Y, this._y);
               setProperty(BloodName, _xscale, 50);
               setProperty(BloodName, _yscale, 50);
               splats++;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Gibbed") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Gibbed");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,4) == "Void" && _global.justHit.action == "shoot")
         {
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "disintigrated";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Disintigrated") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Disintigrated");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit.hook || _global.justHit.spike)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "hooked";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            deltaE_x = _X - targetEnemy._x;
            deltaE_y = _Y - targetEnemy._y;
            enemyDir = (- Math.atan2(deltaE_x,deltaE_y)) / 0.017453292519943295;
            b = 1;
            while(b < 4)
            {
               BloodName = "_root." + this._name + "Blood" + b;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + b,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, enemyDir + 180 + int(Math.random() * 40) - 20);
               setProperty(BloodName, _X, this._x);
               setProperty(BloodName, _xscale, 40);
               setProperty(BloodName, _Y, this._y);
               setProperty(BloodName, _yscale, 40);
               b++;
            }
            if(targetEnemy.hook)
            {
               duplicateMovieClip(_root.HeroHooked,"HeroTagged",16384 + _global.effectDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroSpiked,"HeroTagged",16384 + _global.effectDepth++);
            }
            with(_root.HeroTagged)
            {
               _x = this._x;
               _y = this._y;
               _rotation = enemyDir;
               if(targetEnemy.spike)
               {
                  _rotation += 180;
               }
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Hooked") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Hooked");
            }
            removeMovieClip(targetEnemy);
            this.removeMovieClip();
         }
         else if(_global.justHit.quill)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "stapled";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Stapled") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Stapled");
            }
            removeMovieClip(targetEnemy);
            this.removeMovieClip();
         }
         else if(_global.justHit.mite)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "split";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            x = 1;
            while(x < 3)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Spray" + x))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation + int(Math.random() * 40) - 179;
               }
               BloodColor = new Color(eval("_root." + this._name + "Spray" + x));
               BloodColor.setRGB(11800592);
               x++;
            }
            x = 1;
            while(x < 3)
            {
               duplicateMovieClip(_root.HeroHalf,this._name + "BodyHalf" + x,16384 + _global.heroDepth++);
               with(eval("_root." + _name + "BodyHalf" + x))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = this._rotation;
               }
               x++;
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Split") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Split");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit.hedgehog == "Crush")
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "piked";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            b = 1;
            while(b < 4)
            {
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + b,16384 + _global.effectDepth++);
               BloodName = eval("_root." + this._name + "Blood" + b);
               with(BloodName)
               {
                  _rotation = int(Math.random() * 360) - 179;
                  _x = this._x;
                  _y = this._y;
               }
               b++;
            }
            x = 1;
            while(x < 4)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + x,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Spray" + x))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = int(Math.random() * 360) - 179;
               }
               BloodColor = new Color(eval("_root." + this._name + "Spray" + x));
               BloodColor.setRGB(11800592);
               x++;
            }
            duplicateMovieClip(_root.HeroMangled,this._name + "Body",16384 + _global.heroDepth++);
            with(eval("_root." + _name + "Body"))
            {
               _x = targetEnemy._x;
               _y = targetEnemy._y;
               _rotation = this._rotation;
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Piked") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Piked");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit.hedgehog == "Ground")
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "piked";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Piked") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Piked");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit.disk || _global.justHit.claw)
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "sliced";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            deltaE_x = _X - targetEnemy._x;
            deltaE_y = _Y - targetEnemy._y;
            enemyDir = (- Math.atan2(deltaE_x,deltaE_y)) / 0.017453292519943295;
            b = 1;
            while(b < 3)
            {
               BloodName = "_root." + this._name + "Blood" + b;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + b,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, enemyDir + 180 + int(Math.random() * 40) - 20);
               setProperty(BloodName, _X, this._x);
               setProperty(BloodName, _Y, this._y);
               b++;
            }
            if(int(Math.random() * 2) == 1)
            {
               duplicateMovieClip(_root.HeroBisect,"HeroBisected",16384 + _global.effectDepth++);
               with(_root.HeroBisected)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = enemyDir;
               }
               duplicateMovieClip(_root.HeroTorso,"MyTorso",16384 + _global.effectDepth++);
               with(_root.MyTorso)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = enemyDir + (int(Math.random() * 120) - 60);
               }
            }
            else
            {
               duplicateMovieClip(_root.HeroDecapitate,"HeroDecapitated",16384 + _global.effectDepth++);
               with(_root.HeroDecapitated)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = enemyDir;
               }
               duplicateMovieClip(_root.HeroHead,"MyHead",16384 + _global.effectDepth++);
               with(_root.MyHead)
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = enemyDir + (int(Math.random() * 120) - 60);
               }
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Sliced") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Sliced");
            }
            this.removeMovieClip();
         }
         else if(_global.justHit._name.slice(0,6) == "Horror" && _global.justHit.action != "collect")
         {
            _global.MakeNoise("Wound");
            targetEnemy = _global.justHit;
            _global.justHit = null;
            if(_global.HeroAction == "staggered")
            {
               removeMovieClip(_root.HeroStagger);
            }
            _global.HeroAction = "splattered";
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
            if(eval(_root.HeroSlashin) != undefined)
            {
               removeMovieClip(_root.HeroSlashin);
            }
            duplicateMovieClip(_root.Sword,"mySword",16384 + _global.backgroundDepth++);
            with(_root.mySword)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            deltaE_x = _X - targetEnemy._x;
            deltaE_y = _Y - targetEnemy._y;
            enemyRotation = (- Math.atan2(deltaE_x,deltaE_y)) / 0.017453292519943295;
            splats = 1;
            while(splats < 6)
            {
               BloodName = "_root." + this._name + "Blood" + splats;
               duplicateMovieClip(eval("_root.Blood" + String(random(3) + 1)),this._name + "Blood" + splats,16384 + _global.effectDepth++);
               setProperty(BloodName, _rotation, enemyRotation + 180 + int(Math.random() * 180) - 89);
               setProperty(BloodName, _X, this._x + int(Math.random() * 30) - 15);
               setProperty(BloodName, _Y, this._y + int(Math.random() * 30) - 15);
               splats++;
            }
            splats = 1;
            while(splats < 4)
            {
               duplicateMovieClip(_root.GroundDirt,this._name + "Spray" + splats,16384 + _global.effectDepth++);
               with(eval("_root." + this._name + "Spray" + splats))
               {
                  _x = this._x;
                  _y = this._y;
                  _rotation = enemyRotation + 180 + int(Math.random() * 180) - 89;
               }
               BloodColor = new Color(eval("_root." + this._name + "Spray" + splats));
               BloodColor.setRGB(11800592);
               splats++;
            }
            gibsNum = int(Math.random() * 6) + 8;
            gibs = 1;
            while(gibs < gibsNum)
            {
               GibName = "_root." + this._name + "Gib" + gibs;
               duplicateMovieClip(eval("_root.Gib" + String(random(3) + 1)),this._name + "Gib" + gibs,16384 + _global.effectDepth++);
               setProperty(GibName, _rotation, enemyRotation + 180 + int(Math.random() * 180) - 89);
               setProperty(GibName, _X, this._x);
               setProperty(GibName, _Y, this._y);
               gibs++;
            }
            _global.HeroKilled = true;
            if(_global.SearchArray(_global.BadEnds,"Splattered") == null && _global.gameMode != "Practice")
            {
               _global.BadEnds.push("Splattered");
            }
            this.removeMovieClip();
         }
         else if(_global.HeroAction != "flamed")
         {
            targetEnemy = _global.justHit;
            if(_global.justHit.exploded)
            {
               _global.GainAward("Survive Explosion");
            }
            _global.justHit = null;
            deltaE_x = _X - targetEnemy._x;
            deltaE_y = _Y - targetEnemy._y;
            enemyRotation = (- Math.atan2(deltaE_x,deltaE_y)) / 0.017453292519943295;
            degreesToEnemy = enemyRotation - _rotation;
            if(degreesToEnemy < 0)
            {
               degreesToEnemy += 360;
            }
            StaggerLink = "_root.HeroStagger";
            if(_global.HeroAction != "staggered")
            {
               if(eval(_root.HeroWalkin) != undefined)
               {
                  removeMovieClip(_root.HeroWalkin);
               }
               if(eval(_root.HeroSlashin) != undefined)
               {
                  removeMovieClip(_root.HeroSlashin);
               }
               if(degreesToEnemy < 46)
               {
                  StaggerLink += "Down";
               }
               else if(degreesToEnemy < 136)
               {
                  StaggerLink += "Left";
               }
               else if(degreesToEnemy < 226)
               {
                  StaggerLink += "Up";
               }
               else if(degreesToEnemy < 316)
               {
                  StaggerLink += "Right";
               }
               else
               {
                  StaggerLink += "Down";
               }
               if(_global.RazorGlaiveEquipped)
               {
                  StaggerLink += "Razor";
               }
               duplicateMovieClip(eval(StaggerLink),"HeroStagger",16384 + _global.heroDepth++);
               setProperty(_root.HeroStagger, _X, this._x);
               setProperty(_root.HeroStagger, _Y, this._y);
               setProperty(_root.HeroStagger, _rotation, this._rotation);
               _global.MakeNoise("Oomph");
               if(armorTab != null && armorTab.charge == 300)
               {
                  _global.MakeNoise("Armor Bump");
               }
               if(_global.gameMode != "Practice")
               {
                  _global.PlayerBumps = _global.PlayerBumps + 1;
                  if(_global.PlayerBumps >= 30)
                  {
                     _global.GainAward("30 Bumps");
                  }
               }
            }
            _root.Census.perfectRun = false;
            _global.HeroAction = "staggered";
         }
      }
      if(_global.HeroAction == "none")
      {
         if(eval(_root.HeroWalkin) == undefined)
         {
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroWalkRazor,"HeroWalkin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroWalk,"HeroWalkin",16384 + _global.heroDepth++);
            }
            with(_root.HeroWalkin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
         }
         gotoSpotX = _root._xmouse;
         gotoSpotY = _root._ymouse;
         delta_x = _X - gotoSpotX;
         delta_y = _Y - gotoSpotY;
         targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         if(turnMode)
         {
            _rotation = targetRotation;
         }
         speed = topSpeed;
         speed -= clutters.length;
         if(_root.HeroPointerGoo != undefined)
         {
            if(_root.HeroPointerGoo._currentframe >= 12 && _root.HeroPointerGoo._currentframe <= 55)
            {
               speed /= 2;
            }
         }
         if(speed < 0)
         {
            speed = 0;
         }
         if(_root.HeroPointerSlickTag != undefined)
         {
            speed = 3;
         }
         sprintTab = eval(_global.RewardTab("Sprint"));
         if(_global.RewardKey("Sprint") != null && Key.isDown(_global.RewardKey("Sprint")) && Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed * 1.5 && sprintTab.charge >= 4)
         {
            _root.HeroWalkin.play();
            didMove = false;
            ProjPosY = _Y - speed * 1.5 * Math.cos(_rotation * 0.017453292519943295);
            if(ProjPosY > 0 && ProjPosY < 400)
            {
               _Y = ProjPosY;
               didMove = true;
            }
            else if(ProjPosY <= 0)
            {
               _Y = 1;
            }
            else
            {
               _Y = 399;
            }
            ProjPosX = _X + speed * 1.5 * Math.sin(_rotation * 0.017453292519943295);
            if(ProjPosX > 0 && ProjPosX < 550)
            {
               _X = ProjPosX;
               didMove = true;
            }
            else if(ProjPosX <= 0)
            {
               _X = 1;
            }
            else
            {
               _X = 549;
            }
            if(didMove)
            {
               printName = "Footprint" + _global.effectDepth;
               if(int(_global.framesElapsed / 10) == _global.framesElapsed / 10)
               {
                  _root.attachMovie("Sprint Footprint",printName,_global.effectDepth++);
                  with(eval("_root." + printName))
                  {
                     _x = this._x;
                     _y = this._y;
                     _rotation = this._rotation;
                     gotoAndStop(1);
                  }
               }
               else if(int(_global.framesElapsed / 5) == _global.framesElapsed / 5)
               {
                  _root.attachMovie("Sprint Footprint",printName,_global.effectDepth++);
                  with(eval("_root." + printName))
                  {
                     _x = this._x;
                     _y = this._y;
                     _rotation = this._rotation;
                     gotoAndStop(2);
                  }
               }
               sprintTab.charge -= 4;
            }
         }
         else if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed)
         {
            _root.HeroWalkin.play();
            ProjPosY = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            if(ProjPosY > 0 && ProjPosY < 400)
            {
               _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            }
            else if(ProjPosY <= 0)
            {
               _Y = 1;
            }
            else
            {
               _Y = 399;
            }
            ProjPosX = _X + speed * Math.sin(_rotation * 0.017453292519943295);
            if(ProjPosX > 0 && ProjPosX < 550)
            {
               _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
            }
            else if(ProjPosX <= 0)
            {
               _X = 1;
            }
            else
            {
               _X = 549;
            }
         }
         else
         {
            _root.HeroWalkin.stop();
            if(_global.RewardKey("Sprint") != null)
            {
               if(sprintTab.charge < 300)
               {
                  sprintTab.charge += 2;
                  puffName = "Puff" + _global.effectDepth;
                  if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
                  {
                     _root.attachMovie("Sprint Puff",puffName,_global.effectDepth++);
                     with(eval("_root." + puffName))
                     {
                        _x = this._x;
                        _y = this._y;
                        _rotation = this._rotation;
                     }
                  }
               }
            }
         }
         with(_root.HeroWalkin)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      else if(_global.HeroAction == "attacking")
      {
         passiveTime = 0;
         if(_root.HeroSlashin._currentframe == _root.HeroSlashin._totalframes)
         {
            removeMovieClip(_root.HeroSlashin);
            _global.HeroAction = "none";
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroWalkRazor,"HeroWalkin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroWalk,"HeroWalkin",16384 + _global.heroDepth++);
            }
            with(_root.HeroWalkin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            if(killsOnSwing > 1)
            {
               CP = String(random(100));
               duplicateMovieClip(_root.Bounty,_name + "Multi" + CP,16384 + _global.markDepth++);
               setProperty("_root." + _name + "Multi" + CP, _X, this._x);
               setProperty("_root." + _name + "Multi" + CP, _Y, this._y);
               BountyObject = eval("_root." + _name + "Multi" + CP);
               BountyObject.bounty = "x" + String(killsOnSwing);
               if(killsOnSwing > _global.BestCombo)
               {
                  _global.BestCombo = killsOnSwing;
               }
               pointsOnSwing *= killsOnSwing;
               if(pointsOnSwing >= 300)
               {
                  _global.GainAward("300pt Swing");
               }
               if(pointsOnSwing >= 200)
               {
                  _global.GainAward("200pt Swing");
               }
               if(pointsOnSwing >= 150)
               {
                  _global.GainAward("150pt Swing");
               }
               if(pointsOnSwing >= 100)
               {
                  _global.GainAward("100pt Swing");
               }
               if(pointsOnSwing >= 75)
               {
                  _global.GainAward("75pt Swing");
               }
               if(pointsOnSwing >= 50)
               {
                  _global.GainAward("50pt Swing");
               }
               if(pointsOnSwing >= 20)
               {
                  _global.GainAward("20pt Swing");
               }
            }
            if(killsOnSwing > 0)
            {
               if(pointsOnSwing > _global.BestSwing)
               {
                  _global.BestSwing = pointsOnSwing;
               }
               _global.Score += pointsOnSwing;
               if(killsOnSwing == 1)
               {
                  consecCombo = 0;
               }
               else
               {
                  consecCombo++;
               }
               if(consecCombo >= 10)
               {
                  _global.GainAward("10 Straight Combos");
               }
            }
            else
            {
               consecCombo = 0;
            }
            killsOnSwing = 0;
            pointsOnSwing = 0;
            _root.Census.CheckColors();
         }
      }
      else if(_global.HeroAction == "staggered")
      {
         if(_root.HeroStagger._currentframe == 40)
         {
            removeMovieClip(_root.HeroStagger);
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroWalkRazor,"HeroWalkin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroWalk,"HeroWalkin",16384 + _global.heroDepth++);
            }
            with(_root.HeroWalkin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroAction = "none";
         }
      }
      else if(_global.HeroAction == "bounceback")
      {
         if(_root.HeroBounce._currentframe == 30)
         {
            removeMovieClip(_root.HeroBounce);
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroWalkRazor,"HeroWalkin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroWalk,"HeroWalkin",16384 + _global.heroDepth++);
            }
            with(_root.HeroWalkin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroAction = "none";
         }
      }
      else if(_global.HeroAction == "flamed")
      {
         delta_x = _X - gotoSpotX;
         delta_y = _Y - gotoSpotY;
         targetRotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
         if(turnMode)
         {
            _rotation = targetRotation;
         }
         if(Math.sqrt(delta_x * delta_x + delta_y * delta_y) > speed)
         {
            ProjPosY = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            if(ProjPosY > 0 && ProjPosY < 400)
            {
               _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
            }
            else if(ProjPosY <= 0)
            {
               _Y = 1;
            }
            else
            {
               _Y = 399;
            }
            ProjPosX = _X + speed * Math.sin(_rotation * 0.017453292519943295);
            if(ProjPosX > 0 && ProjPosX < 550)
            {
               _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
            }
            else if(ProjPosX <= 0)
            {
               _X = 1;
            }
            else
            {
               _X = 549;
            }
         }
         else
         {
            gotoSpotX = _root._xmouse + (int(Math.random() * 100) - 50);
            gotoSpotY = _root._ymouse + (int(Math.random() * 100) - 50);
         }
      }
      else if(_global.HeroAction == "frozen")
      {
         if(frozenFrames > 0)
         {
            if(wiggleTo == "up" && _root._ymouse < _Y - 5)
            {
               _Y = _Y - 4;
               frozenFrames -= 5;
               wiggleTo = "down";
            }
            else if(wiggleTo == "down" && _root._ymouse > _Y + 5)
            {
               _Y = _Y + 4;
               frozenFrames -= 5;
               wiggleTo = "up";
            }
            frozenFrames--;
         }
         else
         {
            iceNum = int(Math.random() * 6) + 8;
            ice = 1;
            while(ice < iceNum)
            {
               Spread = int(Math.random() * 100);
               IceName = "_root." + this._name + "Ice" + ice + Spread;
               duplicateMovieClip(eval("_root.Ice" + String(random(3) + 1)),this._name + "Ice" + ice + Spread,16384 + _global.effectDepth++);
               setProperty(IceName, _rotation, int(Math.random() * 360) - 179);
               setProperty(IceName, _X, this._x);
               setProperty(IceName, _Y, this._y);
               ice++;
            }
            _global.MakeNoise("Icebreak" + (int(Math.random() * 3) + 1));
            removeMovieClip(_root.HeroOnIce);
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroWalkRazor,"HeroWalkin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroWalk,"HeroWalkin",16384 + _global.heroDepth++);
            }
            with(_root.HeroWalkin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.HeroAction = "none";
            _global.GainAward("Survive Ice");
         }
      }
      if(eval(_root.HeroWalkin) != undefined)
      {
         with(_root.HeroWalkin)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      if(eval(_root.HeroSlashin) != undefined)
      {
         with(_root.HeroSlashin)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      with(_root.HeroSwing)
      {
         _x = this._x;
         _y = this._y;
         _rotation = this._rotation;
      }
      if(_global.HeroAction == "staggered")
      {
         with(_root.HeroStagger)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      if(_global.HeroAction == "bounceback")
      {
         with(_root.HeroBounce)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      if(_global.HeroAction == "frozen")
      {
         with(_root.HeroOnIce)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
      }
      _global.heroWasX = _X;
      _global.heroWasY = _Y;
   }
}

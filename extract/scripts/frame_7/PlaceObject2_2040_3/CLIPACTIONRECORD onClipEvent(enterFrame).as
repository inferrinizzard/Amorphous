onClipEvent(enterFrame){
   if(!_global.pause)
   {
      _global.GameTime = int(_global.framesElapsed / 30);
      if(!HeroKilled)
      {
         _global.framesElapsed = _global.framesElapsed + 1;
         if(_global.gameMode == "Bounty")
         {
            if(GameTime >= 60)
            {
               _global.GainAward("Survive 1 min");
            }
            if(GameTime >= 120)
            {
               _global.GainAward("Survive 2 min");
            }
            if(GameTime >= 180)
            {
               _global.GainAward("Survive 3 min");
            }
            if(GameTime >= 240)
            {
               _global.GainAward("Survive 4 min");
            }
            if(GameTime >= 300)
            {
               _global.GainAward("Survive 5 min");
            }
            if(GameTime >= 420)
            {
               _global.GainAward("Survive 7 min");
            }
            if(GameTime >= 600)
            {
               _global.GainAward("Survive 10 min");
            }
         }
         if(int(_global.framesElapsed / 30) == _global.framesElapsed / 30)
         {
            _global.PlayTime = _global.PlayTime + 1;
            MinutesPlayed = _global.Playtime / 60;
            if(MinutesPlayed >= 5)
            {
               _global.GainAward("5 min Playtime");
            }
            if(MinutesPlayed >= 10)
            {
               _global.GainAward("10 min Playtime");
            }
            if(MinutesPlayed >= 20)
            {
               _global.GainAward("20 min Playtime");
            }
            if(MinutesPlayed >= 30)
            {
               _global.GainAward("30 min Playtime");
            }
            if(MinutesPlayed >= 45)
            {
               _global.GainAward("45 min Playtime");
            }
            if(MinutesPlayed >= 60)
            {
               _global.GainAward("60 min Playtime");
            }
            if(MinutesPlayed >= 90)
            {
               _global.GainAward("90 min Playtime");
            }
            if(_root.HeroPointerGoo != undefined && _global.gameMode != "Practice")
            {
               _global.PlayerGooTime = _global.PlayerGooTime + 1;
               if(_global.PlayerGooTime >= 60)
               {
                  _global.GainAward("Stuck 1 Minute");
               }
            }
            if(_global.gameMode == "Practice")
            {
               _global.PracticeSeconds = _global.PracticeSeconds + 1;
               if(_global.PracticeSeconds >= 600)
               {
                  _global.GainAward("Practice 10 min");
               }
            }
         }
      }
      bottomLine = 0;
      if(eval(_root.GrinderWall) != undefined)
      {
         bottomLine++;
      }
      if(eval(_root.myBoxGun) != undefined)
      {
         bottomLine++;
      }
      if(eval(_root.myDrone) != undefined)
      {
         bottomLine++;
      }
      x = 1;
      while(x <= _global.activeEnemies.length)
      {
         if(HeroKilled)
         {
            break;
         }
         spawnType = _global.activeEnemies[x - 1];
         switch(spawnType)
         {
            case "Gloople":
               spawnRate = 40;
               break;
            case "Oozle":
               spawnRate = 5;
               break;
            case "Stickie":
               spawnRate = 6;
               break;
            case "Biter":
               spawnRate = 5;
               break;
            case "Meltie":
               spawnRate = 4;
               break;
            case "Sharp":
               spawnRate = 2;
               break;
            case "Clutter":
               spawnRate = 3;
               break;
            case "Inkie":
               spawnRate = 4;
               break;
            case "Grinder":
               spawnRate = 2;
               break;
            case "Gray":
               spawnRate = 0;
               break;
            case "Fuzzle":
               spawnRate = 3;
               break;
            case "Torchie":
               spawnRate = 2;
               break;
            case "Frostie":
               spawnRate = 2;
               break;
            case "Amalgam":
               spawnRate = 0;
               break;
            case "Queen":
               spawnRate = 0;
               break;
            case "Horror":
               spawnRate = 0;
               break;
            case "VoidEater":
               spawnRate = 0;
               break;
            case "RazorQueen":
               spawnRate = 0;
         }
         if(_global.gameMode == "Practice")
         {
            if(_global.PracticeEnemies.length < 8 && spawnRate < 3 && spawnRate != 0)
            {
               spawnRate = 3;
            }
            if(_global.PracticeEnemies.length < 5 && spawnRate < 5 && spawnRate != 0)
            {
               spawnRate = 5;
            }
            if(_global.PracticeEnemies.length < 3 && spawnRate < 7 && spawnRate != 0)
            {
               spawnRate = 7;
            }
            if(_global.PracticeEnemies.length == 1 && spawnRate < 10 && spawnRate != 0)
            {
               spawnRate = 10;
            }
         }
         if(_root.myChoker.jamming)
         {
            if(spawnRate > 0)
            {
               spawnRate = int(spawnRate / 2);
            }
            if(spawnRate == 0 && int(Math.random() * 2) == 1)
            {
               _global.activeEnemies.splice(SearchArray(_global.activeEnemies,spawnType),1);
               noBossTime = 0;
               break;
            }
         }
         if(int(Math.random() * 1000) + 1 < spawnRate && _global.Enemies.length < _global.spawnLimit + bottomLine || spawnRate == 0 || _global.gameMode == "Practice" && Enemies.length == bottomLine && int(Math.random() * 10) == 1)
         {
            if(_global.gameMode == "Single")
            {
               if(_global.Enemies.length >= _global.KillsLeft + bottomLine || _global.ClearTime != 0)
               {
                  break;
               }
            }
            if(_global.gameMode != "Practice")
            {
               RazorQueenisOut = false;
               x = 0;
               while(x < _global.Enemies.length)
               {
                  if(_global.Enemies[x].slice(0,5) == "Razor")
                  {
                     RazorQueenisOut = true;
                  }
                  x++;
               }
               if(RazorQueenisOut)
               {
                  break;
               }
            }
            GloopleName = "_root." + spawnType + String(ChildCounter);
            duplicateMovieClip(eval("_root." + spawnType),spawnType + String(ChildCounter),16384 + _global.baddieDepth++);
            switchVar = int(Math.random() * 4) + 1;
            switch(switchVar)
            {
               case 1:
               default:
                  setProperty(GloopleName, _X, - 5);
                  setProperty(GloopleName, _Y, int(Math.random() * 399) + 1);
                  if(spawnRate == 0 || spawnType == "Oozle")
                  {
                     setProperty(GloopleName, _rotation, 90);
                  }
                  break;
               case 2:
                  setProperty(GloopleName, _X, 555);
                  setProperty(GloopleName, _Y, int(Math.random() * 399) + 1);
                  if(spawnRate == 0 || spawnType == "Oozle")
                  {
                     setProperty(GloopleName, _rotation, - 90);
                  }
                  break;
               case 3:
                  setProperty(GloopleName, _Y, - 5);
                  setProperty(GloopleName, _X, int(Math.random() * 549) + 1);
                  if(spawnRate == 0 || spawnType == "Oozle")
                  {
                     setProperty(GloopleName, _rotation, 180);
                  }
                  break;
               case 4:
                  setProperty(GloopleName, _Y, 405);
                  setProperty(GloopleName, _X, int(Math.random() * 549) + 1);
                  if(spawnRate == 0 || spawnType == "Oozle")
                  {
                     setProperty(GloopleName, _rotation, 0);
                  }
            }
            _global.Enemies.push(spawnType + String(ChildCounter));
            if(SearchArray(EnemiesSeen,spawnType) == null)
            {
               EnemiesSeen.push(spawnType);
            }
            ChildCounter++;
            if(spawnRate == 0)
            {
               _global.activeEnemies.splice(SearchArray(_global.activeEnemies,spawnType),1);
            }
         }
         x++;
      }
      if(_global.backgroundDepth > 980)
      {
         _global.backgroundDepth = 50;
      }
      if(_global.markDepth > 1980)
      {
         _global.markDepth = 1000;
      }
      if(_global.effectDepth > 2980)
      {
         _global.effectDepth = 2000;
      }
      if(_global.baddieDepth > 3980)
      {
         _global.baddieDepth = 3000;
      }
      if(_global.heroDepth > 4980)
      {
         _global.heroDepth = 4000;
      }
      if(_global.capDepth > 5980)
      {
         _global.capDepth = 5000;
      }
      noBoss = true;
      x = 0;
      while(x < _global.Enemies.length)
      {
         if(Enemies[x].slice(0,5) == "Queen" || Enemies[x].slice(0,5) == "Amalg")
         {
            noBoss = false;
         }
         x++;
      }
      if(noBoss)
      {
         noBossTime++;
      }
      else
      {
         noBossTime = 0;
      }
      if(noBossTime >= 300)
      {
         QueenRevive = false;
         _global.BossOnDeck = false;
      }
   }
}

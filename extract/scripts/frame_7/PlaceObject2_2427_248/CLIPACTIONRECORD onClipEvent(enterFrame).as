onClipEvent(enterFrame){
   if(_global.RazorGlaiveUnlocked && SwordUnlockStatus == 0)
   {
      SwordUnlockStatus = 1;
   }
   if(!_global.pause)
   {
      switch(_global.gameMode)
      {
         case "Bounty":
            if(GameTime > interval * GlooplesInGame && GlooplesInGame < _global.EnemySet.length)
            {
               _global.activeEnemies.push(_global.EnemySet[GlooplesInGame]);
               GlooplesInGame++;
            }
            if(GlooplesInGame > _global.EnemySet.length / 2 && (GameTime > 60 || !_global.HardcoreMode))
            {
               if(int(framesElapsed / frameInterval) == framesElapsed / frameInterval && !_global.BossOnDeck && int(Math.random() * 15) == 1)
               {
                  _global.activeEnemies.push("Amalgam");
                  _global.BossOnDeck = true;
               }
            }
            if(GlooplesInGame == _global.EnemySet.length && (GameTime > 120 || !_global.HardcoreMode))
            {
               if(int(framesElapsed / (frameInterval * 2)) == framesElapsed / (frameInterval * 2) && !_global.BossOnDeck && int(Math.random() * 5) == 1)
               {
                  if(_global.EnemiesSeen.length >= 17 && int(Math.random() * 100) + 1 <= 40)
                  {
                     _global.activeEnemies.push("RazorQueen");
                  }
                  else
                  {
                     _global.activeEnemies.push("Queen");
                  }
                  _global.BossOnDeck = true;
               }
            }
            break;
         case "Single":
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
            if(GameTime > 30 * GlooplesInGame && GlooplesInGame < _global.EnemySet.length)
            {
               _global.activeEnemies.push(_global.EnemySet[GlooplesInGame]);
               GlooplesInGame++;
            }
            if(KillsLeft < NestSize / 2)
            {
               if(int(framesElapsed / frameInterval) == framesElapsed / frameInterval && !_global.BossOnDeck && int(Math.random() * 15) == 1)
               {
                  _global.activeEnemies.push("Amalgam");
                  _global.BossOnDeck = true;
               }
            }
            if(KillsLeft <= NestSize / 10)
            {
               if(framesElapsed / 30 == GameTime + 1 && !foundQueen && int(Math.random() * 400) < interval / 10 && !_global.BossOnDeck)
               {
                  if(_global.EnemiesSeen.length >= 17 && int(Math.random() * 100) + 1 <= 40)
                  {
                     _global.activeEnemies.push("RazorQueen");
                  }
                  else
                  {
                     _global.activeEnemies.push("Queen");
                  }
                  _global.BossOnDeck = true;
                  foundQueen = true;
               }
            }
            if(KillsLeft == 0 && (_global.Enemies.length - bottomLine == 0 || ClearTime > 0))
            {
               if(ClearTime == 0)
               {
                  _root.attachMovie("Clear Message","AllClear",7001);
                  with(_root.AllClear)
                  {
                     _x = 270;
                     _y = 180;
                     _alpha = 0;
                  }
                  _global.MakeNoise("Victory!");
                  if(_root.HeroPointer.clutters.length >= 1)
                  {
                     _global.GainAward("Clutter at Finish");
                  }
                  if(_global.HardcoreMode)
                  {
                     switch(_global.interval)
                     {
                        case 15:
                           _global.NestClears[3] = _global.NestClears[3] + 1;
                           break;
                        case 30:
                           _global.NestClears[4] = _global.NestClears[4] + 1;
                           break;
                        case 60:
                           _global.NestClears[5] = _global.NestClears[5] + 1;
                     }
                  }
                  else
                  {
                     switch(_global.interval)
                     {
                        case 15:
                           _global.NestClears[0] = _global.NestClears[0] + 1;
                           break;
                        case 30:
                           _global.NestClears[1] = _global.NestClears[1] + 1;
                           break;
                        case 60:
                           _global.NestClears[2] = _global.NestClears[2] + 1;
                     }
                  }
               }
               else if(ClearTime == 60)
               {
                  clearBonus = interval * 20;
                  _global.Score += clearBonus;
                  CP = String(random(300));
                  duplicateMovieClip(_root.Bounty,_name + "Plus" + CP,16384 + _global.markDepth++);
                  setProperty("_root." + _name + "Plus" + CP, _X, _root.ScoreDisplay._x - 20);
                  setProperty("_root." + _name + "Plus" + CP, _Y, _root.ScoreDisplay._y);
                  BountyObject = eval("_root." + _name + "Plus" + CP);
                  BountyObject.bounty = "+" + String(clearBonus);
                  _root.attachMovie("Nest Clear Bonus","BonusPoints",7002);
                  with(_root.BonusPoints)
                  {
                     _x = 270;
                     _y = 100;
                  }
                  _global.MakeNoise("Kaching");
                  switch(_global.interval)
                  {
                     case 15:
                        _global.GainAward("Clear Short Nest");
                        break;
                     case 30:
                        _global.GainAward("Clear Normal Nest");
                        break;
                     case 60:
                        _global.GainAward("Clear Long Nest");
                  }
               }
               else if(ClearTime == 130)
               {
                  if(_global.Score > _global.SingleNestHighScore)
                  {
                     _global.SingleNestHighScore = _global.Score;
                     _root.attachMovie("New High Score!","NewHigh",7005);
                     with(_root.NewHigh)
                     {
                        _x = 270;
                        _y = 280;
                     }
                  }
                  if(_global.HardcoreMode)
                  {
                     _root.kongregateScores.setMode("HardcoreNest");
                     _root.kongregateScores.submit(_global.Score);
                  }
                  else
                  {
                     _root.kongregateScores.setMode("NormalNest");
                     _root.kongregateScores.submit(_global.Score);
                  }
               }
               else if(ClearTime == 160)
               {
                  _root.attachMovie("Click to Exit","ClickExit",7007);
                  with(_root.ClickExit)
                  {
                     _x = 270;
                     _y = 380;
                  }
               }
               else if(ClearTime > 160)
               {
                  if(UserClicked)
                  {
                     _global.unbuildTo = "Menu";
                  }
                  if(ExitBlink)
                  {
                     if(_root.ClickExit._alpha > 0)
                     {
                        _root.ClickExit._alpha -= 2;
                     }
                     else
                     {
                        ExitBlink = false;
                     }
                  }
                  else if(_root.ClickExit._alpha < 100)
                  {
                     _root.ClickExit._alpha += 2;
                  }
                  else
                  {
                     ExitBlink = true;
                  }
               }
               if(_root.AllClear._alpha < 100)
               {
                  _root.AllClear._alpha += 5;
                  _root.NestCount._alpha -= 5;
               }
               _global.ClearTime = _global.ClearTime + 1;
            }
            break;
         case "Practice":
            if(!SetPracticeFoes)
            {
               x = 1;
               while(x <= _global.PracticeEnemies.length)
               {
                  _global.activeEnemies.push(_global.PracticeEnemies[x - 1]);
                  x++;
               }
               SetPracticeFoes = true;
               _global.BossOnDeck = true;
            }
            else if(framesElapsed / 150 == int(framesElapsed / 150))
            {
               x = 1;
               while(x <= _global.PracticeEnemies.length)
               {
                  switch(PracticeEnemies[x - 1])
                  {
                     case "RazorQueen":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,5) == "Razor")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           _global.activeEnemies.push("RazorQueen");
                        }
                        break;
                     case "Queen":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,5) == "Queen")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           if(!BossOnDeck)
                           {
                              _global.activeEnemies.push("Queen");
                              _global.BossOnDeck = true;
                           }
                        }
                        break;
                     case "VoidEater":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,4) == "Void")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           _global.activeEnemies.push("VoidEater");
                        }
                        break;
                     case "Amalgam":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,7) == "Amalgam")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           _global.activeEnemies.push("Amalgam");
                        }
                        break;
                     case "Horror":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,6) == "Horror")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           _global.activeEnemies.push("Horror");
                        }
                        break;
                     case "Gray":
                        remake = true;
                        y = 0;
                        while(y < Enemies.length)
                        {
                           if(Enemies[y].slice(0,4) == "Gray")
                           {
                              remake = false;
                           }
                           y++;
                        }
                        if(remake)
                        {
                           _global.activeEnemies.push("Gray");
                        }
                  }
                  x++;
               }
            }
            if(ExitBlink)
            {
               if(_root.ExitSign._alpha > 0)
               {
                  _root.ExitSign._alpha -= 2;
               }
               else
               {
                  ExitBlink = false;
               }
            }
            else if(_root.ExitSign._alpha < 100)
            {
               _root.ExitSign._alpha += 2;
            }
            else
            {
               ExitBlink = true;
            }
      }
      pauseTime = 0;
   }
   else
   {
      pauseTime++;
      if(pauseTime >= 3600)
      {
         _global.GainAward("2 minute Pause");
      }
   }
   if(HeroKilled)
   {
      _global.pause = false;
      if(deadFor == null)
      {
         deadFor = 100;
      }
      if(deadFor == 90 && _global.gameMode != "Practice")
      {
         _global.Deaths = _global.Deaths + 1;
         if(_global.Deaths >= 10)
         {
            _global.GainAward("10 Deaths");
         }
         if(_global.Deaths >= 25)
         {
            _global.GainAward("25 Deaths");
         }
         if(_global.Deaths >= 50)
         {
            _global.GainAward("50 Deaths");
         }
         if(_global.Deaths >= 100)
         {
            _global.GainAward("100 Deaths");
         }
         if(_global.BadEnds.length >= 5)
         {
            _global.GainAward("Died 5 Ways");
         }
         if(_global.BadEnds.length >= 10)
         {
            _global.GainAward("Died 10 Ways");
         }
         if(_global.BadEnds.length >= 15)
         {
            _global.GainAward("Died 15 Ways");
         }
      }
      if(deadFor == 100 && _global.gameMode != "Practice")
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
            if(_global.Rematch)
            {
               _global.RematchesLeft--;
            }
            else
            {
               _global.RematchesLeft = 3;
            }
         }
         else
         {
            _global.RematchesLeft = 0;
         }
         _global.Rematch = false;
      }
      if(gameMode == "Single" && deadFor == 40)
      {
         if(_global.Score > _global.SingleNestHighScore)
         {
            _global.SingleNestHighScore = _global.Score;
            _root.attachMovie("New High Score!","NewHigh",7005);
            with(_root.NewHigh)
            {
               _x = 270;
               _y = 280;
            }
         }
         if(_global.HardcoreMode)
         {
            _root.kongregateScores.setMode("HardcoreNest");
            _root.kongregateScores.submit(_global.Score);
         }
         else
         {
            _root.kongregateScores.setMode("NormalNest");
            _root.kongregateScores.submit(_global.Score);
         }
      }
      if(gameMode == "Bounty" && deadFor == 40)
      {
         if(_global.Score > _global.BountyRunHighScore)
         {
            _global.BountyRunHighScore = _global.Score;
            _root.attachMovie("New High Score!","NewHigh",7005);
            with(_root.NewHigh)
            {
               _x = 270;
               _y = 280;
            }
         }
         if(_global.HardcoreMode)
         {
            _root.kongregateScores.setMode("HardcoreBounty");
            _root.kongregateScores.submit(_global.Score);
         }
         else
         {
            _root.kongregateScores.setMode("NormalBounty");
            _root.kongregateScores.submit(_global.Score);
         }
      }
      if(deadFor > 0)
      {
         deadFor--;
      }
      else if(eval(_root.DeathPop) == undefined)
      {
         _global.saveData();
         _root.attachMovie("Death Popup","DeathPop",7001);
         with(_root.DeathPop)
         {
            _x = 270;
            _y = 200;
         }
      }
   }
   if(_global.AwardQue.length > 0)
   {
      if(_global.AwardWait == 0)
      {
         awardName = _global.AwardQue.shift();
         _global.Awards.push(awardName);
         _global.NewAwards.push(awardName);
         _root.attachMovie("New Award Notice",awardName,6653);
         with(eval("_root." + awardName))
         {
            _x = 200;
            _y = 420;
         }
         _global.MakeNoise("AwardGet");
         _global.AwardWait = 60;
         if(int(_global.Awards.length / 10) == _global.Awards.length / 10)
         {
            NoticeQue.push("Key");
         }
         if(_global.Awards.length == 25)
         {
            NoticeQue.push("HCore");
         }
         if(_global.Awards.length == 55)
         {
            NoticeQue.push("SSlot");
         }
         if(_global.Awards.length == 110)
         {
            NoticeQue.push("DSlot");
         }
         if(awardName == "First Razor Queen")
         {
            NoticeQue.push("SKey");
         }
         _global.saveData();
      }
   }
   if(_global.AwardWait > 0)
   {
      _global.AwardWait--;
   }
   if(NoticeQue.length > 0)
   {
      if(NoticeWait == 0)
      {
         noticeName = NoticeQue.shift();
         switch(noticeName)
         {
            case "Key":
               _root.attachMovie("New Reward Key Notice","KeyNotice",6654);
               with(_root.KeyNotice)
               {
                  _x = 200;
                  _y = - 20;
               }
               _global.MakeNoise("New Reward Notice");
               noticeWait = 60;
               break;
            case "SKey":
               _root.attachMovie("New Special Key Notice","SKeyNotice",6654);
               with(_root.KeyNotice)
               {
                  _x = 200;
                  _y = - 20;
               }
               _global.MakeNoise("New Reward Notice");
               noticeWait = 60;
               break;
            case "HCore":
               _root.attachMovie("Hardcore Mode Notice","HCoreNotice",6654);
               with(_root.HCoreNotice)
               {
                  _x = 200;
                  _y = - 20;
               }
               _global.MakeNoise("New Reward Notice");
               noticeWait = 60;
               break;
            case "SSlot":
               _root.attachMovie("Slot S Notice","SSlotNotice",6654);
               with(_root.SSlotNotice)
               {
                  _x = 200;
                  _y = - 20;
               }
               _global.MakeNoise("New Reward Notice");
               noticeWait = 60;
               break;
            case "DSlot":
               _root.attachMovie("Slot D Notice","DSlotNotice",6654);
               with(_root.DSlotNotice)
               {
                  _x = 200;
                  _y = - 20;
               }
               _global.MakeNoise("New Reward Notice");
               noticeWait = 60;
         }
      }
   }
   if(NoticeWait > 0)
   {
      NoticeWait--;
   }
   if(_global.unbuildTo != null && _global.AwardQue.length == 0)
   {
      _global.pause = false;
      x = 1;
      while(x < 7100)
      {
         _root.createEmptyMovieClip("Cleaner",x);
         removeMovieClip(_root.Cleaner);
         x++;
      }
      _global.Enemies.splice(0);
      _global.Hazards.splice(0);
      _global.activeEnemies.splice(0);
      _global.GameTime = 0;
      soundkill = new Sound();
      soundkill.stop();
      if(unbuildTo == "Menu")
      {
         _global.unbuildTo = null;
         _level0.gotoAndStop(5);
      }
      else
      {
         _global.unbuildTo = null;
         _level0.prevFrame();
      }
   }
   x = 0;
   while(x < _global.Enemies.length)
   {
      if(eval("_root." + _global.Enemies[x]) == undefined)
      {
         _global.Enemies.splice(x,1);
      }
      x++;
   }
   x = 0;
   while(x < _global.Hazards.length)
   {
      if(eval("_root." + _global.Hazards[x]) == undefined)
      {
         _global.Hazards.splice(x,1);
      }
      x++;
   }
}

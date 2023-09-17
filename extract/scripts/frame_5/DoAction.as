stop();
if(!RanOnce)
{
   _root.kongregateServices.connect();
   _root.kongregateScores.setMode("NormalNest");
   _global.interval = 30;
   _global.showFPSDisp = "Off";
   _global.spawnLimit = 12;
   _global.showFPS = false;
   _global.soundMode = "All";
   _global.floorMode = "Random";
   _global.HardcoreMode = false;
   subMenu = false;
   _global.RanOnce = true;
   _global.BestSwing = 0;
   _global.BestCombo = 0;
   _global.TipsSeen = new Array();
   _global.EnemiesSeen = new Array();
   _global.EnemiesSeen.push("Gloople");
   _global.EnemiesKilled = new Array();
   _global.EnemiesKilled.push("Gloople");
   _global.SaveFile = SharedObject.getLocal("Amorphous");
   _global.Awards = new Array();
   _global.AwardQue = new Array();
   _global.AwardWait = 0;
   _global.NewAwards = new Array();
   _global.CareerKills = new Array(18);
   _global.PlayTime = 0;
   _global.CKIndex = new Array("Gloople","Oozle","Stickie","Biter","Meltie","Sharp","Clutter","Inkie","Grinder","Gray","Fuzzle","Torchie","Frostie","Amalgam","Queen","Horror","VoidEater","RazorQueen");
   _global.Deaths = 0;
   _global.BadEnds = new Array();
   _global.PlayerBumps = 0;
   _global.PlayerSparks = 0;
   _global.PlayerGooTime = 0;
   _global.PracticeSeconds = 0;
   _global.NestClears = new Array(0,0,0,0,0,0);
   _global.RewardsUnlocked = new Array();
   _global.ABind = null;
   _global.SBind = null;
   _global.DBind = null;
   _global.gameMode = null;
   _global.GameTime = 0;
   _global.pause = false;
   _global.PracticeEnemies = new Array();
   _global.PracticeEnemies.push("Gloople");
   _global.activeEnemies = new Array();
   _global.EnemySet = new Array();
   _global.EnemySet.push("Gloople");
   _global.NestSize = 0;
   _global.KillsLeft = 0;
   _global.BountyRunHighScore = 0;
   _global.SingleNestHighScore = 0;
   _global.Rematch = false;
   _global.RematchesLeft = 0;
   _global.SearchArray = function(ArraytoSearch, ItemtoFind)
   {
      x = 0;
      while(x < ArraytoSearch.length)
      {
         if(ArraytoSearch[x] == ItemtoFind)
         {
            return x;
         }
         x++;
      }
      return null;
   };
   mySound = new Sound();
   _global.MakeNoise = function(NoisetoMake, startAt)
   {
      if(soundMode == "All" || soundMode == "FX Only")
      {
         mySound.attachSound(NoisetoMake);
         mySound.start(startAt);
      }
   };
   _global.KillCount = function(KilledWhat, Goal)
   {
      if(_global.gameMode != "Practice")
      {
         _global.CareerKills[SearchArray(CKIndex,KilledWhat)]++;
         if(_global.CareerKills[SearchArray(CKIndex,KilledWhat)] >= Goal)
         {
            _global.GainAward("Kill " + Goal + " " + KilledWhat + "s");
         }
      }
   };
   _global.RotationVector = function(CurrentRotation, TargetRotation)
   {
      CurRot = CurrentRotation + 180;
      TarRot = TargetRotation + 180;
      if(CurRot > TarRot)
      {
         DifRot = CurRot - TarRot;
         if(DifRot < 180)
         {
            return DifRot * -1;
         }
         return DifRot - 180;
      }
      if(TarRot > CurRot)
      {
         DifRot = TarRot - CurRot;
         if(DifRot < 180)
         {
            return DifRot;
         }
         return (DifRot - 180) * -1;
      }
      return 0;
   };
   Music = new Sound(_root);
   _global.lastSong = "";
   _global.playSong = function(WhatSong)
   {
      if(WhatSong == "nextSong")
      {
         Music.stop();
         if(soundMode == "All" || soundMode == "Music Only")
         {
            switch(_global.lastSong)
            {
               case "Effects of Elevation":
                  Songname = "Invisible Walls";
                  break;
               case "Invisible Walls":
                  Songname = "Accelerated Lifestyle";
                  break;
               case "Accelerated Lifestyle":
                  Songname = "Double the Daily Dose";
                  break;
               case "Double the Daily Dose":
                  Songname = "Habitual Ritual";
                  break;
               case "Habitual Ritual":
                  Songname = "Weekend Amnesia";
                  break;
               case "Weekend Amnesia":
                  Songname = "City Lights at Night";
                  break;
               case "City Lights at Night":
                  Songname = "Mind Mapping";
                  break;
               case "Mind Mapping":
                  Songname = "Ventus Solaris";
                  break;
               case "Ventus Solaris":
                  Songname = "As We May Think";
                  break;
               case "As We May Think":
                  Songname = "Biomythos";
                  break;
               case "Biomythos":
                  Songname = "Obscure Terrain";
                  break;
               case "Obscure Terrain":
                  Songname = "Effects of Elevation";
            }
            Music.attachSound(Songname);
            _global.lastSong = Songname;
            Music.onSoundComplete = function()
            {
               _global.playSong("juke");
            };
            Music.start();
            if(_root._currentframe < 7)
            {
               _root.attachMovie("Jukebox Backdrop","jukeboxBack",6649);
               with(_root.jukeboxBack)
               {
                  _x = 30;
                  _y = 30;
               }
            }
            _root.attachMovie("Jukebox Display","Jukebox",6650);
            with(_root.Jukebox)
            {
               _x = 30;
               _y = 30;
            }
            if((ABind != null || SBind != null || DBind != null) && _root._currentframe == 7)
            {
               _root.Jukebox._y = 60;
            }
         }
      }
      else if(WhatSong != "tellMeAgain")
      {
         Music.stop();
         if(soundMode == "All" || soundMode == "Music Only")
         {
            Songname = _global.lastSong;
            if(WhatSong == "juke")
            {
               while(Songname == _global.lastSong)
               {
                  songPicker = int(Math.random() * 12) + 1;
                  switch(songPicker)
                  {
                     case 1:
                        Songname = "Invisible Walls";
                        break;
                     case 2:
                        Songname = "Accelerated Lifestyle";
                        break;
                     case 3:
                        Songname = "Double the Daily Dose";
                        break;
                     case 4:
                        Songname = "Habitual Ritual";
                        break;
                     case 5:
                        Songname = "Weekend Amnesia";
                        break;
                     case 6:
                        Songname = "City Lights at Night";
                        break;
                     case 7:
                        Songname = "Mind Mapping";
                        break;
                     case 8:
                        Songname = "Ventus Solaris";
                        break;
                     case 9:
                        Songname = "As We May Think";
                        break;
                     case 10:
                        Songname = "Biomythos";
                        break;
                     case 11:
                        Songname = "Obscure Terrain";
                        break;
                     case 12:
                        Songname = "Effects of Elevation";
                  }
               }
               Music.attachSound(Songname);
               _global.lastSong = Songname;
            }
            else
            {
               Music.attachSound(WhatSong);
               _global.lastSong = WhatSong;
            }
            Music.onSoundComplete = function()
            {
               _global.playSong("juke");
            };
            Music.start();
            if(_root._currentframe < 7)
            {
               _root.attachMovie("Jukebox Backdrop","jukeboxBack",6649);
               with(_root.jukeboxBack)
               {
                  _x = 30;
                  _y = 30;
               }
            }
            _root.attachMovie("Jukebox Display","Jukebox",6650);
            with(_root.Jukebox)
            {
               _x = 30;
               _y = 30;
            }
            if((ABind != null || SBind != null || DBind != null) && _root._currentframe == 7)
            {
               _root.Jukebox._y = 60;
            }
         }
      }
      else if(soundMode == "All" || soundMode == "Music Only")
      {
         if(_root._currentframe < 7)
         {
            _root.attachMovie("Jukebox Backdrop","jukeboxBack",6649);
            with(_root.jukeboxBack)
            {
               _x = 30;
               _y = 30;
            }
         }
         _root.attachMovie("Jukebox Display","Jukebox",6650);
         with(_root.Jukebox)
         {
            _x = 30;
            _y = 30;
         }
      }
   };
   _global.KStat = function()
   {
      _root.kongregateStats.submit("TotalAwards",_global.Awards.length);
      _root.kongregateStats.submit("RewardsUnlocked",_global.RewardsUnlocked.length);
      _root.kongregateStats.submit("TotalPlayTime",_global.PlayTime);
      _root.kongregateStats.submit("PlayerDeaths",_global.Deaths);
      _root.kongregateStats.submit("PlayerBumps",_global.PlayerBumps);
      _root.kongregateStats.submit("BestiaryEntries",_global.EnemiesSeen.length);
      _root.kongregateStats.submit("BestSwing",_global.BestSwing);
      _root.kongregateStats.submit("BestCombo",_global.BestCombo);
      if(_global.SearchArray(_global.Awards,"Perfect Run") != null)
      {
         _root.kongregateStats.submit("BadassAward",1);
      }
      if(_global.SearchArray(_global.Awards,"4 Color Splats") != null)
      {
         _root.kongregateStats.submit("ImpressionistAward",1);
      }
      if(_global.SearchArray(_global.Awards,"5 Queen Misses") != null)
      {
         _root.kongregateStats.submit("DuelistAward",1);
      }
      if(_global.SearchArray(_global.Awards,"10 Straight Combos") != null)
      {
         _root.kongregateStats.submit("BladeMasterAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Perfect Run") != null)
      {
         _root.kongregateStats.submit("BadassAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Survive Explosion") != null)
      {
         _root.kongregateStats.submit("DemolitionAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Survive Fire") != null)
      {
         _root.kongregateStats.submit("BurnWardAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Survive Blackout") != null)
      {
         _root.kongregateStats.submit("BlindsightAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Survive Ice") != null)
      {
         _root.kongregateStats.submit("HypothermiaAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Ambush") != null)
      {
         _root.kongregateStats.submit("UnfortunateAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Bogged by Clutters") != null)
      {
         _root.kongregateStats.submit("FriendlyAward",1);
      }
      if(_global.SearchArray(_global.Awards,"Clutter at Finish") != null)
      {
         _root.kongregateStats.submit("PurpleHeartAward",1);
      }
      x = 0;
      while(x++)
      {
         statCalled = CKIndex[x] + "Killed";
         _root.kongregateStats.submit(statCalled,_global.CareerKills[x]);
         x < CKIndex.length;
      }
      _root.kongregateStats.submit("SmallNestClears",_global.NestClears[0]);
      _root.kongregateStats.submit("BigNestClears",_global.NestClears[1]);
      _root.kongregateStats.submit("HugeNestClears",_global.NestClears[2]);
      _root.kongregateStats.submit("HardcoreSmallNestClears",_global.NestClears[3]);
      _root.kongregateStats.submit("HardcoreBigNestClears",_global.NestClears[4]);
      _root.kongregateStats.submit("HardcoreHugeNestClears",_global.NestClears[5]);
   };
   _global.saveData = function()
   {
      _root.attachMovie("Saving Icon","SaveIcon",6652);
      with(_root.SaveIcon)
      {
         _x = 530;
         _y = 380;
      }
      _global.SaveFile.data.BountyRunHighScore = _global.BountyRunHighScore;
      _global.SaveFile.data.SingleNestHighScore = _global.SingleNestHighScore;
      _global.SaveFile.data.Awards = _global.Awards;
      _global.SaveFile.data.RewardsUnlocked = _global.RewardsUnlocked;
      _global.SaveFile.data.ABind = _global.ABind;
      _global.SaveFile.data.SBind = _global.SBind;
      _global.SaveFile.data.DBind = _global.DBind;
      _global.SaveFile.data.CareerKills = _global.CareerKills;
      _global.SaveFile.data.PlayTime = _global.PlayTime;
      _global.SaveFile.data.Deaths = _global.Deaths;
      _global.SaveFile.data.BadEnds = _global.BadEnds;
      _global.SaveFile.data.PlayerBumps = _global.PlayerBumps;
      _global.SaveFile.data.PlayerSparks = _global.PlayerSparks;
      _global.SaveFile.data.PlayerGooTime = _global.PlayerGooTime;
      _global.SaveFile.data.PracticeSeconds = _global.PracticeSeconds;
      _global.SaveFile.data.TipsSeen = _global.TipsSeen;
      _global.SaveFile.data.EnemiesSeen = _global.EnemiesSeen;
      _global.SaveFile.data.EnemiesKilled = _global.EnemiesKilled;
      _global.SaveFile.data.interval = _global.interval;
      _global.SaveFile.data.spawnLimit = _global.spawnLimit;
      _global.SaveFile.data.showFPS = _global.showFPS;
      _global.SaveFile.data.soundMode = _global.soundMode;
      _global.SaveFile.data.floorMode = _global.floorMode;
      _global.SaveFile.data.HardcoreMode = _global.HardcoreMode;
      _global.SaveFile.data.NestClears = _global.NestClears;
      _global.SaveFile.flush();
      _global.KStat();
   };
   _global.loadData = function()
   {
      if(_global.SaveFile.data.BountyRunHighScore != undefined)
      {
         _global.BountyRunHighScore = _global.SaveFile.data.BountyRunHighScore;
      }
      if(_global.SaveFile.data.SingleNestHighScore != undefined)
      {
         _global.SingleNestHighScore = _global.SaveFile.data.SingleNestHighScore;
      }
      if(_global.SaveFile.data.Awards != undefined)
      {
         _global.Awards = _global.SaveFile.data.Awards;
      }
      if(_global.SaveFile.data.NestClears != undefined)
      {
         _global.NestClears = _global.SaveFile.data.NestClears;
      }
      if(_global.SaveFile.data.RewardsUnlocked != undefined)
      {
         _global.RewardsUnlocked = _global.SaveFile.data.RewardsUnlocked;
      }
      if(_global.SaveFile.data.ABind != undefined)
      {
         _global.ABind = _global.SaveFile.data.ABind;
      }
      if(_global.SaveFile.data.SBind != undefined)
      {
         _global.SBind = _global.SaveFile.data.SBind;
      }
      if(_global.SaveFile.data.DBind != undefined)
      {
         _global.DBind = _global.SaveFile.data.DBind;
      }
      if(_global.SaveFile.data.CareerKills != undefined)
      {
         _global.CareerKills = _global.SaveFile.data.CareerKills;
      }
      if(_global.SaveFile.data.PlayTime != undefined)
      {
         _global.PlayTime = _global.SaveFile.data.PlayTime;
      }
      if(_global.SaveFile.data.Deaths != undefined)
      {
         _global.Deaths = _global.SaveFile.data.Deaths;
      }
      if(_global.SaveFile.data.BadEnds != undefined)
      {
         _global.BadEnds = _global.SaveFile.data.BadEnds;
      }
      if(_global.SaveFile.data.PlayerBumps != undefined)
      {
         _global.PlayerBumps = _global.SaveFile.data.PlayerBumps;
      }
      if(_global.SaveFile.data.PlayerSparks != undefined)
      {
         _global.PlayerSparks = _global.SaveFile.data.PlayerSparks;
      }
      if(_global.SaveFile.data.PlayerGooTime != undefined)
      {
         _global.PlayerGooTime = _global.SaveFile.data.PlayerGooTime;
      }
      if(_global.SaveFile.data.PracticeSeconds != undefined)
      {
         _global.PracticeSeconds = _global.SaveFile.data.PracticeSeconds;
      }
      if(_global.SaveFile.data.TipsSeen != undefined)
      {
         _global.TipsSeen = _global.SaveFile.data.TipsSeen;
      }
      if(_global.SaveFile.data.EnemiesSeen != undefined)
      {
         _global.EnemiesSeen = _global.SaveFile.data.EnemiesSeen;
      }
      if(_global.SaveFile.data.EnemiesKilled != undefined)
      {
         _global.EnemiesKilled = _global.SaveFile.data.EnemiesKilled;
      }
      if(_global.SaveFile.data.interval != undefined)
      {
         _global.interval = _global.SaveFile.data.interval;
      }
      if(_global.SaveFile.data.spawnLimit != undefined)
      {
         _global.spawnLimit = _global.SaveFile.data.spawnLimit;
      }
      if(_global.SaveFile.data.showFPS != undefined)
      {
         _global.showFPS = _global.SaveFile.data.showFPS;
      }
      if(_global.SaveFile.data.soundMode != undefined)
      {
         _global.soundMode = _global.SaveFile.data.soundMode;
      }
      if(_global.SaveFile.data.floorMode != undefined)
      {
         _global.floorMode = _global.SaveFile.data.floorMode;
      }
      if(_global.SaveFile.data.HardcoreMode != undefined)
      {
         _global.HardcoreMode = _global.SaveFile.data.HardcoreMode;
      }
   };
   _global.resetAllData = function()
   {
      _global.interval = 30;
      _global.spawnLimit = 12;
      _global.showFPS = false;
      _global.soundMode = "All";
      _global.floorMode = "Random";
      _global.HardcoreMode = false;
      _global.TipsSeen = new Array();
      _global.EnemiesSeen = new Array();
      _global.EnemiesSeen.push("Gloople");
      _global.EnemiesKilled = new Array();
      _global.EnemiesKilled.push("Gloople");
      _global.RewardsUnlocked = new Array();
      _global.ABind = null;
      _global.SBind = null;
      _global.DBind = null;
      _global.Awards = new Array();
      _global.AwardQue = new Array();
      _global.AwardWait = 0;
      _global.NewAwards = new Array();
      _global.CareerKills = new Array(18);
      _global.PlayTime = 0;
      _global.Deaths = 0;
      _global.BadEnds = new Array();
      _global.PlayerBumps = 0;
      _global.PlayerSparks = 0;
      _global.PlayerGooTime = 0;
      _global.PracticeSeconds = 0;
      _global.NestClears = new Array(0,0,0,0,0,0);
      _global.gameMode = null;
      _global.GameTime = 0;
      _global.PracticeEnemies = new Array();
      _global.PracticeEnemies.push("Gloople");
      _global.activeEnemies = new Array();
      _global.EnemySet = new Array();
      _global.EnemySet.push("Gloople");
      _global.NestSize = 0;
      _global.KillsLeft = 0;
      _global.BountyRunHighScore = 0;
      _global.SingleNestHighScore = 0;
      _global.Rematch = false;
      _global.RematchesLeft = 0;
      _global.RazorGlaiveEquipped = false;
      _global.saveData();
   };
   _global.GainAward = function(awardName)
   {
      if(_global.SearchArray(_global.Awards,awardName) == null && (_global.gameMode != "Practice" || awardName == "Practice 10 min" || awardName.slice(-8) == "Playtime"))
      {
         if(_global.SearchArray(_global.AwardQue,awardName) == null)
         {
            _global.AwardQue.push(awardName);
         }
      }
   };
   _global.RewardKey = function(Reward)
   {
      if(_global.ABind == Reward)
      {
         return 65;
      }
      if(_global.SBind == Reward)
      {
         return 83;
      }
      if(_global.DBind == Reward)
      {
         return 68;
      }
      return null;
   };
   _global.RewardTab = function(Reward)
   {
      if(_global.ABind == Reward)
      {
         return "_root.ATab";
      }
      if(_global.SBind == Reward)
      {
         return "_root.STab";
      }
      if(_global.DBind == Reward)
      {
         return "_root.DTab";
      }
      return null;
   };
   _global.loadData();
   if(showFPS)
   {
      _global.showFPSDisp = "On";
   }
}
_global.RazorGlaiveEquipped = false;
_global.playSong("Ventus Solaris");
_global.saveData();

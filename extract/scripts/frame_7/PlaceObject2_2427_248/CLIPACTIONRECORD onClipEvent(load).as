onClipEvent(load){
   deadFor = null;
   GlooplesInGame = 0;
   _global.BossOnDeck = false;
   frameInterval = interval * 30;
   UserClicked = false;
   NoticeQue = new Array();
   NoticeWait = 0;
   if(_global.gameMode == "Single")
   {
      _global.KillsLeft = _global.NestSize;
      foundQueen = false;
      _global.ClearTime = 0;
      _root.attachMovie("Nest Counter","NestCount",6500);
      with(_root.NestCount)
      {
         _x = 135;
         _y = 380;
      }
   }
   if(_global.gameMode == "Practice")
   {
      _root.attachMovie("To Exit Practice","ExitSign",6500);
      with(_root.ExitSign)
      {
         _x = 270;
         _y = 380;
         ExitBlink = true;
      }
   }
   if(_global.HardcoreMode && (_global.gameMode == "Single" || _global.gameMode == "Bounty"))
   {
      x = 0;
      while(x < _global.EnemySet.length)
      {
         if(_global.SearchArray(_global.EnemiesSeen,_global.EnemySet[x]) != null)
         {
            _global.activeEnemies.push(_global.EnemySet[x]);
         }
         x++;
      }
      GlooplesInGame = _global.activeEnemies.length - 1;
   }
   _global.playSong("juke");
}

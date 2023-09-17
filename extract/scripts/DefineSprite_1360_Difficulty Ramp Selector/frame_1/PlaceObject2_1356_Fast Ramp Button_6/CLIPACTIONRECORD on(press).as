on(press){
   if(_parent.DiffSel.timeUp > 5)
   {
      _global.interval = 15;
      _global.gameMode = "Bounty";
      while(EnemySet.length < 11)
      {
         if(EnemySet.length < 5)
         {
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  if(SearchArray(EnemySet,"Stickie") == null)
                  {
                     EnemySet.push("Stickie");
                  }
                  break;
               case 2:
                  if(SearchArray(EnemySet,"Biter") == null)
                  {
                     EnemySet.push("Biter");
                  }
                  break;
               case 3:
                  if(SearchArray(EnemySet,"Meltie") == null)
                  {
                     EnemySet.push("Meltie");
                  }
                  break;
               case 4:
                  if(SearchArray(EnemySet,"Clutter") == null)
                  {
                     EnemySet.push("Clutter");
                  }
            }
         }
         else if(EnemySet.length < 9)
         {
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  if(SearchArray(EnemySet,"Sharp") == null)
                  {
                     EnemySet.push("Sharp");
                  }
                  break;
               case 2:
                  if(SearchArray(EnemySet,"Inkie") == null)
                  {
                     EnemySet.push("Inkie");
                  }
                  break;
               case 3:
                  if(SearchArray(EnemySet,"Grinder") == null)
                  {
                     EnemySet.push("Grinder");
                  }
                  break;
               case 4:
                  if(SearchArray(EnemySet,"Fuzzle") == null)
                  {
                     EnemySet.push("Fuzzle");
                  }
            }
         }
         else
         {
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  if(SearchArray(EnemySet,"Torchie") == null)
                  {
                     EnemySet.push("Torchie");
                  }
                  break;
               case 2:
                  if(SearchArray(EnemySet,"Frostie") == null)
                  {
                     EnemySet.push("Frostie");
                  }
            }
         }
      }
      _root.subMenu = false;
      _level0.nextFrame();
      _root.Difficulty.removeMovieClip();
   }
}

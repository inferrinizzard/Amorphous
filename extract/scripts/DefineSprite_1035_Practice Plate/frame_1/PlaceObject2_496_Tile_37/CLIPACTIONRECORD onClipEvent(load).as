onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Fuzzle") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Fuzzle","Profile",1);
      if(SearchArray(PracticeEnemies,"Fuzzle") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

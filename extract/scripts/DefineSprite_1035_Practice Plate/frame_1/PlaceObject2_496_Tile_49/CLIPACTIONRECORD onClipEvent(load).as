onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Frostie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Frostie","Profile",1);
      if(SearchArray(PracticeEnemies,"Frostie") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

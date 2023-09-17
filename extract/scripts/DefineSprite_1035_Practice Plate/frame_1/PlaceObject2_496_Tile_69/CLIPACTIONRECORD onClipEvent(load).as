onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Queen") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Queen","Profile",1);
      if(SearchArray(PracticeEnemies,"Queen") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Grinder") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Grinder","Profile",1);
      if(SearchArray(PracticeEnemies,"Grinder") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Meltie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Meltie","Profile",1);
      if(SearchArray(PracticeEnemies,"Meltie") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

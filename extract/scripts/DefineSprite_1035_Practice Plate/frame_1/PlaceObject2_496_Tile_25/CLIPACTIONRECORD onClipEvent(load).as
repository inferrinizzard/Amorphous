onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Clutter") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Clutter","Profile",1);
      if(SearchArray(PracticeEnemies,"Clutter") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

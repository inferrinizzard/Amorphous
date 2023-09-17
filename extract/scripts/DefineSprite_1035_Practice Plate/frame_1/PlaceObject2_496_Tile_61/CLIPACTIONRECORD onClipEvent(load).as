onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Horror") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Horror","Profile",1);
      if(SearchArray(PracticeEnemies,"Horror") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

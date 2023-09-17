onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Gray") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Gray","Profile",1);
      if(SearchArray(PracticeEnemies,"Gray") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

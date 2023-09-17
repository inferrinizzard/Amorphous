onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Sharp") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Sharp","Profile",1);
      if(SearchArray(PracticeEnemies,"Sharp") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

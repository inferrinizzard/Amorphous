onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Biter") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Biter","Profile",1);
      if(SearchArray(PracticeEnemies,"Biter") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

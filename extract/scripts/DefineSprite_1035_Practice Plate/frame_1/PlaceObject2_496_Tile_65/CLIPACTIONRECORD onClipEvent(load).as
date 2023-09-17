onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"VoidEater") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info VoidEater","Profile",1);
      if(SearchArray(PracticeEnemies,"VoidEater") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

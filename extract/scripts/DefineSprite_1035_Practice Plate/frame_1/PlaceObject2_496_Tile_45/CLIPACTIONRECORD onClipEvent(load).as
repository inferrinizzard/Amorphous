onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Torchie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Torchie","Profile",1);
      if(SearchArray(PracticeEnemies,"Torchie") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

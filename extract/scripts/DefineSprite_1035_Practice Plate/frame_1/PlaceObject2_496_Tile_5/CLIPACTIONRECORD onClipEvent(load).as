onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Gloople") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Gloople","Profile",1);
      if(SearchArray(PracticeEnemies,"Gloople") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Stickie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Stickie","Profile",1);
      if(SearchArray(PracticeEnemies,"Stickie") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

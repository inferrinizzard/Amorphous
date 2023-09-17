onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Amalgam") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Amalgam","Profile",1);
      if(SearchArray(PracticeEnemies,"Amalgam") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

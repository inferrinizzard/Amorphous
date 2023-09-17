onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Oozle") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Oozle","Profile",1);
      if(SearchArray(PracticeEnemies,"Oozle") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

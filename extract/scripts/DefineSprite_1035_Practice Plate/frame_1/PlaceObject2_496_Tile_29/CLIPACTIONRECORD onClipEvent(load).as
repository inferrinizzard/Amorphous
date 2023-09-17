onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Inkie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Inkie","Profile",1);
      if(SearchArray(PracticeEnemies,"Inkie") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

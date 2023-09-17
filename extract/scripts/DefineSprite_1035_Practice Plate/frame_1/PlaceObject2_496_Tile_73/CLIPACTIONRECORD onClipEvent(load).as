onClipEvent(load){
   stop();
   onMe = false;
   _visible = false;
   if(SearchArray(EnemiesSeen,"RazorQueen") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      _visible = true;
      attachMovie("Info RazorQueen","Profile",1);
      if(SearchArray(PracticeEnemies,"RazorQueen") == null)
      {
         attachMovie("Tile Shader","Shader",2);
      }
   }
}

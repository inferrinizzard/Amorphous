onClipEvent(mouseDown){
   if(onMe && tileLit)
   {
      if(SearchArray(PracticeEnemies,"Inkie") != null)
      {
         attachMovie("Tile Shader","Shader",2);
         _global.MakeNoise("Select Off");
         _global.PracticeEnemies.splice(SearchArray(_global.PracticeEnemies,"Inkie"),1);
      }
      else
      {
         Shader.removeMovieClip();
         _global.MakeNoise("Select On");
         _global.PracticeEnemies.push("Inkie");
      }
   }
}

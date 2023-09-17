onClipEvent(mouseDown){
   if(onMe && tileLit)
   {
      if(SearchArray(PracticeEnemies,"Horror") != null)
      {
         attachMovie("Tile Shader","Shader",2);
         _global.MakeNoise("Select Off");
         _global.PracticeEnemies.splice(SearchArray(_global.PracticeEnemies,"Horror"),1);
      }
      else
      {
         Shader.removeMovieClip();
         _global.MakeNoise("Select On");
         _global.PracticeEnemies.push("Horror");
      }
   }
}

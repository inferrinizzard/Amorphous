on(press){
   if(PracticeEnemies.length > 0)
   {
      _global.gameMode = "Practice";
      _root.subMenu = false;
      _level0.nextFrame();
      _root.PracticeMenu.removeMovieClip();
   }
}

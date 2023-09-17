on(press){
   _global.MakeNoise("Menu Noise");
   _root.attachMovie("Reset Scores Conf","ResetScoresConf",1001);
   with(_root.ResetScoresConf)
   {
      _x = 250;
      _y = 220;
   }
   _root.OptionMenu.removeMovieClip();
}

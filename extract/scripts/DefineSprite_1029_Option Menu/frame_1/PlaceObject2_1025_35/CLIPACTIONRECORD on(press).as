on(press){
   _global.MakeNoise("Menu Noise");
   _root.attachMovie("Reset All Conf","ResetAllConf",1001);
   with(_root.ResetAllConf)
   {
      _x = 250;
      _y = 220;
   }
   _root.OptionMenu.removeMovieClip();
}

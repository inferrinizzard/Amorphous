onClipEvent(keyDown){
   if(Key.getCode() == 88)
   {
      _global.unbuildTo = "Menu";
   }
   if(Key.getCode() == 78)
   {
      if(_global.soundMode != "FX Only" && _global.soundMode != "None")
      {
         _global.playSong("nextSong");
         musicSwitches++;
         if(musicSwitches == 5)
         {
            _global.GainAward("Next Song 5 Times");
         }
      }
   }
   if(Key.getCode() == 77)
   {
      _global.playSong("tellMeAgain");
   }
   if(Key.getCode() == 32)
   {
      if(!HeroKilled && (_global.ClearTime == 0 || _global.gameMode != "Single"))
      {
         _global.pause = !_global.pause;
         if(eval(_root.PauseScreen) == undefined)
         {
            _root.attachMovie("Pause Blanket","PauseScreen",6645);
            with(_root.PauseScreen)
            {
               _x = 275;
               _y = 200;
            }
            _global.saveData();
         }
         else
         {
            removeMovieClip(_root.PauseScreen);
         }
      }
   }
}

on(press){
   if(_global.soundMode == "FX Only")
   {
      _global.soundMode = "All";
      _global.playSong("juke");
   }
   if(_global.soundMode == "Music Only")
   {
      _global.soundMode = "FX Only";
      _global.playSong("juke");
   }
   if(_global.soundMode == "None")
   {
      _global.soundMode = "Music Only";
      _global.playSong("juke");
   }
   _parent.MusicSetting.text = _global.soundMode;
}

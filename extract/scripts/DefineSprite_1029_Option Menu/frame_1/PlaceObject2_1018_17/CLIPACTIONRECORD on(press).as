on(press){
   if(_global.spawnLimit < 20)
   {
      _global.spawnLimit = _global.spawnLimit + 1;
      _parent.SpawnSetting.text = _global.spawnLimit;
   }
}

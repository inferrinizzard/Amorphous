on(press){
   if(_global.spawnLimit > 8)
   {
      _global.spawnLimit--;
      _parent.SpawnSetting.text = _global.spawnLimit;
   }
}

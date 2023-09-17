on(press){
   if(_global.floorMode == "Simple")
   {
      _global.floorMode = "Random";
   }
   _parent.FloorSetting.text = _global.floorMode;
}

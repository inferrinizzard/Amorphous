on(press){
   if(_global.floorMode == "Random")
   {
      _global.floorMode = "Simple";
   }
   _parent.FloorSetting.text = _global.floorMode;
}

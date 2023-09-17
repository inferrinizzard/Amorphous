onClipEvent(mouseDown){
   if(onMe && _visible)
   {
      if(_global.HardcoreMode)
      {
         _global.MakeNoise("GraySnap");
         gotoAndStop(2);
         _global.HardcoreMode = false;
      }
      else
      {
         _global.MakeNoise("GraySpear");
         _global.MakeNoise("FuzzGrowl");
         _global.MakeNoise("FuzzBite2");
         _global.MakeNoise("Thump");
         gotoAndStop(1);
         _global.HardcoreMode = true;
      }
   }
}

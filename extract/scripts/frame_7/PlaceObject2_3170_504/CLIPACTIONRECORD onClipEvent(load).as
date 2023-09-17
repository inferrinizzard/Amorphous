onClipEvent(load){
   if(_name != "VoidSpiral")
   {
      _alpha = 50;
      if(_global.soundMode == "All" || _global.soundMode == "FX Only")
      {
         voidSound = new Sound(this);
         voidSound.attachSound("VoidField");
         voidSound.start(0,15);
      }
   }
}

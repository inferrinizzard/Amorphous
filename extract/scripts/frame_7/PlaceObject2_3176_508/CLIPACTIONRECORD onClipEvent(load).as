onClipEvent(load){
   if(_name != "VoidBeam")
   {
      framesExisted = 0;
      hostObject = eval("_root." + _name.slice(0,_name.length - 4));
      if(_global.soundMode == "All" || _global.soundMode == "FX Only")
      {
         beamSound = new Sound(this);
         beamSound.attachSound("VoidBeam");
         beamSound.start(0,3);
      }
   }
   else
   {
      stop();
   }
}

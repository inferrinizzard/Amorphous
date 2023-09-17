onClipEvent(load){
   if(_name != "BigFire")
   {
      framesExisted = 0;
      putOut = false;
      smokies = 0;
      if(_global.soundMode == "All" || _global.soundMode == "FX Only")
      {
         flameSound = new Sound(this);
         flameSound.attachSound("BigFire");
         flameSound.start(0,5);
      }
   }
   else
   {
      stop();
   }
}

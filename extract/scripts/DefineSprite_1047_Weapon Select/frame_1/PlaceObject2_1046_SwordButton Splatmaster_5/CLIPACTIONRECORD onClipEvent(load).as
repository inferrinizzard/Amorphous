onClipEvent(load){
   stop();
   onMe = false;
   myTipText = "The Splatmaster 3000 is the standard Gloople population control device.  Very effective at eliminating typical threats and durable enough to withstand protracted use";
   if(_global.RazorGlaiveEquipped)
   {
      _xscale = 70;
      _yscale = 70;
      gotoAndStop(21);
   }
}

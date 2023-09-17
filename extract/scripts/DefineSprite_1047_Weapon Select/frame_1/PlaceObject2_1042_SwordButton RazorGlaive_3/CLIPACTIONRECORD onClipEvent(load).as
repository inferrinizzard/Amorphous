onClipEvent(load){
   stop();
   onMe = false;
   myTipText = "The Razor Glaive is an exceedingly powerful weapon with a wide swing arc.  Exceptional density and size lend great reach and destructive power, but at the cost of mobility";
   if(!_global.RazorGlaiveEquipped)
   {
      _xscale = 70;
      _yscale = 70;
      gotoAndStop(21);
   }
}

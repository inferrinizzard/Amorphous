onClipEvent(load){
   gotoAndStop(2);
   onMe = false;
   if(_global.HardcoreMode)
   {
      gotoAndStop(1);
   }
   if(_global.Awards.length < 25)
   {
      _visible = false;
   }
   myTipText = "Click here to toggle Hardcore Mode.  While in Hardcore mode, different breeds of Glooples will not appear over time - you\'ll be set upon by every type from the very beginning!";
}

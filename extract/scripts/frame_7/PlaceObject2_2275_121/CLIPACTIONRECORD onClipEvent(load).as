onClipEvent(load){
   mommy = false;
   if(_name == "GrayTip")
   {
      mommy = true;
      stop();
   }
   else
   {
      gotoAndStop(1);
   }
}

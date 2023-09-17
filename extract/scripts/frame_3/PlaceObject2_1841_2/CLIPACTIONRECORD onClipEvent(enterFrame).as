onClipEvent(enterFrame){
   if(myLogo._currentframe == 1)
   {
      if(_alpha < 100)
      {
         _alpha = _alpha + 5;
      }
      else
      {
         myLogo.play();
      }
   }
   if(myLogo._currentframe == 171)
   {
      throughOnce = true;
      myLogo.stop();
   }
   if(throughOnce)
   {
      if(_alpha > 0)
      {
         _alpha = _alpha - 5;
      }
      else
      {
         _root.nextFrame();
         _visible = false;
      }
   }
}

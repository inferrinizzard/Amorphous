onClipEvent(enterFrame){
   if(tileLit)
   {
      if(hitTest(_root._xmouse,_root._ymouse,false))
      {
         onMe = true;
         if(_currentframe != 21)
         {
            play();
         }
         else
         {
            stop();
         }
         if(_currentframe == 41)
         {
            gotoAndPlay(1);
         }
      }
      else
      {
         onMe = false;
         play();
         if(_currentframe == 41)
         {
            gotoAndStop(1);
         }
         if(_currentframe == 1)
         {
            stop();
         }
      }
   }
   else
   {
      gotoAndStop(42);
   }
}

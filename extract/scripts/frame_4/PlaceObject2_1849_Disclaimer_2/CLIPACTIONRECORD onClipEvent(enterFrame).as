onClipEvent(enterFrame){
   if(framesExisted < 100)
   {
      _alpha++;
   }
   else if(framesExisted > 200 && framesExisted < 300)
   {
      _alpha--;
   }
   else if(framesExisted >= 300)
   {
      _level0.nextFrame();
   }
   framesExisted++;
}

onClipEvent(enterFrame){
   if(_root.innocuousLogo._visible == false)
   {
      if(framesExisted < 150)
      {
         if(_alpha < 100)
         {
            _alpha = _alpha + 10;
         }
      }
      else if(framesExisted < 210)
      {
         if(_alpha > 0)
         {
            _alpha = _alpha - 10;
         }
      }
      else
      {
         _level0.nextFrame();
      }
      framesExisted++;
   }
}

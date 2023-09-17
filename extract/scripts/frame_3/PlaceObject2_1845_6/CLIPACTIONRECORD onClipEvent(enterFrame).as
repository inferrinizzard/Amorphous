onClipEvent(enterFrame){
   if(_root.innocuousLogo._visible == false)
   {
      if(framesExisted < 150)
      {
         if(_alpha < 100)
         {
            _alpha = _alpha + 5;
            _xscale = _xscale + 6;
            _yscale = _yscale + 6;
         }
      }
      else if(framesExisted < 210)
      {
         if(_alpha > 0)
         {
            _alpha = _alpha - 5;
         }
      }
      framesExisted++;
   }
}

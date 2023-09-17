onClipEvent(enterFrame){
   if(hitTest(_root._xmouse,_root._ymouse,false) && _visible)
   {
      onMe = true;
      gotoAndStop(2);
   }
   else
   {
      onMe = false;
      gotoAndStop(1);
   }
   if(_root.SwordMask._currentframe == 101)
   {
      _visible = true;
   }
   if(_visible && _xscale < 100)
   {
      if(_xscale < 80)
      {
         _xscale = _xscale + 10;
         _yscale = _yscale + 10;
      }
      else
      {
         _xscale = _xscale + 5;
         _yscale = _yscale + 5;
      }
   }
}

onClipEvent(enterFrame){
   if(_global.RazorGlaiveUnlocked)
   {
      if(hitTest(_root._xmouse,_root._ymouse,false) && _root.subMenu == false)
      {
         onMe = true;
         _root.infoBox.tipText = myTipText;
      }
      else
      {
         onMe = false;
         if(_root.infoBox.tipText == myTipText)
         {
            _root.infoBox.tipText = null;
         }
      }
      if(!_global.RazorGlaiveEquipped)
      {
         if(_currentframe != 21)
         {
            play();
         }
         else
         {
            stop();
         }
         if(_xscale > 70)
         {
            _xscale = _xscale - 2;
            _yscale = _yscale - 2;
         }
      }
      else
      {
         if(_currentframe != 1)
         {
            play();
         }
         else
         {
            stop();
         }
         if(_xscale < 100)
         {
            _xscale = _xscale + 2;
            _yscale = _yscale + 2;
         }
      }
   }
}

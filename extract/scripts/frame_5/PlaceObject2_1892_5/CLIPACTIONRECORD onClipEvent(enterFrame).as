onClipEvent(enterFrame){
   if(hitTest(_root._xmouse,_root._ymouse,false) && _root.subMenu == false)
   {
      if(!onMe)
      {
         _global.MakeNoise("Menu Mouseover");
      }
      onMe = true;
      _root.infoBox.tipText = myTipText;
      if(_currentframe != 16)
      {
         play();
      }
      else
      {
         stop();
      }
   }
   else
   {
      onMe = false;
      if(_root.infoBox.tipText == myTipText)
      {
         _root.infoBox.tipText = null;
      }
      if(_currentframe != 1)
      {
         play();
      }
      else
      {
         stop();
      }
   }
}

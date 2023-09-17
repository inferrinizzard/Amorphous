onClipEvent(enterFrame){
   if(_global.Awards.length < 25)
   {
      _visible = false;
   }
   else
   {
      _visible = true;
   }
   if(hitTest(_root._xmouse,_root._ymouse,false) && _root.subMenu == false && _visible)
   {
      if(!onMe)
      {
         _global.MakeNoise("Menu Mouseover");
      }
      onMe = true;
      _root.infoBox.tipText = myTipText;
      if(_xscale == 100)
      {
         _xscale = 110;
         _yscale = 110;
      }
   }
   else
   {
      onMe = false;
      if(_root.infoBox.tipText == myTipText)
      {
         _root.infoBox.tipText = null;
      }
      if(_xscale == 110)
      {
         _xscale = 100;
         _yscale = 100;
      }
   }
}

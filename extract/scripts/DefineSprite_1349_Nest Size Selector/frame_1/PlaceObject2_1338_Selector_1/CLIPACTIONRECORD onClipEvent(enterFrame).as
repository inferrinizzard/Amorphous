onClipEvent(enterFrame){
   timeUp++;
   if(hitTest(_root._xmouse,_root._ymouse,false))
   {
      onMe = true;
   }
   else
   {
      onMe = false;
   }
}

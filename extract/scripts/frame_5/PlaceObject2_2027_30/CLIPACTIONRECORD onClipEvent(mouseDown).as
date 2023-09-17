onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Tip Browser","TipBrowser",1000);
      with(_root.TipBrowser)
      {
         _x = 275;
         _y = 205;
      }
      _root.subMenu = true;
   }
}

onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Beastiary Plate","BeastiaryMenu",1000);
      with(_root.BeastiaryMenu)
      {
         _x = 275;
         _y = 205;
      }
      _root.subMenu = true;
   }
}

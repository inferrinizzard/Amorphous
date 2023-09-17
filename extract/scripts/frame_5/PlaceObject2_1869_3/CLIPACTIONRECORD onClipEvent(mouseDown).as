onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Practice Plate","PracticeMenu",1000);
      with(_root.PracticeMenu)
      {
         _x = 275;
         _y = 205;
      }
      _root.subMenu = true;
   }
}

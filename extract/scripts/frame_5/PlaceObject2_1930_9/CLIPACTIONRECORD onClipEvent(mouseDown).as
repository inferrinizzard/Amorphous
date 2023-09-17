onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Option Menu","OptionMenu",1000);
      with(_root.OptionMenu)
      {
         _x = 250;
         _y = 250;
      }
      _root.subMenu = true;
   }
}

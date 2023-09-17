onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Award Case","AwardsCase",1000);
      with(_root.AwardsCase)
      {
         _x = 20;
         _y = 20;
      }
      _root.subMenu = true;
   }
}

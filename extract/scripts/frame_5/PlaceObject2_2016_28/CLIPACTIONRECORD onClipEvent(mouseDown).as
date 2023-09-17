onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Rewards Case","RewardsCase",1000);
      with(_root.RewardsCase)
      {
         _x = 255;
         _y = 195;
      }
      _root.subMenu = true;
   }
}

onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _root.attachMovie("Instruction Plate","InstructionMenu",1000);
      with(_root.InstructionMenu)
      {
         _x = 275;
         _y = 205;
      }
      _root.subMenu = true;
   }
}

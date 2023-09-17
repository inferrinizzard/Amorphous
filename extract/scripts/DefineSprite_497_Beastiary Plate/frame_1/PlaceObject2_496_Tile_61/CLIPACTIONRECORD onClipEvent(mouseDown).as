onClipEvent(mouseDown){
   if(onMe && tileLit && _global.selectedGloople == null)
   {
      _global.MakeNoise("Menu Noise");
      _root.BeastiaryMenu.attachMovie("Data Panel","DataPanel",40);
      _global.selectedGloople = "Horror";
   }
}

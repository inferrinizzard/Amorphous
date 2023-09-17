onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _global.EnemySet.splice(0);
      _global.EnemySet.push("Gloople");
      _root.attachMovie("Nest Size Selector","NestSize",1000);
      with(_root.NestSize)
      {
         _x = 277.5;
         _y = 205;
      }
      _root.subMenu = true;
   }
}

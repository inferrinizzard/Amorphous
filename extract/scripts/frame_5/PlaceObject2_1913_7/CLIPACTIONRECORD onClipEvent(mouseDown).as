onClipEvent(mouseDown){
   if(onMe)
   {
      _global.MakeNoise("Menu Noise");
      _global.EnemySet.splice(0);
      _global.EnemySet.push("Gloople");
      _root.attachMovie("Difficulty Ramp Selector","Difficulty",1000);
      with(_root.Difficulty)
      {
         _x = 277.5;
         _y = 231;
      }
      _root.subMenu = true;
   }
}

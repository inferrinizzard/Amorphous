on(press){
   if(_parent.NestSizeSel.timeUp <= 5)
   {
   }
   _global.interval = 60;
   _global.gameMode = "Single";
   switch(interval)
   {
      case 15:
         breedsInNest = 5;
         _global.NestSize = 200;
         break;
      case 30:
         breedsInNest = 8;
         _global.NestSize = 350;
         break;
      case 60:
         breedsInNest = 11;
         _global.NestSize = 500;
   }
   continue loop0;
}

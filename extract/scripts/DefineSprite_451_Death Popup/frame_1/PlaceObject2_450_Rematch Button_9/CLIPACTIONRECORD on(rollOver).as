on(rollOver){
   switch(_global.RematchesLeft)
   {
      case 3:
         gotoAndStop(2);
         break;
      case 2:
         gotoAndStop(3);
         break;
      case 1:
         gotoAndStop(4);
   }
}

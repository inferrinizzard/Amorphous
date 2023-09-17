onClipEvent(enterFrame){
   if(_global.SingleNestHighScore == 0 && _global.BountyRunHighScore == 0)
   {
      _alpha = 0;
   }
   else
   {
      _alpha = 100;
   }
}

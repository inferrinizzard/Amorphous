onClipEvent(enterFrame){
   if(firesStomped >= 10)
   {
      _global.GainAward("Smother 10 Fires");
   }
   if(_global.gameMode == "Single" && _global.ClearTime >= 10 && perfectRun)
   {
      _global.GainAward("Perfect Run");
   }
}

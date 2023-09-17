onClipEvent(enterFrame){
   TotalNeeded = _level0.getBytesTotal();
   HowMuchDone = _level0.getBytesLoaded();
   PercentDone = int(HowMuchDone / TotalNeeded * 100) + 1;
   gotoAndStop(PercentDone);
}

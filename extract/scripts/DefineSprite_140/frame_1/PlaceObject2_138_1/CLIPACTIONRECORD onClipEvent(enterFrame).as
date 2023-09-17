onClipEvent(enterFrame){
   TotalNeeded = _level0.getBytesTotal();
   HowMuchDone = _level0.getBytesLoaded();
   loadingText.text = int(HowMuchDone / TotalNeeded * 100);
   loadingText.setTextFormat(loadingTextFormat);
}

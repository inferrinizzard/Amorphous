onClipEvent(enterFrame){
   deadText.text = ":" + int(TimeLeft / 30);
   deadText.setTextFormat(deadTextFormat);
   TimeLeft--;
   if(TimeLeft == 0)
   {
      _global.unbuildTo = "Menu";
   }
}

onClipEvent(enterFrame){
   if(_parent.Scroll.viewingAt + 1 < _global.TipsSeen.length)
   {
      gotoAndStop(2);
   }
   else
   {
      gotoAndStop(1);
      _xscale = 100;
      _yscale = 100;
   }
}

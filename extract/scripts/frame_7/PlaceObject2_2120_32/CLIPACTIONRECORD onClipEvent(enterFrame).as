onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_currentframe < 121)
      {
         play();
      }
      if(_currentframe < 81)
      {
         if(int(_currentframe / 5) == _currentframe / 5)
         {
            BubbleName = "_root." + _name + "Bubble" + _global.capDepth;
            duplicateMovieClip(_root.AcidBubble,this._name + "Bubble" + _global.capDepth,16384 + _global.capDepth++);
            BubbleDistance = int(Math.random() * 20);
            BubbleOffset = int(Math.random() * 359) - 180;
            setProperty(BubbleName, _X, this._x + BubbleDistance * Math.sin(BubbleOffset * 0.017453292519943295));
            setProperty(BubbleName, _Y, this._y - BubbleDistance * Math.cos(BubbleOffset * 0.017453292519943295));
         }
      }
      if(_currentframe == 121)
      {
         stop();
      }
   }
   else
   {
      stop();
   }
}

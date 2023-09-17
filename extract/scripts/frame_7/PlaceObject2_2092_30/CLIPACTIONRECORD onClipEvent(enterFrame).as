onClipEvent(enterFrame){
   if(_name != "GloopleMelt" && !_global.pause)
   {
      play();
      _X = hostObject._x;
      _Y = hostObject._y;
      if(_currentframe == 2)
      {
         if(eval(hostObject) == undefined)
         {
            removeMovieClip(this);
         }
         _X = hostObject._x;
         _Y = hostObject._y;
         _rotation = hostObject._rotation;
         if(hostObject._name.slice(0,5) == "Oozle" || hostObject._name.slice(0,4) == "Gray")
         {
            _xscale = 170;
            _yscale = 170;
         }
         if(hostObject._name.slice(0,7) == "Clutter")
         {
            _xscale = hostObject._xscale;
            _yscale = hostObject._yscale;
         }
         hostObject.gotoAndStop(1);
         hostObject.speed = 1;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hostObject._name),1);
      }
      if(_currentframe == 41)
      {
         removeMovieClip(hostObject);
      }
      if(_currentframe == 81)
      {
         removeMovieClip(this);
      }
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
   else
   {
      stop();
   }
}

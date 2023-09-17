onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_currentframe < 121)
      {
         play();
      }
      if(_currentframe == 81)
      {
         duplicateMovieClip(_root.BlackSmoke,_name + "BSmoke",16384 + _global.capDepth++);
         with(eval("_root." + _name + "BSmoke"))
         {
            _x = this._x;
            _y = this._y;
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

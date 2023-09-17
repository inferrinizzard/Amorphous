onClipEvent(enterFrame){
   if(_name != "BiterMorph" && !_global.pause)
   {
      play();
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      _X = hostObject._x;
      _Y = hostObject._y;
      _rotation = hostObject._rotation;
      if(_currentframe == 31)
      {
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hostObject._name),1);
         removeMovieClip(hostObject);
         duplicateMovieClip(_root.Biter,"Biter" + _root.SpawnPoint.ChildCounter,16384 + _global.baddieDepth++);
         with(eval("_root.Biter" + _root.SpawnPoint.ChildCounter))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         _global.Enemies.push("Biter" + _root.SpawnPoint.ChildCounter);
         _root.SpawnPoint.ChildCounter = _root.SpawnPoint.ChildCounter + 1;
         removeMovieClip(this);
      }
   }
   else if(_name != "BiterMorph")
   {
      stop();
   }
}

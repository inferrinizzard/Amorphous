onClipEvent(enterFrame){
   if(_name != "QueenSeed" && !_global.pause)
   {
      if(_currentframe > 1)
      {
         play();
      }
      if(eval(hostObject) == undefined && _currentframe < 21)
      {
         removeMovieClip(this);
      }
      if(_currentframe < 21)
      {
         _X = hostObject._x;
         _Y = hostObject._y;
         _rotation = hostObject._rotation;
      }
      if(eval(mommyQueen) == undefined && _global.QueenRevive == true && eval(hostObject) != undefined)
      {
         gotoAndPlay(2);
         _global.QueenRevive = false;
         _global.BossOnDeck = true;
         _global.MakeNoise("QueenHatch");
      }
      if(_currentframe == 21)
      {
         hostObject.killedBy = this;
      }
      if(_currentframe == 61)
      {
         duplicateMovieClip(_root.Queen,"Queen" + _root.SpawnPoint.ChildCounter,16384 + _global.baddieDepth++);
         mommyQueen = eval("_root.Queen" + _root.SpawnPoint.ChildCounter);
         _global.Enemies.push("Queen" + _root.SpawnPoint.ChildCounter);
         _root.SpawnPoint.ChildCounter = _root.SpawnPoint.ChildCounter + 1;
         with(mommyQueen)
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         this.removeMovieClip();
      }
   }
   else
   {
      stop();
   }
}

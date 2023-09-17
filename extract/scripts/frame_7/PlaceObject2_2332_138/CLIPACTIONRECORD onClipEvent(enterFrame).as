onClipEvent(enterFrame){
   if(_name != "GloopleBurn" && !_global.pause)
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
         if(hostObject._name.slice(0,7) == "Amalgam")
         {
            _xscale = hostObject._xscale + 70;
            _yscale = hostObject._yscale + 70;
         }
         hostObject.gotoAndStop(1);
         hostObject.speed = 1;
         _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hostObject._name),1);
      }
      if(_currentframe == 41)
      {
         removeMovieClip(hostObject);
         duplicateMovieClip(_root.BlackSmoke,_name + "BSmoke",16384 + _global.capDepth++);
         with(eval("_root." + _name + "BSmoke"))
         {
            _x = this._x;
            _y = this._y;
         }
      }
      if(_currentframe == 81)
      {
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

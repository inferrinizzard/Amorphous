onClipEvent(enterFrame){
   if(_name != "Goo" && !_global.pause)
   {
      play();
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      _X = hostObject._x;
      _Y = hostObject._y;
      _rotation = hostObject._rotation;
      if(_currentframe == 12)
      {
         if(hostObject._name != "HeroPointer")
         {
            hostObject.speed /= 2;
         }
      }
      if(_currentframe == 30 && hostObject._name.slice(0,6) == "Meltie")
      {
         _global.MakeNoise("Sizzle");
         gotoAndPlay(41);
      }
      if(_currentframe == 30 && hostObject._name.slice(0,7) == "Frostie")
      {
         iceNum = 4;
         ice = 1;
         while(ice < iceNum)
         {
            IceName = "_root." + this._name + "Ice" + ice;
            duplicateMovieClip(eval("_root.Ice" + String(random(3) + 1)),this._name + "Ice" + Ice,16384 + _global.effectDepth++);
            setProperty(IceName, _rotation, this._rotation + int(Math.random() * 100) - 59);
            setProperty(IceName, _X, this._x);
            setProperty(IceName, _Y, this._y);
            ice++;
         }
         gotoAndPlay(55);
      }
      if(_currentframe == 40 && framesExisted < 166)
      {
         gotoAndPlay(16);
      }
      framesExisted++;
      if(_currentframe == 55)
      {
         if(hostObject._name != "HeroPointer")
         {
            hostObject.speed *= 2;
         }
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}

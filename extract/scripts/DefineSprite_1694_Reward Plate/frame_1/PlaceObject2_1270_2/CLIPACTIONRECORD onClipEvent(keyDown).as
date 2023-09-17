onClipEvent(keyDown){
   if(onMe && _parent.myIcon._currentframe == 1)
   {
      if(Key.getCode() == 65 && _global.ABind != myReward)
      {
         _global.MakeNoise("Bind Reward Key");
         _parent._parent.attachMovie("Key Bound Reticle","ABindRing",1050);
         with(_parent._parent.ABindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         _global.ABind = myReward;
         if(_global.SBind == myReward)
         {
            _global.SBind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
         if(_global.DBind == myReward)
         {
            _global.DBind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
      }
      else if(Key.getCode() == 83 && _global.Awards.length >= 55 && _global.SBind != myReward)
      {
         _global.MakeNoise("Bind Reward Key");
         _parent._parent.attachMovie("Key Bound Reticle","SBindRing",1051);
         with(_parent._parent.SBindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         _global.SBind = myReward;
         if(_global.ABind == myReward)
         {
            _global.ABind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
         if(_global.DBind == myReward)
         {
            _global.DBind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
      }
      else if(Key.getCode() == 68 && _global.Awards.length == 110 && _global.DBind != myReward)
      {
         _global.MakeNoise("Bind Reward Key");
         _parent._parent.attachMovie("Key Bound Reticle","DBindRing",1052);
         with(_parent._parent.DBindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
         _global.DBind = myReward;
         if(_global.ABind == myReward)
         {
            _global.ABind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
         if(_global.SBind == myReward)
         {
            _global.SBind = null;
            _global.MakeNoise("UnBind Reward Key");
         }
      }
   }
}

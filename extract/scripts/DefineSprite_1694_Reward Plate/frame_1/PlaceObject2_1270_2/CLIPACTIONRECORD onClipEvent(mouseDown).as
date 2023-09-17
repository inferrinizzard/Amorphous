onClipEvent(mouseDown){
   if(onMe && _parent.myIcon._currentframe == 3 && _parent._parent.myKeys.length > 0)
   {
      if(myReward == "Glaive")
      {
         scaryKeyPos = _global.SearchArray(_parent._parent.myKeys,"razorKey");
         if(scaryKeyPos != null)
         {
            myLock.gotoAndStop(2);
            _global.MakeNoise("Unlock 2");
            _global.MakeNoise("Unlock Jingle");
            _global.RewardsUnlocked.push(myReward);
            _parent.myIcon.gotoAndStop(1);
            _parent._parent.myKeys.splice(scaryKeyPos,1);
            _root.razorKey.removeMovieClip();
            _global.saveData();
         }
      }
      else
      {
         howManyKeys = _parent._parent.myKeys.length;
         x = howManyKeys;
         while(x > 0)
         {
            keyToUse = _parent._parent.myKeys[x - 1];
            if(keyToUse != "razorKey")
            {
               myLock.gotoAndStop(2);
               _global.MakeNoise("Unlock 1");
               _global.MakeNoise("Unlock Jingle");
               _global.RewardsUnlocked.push(myReward);
               _parent.myIcon.gotoAndStop(1);
               removeMovieClip(eval("_root." + keyToUse));
               _parent._parent.myKeys.splice(x - 1,1);
               _global.saveData();
               x = 0;
            }
            x--;
         }
      }
   }
   else if(onMe && _parent.myIcon._currentframe == 1)
   {
      if(_global.RewardKey(myReward) == null)
      {
         if(_global.ABind == null)
         {
            _global.MakeNoise("Bind Reward Key");
            _parent._parent.attachMovie("Key Bound Reticle","ABindRing",1050);
            with(_parent._parent.ABindRing)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            _global.ABind = myReward;
         }
         else if(_global.SBind == null && _global.Awards.length >= 55)
         {
            _global.MakeNoise("Bind Reward Key");
            _parent._parent.attachMovie("Key Bound Reticle","SBindRing",1051);
            with(_parent._parent.SBindRing)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            _global.SBind = myReward;
         }
         else if(_global.DBind == null && _global.Awards.length >= 110)
         {
            _global.MakeNoise("Bind Reward Key");
            _parent._parent.attachMovie("Key Bound Reticle","DBindRing",1052);
            with(_parent._parent.DBindRing)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            _global.DBind = myReward;
         }
         else
         {
            _global.MakeNoise("Bind Reward Key");
            _parent._parent.attachMovie("Key Bound Reticle","ABindRing",1050);
            with(_parent._parent.ABindRing)
            {
               _x = this._parent._x;
               _y = this._parent._y;
            }
            _global.ABind = myReward;
         }
      }
      else if(_global.ABind == myReward)
      {
         _parent._parent.ABindRing.removeMovieClip();
         _global.ABind = null;
         _global.MakeNoise("UnBind Reward Key");
      }
      else if(_global.SBind == myReward)
      {
         _parent._parent.SBindRing.removeMovieClip();
         _global.SBind = null;
         _global.MakeNoise("UnBind Reward Key");
      }
      else if(_global.DBind == myReward)
      {
         _parent._parent.DBindRing.removeMovieClip();
         _global.DBind = null;
         _global.MakeNoise("UnBind Reward Key");
      }
   }
}

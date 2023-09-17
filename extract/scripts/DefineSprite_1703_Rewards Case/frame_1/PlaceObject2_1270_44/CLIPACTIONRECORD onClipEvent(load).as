onClipEvent(load){
   _parent.myKeys = new Array();
   keyPosition = 0;
   keysOnRing = int(_global.Awards.length / 10) - _global.RewardsUnlocked.length;
   if(_global.SearchArray(_global.RewardsUnlocked,"Glaive") != null)
   {
      keysOnRing++;
   }
   x = 1;
   while(x <= keysOnRing)
   {
      keyName = "rewardKey" + x;
      _root.attachMovie("Reward Key",keyName,1050 + keyPosition);
      with(eval("_root." + keyName))
      {
         _x = _root._xmouse + keyPosition;
         _y = _root._ymouse + keyPosition;
      }
      keyPosition += 5;
      _parent.myKeys.push(keyName);
      x++;
   }
   if(_global.SearchArray(_global.RewardsUnlocked,"Glaive") == null)
   {
      if(_global.SearchArray(_global.Awards,"First Razor Queen") != null)
      {
         _root.attachMovie("Reward Key Razor","razorKey",1040);
         with(_root.razorKey)
         {
            _x = _root._xmouse - 5;
            _y = _root._ymouse - 5;
         }
         _parent.myKeys.push("razorKey");
      }
   }
}

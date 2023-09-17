onClipEvent(enterFrame){
   if(_root._xmouse <= myBindingBox.xMax && _root._xmouse >= myBindingBox.xMin && _root._ymouse <= myBindingBox.yMax && _root._ymouse >= myBindingBox.yMin)
   {
      onMe = true;
      _parent.myIcon._xscale = 110;
      _parent.myIcon._yscale = 110;
   }
   else
   {
      onMe = false;
      _parent.myIcon._xscale = 100;
      _parent.myIcon._yscale = 100;
   }
   if(onMe)
   {
      if(_parent.myIcon._currentframe == 1)
      {
         if(_parent._parent.displayShow != myInfoText)
         {
            _parent._parent.displayShow = myInfoText;
         }
      }
      else if(_parent._parent.myKeys.length > 0)
      {
         if(myReward == "Glaive")
         {
            if(_global.SearchArray(_parent._parent.myKeys,"razorKey") != null)
            {
               _parent._parent.displayShow = "Click here to use that strange Key to remove this lock and get at the unique Reward hidden within...";
            }
            else
            {
               _parent._parent.displayShow = "Normal Reward Keys will not release this lock... it apears something special is required...";
            }
         }
         else if(_parent._parent.myKeys.length > 1 || _parent._parent.myKeys[0] != "razorKey")
         {
            _parent._parent.displayShow = "Click here to use a Key to release this lock and bring this Reward into battle with you.";
         }
         else
         {
            _parent._parent.displayShow = "That strange Key will not fit this lock.";
         }
      }
      else
      {
         _parent._parent.displayShow = "Gain Awards to earn a Key to open this lock and access the reward it hides...";
      }
      tipFocus = true;
   }
   else if(tipFocus)
   {
      _parent._parent.displayShow = null;
      tipFocus = false;
   }
}

onClipEvent(enterFrame){
   if(myAward == null && Acquired)
   {
      _parent.attachMovie("Award","myAward",2);
      _parent.myAward.comm = myComm;
      myAward = _parent.myAward;
      if(_global.SearchArray(_global.NewAwards,myComm) != null)
      {
         _parent.attachMovie("Award Glow","myGlow",1);
         AwardIsNew = true;
         _global.NewAwards.splice(_global.SearchArray(_global.NewAwards,myComm),1);
      }
   }
   if(myAward != null && Acquired)
   {
      if(_root._xmouse <= myBindingBox.xMax && _root._xmouse >= myBindingBox.xMin && _root._ymouse <= myBindingBox.yMax && _root._ymouse >= myBindingBox.yMin)
      {
         if(onMe < 25)
         {
            onMe++;
         }
         if(myAward._xscale < 400)
         {
            myAward._xscale += 40;
            myAward._yscale += 40;
         }
         else if(myAward._xscale > 400)
         {
            myAward._xscale = 400;
            myAward._yscale = 400;
            if(AwardIsNew)
            {
               _parent.myGlow.removeMovieClip();
               AwardIsNew = false;
            }
         }
         else if(onMe == 25)
         {
            _global.InspectingAward = myComm;
         }
         _parent.swapDepths(1000);
      }
      else
      {
         onMe = 0;
         if(_global.InspectingAward == myComm)
         {
            _global.InspectingAward = null;
         }
         if(myAward._xscale > 100)
         {
            myAward._xscale -= 40;
            myAward._yscale -= 40;
         }
         else if(myAward._xscale < 100)
         {
            myAward._xscale = 100;
            myAward._yscale = 100;
         }
         _parent.swapDepths(homeDepth);
      }
   }
}

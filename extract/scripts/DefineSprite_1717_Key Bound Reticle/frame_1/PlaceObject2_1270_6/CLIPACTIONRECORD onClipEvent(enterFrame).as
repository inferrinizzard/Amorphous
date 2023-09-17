onClipEvent(enterFrame){
   if(_parent._xscale > 100)
   {
      _parent._xscale -= 25;
      _parent._yscale -= 25;
      _parent._alpha += 10;
   }
   else if(_parent._currentframe == 1)
   {
      switch(myBind)
      {
         case "A":
            _parent.gotoAndStop(2);
            break;
         case "S":
            _parent.gotoAndStop(3);
            break;
         case "D":
            _parent.gotoAndStop(4);
      }
   }
   _parent.InnerRing._rotation -= 2;
   _parent.OuterRing._rotation += 4;
   if(_root.subMenu == false)
   {
      _parent.removeMovieClip();
   }
   switch(myBind)
   {
      case "A":
         if(_global.ABind == null)
         {
            _parent.removeMovieClip();
         }
         break;
      case "S":
         if(_global.SBind == null)
         {
            _parent.removeMovieClip();
         }
         break;
      case "D":
         if(_global.DBind == null)
         {
            _parent.removeMovieClip();
         }
   }
}

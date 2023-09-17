onClipEvent(enterFrame){
   if(active)
   {
      _parent.InnerRing._rotation -= 3;
      _parent.OuterRing._rotation += 6;
      switch(myBind)
      {
         case "A":
            if(_global.ABind == null)
            {
               _parent._visible = true;
               _parent.gotoAndStop(1);
            }
            else
            {
               _parent._visible = false;
            }
            break;
         case "S":
            if(_global.SBind == null)
            {
               _parent._visible = true;
               _parent.gotoAndStop(2);
            }
            else
            {
               _parent._visible = false;
            }
            break;
         case "D":
            if(_global.DBind == null)
            {
               _parent._visible = true;
               _parent.gotoAndStop(3);
            }
            else
            {
               _parent._visible = false;
            }
      }
   }
}

onClipEvent(load){
   myBind = _parent._name.slice(0,1);
   active = true;
   switch(myBind)
   {
      case "A":
         _parent.gotoAndStop(1);
         break;
      case "S":
         _parent.gotoAndStop(2);
         if(_global.Awards.length < 55)
         {
            active = false;
         }
         break;
      case "D":
         _parent.gotoAndStop(3);
         if(_global.Awards.length < 110)
         {
            active = false;
         }
   }
   if(!active)
   {
      _parent._visible = false;
   }
}

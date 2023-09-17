onClipEvent(load){
   if(_name == "Goo")
   {
      stop();
   }
   else
   {
      framesExisted = 0;
      hostObject = eval("_root." + _name.slice(0,_name.length - 3));
      if(hostObject._name.slice(0,7) == "Clutter")
      {
         _xscale = hostObject._xscale;
         _yscale = hostObject._yscale;
      }
   }
}

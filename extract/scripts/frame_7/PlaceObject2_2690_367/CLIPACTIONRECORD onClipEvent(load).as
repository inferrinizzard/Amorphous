onClipEvent(load){
   if(_name == "BiterLunge")
   {
      stop();
   }
   else
   {
      daddyBiter = eval("_root." + _name.slice(0,_name.length - 5));
   }
}

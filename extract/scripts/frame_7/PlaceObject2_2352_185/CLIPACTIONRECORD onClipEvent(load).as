onClipEvent(load){
   if(_name == "BiterMorph")
   {
      stop();
   }
   else
   {
      hostObject = eval("_root." + _name.slice(0,_name.length - 5));
   }
}

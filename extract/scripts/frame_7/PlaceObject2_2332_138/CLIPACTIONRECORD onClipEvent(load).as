onClipEvent(load){
   if(_name == "GloopleBurn")
   {
      stop();
   }
   else
   {
      hostObject = eval("_root." + _name.slice(0,_name.length - 11));
   }
}

onClipEvent(load){
   if(_name != "SlickTag")
   {
      _visible = false;
      framesExisted = 0;
      hostObject = eval("_root." + _name.slice(0,_name.length - 8));
      hostTurnSpeed = 0;
      hostSpeed = 0;
   }
}

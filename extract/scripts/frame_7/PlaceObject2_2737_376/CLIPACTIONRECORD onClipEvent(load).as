onClipEvent(load){
   if(_name == "HeroMangle")
   {
      stop();
   }
   else
   {
      speed = 4;
      playsthrough = 0;
      splats = 0;
      daddyBiter = eval("_root." + _name.slice(0,_name.length - 8));
   }
}

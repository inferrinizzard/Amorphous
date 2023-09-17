onClipEvent(load){
   if(_name == "HeroChow")
   {
      stop();
   }
   else
   {
      speed = 4;
      playsthrough = 0;
      splats = 0;
      daddyFuzzle = eval("_root." + _name.slice(0,_name.length - 7));
   }
}

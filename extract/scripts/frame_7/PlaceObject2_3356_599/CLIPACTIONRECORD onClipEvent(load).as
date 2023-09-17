onClipEvent(load){
   if(_name == "HeroHalf")
   {
      stop();
   }
   else
   {
      splats = 0;
      if(_name.slice(_name.length - 1,_name.length) == "2")
      {
         _xscale = -100;
      }
      Method = int(Math.random() * 3) + 1;
   }
}

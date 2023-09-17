onClipEvent(load){
   if(_name == "RazorLarvaPop")
   {
      stop();
   }
   else
   {
      if(int(Math.random() * 2) == 1)
      {
         _xscale = -100;
      }
      _rotation = int(Math.random() * 360) - 179;
   }
}

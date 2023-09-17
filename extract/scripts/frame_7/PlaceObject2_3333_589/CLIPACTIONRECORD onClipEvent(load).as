onClipEvent(load){
   if(_name == "GroundDirt")
   {
      stop();
   }
   else if(int(Math.random() * 2) == 1)
   {
      _xscale = -100;
   }
}

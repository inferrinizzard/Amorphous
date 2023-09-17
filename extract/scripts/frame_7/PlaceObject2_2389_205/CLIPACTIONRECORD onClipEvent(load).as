onClipEvent(load){
   if(_name == "HeroTorso")
   {
      stop();
   }
   else
   {
      speed = int(Math.random() * 3) + 2;
   }
}

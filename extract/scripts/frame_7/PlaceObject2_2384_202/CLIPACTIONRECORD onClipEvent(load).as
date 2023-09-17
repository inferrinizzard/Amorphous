onClipEvent(load){
   if(_name != "HeroHead")
   {
      flyRange = int(Math.random() * 10) + 5;
      speed = 4;
      framesAtSpeed = 0;
      prints = 0;
   }
   else
   {
      stop();
   }
}

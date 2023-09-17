onClipEvent(load){
   mommy = false;
   justBounced = 0;
   printcount = 0;
   if(_name == "HeroImpaled")
   {
      mommy = true;
      stop();
   }
   else
   {
      killedBy = null;
      spines = true;
      speed = 3;
      turnSpeed = 3;
      _global.Enemies.push(_name);
   }
}

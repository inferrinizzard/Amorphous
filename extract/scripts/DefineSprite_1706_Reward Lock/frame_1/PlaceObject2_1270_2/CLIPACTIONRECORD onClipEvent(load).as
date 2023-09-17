onClipEvent(load){
   _parent.stop();
   flyFor = 300;
   flyOff = false;
   _parent._rotation = int(Math.random() * 20) - 10;
   listTo = 0;
   speed = 0;
   twist = int(Math.random() * 4) + 4;
   if(int(Math.random() * 2) == 1)
   {
      twist *= -1;
   }
}

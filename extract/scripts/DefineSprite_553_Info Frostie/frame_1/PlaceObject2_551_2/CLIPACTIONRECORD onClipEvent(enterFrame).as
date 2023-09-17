onClipEvent(enterFrame){
   if(frosts < 10 && int(Math.random() * 5) == 1)
   {
      attachMovie("Frost","Frost" + frostCounter,frostCounter);
      with(eval("Frost" + frostCounter))
      {
         _rotation += int(Math.random() * 360);
         _x += int(Math.random() * 30) - 15;
         _y += int(Math.random() * 30) - 15;
      }
      frosts++;
      frostCounter++;
      if(frostCounter == 10)
      {
         frostCounter = 0;
      }
   }
   x = 0;
   while(x < 10)
   {
      lookFrost = eval("Frost" + x);
      if(lookFrost != null)
      {
         if(lookFrost._xscale == 60 && int(Math.random() * 10) == 1)
         {
            lookFrost.removeMovieClip();
            frosts--;
         }
         if(lookFrost._xscale > 60)
         {
            lookFrost._xscale -= 2;
            lookFrost._yscale -= 2;
         }
      }
      x++;
   }
}

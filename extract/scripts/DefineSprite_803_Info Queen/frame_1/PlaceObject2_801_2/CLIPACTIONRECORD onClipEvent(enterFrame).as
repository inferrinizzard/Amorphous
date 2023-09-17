onClipEvent(enterFrame){
   if(wisps < 10 && int(Math.random() * 5) == 1)
   {
      attachMovie("Queen Wisp","Wisp" + wispCounter,wispCounter);
      with(eval("Wisp" + wispCounter))
      {
         whereOnSkin = int(Math.random() * 359) - 180;
         if(int(Math.random() * 2) == 1)
         {
            _xscale = -100;
         }
         _rotation = this._rotation + whereOnSkin;
         _x += 10 * Math.sin(_rotation * 0.017453292519943295);
         _y -= 10 * Math.cos(_rotation * 0.017453292519943295);
      }
      wisps++;
      wispCounter++;
      if(wispCounter == 10)
      {
         wispCounter = 0;
      }
   }
   x = 0;
   while(x < 10)
   {
      lookWisp = eval("Wisp" + x);
      if(lookWisp != null)
      {
         if(lookWisp._currentframe == 56)
         {
            lookWisp.removeMovieClip();
            wisps--;
         }
      }
      x++;
   }
}

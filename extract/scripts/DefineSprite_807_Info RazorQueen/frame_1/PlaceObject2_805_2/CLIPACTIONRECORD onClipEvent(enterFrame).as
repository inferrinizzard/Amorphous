onClipEvent(enterFrame){
   if(teeth < 10 && int(Math.random() * 20) == 1)
   {
      attachMovie("Razor Tooth","Tooth" + toothCounter,toothCounter);
      with(eval("Tooth" + toothCounter))
      {
         whereOnSkin = int(Math.random() * 359) - 180;
         _yscale = 50;
         if(int(Math.random() * 2) == 1)
         {
            _xscale = -50;
         }
         else
         {
            _xscale = 50;
         }
         _rotation += whereOnSkin;
         _x += 2 * Math.sin(_rotation * 0.017453292519943295);
         _y -= 2 * Math.cos(_rotation * 0.017453292519943295);
      }
      teeth++;
      toothCounter++;
      if(toothCounter == 10)
      {
         toothCounter = 0;
      }
   }
   x = 0;
   while(x < 10)
   {
      lookTooth = eval("Tooth" + x);
      if(lookTooth != null)
      {
         with(lookTooth)
         {
            toHost_x = _x - this._x;
            toHost_y = _y - this._y;
            offSet = Math.sqrt(toHost_x * toHost_x + toHost_y * toHost_y);
            if(_yscale < 100)
            {
               if(_xscale < 0)
               {
                  _xscale -= 5;
               }
               else
               {
                  _xscale += 5;
               }
               _yscale += 5;
               _y -= 0.2 * Math.cos(_rotation * 0.017453292519943295);
               _x += 0.2 * Math.sin(_rotation * 0.017453292519943295);
            }
            else if(_yscale < 105)
            {
               _yscale += 0.2;
               _y -= 0.5 * Math.cos(_rotation * 0.017453292519943295);
               _x += 0.5 * Math.sin(_rotation * 0.017453292519943295);
            }
            else
            {
               this.teeth--;
               lookTooth.removeMovieClip();
            }
         }
      }
      x++;
   }
}

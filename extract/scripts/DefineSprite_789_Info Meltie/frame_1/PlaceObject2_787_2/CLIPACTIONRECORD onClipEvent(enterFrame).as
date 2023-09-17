onClipEvent(enterFrame){
   if(_currentframe == 20 || _currentframe == 40 || _currentframe == 60)
   {
      switch(_currentframe)
      {
         case 20:
            bubbleRotation = _rotation + 45;
            break;
         case 40:
            bubbleRotation = _rotation - 90;
            break;
         case 60:
            bubbleRotation = _rotation - 180;
      }
      if(bubbleRotation > 179)
      {
         bubbleRotation -= 360;
      }
      if(bubbleRotation < -180)
      {
         bubbleRotation += 360;
      }
      PopName = "_root." + this._name + "Pop" + _currentframe;
      attachMovie("Splat" + String(random(3) + 1),"Pop" + _currentframe,_currentframe);
      with(eval("Pop" + _currentframe))
      {
         _rotation = bubbleRotation;
         _x += 10 * Math.sin(bubbleRotation * 0.017453292519943295);
         _y -= 10 * Math.cos(bubbleRotation * 0.017453292519943295);
         _xscale = 30;
         _yscale = 30;
         PopColor = new Color(eval("Pop" + this._currentframe));
         PopColor.setRGB(15898925);
      }
   }
   x = 20;
   while(x < 80)
   {
      popName = eval("Pop" + x);
      if(popName != null)
      {
         if(popName._currentframe == 32)
         {
            popName.removeMovieClip();
         }
      }
      x += 20;
   }
}

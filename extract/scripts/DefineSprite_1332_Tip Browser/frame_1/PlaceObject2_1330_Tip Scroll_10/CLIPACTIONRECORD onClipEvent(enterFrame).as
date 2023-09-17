onClipEvent(enterFrame){
   targetY = -150 * (viewingAt - 1);
   currentY = _Y - startingY;
   gap = Math.abs(targetY - currentY);
   if(targetY < currentY)
   {
      if(gap > 300)
      {
         _Y = _Y - 25;
      }
      else if(gap > 20)
      {
         _Y = _Y - 10;
      }
      else if(gap > 0)
      {
         _Y = _Y - 5;
      }
   }
   else if(targetY > currentY)
   {
      if(gap > 300)
      {
         _Y = _Y + 25;
      }
      else if(gap > 20)
      {
         _Y = _Y + 10;
      }
      else if(gap > 0)
      {
         _Y = _Y + 5;
      }
   }
}

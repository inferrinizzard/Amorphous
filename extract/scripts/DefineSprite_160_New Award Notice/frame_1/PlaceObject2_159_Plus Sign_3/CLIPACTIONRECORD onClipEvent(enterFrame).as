onClipEvent(enterFrame){
   if(yVector < 10)
   {
      _parent._y += yVector;
      if(yVector < -1)
      {
         yVector += 0.5;
      }
      else if(yVector < 1)
      {
         if(yVector > -0.01 && yVector < 0)
         {
            yVector = 0;
         }
         if(yVector == 0 && stallTime < 20)
         {
            stallTime++;
         }
         else
         {
            yVector += 0.1;
         }
      }
      else
      {
         yVector += 0.5;
      }
   }
   else
   {
      removeMovieClip(_parent);
   }
}

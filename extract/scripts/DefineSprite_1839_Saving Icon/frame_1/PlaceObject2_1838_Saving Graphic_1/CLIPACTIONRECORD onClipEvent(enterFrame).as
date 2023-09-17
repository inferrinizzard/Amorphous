onClipEvent(enterFrame){
   if(framesExisted > 30)
   {
      if(_alpha > 0)
      {
         _alpha = _alpha - 2;
      }
      else
      {
         removeMovieClip(_parent);
      }
   }
   framesExisted++;
}

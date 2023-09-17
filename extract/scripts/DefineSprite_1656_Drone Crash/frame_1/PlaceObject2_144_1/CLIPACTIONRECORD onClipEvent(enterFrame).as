onClipEvent(enterFrame){
   if(framesExisted > 120)
   {
      _parent._alpha -= 5;
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
   }
   framesExisted++;
}

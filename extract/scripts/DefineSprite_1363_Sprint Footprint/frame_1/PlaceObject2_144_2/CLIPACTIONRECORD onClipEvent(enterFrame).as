onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(lifeSpan > 0)
      {
         lifeSpan--;
      }
      else
      {
         _parent._alpha -= 20;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
   }
}

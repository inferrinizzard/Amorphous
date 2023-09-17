onClipEvent(enterFrame){
   if(framesExisted > 120)
   {
      if(_parent._alpha <= 0)
      {
         if(eval(_root.jukeboxBack) != undefined)
         {
            removeMovieClip(_root.jukeboxBack);
         }
         removeMovieClip(_parent);
      }
      else
      {
         _parent._alpha -= 2;
         if(eval(_root.jukeboxBack) != undefined)
         {
            _root.jukeboxBack._alpha -= 1;
         }
      }
   }
   framesExisted++;
   if(eval(_root.jukeboxBack) != undefined && _root._currentframe == 7)
   {
      removeMovieClip(_root.jukeboxBack);
   }
}

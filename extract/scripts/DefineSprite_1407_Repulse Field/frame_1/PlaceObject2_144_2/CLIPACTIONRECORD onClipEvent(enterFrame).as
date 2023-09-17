onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(eval(_root.mySpike) == undefined)
      {
         _parent.removeMovieClip();
      }
      _parent._rotation -= 1.5;
      if(_parent._xscale < 100)
      {
         _parent._xscale += 10;
         _parent._yscale += 10;
      }
   }
}

onClipEvent(enterFrame){
   if(_name != "RazorSpike" && !_global.pause)
   {
      if(speed != 0)
      {
         _Y = _Y - speed * Math.cos(moveDirection * 0.017453292519943295);
         _X = _X + speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            if(speed > 2)
            {
               speed /= 2;
               framesAtSpeed = 0;
               _yscale = _yscale - 30;
            }
            else
            {
               speed = 0;
            }
         }
         if(_root.HeroPointer.hitTest(_X,_Y,true) && speed > 2)
         {
            _global.justHit = this;
         }
      }
      else if(framesAtSpeed >= 30)
      {
         removeMovieClip(this);
      }
      framesAtSpeed++;
   }
}

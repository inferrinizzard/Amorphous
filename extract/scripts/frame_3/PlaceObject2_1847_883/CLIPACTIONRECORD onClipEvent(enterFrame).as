onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_name != "Blackout" && !Blink && Fade)
      {
         if(framesExisted > 90)
         {
            if(_alpha > 0)
            {
               _alpha--;
            }
            else
            {
               if(!HeroKilled)
               {
                  _global.GainAward("Survive Blackout");
               }
               removeMovieClip(this);
            }
         }
         else
         {
            framesExisted++;
         }
         if(_root.HeroPointer.killsOnSwing > 0 && _alpha > 50)
         {
            _global.GainAward("Blind Kill");
         }
      }
      else if(Blink)
      {
         _alpha = _alpha - 20;
         if(_alpha <= 0)
         {
            removeMovieClip(this);
         }
      }
   }
}

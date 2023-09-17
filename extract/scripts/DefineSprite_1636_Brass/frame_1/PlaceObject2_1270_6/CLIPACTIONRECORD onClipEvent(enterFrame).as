onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!atRest)
      {
         if(!tumble)
         {
            _parent._rotation += spin;
         }
         else
         {
            _parent.play();
         }
         if(tumble && tumbleFast)
         {
            _parent.nextFrame();
         }
         _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
         _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
         if(framesAtSpeed >= 10)
         {
            speed -= 0.1;
            framesAtSpeed = 0;
         }
         if(flight < 30)
         {
            _parent._xscale += lift;
            _parent._yscale += lift;
         }
         else
         {
            _parent._xscale -= lift;
            _parent._yscale -= lift;
         }
         if(_parent._yscale < 100)
         {
            if(!tink)
            {
               tink = true;
               flight = 15;
               lift /= 2;
               speed /= 2;
               spin /= 2;
               _parent._xscale = 100;
               _parent._yscale = 100;
               tumbleFast = false;
               _global.MakeNoise("Brass" + String(int(Math.random() * 3) + 1));
            }
            else
            {
               if(tumble)
               {
                  if(_parent._currentframe < 12 || _parent._currentframe > 31)
                  {
                     _parent.gotoAndStop(1);
                  }
                  else
                  {
                     _parent.gotoAndStop(20);
                  }
               }
               atRest = true;
               _parent._xscale -= lift;
               _parent._yscale -= lift;
               framesAtSpeed = 0;
               _parent.swapDepths(_global.effectDepth++);
            }
         }
         flight++;
      }
      else if(framesAtSpeed <= 300)
      {
         _parent.stop();
         _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
         _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
         if(speed > 0)
         {
            if(listLeft)
            {
               moveDirection -= 5;
               _parent._rotation -= 5;
            }
            else
            {
               moveDirection += 5;
               _parent._rotation += 5;
            }
            if(moveDirection > 180)
            {
               moveDirection -= 360;
            }
            if(moveDirection < -180)
            {
               moveDirection += 360;
            }
            speed -= 0.2;
         }
         else
         {
            speed = 0;
         }
      }
      else
      {
         _parent._alpha -= 5;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
      framesAtSpeed++;
   }
}

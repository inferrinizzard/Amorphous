onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(lifeSpan > 0)
      {
         lifeSpan--;
         if(lifeSpan > 35)
         {
            _parent._xscale += 2;
            _parent._yscale += 2;
         }
         else if(lifeSpan > 20)
         {
            _parent._xscale -= 2;
            _parent._yscale -= 2;
         }
         else if(lifeSpan > 10)
         {
            _parent._xscale += 4;
            _parent._yscale += 4;
         }
         else
         {
            _parent._xscale -= 4;
            _parent._yscale -= 4;
         }
         if(lifeSpan == 20 || lifeSpan == 1)
         {
            _global.MakeNoise("Dirt Hit");
         }
         roll++;
         switch(roll)
         {
            case 3:
               _parent.gotoAndStop(2);
               break;
            case 6:
               _parent.gotoAndStop(3);
               break;
            case 9:
               _parent.gotoAndStop(4);
               break;
            case 12:
               _parent.gotoAndStop(1);
               roll = 0;
         }
      }
      else
      {
         if(payload == 450)
         {
            _global.MakeNoise("Lure Hiss Start");
            myHiss.start(0,100);
         }
         if(speed >= 1)
         {
            speed--;
         }
         _parent.luring = true;
         if(payload > 0)
         {
            if(payload / 10 == int(payload / 10))
            {
               _root.attachMovie("Pheremone","Pher" + payload,_global.capDepth++);
               with(eval("_root.Pher" + payload))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = windDirection;
               }
               windDirection += int(Math.random() * 10) - 5;
               if(windDirection > 180)
               {
                  windDirection -= 360;
               }
               if(windDirection < -180)
               {
                  windDirection += 360;
               }
            }
            payload--;
         }
         else if(_parent._alpha > 0)
         {
            _parent.luring = false;
            myHiss.stop();
            _parent._alpha -= 20;
         }
         else
         {
            _parent.removeMovieClip();
         }
      }
      _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
      _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
      if(speed > 0)
      {
         speed -= 0.05;
      }
      else
      {
         speed = 0;
      }
      if(_parent._y < -5 || _parent._x < -5 || _parent._y > 405 || _parent._x > 555)
      {
         myTab = eval(_global.RewardTab("Lure"));
         myTab.charge = 200;
         _parent.removeMovieClip();
      }
   }
}

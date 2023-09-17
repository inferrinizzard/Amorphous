onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!buried)
      {
         _parent._rotation += 100;
         _parent._y -= speed * Math.cos(moveDirection * 0.017453292519943295);
         _parent._x += speed * Math.sin(moveDirection * 0.017453292519943295);
         if(Skyward)
         {
            _parent._xscale += 10;
            _parent._yscale += 10;
         }
         else
         {
            _parent._xscale--;
            _parent._yscale--;
            if(_parent._xscale <= 80)
            {
               _parent._rotation = moveDirection;
               _parent.gotoAndStop(2);
               DirtName = _parent._name + "Dirt";
               duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
               with(eval("_root." + DirtName))
               {
                  _x = this._parent._x;
                  _y = this._parent._y;
                  _rotation = this._parent._rotation;
               }
               buried = true;
            }
         }
         if(_parent._y < -5 || _parent._x < -5 || _parent._y > 405 || _parent._x > 555)
         {
            _parent.removeMovieClip();
         }
      }
      else if(framesStuck < 90)
      {
         framesStuck++;
      }
      else
      {
         _parent._alpha -= 5;
      }
      if(_parent._alpha <= 0)
      {
         _parent.removeMovieClip();
      }
   }
}

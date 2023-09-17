onClipEvent(enterFrame){
   _parent._x = _root._xmouse + offsetX;
   _parent._y = _root._ymouse + offsetY;
   momentum = int(Math.abs(_parent._x - lastX) / 3);
   if(_parent._x > lastX)
   {
      if(_parent._rotation < 70)
      {
         _parent._rotation += momentum;
      }
      else
      {
         _parent._rotation--;
      }
      if(_parent._rotation > 90)
      {
         _parent._rotation = 90;
      }
      swingTo = -1 * (int(Math.random() * int(Math.abs(_parent._rotation) / 3)) + int(Math.abs(_parent._rotation) / 2));
      swingDir = -1;
      toFros = 0;
   }
   else if(_parent._x < lastX)
   {
      if(_parent._rotation > -70)
      {
         _parent._rotation -= momentum;
      }
      else
      {
         _parent._rotation = _parent._rotation + 1;
      }
      if(_parent._rotation < -90)
      {
         _parent._rotation = -90;
      }
      swingTo = int(Math.random() * int(Math.abs(_parent._rotation) / 3)) + int(Math.abs(_parent._rotation) / 2);
      swingDir = 1;
      toFros = 0;
   }
   else if(_parent._rotation < swingTo)
   {
      if(swingDir == 1)
      {
         swingSpeed = int((110 - Math.abs(_parent._rotation)) / 7) + 1;
         swingSpeed -= toFros * 3;
         if(swingSpeed < 1)
         {
            swingSpeed = 1;
         }
         _parent._rotation += swingSpeed;
      }
      else
      {
         _parent._rotation = swingTo;
      }
   }
   else if(_parent._rotation > swingTo)
   {
      if(swingDir == -1)
      {
         swingSpeed = int((110 - Math.abs(_parent._rotation)) / 7) + 1;
         swingSpeed -= toFros * 3;
         if(swingSpeed < 1)
         {
            swingSpeed = 1;
         }
         _parent._rotation -= swingSpeed;
      }
      else
      {
         _parent._rotation = swingTo;
      }
   }
   else if(swingTo != 0)
   {
      if(_parent._rotation > 0)
      {
         swingTo = -1 * (int(Math.random() * int(Math.abs(_parent._rotation) / 3)) + int(Math.abs(_parent._rotation) / 2));
         swingDir = -1;
         toFros++;
      }
      else
      {
         swingTo = int(Math.random() * int(Math.abs(_parent._rotation) / 3)) + int(Math.abs(_parent._rotation) / 2);
         swingDir = 1;
         toFros++;
      }
      if(Math.abs(swingTo) < 10)
      {
         swingTo = 0;
      }
   }
   else
   {
      swingDir = 0;
   }
   lastX = _parent._x;
   lastY = _parent._y;
   if(_root.subMenu == false)
   {
      _parent.removeMovieClip();
   }
}

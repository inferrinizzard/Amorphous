onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(_parent._currentframe < 6)
      {
         _parent.play();
      }
      else if(_parent._currentframe == 6 && lifespan == 90)
      {
         _parent.stop();
         endPointY = _parent._y - 20 * Math.cos(_parent._rotation * 0.017453292519943295);
         endPointX = _parent._x + 20 * Math.sin(_parent._rotation * 0.017453292519943295);
         if(endPointY > -6 && endPointX > -6 && endPointY < 406 && endPointX < 556)
         {
            stray = _parent.aim + int(Math.random() * 120) - 60;
            _root.attachMovie("Runner Line",_parent._name + "s",_global.effectDepth++);
            with(eval("_root." + _parent._name + "s"))
            {
               _x = endPointX;
               _y = endPointY;
               _rotation = stray;
            }
         }
         lifespan--;
      }
      else if(lifespan > 0)
      {
         _parent.stop();
         lifespan--;
      }
      else if(_parent._currentframe < 27)
      {
         _parent.play();
      }
      else
      {
         _parent.removeMovieClip();
      }
   }
   else
   {
      _parent.stop();
   }
}

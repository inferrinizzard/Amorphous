onClipEvent(enterFrame){
   if(_name != "RazorTooth" && !_global.pause)
   {
      if(_yscale < 100)
      {
         if(_xscale < 0)
         {
            _xscale = _xscale - 5;
         }
         else
         {
            _xscale = _xscale + 5;
         }
         _yscale = _yscale + 5;
         offSet += 0.2;
      }
      else if(offSet < 16)
      {
         offSet += 0.5;
      }
      else
      {
         mommyQueen.teeth--;
         duplicateMovieClip(_root.ShedTooth,_name + "Shed",16384 + _global.effectDepth++);
         with(eval("_root." + _name + "Shed"))
         {
            _x = this._x;
            _y = this._y;
            _rotation = this._rotation;
         }
         removeMovieClip(this);
      }
      _Y = mommyQueen._y - offSet * Math.cos(_rotation * 0.017453292519943295);
      _X = mommyQueen._x + offSet * Math.sin(_rotation * 0.017453292519943295);
   }
}

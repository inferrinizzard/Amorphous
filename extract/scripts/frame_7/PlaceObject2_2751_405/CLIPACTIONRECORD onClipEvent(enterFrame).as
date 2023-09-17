onClipEvent(enterFrame){
   if(_name != "Sparks" && !_global.pause)
   {
      _root.attachMovie("Spark Shower",_name + "Show",_global.capDepth++);
      with(eval("_root." + _name + "Show"))
      {
         _x = this._x;
         _y = this._y;
         _rotation = this._rotation;
      }
      removeMovieClip(this);
   }
   else
   {
      stop();
   }
}

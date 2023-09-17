onClipEvent(load){
   if(_name != "GroundHole")
   {
      framesExisted = 0;
      _xscale = 50;
      _yscale = 50;
      this._rotation = int(Math.random() * 360) - 180;
   }
}

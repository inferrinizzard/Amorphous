onClipEvent(load){
   if(_name != "GroundMound")
   {
      framesExisted = 0;
      _alpha = 0;
      this._rotation = int(Math.random() * 360) - 180;
   }
}

onClipEvent(load){
   if(_name != "WhiteSmoke")
   {
      framesExisted = 0;
      this._xscale = 30;
      this._yscale = 30;
      this._rotation = int(Math.random() * 360) - 180;
   }
}

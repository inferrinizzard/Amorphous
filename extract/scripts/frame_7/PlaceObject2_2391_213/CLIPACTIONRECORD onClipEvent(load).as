onClipEvent(load){
   if(_name != "ColdBurst")
   {
      framesExisted = 0;
      littleFrosts = 0;
      this._xscale = 1000;
      this._yscale = 1000;
      this._alpha = 50;
      _global.Hazards.push(_name);
   }
}

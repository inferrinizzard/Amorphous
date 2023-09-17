onClipEvent(load){
   driftdirection = _parent._rotation;
   lifespan = 60;
   _parent._rotation = int(Math.random() * 359) - 180;
   _parent._xscale = 50;
   _parent._yscale = 50;
}

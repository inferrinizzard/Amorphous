onClipEvent(load){
   stop();
   framesExisted = 0;
   speed = 0.5 + int(Math.random() * 6) * 0.5;
   life = int(Math.random() * 40) + 50;
   spin = int(Math.random() * 50) - 25;
   heading = int(Math.random() * 120) - 60;
   newScale = int(Math.random() * 40) + 10;
   _parent._rotation -= 180;
   _parent._rotation += heading;
   _parent._xscale = newScale;
   _parent._yscale = newScale;
}

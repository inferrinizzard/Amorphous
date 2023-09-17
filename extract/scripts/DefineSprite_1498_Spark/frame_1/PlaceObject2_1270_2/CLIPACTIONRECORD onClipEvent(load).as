onClipEvent(load){
   lifeSpan = int(Math.random() * 10) + 10;
   listTo = int(Math.random() * 11) - 5;
   _parent._yscale = 80 + lifeSpan * 2;
}

onClipEvent(load){
   if(_name != "QueenWiggler")
   {
      framesExisted = 0;
      mySize = int(Math.random() * 50) + 50;
      _rotation = int(Math.random() * 360) - 180;
      _xscale = mySize;
      _yscale = mySize;
      if(int(Math.random() * 2) == 1)
      {
         _xscale = _xscale * -1;
      }
   }
   else
   {
      stop();
   }
}

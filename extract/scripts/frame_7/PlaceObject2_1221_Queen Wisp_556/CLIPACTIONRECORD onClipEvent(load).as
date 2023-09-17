onClipEvent(load){
   if(_name == "QueenWisp")
   {
      stop();
   }
   else
   {
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 5));
      whereOnSkin = int(Math.random() * 359) - 180;
      if(int(Math.random() * 2) == 1)
      {
         _xscale = -100;
      }
   }
}

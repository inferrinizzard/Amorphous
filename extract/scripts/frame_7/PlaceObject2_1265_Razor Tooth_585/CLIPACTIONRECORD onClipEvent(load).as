onClipEvent(load){
   if(_name != "RazorTooth")
   {
      _xscale = 50;
      _yscale = 50;
      offSet = int(Math.random() * 5) + 1;
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 7));
      if(int(Math.random() * 2) == 1)
      {
         _xscale = -50;
      }
   }
}

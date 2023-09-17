onClipEvent(enterFrame){
   if(int(_xscale) == widthGoal)
   {
      widthGoal = int(Math.random() * 80) + 60;
   }
   else if(int(_xscale) < widthGoal)
   {
      _xscale = _xscale + 0.1;
   }
   else
   {
      _xscale = _xscale - 0.1;
   }
   if(int(_yscale) == heightGoal)
   {
      heightGoal = int(Math.random() * 80) + 60;
   }
   else if(int(_yscale) < heightGoal)
   {
      _yscale = _yscale + 0.1;
   }
   else
   {
      _yscale = _yscale - 0.1;
   }
}

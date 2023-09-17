onClipEvent(enterFrame){
   if(_X > -200 && _X < 300)
   {
      if(xtime == xchange)
      {
         xscroll = int(Math.random() * 5) - 2;
         xtime = 0;
         xchange = int(Math.random() * 90) + 60;
      }
   }
   else if(_X <= -200 && xscroll <= 0)
   {
      xscroll = int(Math.random() * 3) + 1;
      xtime = 0;
      xchange = int(Math.random() * 90) + 60;
   }
   else if(_X >= 300 && xscroll >= 0)
   {
      xscroll = int(Math.random() * 3) - 3;
      xtime = 0;
      xchange = int(Math.random() * 90) + 60;
   }
   if(xvel > xscroll)
   {
      xvel -= 0.2;
   }
   else if(xvel < xscroll)
   {
      xvel += 0.2;
   }
   _X = _X + xvel;
   xtime++;
   if(_Y > -300 && _Y < 400)
   {
      if(ytime == ychange)
      {
         yscroll = int(Math.random() * 7) - 3;
         ytime = 0;
         ychange = int(Math.random() * 90) + 60;
      }
   }
   else if(_Y <= -300 && yscroll <= 0)
   {
      yscroll = int(Math.random() * 4) + 1;
      ytime = 0;
      ychange = int(Math.random() * 90) + 60;
   }
   else if(_Y >= 400 && yscroll >= 0)
   {
      yscroll = int(Math.random() * 4) - 4;
      ytime = 0;
      ychange = int(Math.random() * 90) + 60;
   }
   if(yvel > yscroll)
   {
      yvel -= 0.2;
   }
   else if(yvel < yscroll)
   {
      yvel += 0.2;
   }
   _Y = _Y + yvel;
   ytime++;
}

onClipEvent(enterFrame){
   Progress = _root.SwordMask._currentframe - 1;
   if(Progress < 22)
   {
      _X = startingX + 20 * ((21 - Progress) / 21);
   }
   else if(Progress < 44)
   {
      _X = startingX + 20 * ((Progress - 21) / 22);
   }
   else
   {
      _X = startingX + 20 + 155 * ((Progress - 43) / 57);
   }
   _Y = startingY - 320 * (Progress / 100);
}

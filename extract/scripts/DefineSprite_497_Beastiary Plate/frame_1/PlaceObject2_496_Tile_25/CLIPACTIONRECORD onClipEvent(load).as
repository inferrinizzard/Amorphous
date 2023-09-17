onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Clutter") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Clutter","InfoClutter",1);
   }
}

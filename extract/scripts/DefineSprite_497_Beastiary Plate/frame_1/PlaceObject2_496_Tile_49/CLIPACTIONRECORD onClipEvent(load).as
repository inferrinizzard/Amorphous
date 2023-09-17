onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Frostie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Frostie","InfoFrostie",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Meltie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Meltie","InfoMeltie",1);
   }
}

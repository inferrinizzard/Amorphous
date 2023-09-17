onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Grinder") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Grinder","InfoGrinder",1);
   }
}

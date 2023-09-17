onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Biter") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Biter","InfoBiter",1);
   }
}

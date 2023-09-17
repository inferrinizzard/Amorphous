onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Queen") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Queen","InfoQueen",1);
   }
}

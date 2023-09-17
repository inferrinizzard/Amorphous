onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Gray") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Gray","InfoGray",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Amalgam") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Amalgam","InfoAmalgam",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Oozle") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Oozle","InfoOozle",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Stickie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Stickie","InfoStickie",1);
   }
}

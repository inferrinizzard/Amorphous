onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Sharp") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Sharp","InfoSharp",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Horror") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Horror","InfoHorror",1);
   }
}

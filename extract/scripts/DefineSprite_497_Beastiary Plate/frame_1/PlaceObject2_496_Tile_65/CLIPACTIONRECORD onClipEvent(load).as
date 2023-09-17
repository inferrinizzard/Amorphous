onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"VoidEater") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info VoidEater","InfoVoidEater",1);
   }
}

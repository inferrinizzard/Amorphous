onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Fuzzle") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Fuzzle","InfoFuzzle",1);
   }
}

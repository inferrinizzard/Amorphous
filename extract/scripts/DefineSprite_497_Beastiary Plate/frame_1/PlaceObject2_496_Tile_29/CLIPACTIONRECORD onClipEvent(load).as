onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Inkie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Inkie","InfoInkie",1);
   }
}

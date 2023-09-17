onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Torchie") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Torchie","InfoTorchie",1);
   }
}

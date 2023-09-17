onClipEvent(load){
   stop();
   onMe = false;
   if(SearchArray(EnemiesSeen,"Gloople") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      attachMovie("Info Gloople","InfoGloople",1);
   }
}

onClipEvent(load){
   stop();
   onMe = false;
   _visible = false;
   if(SearchArray(EnemiesSeen,"RazorQueen") == null)
   {
      tileLit = false;
   }
   else
   {
      tileLit = true;
      _visible = true;
      attachMovie("Info RazorQueen","InfoRazorQueen",1);
   }
}
